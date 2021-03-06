﻿unit ufrmUpdateAuxiliar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
  IdException, IniFiles, ShellAPI, IdHTTP, CheckLst, DBCtrls, ExeInfo;

type
  TfrmUpdateAuxiliar = class(TForm)
    lblAtualizacao: TLabel;
    pbAtualizacao: TProgressBar;
    pnl1: TPanel;
    idftp1: TIdFTP;
    exnf1: TExeInfo;
    pnl2: TPanel;
    pnl3: TPanel;
    mmo1: TMemo;
    procedure idftp1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure idftp1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    function ObterDiretorioDoExecutavel: string;
    function ConectarAoServidorFTP: boolean;
    function ObterNumeroVersaoLocal: smallint;
    function ObterNumeroVersaoFTP: smallint;
    procedure AtualizarVersaoFTP;
    procedure CompactarAtualizacao;
    procedure AtualizarNumeroVersao;
    procedure UpdateAtualizacao;
    procedure ReiniciarAplicacao;
    procedure FormShow(Sender: TObject);


  private
    { Private declarations }
    FnTamanhoTotal : Integer;

  public
    { Public declarations }

  end;

var
  frmUpdateAuxiliar: TfrmUpdateAuxiliar;

implementation

{$R *.dfm}

procedure TfrmUpdateAuxiliar.AtualizarNumeroVersao;
var
  oArquivoLocal, oArquivoFTP: TIniFile;
  sNumeroNovaVersao: string;
begin
  // abre os dois arquivos INI
  oArquivoFTP   := TIniFile.Create(ObterDiretorioDoExecutavel + 'VersaoFTPAuxiliar.ini');
  oArquivoLocal := TIniFile.Create(ObterDiretorioDoExecutavel + 'VersaoLocalAuxiliar.ini');
  try
    // obtém o número da nova versão no arquivo "VersaoFTP.ini"...
    sNumeroNovaVersao := oArquivoFTP.ReadString('VersaoFTP', 'Numero',EmptyStr);
//     ShowMessage(sNumeroNovaVersao);
    // ... e grava este número no arquivo "VersaoLocal.ini"
    oArquivoLocal.WriteString('VersaoLocal', 'Numero', sNumeroNovaVersao);
  finally
    FreeAndNil(oArquivoFTP);
    FreeAndNil(oArquivoLocal);
  end;
end;

procedure TfrmUpdateAuxiliar.AtualizarVersaoFTP;
var
  nNumeroVersaoLocal, nNumeroVersaoFTP: smallint;
begin
//  if not ConectarAoServidorFTP then
//    Exit;


//    UpdateAtualizacao;
    CompactarAtualizacao;
//    AtualizarNumeroVersao;
//    ReiniciarAplicacao;

end;

procedure TfrmUpdateAuxiliar.UpdateAtualizacao;
begin
  try
    // deleta o arquivo "Atualizacao.rar", caso exista,
    // evitando erro de arquivo já existente
    if FileExists(ObterDiretorioDoExecutavel + 'lib.rar') then
      DeleteFile(ObterDiretorioDoExecutavel + 'lib.rar');

    // obtém o tamanho da atualização e preenche a variável "FnTamanhoTotal"
    FnTamanhoTotal := IdFTP1.Size('lib.7z');

    // faz o download do arquivo "Atualizacao.rar"
    IdFTP1.Get('lib.7z', ObterDiretorioDoExecutavel + 'lib.7z', True, True);
  except
    On E: Exception do
    begin
      // ignora a exceção "Connection Closed Gracefully"
      if E is EIdConnClosedGracefully then
        Exit;

      ShowMessage('Erro ao baixar a atualização: ' + E.Message);

      // interrompe a atualização
      Abort;
    end;
  end;
end;

function TfrmUpdateAuxiliar.ConectarAoServidorFTP: boolean;
begin
idFTP1.Host := 'ftp.atomsistem.com.br';
idFTP1.Username := 'atoms053';
idFTP1.Password := 'atom2017';
idFTP1.Connect;

//Shape_Conectado.Brush.Color := clLime;




  // desconecta, caso tenha sido conectado anteriormente
  if IdFTP1.Connected then
    IdFTP1.Disconnect;
  try
    IdFTP1.Connect;
    result := True;
    mmo1.Lines.Add('Conectado ao endereço: ' + idFTP1.Host);
    mmo1.Lines.Add('Srvidor remoto: ' + idFTP1.SystemDesc);
    mmo1.Lines.Add('');

  except
    On E: Exception do
    begin
      mmo1.Lines.Add('Erro ao acessar o servidor de atualização: ' + E.Message);
      result := False;
    end;
  end;
end;

procedure TfrmUpdateAuxiliar.CompactarAtualizacao;
var
  sNomeArquivoAtualizacao: string;
begin
  // deleta o backup anterior, ou melhor, da versão anterior,
  // evitando erro de arquivo já existente
//  if FileExists(ObterDiretorioDoExecutavel + 'Auxiliar_bkp.exe') then
//    DeleteFile(ObterDiretorioDoExecutavel + 'Auxiliar_bkp.exe');

  // Renomeia o executável atual (desatualizado) para "Sistema_Backup.exe"
