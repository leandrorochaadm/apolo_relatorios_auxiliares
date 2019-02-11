unit uFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, {ExeInfo,} ComCtrls, ExtCtrls, StdCtrls, Grids, DBGrids,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, CheckLst,
  DBCtrls, IdExplicitTLSClientServerBase, IdFTP, frxClass;

type
  TfrmPrincipal = class(TForm)
    Panel2: TPanel;
    IdHTTP: TIdHTTP;
    IdFTP1: TIdFTP;
    pcAtendimento: TPageControl;
    tabRel: TTabSheet;
    lblDataI: TLabel;
    lblDataF: TLabel;
    lblPlanoConta: TLabel;
    btnDreDet: TButton;
    Imprimir: TButton;
    Button1: TButton;
    dataI: TDateTimePicker;
    dataF: TDateTimePicker;
    btnDreRes: TButton;
    dblkcbbPlanoConta: TDBLookupComboBox;
    btnLimparFiltro: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure BtnLiberadorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnDreDetClick(Sender: TObject);
    procedure btnDreResClick(Sender: TObject);
    procedure Periodo;
    procedure btnLimparFiltroClick(Sender: TObject);
    procedure LimparFiltros;
    procedure versaoRelatorio;
    function ObterDiretorioDoExecutavel: string;
    function ConectarAoServidorFTP: boolean;
    function ObterNumeroVersaoLocal: smallint;
    function ObterNumeroVersaoFTP: smallint;
    procedure BaixarAtualizacao;
    procedure DescompactarAtualizacao;
    procedure AtualizarNumeroVersao;
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure AtualizarVersao;
    procedure ReiniciarAplicacao;
    function testarInternet:Boolean;
    procedure verificarBaixarCartao;
    procedure atualizarContasCaixa(movimento, conta:Integer);
    function zerarcodigo(codigo:string;qtde:integer):string;
    procedure novoPlanoConta;
    procedure qrcommonExec(sqlComand: string);
    procedure converterPlanoConta;
    procedure Button2Click(Sender: TObject);
    procedure CarregarRelatorio(const pReport: TfrxReport);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VericarDuplicatasPagar;
    procedure Button3Click(Sender: TObject);
    procedure AbreForm(aClasseForm: TComponentClass; aForm: TForm);
  private
    { Private declarations }
    FnTamanhoTotal: integer;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  versao: String;

implementation

uses uFrmLiberador, uDM, uDmRel, IdException, IniFiles, ShellAPI, uRelatorio;
{$R *.dfm}

procedure TfrmPrincipal.BtnLiberadorClick(Sender: TObject);
begin
  try
    frmLiberador := TfrmLiberador.Create(Application);
    frmLiberador.ShowModal;
  finally
    FreeAndNil(frmLiberador);
  end;
end;

procedure TfrmPrincipal.btnLimparFiltroClick(Sender: TObject);
begin
  LimparFiltros;
//  atualizarContasCaixa(3,7);
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin

//  DmRel.qrRelProdCusto.Close;
//  DmRel.qrRelProdCusto.SQL.Clear;
//DmRel.qrRelProdCusto.SQL.Add(' SELECT F.codigo,F.referencia_fornecedor AS cod_forn, PRODUTO as Descricao, F.localicazao, J.fantasia as nome_forn, ');
//DmRel.qrRelProdCusto.SQL.Add(' f.precocusto as preco_compra, c.custo_margem_0 as preco_custo, c.lucro as lucro_liq, f.precovenda ');
// DmRel.qrRelProdCusto.SQL.Add(' FROM C000025 F ');
// DmRel.qrRelProdCusto.SQL.Add(' LEFT JOIN C000009 J ON (F.codfornecedor=J.codigo) ');
// DmRel.qrRelProdCusto.SQL.Add(' left join c000026 c on (c.codproduto =f.codigo) ');
//
//DmRel.qrRelProdCusto.SQL.Add('  WHERE F.data_ultimacompra is not null and F.data_ultimacompra between :dataI and :dataF ');
//
//  DmRel.qrRelProdCusto.Open;

