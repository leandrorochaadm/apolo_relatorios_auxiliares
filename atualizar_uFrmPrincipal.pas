unit atualizar_uFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
  IdException, IniFiles, ShellAPI, IdHTTP, CheckLst, DBCtrls, ExeInfo;

type
  TForm1 = class(TForm)
    lblAtualizacao: TLabel;
    pbAtualizacao: TProgressBar;
    pnl1: TPanel;
    idftp1: TIdFTP;
    exnf1: TExeInfo;
    procedure idftp1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure idftp1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    function ObterDiretorioDoExecutavel: string;
    function ConectarAoServidorFTP: boolean;
    function ObterNumeroVersaoLocal: smallint;
    function ObterNumeroVersaoFTP: smallint;
    procedure BaixarAtualizacao;
    procedure DescompactarAtualizacao;
    procedure AtualizarNumeroVersao;
    procedure AtualizarVersao;
    procedure ReiniciarAplicacao;
    procedure FormShow(Sender: TObject);
    procedure lblAtualizacaoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    FnTamanhoTotal : Integer;

  public
    { Public declarations }
    msgAtualizacao: Boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AtualizarNumeroVersao;
var
  oArquivoLocal, oArquivoFTP: TIniFile;
  sNumeroNovaVersao: string;
begin
  // abre os dois arquivos INI
  oArquivoFTP   := TIniFile.Create(ObterDiretorioDoExecutavel + 'VersaoFTPAuxiliar.ini');
  oArquivoLocal := TIniFile.Create(ObterDiretorioDoExecutavel + 'VersaoLocalAuxiliar.ini');
  try
    // obt�m o n�mero da nova vers�o no arquivo "VersaoFTP.ini"...
    sNumeroNovaVersao := oArquivoFTP.ReadString('VersaoFTP', 'Numero',EmptyStr);
//     ShowMessage(sNumeroNovaVersao);
    // ... e grava este n�mero no arquivo "VersaoLocal.ini"
    oArquivoLocal.WriteString('VersaoLocal', 'Numero', sNumeroNovaVersao);
  finally
    FreeAndNil(oArquivoFTP);
    FreeAndNil(oArquivoLocal);
  end;
end;

procedure TForm1.AtualizarVersao;
var
  nNumeroVersaoLocal, nNumeroVersaoFTP: smallint;
begin
  if not ConectarAoServidorFTP then
    Exit;


    BaixarAtualizacao;
    DescompactarAtualizacao;
    AtualizarNumeroVersao;
    ReiniciarAplicacao;

end;

procedure TForm1.BaixarAtualizacao;
begin
  try
    // deleta o arquivo "Atualizacao.rar", caso exista,
    // evitando erro de arquivo j� existente
    if FileExists(ObterDiretorioDoExecutavel + 'lib.rar') then
      DeleteFile(ObterDiretorioDoExecutavel + 'lib.rar');

    // obt�m o tamanho da atualiza��o e preenche a vari�vel "FnTamanhoTotal"
    FnTamanhoTotal := IdFTP1.Size('lib.rar');

    // faz o download do arquivo "Atualizacao.rar"
    IdFTP1.Get('lib.rar', ObterDiretorioDoExecutavel + 'lib.rar', True, True);
  except
    On E: Exception do
    begin
      // ignora a exce��o "Connection Closed Gracefully"
      if E is EIdConnClosedGracefully then
        Exit;

      ShowMessage('Erro ao baixar a atualiza��o: ' + E.Message);

      // interrompe a atualiza��o
      Abort;
    end;
  end;
end;

function TForm1.ConectarAoServidorFTP: boolean;
begin
  // desconecta, caso tenha sido conectado anteriormente
  if IdFTP1.Connected then
    IdFTP1.Disconnect;
  try
    IdFTP1.Connect;
    result := True;
  except
    On E: Exception do
    begin
      ShowMessage('Erro ao acessar o servidor de atualiza��o: ' + E.Message);
      result := False;
    end;
  end;
end;

procedure TForm1.DescompactarAtualizacao;
var
  sNomeArquivoAtualizacao: string;
begin
  // deleta o backup anterior, ou melhor, da vers�o anterior,
  // evitando erro de arquivo j� existente
  if FileExists(ObterDiretorioDoExecutavel + 'Auxiliar_bkp.exe') then
    DeleteFile(ObterDiretorioDoExecutavel + 'Auxiliar_bkp.exe');

  // Renomeia o execut�vel atual (desatualizado) para "Sistema_Backup.exe"
  RenameFile(ObterDiretorioDoExecutavel + 'Auxiliar.exe',
    ObterDiretorioDoExecutavel + 'Auxiliar_bkp.exe');

  // armazena o nome do arquivo de atualiza��o em uma vari�vel
  sNomeArquivoAtualizacao := ObterDiretorioDoExecutavel + 'lib.rar';


  lblAtualizacao.Caption:= 'Descompactando arquivo de atualiza��o';
  // executa a linha de comando do 7-Zip para descompactar o arquivo baixado
  ShellExecute(0, nil, '7z.exe',
    PWideChar(' x -aoa ' + sNomeArquivoAtualizacao + ' -o' +
        ObterDiretorioDoExecutavel), '', SW_SHOW);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