//  RenameFile(ObterDiretorioDoExecutavel + 'Auxiliar.exe',
//    ObterDiretorioDoExecutavel + 'Auxiliar_bkp.exe');

  // armazena o nome do arquivo de atualização em uma variável
  sNomeArquivoAtualizacao := ObterDiretorioDoExecutavel + 'lib.7z';


  lblAtualizacao.Caption:= 'compactando arquivo de atualização';
  // executa a linha de comando do 7-Zip para descompactar o arquivo baixado
  ShellExecute(0, nil, '7z.exe',
    PWideChar(' a ' + sNomeArquivoAtualizacao + ' ' +
        ObterDiretorioDoExecutavel+'bin\*'), '', SW_SHOW);
end;

procedure TfrmUpdateAuxiliar.FormShow(Sender: TObject);
begin


//TfrmUpdateAuxiliar.Caption := TfrmUpdateAuxiliar.Caption +' Versão: '+ exnf1.FileVersion ;

UpdateAtualizacao;
end;

procedure TfrmUpdateAuxiliar.idftp1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  nTamanhoTotal, nTransmitidos, nPorcentagem: real;
begin
  if FnTamanhoTotal = 0 then
    Exit;

  Application.ProcessMessages;

  // obtém o tamanho total do arquivo em bytes
  nTamanhoTotal := FnTamanhoTotal div 1024;

  // obtém a quantidade de bytes já baixados
  nTransmitidos := AWorkCount div 1024;

  // calcula a porcentagem de download
  nPorcentagem := (nTransmitidos * 100) / nTamanhoTotal;

  // atualiza o componente TLabel com a porcentagem
   lblAtualizacao.Caption := 'Aguarde o sistema está atualizando'

   +#13+
   Format('%s%%', [FormatFloat('##0', nPorcentagem)]) +'  -  '+
   Format('%s KB de %s KB',
   [FormatFloat('##,###,##0', nTransmitidos), FormatFloat('##,###,##0', nTamanhoTotal)])

  ;

  // atualiza a barra de preenchimento do componente TProgressBar
  pbAtualizacao.Position := AWorkCount div 1024;
end;

procedure TfrmUpdateAuxiliar.idftp1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
 pbAtualizacao.Max := FnTamanhoTotal div 1024;
end;



function TfrmUpdateAuxiliar.ObterDiretorioDoExecutavel: string;
begin
result := ExtractFilePath(Application.ExeName);
end;

function TfrmUpdateAuxiliar.ObterNumeroVersaoFTP: smallint;
var
  sNumeroVersao: string;
  oArquivoINI: TIniFile;
begin
  // deleta o arquivo "VersaoFTP.ini" do computador, caso exista,
  // evitando erro de arquivo já existente
  if FileExists(ObterDiretorioDoExecutavel + 'VersaoFTPAuxiliar.ini') then
    DeleteFile(ObterDiretorioDoExecutavel + 'VersaoFTPAuxiliar.ini');

  // baixa o arquivo "VersaoFTP.ini" para o computador
  IdFTP1.Get('VersaoFTPAuxiliar.ini',
    ObterDiretorioDoExecutavel + 'VersaoFTPAuxiliar.ini', True, True);

  // abre o arquivo "VersaoFTP.ini"
  oArquivoINI := TIniFile.Create(ObterDiretorioDoExecutavel +
      'VersaoFTPAuxiliar.ini');
  try
    // lê o número da versão
    sNumeroVersao := oArquivoINI.ReadString('VersaoFTP', 'Numero', EmptyStr);

    // retira os pontos (exemplo: de "1.0.1" para "101")
    sNumeroVersao := StringReplace(sNumeroVersao, '.', EmptyStr,
      [rfReplaceAll]);

    // converte o número da versão para número
    result := StrToIntDef(sNumeroVersao, 0);
  finally
    FreeAndNil(oArquivoINI);
  end;
end;

function TfrmUpdateAuxiliar.ObterNumeroVersaoLocal: smallint;
var
  sNumeroVersao: string;
  oArquivoINI: TIniFile;
begin
  // abre o arquivo "VersaoLocal.ini"
  oArquivoINI := TIniFile.Create(ObterDiretorioDoExecutavel +
      'VersaoLocalAulixiar.ini');
  try
    // lê o número da versão
    sNumeroVersao := oArquivoINI.ReadString('VersaoLocal', 'Numero', EmptyStr);

    // retira os pontos (exemplo: de "1.0.0" para "100")
    sNumeroVersao := StringReplace(sNumeroVersao, '.', EmptyStr,
      [rfReplaceAll]);

    // converte o número da versão para número
    result := StrToIntDef(sNumeroVersao, 0);
  finally
    FreeAndNil(oArquivoINI);
  end;
end;

procedure TfrmUpdateAuxiliar.ReiniciarAplicacao;
begin
//  lblAtualizacao.Caption:='Atualização concluída com sucesso. A aplicação será reiniciada.';
  ShellExecute(0, nil, PChar(ObterDiretorioDoExecutavel +'Auxiliar.exe'), '', nil, SW_SHOWNORMAL);
//  Application.Terminate;
Close;

//   ShellExecute(0, nil, '7z.exe',
//    PWideChar(' x -aoa ' + sNomeArquivoAtualizacao + ' -o' +
//        ObterDiretorioDoExecutavel), '', SW_SHOW);
end;

end.