//ShowMessage(DateToStr(dataF.Date));

  with DmRel.qrRelProdCusto , SQL do
  begin
    Close;
    Params.ParamByName('dataI').AsDate := dataI.Date;
    Params.ParamByName('dataF').AsDate := dataF.Date;
    Open;
  end;

  Periodo;
  versaoRelatorio;

//  with uDmRel.DmRel.frxRepProdCusto do
//  begin
//    LoadFromFile(ExtractFilePath(ParamStr(0)) + 'rel\PrecCusto.fr3');
//    PrepareReport(True);
//    ShowReport;
//  end;



end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin

  uRelatorio.VendaMensal(dataI.Date, dataF.Date);
  CarregarRelatorio(dmRel.frxVendaMensal);
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
AbreForm(TfrmLiberador, frmLiberador);
end;

procedure TfrmPrincipal.CarregarRelatorio(const pReport: TfrxReport);
begin
versaoRelatorio;
Periodo;
 pReport.PrepareReport;
// pReport.LoadFromFile()
 pReport.ShowPreparedReport;
end;

function TfrmPrincipal.ConectarAoServidorFTP: boolean;
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
      ShowMessage('Erro ao acessar o servidor de atualização: ' + E.Message);
      result := False;
    end;
  end;
end;

procedure TfrmPrincipal.converterPlanoConta;
begin
  novoPlanoConta;
atualizarContasCaixa(0,100);
atualizarContasCaixa(1,101);
atualizarContasCaixa(2,102);
atualizarContasCaixa(3,103);
atualizarContasCaixa(4,104);
atualizarContasCaixa(5,105);
atualizarContasCaixa(6,106);
atualizarContasCaixa(7,107);
atualizarContasCaixa(8,108);
atualizarContasCaixa(9,109);
atualizarContasCaixa(10,110);
atualizarContasCaixa(11,111);
atualizarContasCaixa(12,112);
atualizarContasCaixa(13,113);
atualizarContasCaixa(14,114);
atualizarContasCaixa(15,115);
atualizarContasCaixa(16,116);
atualizarContasCaixa(17,117);
atualizarContasCaixa(18,118);
atualizarContasCaixa(19,119);
atualizarContasCaixa(20,120);
atualizarContasCaixa(21,121);
atualizarContasCaixa(22,122);
atualizarContasCaixa(23,123);
//atualizarContasCaixa(25,21);
//atualizarContasCaixa(26,126);
//atualizarContasCaixa(27,127);
atualizarContasCaixa(40,140);
atualizarContasCaixa(41,141);
atualizarContasCaixa(42,142);

//  atualizarContasCaixa();
end;

procedure TfrmPrincipal.DescompactarAtualizacao;
var
  sNomeArquivoAtualizacao: string;
begin
  // deleta o backup anterior, ou melhor, da versão anterior,
  // evitando erro de arquivo já existente
  if FileExists(ObterDiretorioDoExecutavel + 'Auxiliar_bkp.exe') then
    DeleteFile(ObterDiretorioDoExecutavel + 'Auxiliar_bkp.exe');

  // Renomeia o executável atual (desatualizado) para "Sistema_Backup.exe"
  RenameFile(ObterDiretorioDoExecutavel + 'Auxiliar.exe',
    ObterDiretorioDoExecutavel + 'Auxiliar_bkp.exe');

  // armazena o nome do arquivo de atualização em uma variável
  sNomeArquivoAtualizacao := ObterDiretorioDoExecutavel + 'lib.rar';

  // executa a linha de comando do 7-Zip para descompactar o arquivo baixado
  ShellExecute(0, nil, '7z',
    PWideChar(' e -aoa ' + sNomeArquivoAtualizacao + ' -o' +
        ObterDiretorioDoExecutavel), '', SW_SHOW);
end;

procedure TfrmPrincipal.btnDreResClick(Sender: TObject);
begin
uRelatorio.DreRes(dataI.Date, dataF.Date);
CarregarRelatorio(dmRel.frxDreRes);
end;