msgAtualizacao:=True;
//if Application.MessageBox('Esse aplicativo desatualizado. Aguarde um instante (Aprox. 3MB)',
// 'Atualiza��o',MB_OK+MB_ICONINFORMATION) = IDOK then AtualizarVersao;
// else Application.Terminate;
//ShowMessage(BoolToStr(msgAtualizacao));
Form1.Caption := Form1.Caption +' Vers�o: '+ exnf1.FileVersion ;
end;

procedure TForm1.idftp1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  nTamanhoTotal, nTransmitidos, nPorcentagem: real;
begin
  if FnTamanhoTotal = 0 then
    Exit;

  Application.ProcessMessages;

  // obt�m o tamanho total do arquivo em bytes
  nTamanhoTotal := FnTamanhoTotal div 1024;

  // obt�m a quantidade de bytes j� baixados
  nTransmitidos := AWorkCount div 1024;

  // calcula a porcentagem de download
  nPorcentagem := (nTransmitidos * 100) / nTamanhoTotal;

  // atualiza o componente TLabel com a porcentagem
   lblAtualizacao.Caption := 'Aguarde o sistema est� atualizando'

   +#13+
   Format('%s%%', [FormatFloat('##0', nPorcentagem)]) +'  -  '+
   Format('%s KB de %s KB',
   [FormatFloat('##,###,##0', nTransmitidos), FormatFloat('##,###,##0', nTamanhoTotal)])

  ;

  // atualiza a barra de preenchimento do componente TProgressBar
  pbAtualizacao.Position := AWorkCount div 1024;
end;

procedure TForm1.idftp1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
 pbAtualizacao.Max := FnTamanhoTotal div 1024;
end;

procedure TForm1.lblAtualizacaoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
//ShowMessage(BoolToStr(msgAtualizacao));
if msgAtualizacao = True then
//begin
//if Application.MessageBox('Esse aplicativo desatualizado. Aguarde um instante (Aprox. 3MB)',
// 'Atualiza��o',MB_OK+MB_ICONINFORMATION) = IDOK then
  begin
  msgAtualizacao:=False;
  AtualizarVersao;
  end;
//end;
end;

function TForm1.ObterDiretorioDoExecutavel: string;
begin
result := ExtractFilePath(Application.ExeName);
end;

function TForm1.ObterNumeroVersaoFTP: smallint;
var
  sNumeroVersao: string;
  oArquivoINI: TIniFile;
begin
  // deleta o arquivo "VersaoFTP.ini" do computador, caso exista,
  // evitando erro de arquivo j� existente
  if FileExists(ObterDiretorioDoExecutavel + 'VersaoFTPAuxiliar.ini') then
    DeleteFile(ObterDiretorioDoExecutavel + 'VersaoFTPAuxiliar.ini');

  // baixa o arquivo "VersaoFTP.ini" para o computador
  IdFTP1.Get('VersaoFTPAuxiliar.ini',
    ObterDiretorioDoExecutavel + 'VersaoFTPAuxiliar.ini', True, True);

  // abre o arquivo "VersaoFTP.ini"
  oArquivoINI := TIniFile.Create(ObterDiretorioDoExecutavel +
      'VersaoFTPAuxiliar.ini');
  try
    // l� o n�mero da vers�o
    sNumeroVersao := oArquivoINI.ReadString('VersaoFTP', 'Numero', EmptyStr);

    // retira os pontos (exemplo: de "1.0.1" para "101")
    sNumeroVersao := StringReplace(sNumeroVersao, '.', EmptyStr,
      [rfReplaceAll]);

    // converte o n�mero da vers�o para n�mero
    result := StrToIntDef(sNumeroVersao, 0);
  finally
    FreeAndNil(oArquivoINI);
  end;
end;

function TForm1.ObterNumeroVersaoLocal: smallint;
var
  sNumeroVersao: string;
  oArquivoINI: TIniFile;
begin
  // abre o arquivo "VersaoLocal.ini"
  oArquivoINI := TIniFile.Create(ObterDiretorioDoExecutavel +
      'VersaoLocalAulixiar.ini');
  try
    // l� o n�mero da vers�o
    sNumeroVersao := oArquivoINI.ReadString('VersaoLocal', 'Numero', EmptyStr);

    // retira os pontos (exemplo: de "1.0.0" para "100")
    sNumeroVersao := StringReplace(sNumeroVersao, '.', EmptyStr,
      [rfReplaceAll]);

    // converte o n�mero da vers�o para n�mero
    result := StrToIntDef(sNumeroVersao, 0);
  finally
    FreeAndNil(oArquivoINI);
  end;
end;

procedure TForm1.ReiniciarAplicacao;
begin
//  lblAtualizacao.Caption:='Atualiza��o conclu�da com sucesso. A aplica��o ser� reiniciada.';
  ShellExecute(0, nil, PChar(ObterDiretorioDoExecutavel +'Auxiliar.exe'), '', nil, SW_SHOWNORMAL);
//  Application.Terminate;
Close;

//   ShellExecute(0, nil, '7z.exe',
//    PWideChar(' x -aoa ' + sNomeArquivoAtualizacao + ' -o' +
//        ObterDiretorioDoExecutavel), '', SW_SHOW);
end;

end.