procedure TfrmPrincipal.AbreForm(aClasseForm: TComponentClass; aForm: TForm);
begin
  Application.CreateForm(aClasseForm, aForm);
  try
    aForm.ShowModal;
  finally
    FreeAndNil(aForm);
  end;
end;

procedure TfrmPrincipal.atualizarContasCaixa(movimento, conta: Integer);
var
planoConta:string;
begin
planoConta:='';

    planoConta := zerarcodigo(IntToStr(conta),6);
//    ShowMessage(planoConta);

    dm.qrCommon.Close;
    dm.qrCommon.SQL.Clear;
    dm.qrCommon.SQL.Add('UPDATE c000044 C set C.codconta=');
    dm.qrCommon.SQL.Add(QuotedStr(planoConta));
    dm.qrCommon.SQL.Add('where c.movimento is not null and c.movimento= ');
    dm.qrCommon.SQL.Add(IntToStr(movimento));
    dm.qrCommon.SQL.Add(' and c.codconta <> ');
    dm.qrCommon.SQL.Add(QuotedStr(planoConta));

//    ShowMessage(dm.qrCommon.SQL.Text);

    dm.qrCommon.ExecSQL;
end;

procedure TfrmPrincipal.AtualizarNumeroVersao;
var
  oArquivoLocal, oArquivoFTP: TIniFile;
  sNumeroNovaVersao: string;
begin
  // abre os dois arquivos INI
  oArquivoFTP := TIniFile.Create(ObterDiretorioDoExecutavel +
      'VersaoFTPAuxiliar.ini');
  oArquivoLocal := TIniFile.Create(ObterDiretorioDoExecutavel +
      'VersaoLocalAuxiliar.ini');
  try
    // obtém o número da nova versão no arquivo "VersaoFTP.ini"...
    sNumeroNovaVersao := oArquivoFTP.ReadString('VersaoFTP', 'Numero',
      EmptyStr);

    // ... e grava este número no arquivo "VersaoLocal.ini"
    oArquivoLocal.WriteString('VersaoLocal', 'Numero', sNumeroNovaVersao);
  finally
    FreeAndNil(oArquivoFTP);
    FreeAndNil(oArquivoLocal);
  end;
end;

procedure TfrmPrincipal.AtualizarVersao;
var
  nNumeroVersaoLocal, nNumeroVersaoFTP: smallint;
begin
  if not ConectarAoServidorFTP then
    Exit;

  nNumeroVersaoLocal := ObterNumeroVersaoLocal;
  nNumeroVersaoFTP := ObterNumeroVersaoFTP;

  if nNumeroVersaoLocal < nNumeroVersaoFTP then
  begin

    ShellExecute(0, nil, PChar('atualizar_Auxiliar.exe'), '', nil,
      SW_SHOWNORMAL);
    Application.Terminate;

    // ShowMessage('vai atualizar..');

  end
  else
  begin
    // ShowMessage('O sistema já está atualizado.');

  end;

end;

procedure TfrmPrincipal.BaixarAtualizacao;
begin
  try
    // deleta o arquivo "Atualizacao.rar", caso exista,
    // evitando erro de arquivo já existente
    if FileExists(ObterDiretorioDoExecutavel + 'lib.rar') then
      DeleteFile(ObterDiretorioDoExecutavel + 'lib.rar');

    // obtém o tamanho da atualização e preenche a variável "FnTamanhoTotal"
    FnTamanhoTotal := IdFTP1.Size('lib.rar');

    // faz o download do arquivo "Atualizacao.rar"
    IdFTP1.Get('lib.rar', ObterDiretorioDoExecutavel + 'lib.rar', True, True);
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

procedure TfrmPrincipal.btnDreDetClick(Sender: TObject);
begin
uRelatorio.DreDet(dataI.Date, dataF.Date);
CarregarRelatorio(dmRel.frxDreDet);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  versao := '2.02';
//  ShowMessage(versao);

  LimparFiltros; // limpar filtros

  verificarBaixarCartao;

  //correção pra Sotelli v2.00 15/01/19
  VericarDuplicatasPagar;

 //nao esta desativado pq trocou de servido
// if testarInternet = True then AtualizarVersao;

 //add na versao 1.7.5
 //novo plano de contas com
 converterPlanoConta;

  // desabilita qrweb
  dm.web.Connected := False;

  //desabilar o botao conrole licença
//  BtnLiberador.Visible := False;

  //exibe a versão no titulo
  frmPrincipal.caption := caption + ' Versão: ' + versao;

  // testa internet
  if {testarInternet = True} False then
    begin
    dm.web.Connected := True;

//    BtnLiberador.Visible := True ;
    // ShowMessage(dm.con.HostName+' - '+dm.con.Database);


    with dm.qrClienteWeb, SQL do
    begin
      Close;
      Clear;
      Text := 'select * from cliente where cpf_cnpj = :cnpj';
      ParamByName('cnpj').Value := dm.qrFilial.FieldByName('cnpj').Value;
      Open;
    end;

    // ShowMessage(inttostr(dm.qrClienteWeb.RecordCount));
    if dm.qrClienteWeb.RecordCount = 0 then
    begin
      dm.qrClienteWeb.Close;
      dm.qrClienteWeb.SQL.Clear;
      dm.qrClienteWeb.SQL.Text := 'INSERT INTO `atoms053_web`.`cliente` ' +
        '(`cod`, `razao`, `cpf_cnpj`, bloqueado) ' +
        ' VALUES (:cod, :razao, :cpf_cnpj, :bloqueado)';

      dm.qrClienteWeb.ParamByName('cod').AsInteger := 1000;
      dm.qrClienteWeb.ParamByName('razao').AsString := dm.qrFilial.FieldByName
        ('FILIAL').AsString;
      dm.qrClienteWeb.ParamByName('cpf_cnpj').AsString := dm.qrFilial.FieldByName
        ('cnpj').AsString;
      dm.qrClienteWeb.ParamByName('Bloqueado').AsString := 'NAO';

      dm.qrClienteWeb.ExecSQL;

    end;

    if dm.qrClienteWeb.FieldByName('Bloqueado').Value = 'NAO' then
//      BtnLiberador.Visible := True;

  end;


end;

procedure TfrmPrincipal.IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  nTamanhoTotal, nTransmitidos, nPorcentagem: real;
begin

end;

procedure TfrmPrincipal.ImprimirClick(Sender: TObject);
begin

  with DmRel.qrVendaCartaoSnfce, SQL do
  begin
    Close;
    Clear;
    Add('select c000048.codigo,  c000048.data, c000007.nome, c000048.total from c000048 '
        + 'left join c000007 on (c000007.codigo = c000048.codcliente) ' +
        'where (c000048.meio_cartaocred >0 or c000048.meio_cartaodeb>0) and c000048.nfce is null '
        + 'and c000048.data between ' +

        QuotedStr(FormatDateTime('dd.mm.YYYY', dataI.Date))
        + ' and ' + QuotedStr(FormatDateTime('dd.mm.YYYY', dataF.Date)));
    Open;
  end;

  Periodo;

//  with uDmRel.DmRel.frxRepVendaCartaoSnfce do
//  begin
//    LoadFromFile(ExtractFilePath(ParamStr(0)) + 'rel\VendaCartaoSnfce.fr3');
//    PrepareReport(True);
//    ShowReport;
//  end;
end;

procedure TfrmPrincipal.LimparFiltros;
begin
  dblkcbbPlanoConta.KeyValue := '';
  // dblkcbbPlanoConta.Text := '';
  dataI.Date := Date - 1; // StrToDate('01/05/2018');
  dataF.Date := Date; // StrToDate('31/05/2018');
end;

procedure TfrmPrincipal.novoPlanoConta;
begin
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000100'',''IMPLANTAÇÃO DE SALDO'',1,''1.01.101'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000101'',''LANCTO. ENTRADA'',1,''1.01.102'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000102'',''LANCTO. SAÍDA'',1,''1.01.103'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000103'',''VENDA DINHEIRO'',1,''1.01.104'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000104'',''VENDA CREDIÁRIO'',1,''1.01.105'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000105'',''VENDA CHEQUE À VISTA'',1,''1.01.106'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000106'',''VENDA CHEQUE À PRAZO'',1,''1.01.107'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000107'',''VENDA CARTÃO CRÉDITO'',1,''1.01.108'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000108'',''VENDA CARTÃO DÉBITO'',1,''1.01.109'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000109'',''RECEBTO. DINHEIRO'',1,''1.02.101'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000110'',''RECEBTO. CHEQUE A.V.'',1,''1.02.102'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000111'',''RECEBTO. CHEQUE A.P.'',1,''1.02.103'',''000006'', 3); ');
//RECEBIMENTO DE CREDIARIO => RECEBIMENTO PELO BANCO
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000013'',''RECEBTO. PELO BANCO'',1,''1.02.104'',''000006'', 3); ');

qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000113'',''RECEBTO. JUROS'',1,''1.02.105'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000114'',''DESCONTO NO RECEBTO'',1,''1.02.106'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000115'',''RECEBTO. BOLETO'',1,''1.02.107'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000116'',''OUTRAS ENTRADAS'',1,''1.02.108'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000117'',''OUTRAS SAÍDAS'',1,''1.02.109'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000118'',''O.S. DINHEIRO'',1,''1.03.101'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000119'',''O.S. CREDIÁRIO'',1,''1.03.102'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000120'',''O.S. CHEQUE À VISTA'',1,''1.03.103'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000121'',''O.S. CHEQUE À PRAZO'',1,''1.03.104'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000122'',''O.S. CARTÃO CRÉDITO'',1,''1.03.105'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000123'',''O.S. CARTÃO DÉBITO'',1,''1.03.106'',''000006'', 3); ');
//qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000125'',''PAGTO - CAIXA'',2,''2.01.101'',''000006'', 3); ');
//qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000126'',''PAGTO - BANCO'',2,''2.01.102'',''000006'', 3); ');
//qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000127'',''PAGTO - CHEQUE TERC.'',2,''2.01.103'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000140'',''VENDA CONVÊNIO'',1,''1.01.110'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000141'',''VENDA CONVÊNIO VIDALINK'',1,''1.01.111'',''000006'', 3); ');
qrcommonExec(' UPDATE OR INSERT INTO C000035 (CODIGO, CONTA, TIPO, CLASSIFICACAO, CODGRUPO, NIVEL) VALUES (''000142'',''VENDA FINANCEIRA'',1,''1.01.112'',''000006'', 3); ');


end;


function TfrmPrincipal.ObterDiretorioDoExecutavel: string;
begin
  result := ExtractFilePath(Application.ExeName);
end;

function TfrmPrincipal.ObterNumeroVersaoFTP: smallint;
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

    // ShowMessage('ftp '+sNumeroVersao);
  finally
    FreeAndNil(oArquivoINI);
  end;
end;

function TfrmPrincipal.ObterNumeroVersaoLocal: smallint;
var
  sNumeroVersao: string;
  oArquivoINI: TIniFile;
begin
  // abre o arquivo "VersaoLocal.ini"
  oArquivoINI := TIniFile.Create(ObterDiretorioDoExecutavel +
      'VersaoLocalAuxiliar.ini');
  try
    // lê o número da versão
    sNumeroVersao := oArquivoINI.ReadString('VersaoLocal', 'Numero', EmptyStr);

    // retira os pontos (exemplo: de "1.0.0" para "100")
    sNumeroVersao := StringReplace(sNumeroVersao, '.', EmptyStr,
      [rfReplaceAll]);

    // converte o número da versão para número
    result := StrToIntDef(sNumeroVersao, 0);
    // ShowMessage('local'+sNumeroVersao);
  finally
    FreeAndNil(oArquivoINI);
  end;
end;

procedure TfrmPrincipal.Periodo;
begin
  DmRel.qrrelatorio.Open;
  DmRel.qrrelatorio.Edit;
  DmRel.qrrelatorio.FieldByName('LINHA2').AsString := 'Período: ' +
    (FormatDateTime('dd/mm/yyyy', dataI.Date)) + ' a ' +
    (FormatDateTime('dd/mm/yyyy', dataF.Date));

end;



procedure TfrmPrincipal.qrcommonExec(sqlComand: string);
begin
with dm.qrCommon do
begin
Close;
SQL.Clear;

SQL.Text := sqlComand ;

//Prepare;
ExecSQL;
//CommitUpdates;
//ShowMessage(SQL.Text);
end;
end;

procedure TfrmPrincipal.ReiniciarAplicacao;
begin
  ShowMessage
    ('Atualização concluída com sucesso. A aplicação será reiniciada.');
  ShellExecute(0, nil, PChar(Application.ExeName), '', nil, SW_SHOWNORMAL);
  Application.Terminate;
end;

procedure TfrmPrincipal.btnRelatorioClick(Sender: TObject);
begin
  pcAtendimento.Visible := True;
  pcAtendimento.ActivePage := tabRel;
  tabRel.TabVisible := True;
//  tabBoleto.TabVisible := False;

  verificarBaixarCartao;

  //correção pra Sotelli v2.00 15/01/19
  VericarDuplicatasPagar;

 //nao esta desativado pq trocou de servido
// if testarInternet = True then AtualizarVersao;

 //add na versao 1.7.5
 //novo plano de contas com
 converterPlanoConta;

end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  pcAtendimento.Visible := True;
//  pcAtendimento.ActivePage := tabBoleto;
  tabRel.TabVisible := False;
//  tabBoleto.TabVisible := True;
end;

function TfrmPrincipal.testarInternet:Boolean;
begin
  // testa se tem internet
  try
    IdHTTP.Get('http://www.google.com.br');
    IdHTTP.ProxyParams.BasicAuthentication := True;
    IdHTTP.Request.BasicAuthentication := True;

    // ativa a qrweb ser tiver internet
//    dm.web.Connected := True;
    // showmessage('Tem conexão');
    // AtualizarVersao;
    Result:= True;
  except

    // dm.web.Connected := false;
    Result:=False;
    ShowMessage('Não tem internet, não será possivel acessar o controle de licença');
  end;
end;

procedure TfrmPrincipal.VericarDuplicatasPagar;
begin
    dm.qrCommon.Close;
    dm.qrCommon.SQL.Clear;
    dm.qrCommon.SQL.Text := 'update c000044 cx set cx.codconta=''000021'' where cx.historico like ''%Duplicata a Pagar%'' and cx.codconta<>''000021'' ';
    dm.qrCommon.ExecSQL;
//    dm.qrCommon.open;

    dm.qrCommon.Close;
    dm.qrCommon.SQL.Clear;
    dm.qrCommon.SQL.Text := 'update c000042 cx set cx.codconta=''000021'' where cx.codconta=''000008'' AND cx.tipo=''D'' ';
    dm.qrCommon.ExecSQL;
//    dm.qrCommon.open;


end;

procedure TfrmPrincipal.verificarBaixarCartao;
begin
///
    dm.qrCommon.Close;
    dm.qrCommon.SQL.Clear;
    dm.qrCommon.SQL.Text := 'UPDATE c000042 C set C.codconta=''000013'' where c.codconta is null and ((c.historico like ''%BAIXA DE CARTAO%'')  or ( c.historico like ''DEPOSITO EM CHEQUE''))';

    dm.qrCommon.ExecSQL;
end;

procedure TfrmPrincipal.versaoRelatorio;
begin
  DmRel.qrrelatorio.Open;
  DmRel.qrrelatorio.Edit;
  DmRel.qrrelatorio.FieldByName('LINHA3').AsString :=
    'Versão: ' + versao;
end;

function TfrmPrincipal.zerarcodigo(codigo: string; qtde: integer): string;
begin
  while length(codigo) < qtde do codigo := '0'+codigo;
  result := codigo;
end;

end.
