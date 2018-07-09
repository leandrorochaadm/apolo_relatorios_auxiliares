unit uFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExeInfo, ComCtrls, ExtCtrls, StdCtrls, Grids, DBGrids,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, CheckLst,
  DBCtrls;

type
  TfrmPrincipal = class(TForm)
    BtnLiberador: TSpeedButton;
    ExeInfo1: TExeInfo;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    pcAtendimento: TPageControl;
    tabRel: TTabSheet;
    tabBoleto: TTabSheet;
    IdHTTP: TIdHTTP;
    btnDreDet: TButton;
    Imprimir: TButton;
    Button1: TButton;
    dataI: TDateTimePicker;
    dataF: TDateTimePicker;
    btnDreRes: TButton;
    dblkcbbPlanoConta: TDBLookupComboBox;
    lblDataI: TLabel;
    lblDataF: TLabel;
    lblPlanoConta: TLabel;
    btnLimparFiltro: TButton;
    procedure BtnLiberadorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnDreDetClick(Sender: TObject);
    procedure btnDreResClick(Sender: TObject);
    procedure Periodo;
    procedure btnLimparFiltroClick(Sender: TObject);
    procedure LimparFiltros;
    procedure versaoRelatorio;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uFrmLiberador, uDM, uDmRel;
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
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin

  Periodo;

  with uDmRel.DmRel.frxRepProdCusto do
  begin
    LoadFromFile(ExtractFilePath(ParamStr(0)) + 'rel\PrecCusto.fr3');
    PrepareReport(True);
    ShowReport;
  end;

end;

procedure TfrmPrincipal.btnDreResClick(Sender: TObject);
begin

 {$region 'sql Res'}
  DmRel.qrDreRes.Close;
  DmRel.qrDreRes.SQL.Clear;
  DmRel.qrDreRes.SQL.Add('Select ');
  DmRel.qrDreRes.SQL.Add('Classificacao, ');
  DmRel.qrDreRes.SQL.Add('max(tipo) as tipo, ');
  DmRel.qrDreRes.SQL.Add('max(Nome_Conta) as Nome_conta, ');
  DmRel.qrDreRes.SQL.Add('sum(Total) as Total ');

  DmRel.qrDreRes.SQL.Add('from ');
  DmRel.qrDreRes.SQL.Add('( Select ');
  DmRel.qrDreRes.SQL.Add('c000035.classificacao as Classificacao, ');
  DmRel.qrDreRes.SQL.Add('c000035.tipo as tipo, ');
  DmRel.qrDreRes.SQL.Add('c000035.conta as Nome_Conta, ');
  DmRel.qrDreRes.SQL.Add('sum(c000042.Valor) as Total ');
  DmRel.qrDreRes.SQL.Add('from ');

  DmRel.qrDreRes.SQL.Add('c000042 ');
  DmRel.qrDreRes.SQL.Add(
    'INNER JOIN C000035 ON(C000042.codconta = c000035.CODIGO) ');
  DmRel.qrDreRes.SQL.Add('where ');
  DmRel.qrDreRes.SQL.Add('c000042.DATA between :dataI and :dataF ');

  // ShowMessage((dblkcbbPlanoConta.KeyValue));

  if Trim(dblkcbbPlanoConta.Text) <> '' then
  begin
    DmRel.qrDreRes.SQL.Add(' and C000042.codconta=' + inttostr
        (dblkcbbPlanoConta.KeyValue));
  end;

  DmRel.qrDreRes.SQL.Add(' group by ');
  DmRel.qrDreRes.SQL.Add('Classificacao, ');
  DmRel.qrDreRes.SQL.Add('tipo, ');
  DmRel.qrDreRes.SQL.Add('Nome_Conta ');

  DmRel.qrDreRes.SQL.Add('UNION ALL ');

  DmRel.qrDreRes.SQL.Add('Select ');
  DmRel.qrDreRes.SQL.Add('c000035.classificacao as Classificacao, ');
  DmRel.qrDreRes.SQL.Add('c000035.tipo as tipo, ');
  DmRel.qrDreRes.SQL.Add('c000035.conta as Nome_Conta, ');
  DmRel.qrDreRes.SQL.Add(
    'sum((coalesce(c000044.entrada,0) - coalesce(c000044.saida,0))) as Total ');
  DmRel.qrDreRes.SQL.Add('from ');
  DmRel.qrDreRes.SQL.Add('c000044 ');
  DmRel.qrDreRes.SQL.Add(
    'INNER JOIN C000035 ON(C000044.codconta = c000035.codigo) ');
  DmRel.qrDreRes.SQL.Add('where 1=1 ');

  if Trim(dblkcbbPlanoConta.Text) <> '' then
  begin
    DmRel.qrDreRes.SQL.Add(' and C000044.codconta=' + inttostr
        (dblkcbbPlanoConta.KeyValue));
  end;

  DmRel.qrDreRes.SQL.Add(' and c000044.DATA between   :dataI and :dataF ');
  DmRel.qrDreRes.SQL.Add(
    'and (coalesce(c000044.entrada,0) - coalesce(c000044.saida,0)) <>0 ');
  DmRel.qrDreRes.SQL.Add('and  historico <> ''S A L D O   A N T E R I O R'' ');
  DmRel.qrDreRes.SQL.Add('and historico <> ''Acerto do Saldo Anterior'' ');

  DmRel.qrDreRes.SQL.Add('group by ');
  DmRel.qrDreRes.SQL.Add('Classificacao, ');
  DmRel.qrDreRes.SQL.Add('tipo, ');
  DmRel.qrDreRes.SQL.Add('Nome_Conta ');
  DmRel.qrDreRes.SQL.Add(')  as tmp ');
  DmRel.qrDreRes.SQL.Add('group by classificacao ');

  DmRel.qrDreRes.Open;

  {$endregion}

  with DmRel.qrDreRes, SQL do
  begin
    Close;
    Params.ParamByName('DataI').AsDate := dataI.Date;
    Params.ParamByName('DataF').AsDate := dataF.Date;
    Open;
  end;

  Periodo;
  versaoRelatorio;

  with uDmRel.DmRel.frxRepProdCusto do
  begin
    LoadFromFile(ExtractFilePath(ParamStr(0)) + 'rel\DreRes.fr3');
    PrepareReport(True);
    ShowReport;
  end;
end;

procedure TfrmPrincipal.btnDreDetClick(Sender: TObject);
begin
{$region 'sql Det'}
  DmRel.qrDreDet.close;
  DmRel.qrDreDet.sql.Clear;
  DmRel.qrDreDet.SQL.Add(' Select ');
  DmRel.qrDreDet.SQL.Add(' Classificacao, ');
  DmRel.qrDreDet.SQL.Add(' tipo, ');
  DmRel.qrDreDet.SQL.Add(' Nome_Conta, ');
  DmRel.qrDreDet.SQL.Add(' historico, ');
  DmRel.qrDreDet.SQL.Add(' origem, ');
  DmRel.qrDreDet.SQL.Add(' data, ');
  DmRel.qrDreDet.SQL.Add(' Total ');
  DmRel.qrDreDet.SQL.Add(' from ');

  DmRel.qrDreDet.SQL.Add(' ( Select ');
  DmRel.qrDreDet.SQL.Add(' c000035.classificacao as Classificacao, ');
  DmRel.qrDreDet.SQL.Add(' c000035.tipo as tipo, ');
  DmRel.qrDreDet.SQL.Add(' c000035.conta as Nome_Conta, ');
  DmRel.qrDreDet.SQL.Add(' c000044.data, ');
  DmRel.qrDreDet.SQL.Add(' c000044.historico, ');
  DmRel.qrDreDet.SQL.Add(' c000044.codconta as origem, ');
  DmRel.qrDreDet.SQL.Add(
    ' (coalesce(c000044.entrada,0) - coalesce(c000044.saida,0)) as Total ');
  DmRel.qrDreDet.SQL.Add(' from ');
  DmRel.qrDreDet.SQL.Add(' c000044 ');
  DmRel.qrDreDet.SQL.Add(
    ' INNER JOIN C000035 ON(C000044.codconta = c000035.codigo) ');
  DmRel.qrDreDet.SQL.Add(' where ');

  DmRel.qrDreDet.SQL.Add(' c000044.DATA  between :dataI and :dataF ');

  DmRel.qrDreDet.SQL.Add(
    ' and (coalesce(c000044.entrada,0) - coalesce(c000044.saida,0)) <>0 ');
  DmRel.qrDreDet.SQL.Add(' and  historico <> ''S A L D O   A N T E R I O R'' ');
  DmRel.qrDreDet.SQL.Add(' and historico <> ''Acerto do Saldo Anterior'' ');

  if Trim(dblkcbbPlanoConta.Text) <> '' then
  begin
    DmRel.qrDreDet.SQL.Add(' and C000044.codconta=' + inttostr
        (dblkcbbPlanoConta.KeyValue));
  end;

  DmRel.qrDreDet.SQL.Add(' union all ');

  DmRel.qrDreDet.SQL.Add(' Select ');
  DmRel.qrDreDet.SQL.Add(' c000035.classificacao as Classificacao, ');
  DmRel.qrDreDet.SQL.Add(' c000035.tipo as tipo, ');
  DmRel.qrDreDet.SQL.Add(' c000035.conta as Nome_Conta, ');
  DmRel.qrDreDet.SQL.Add(' c000042.data, ');
  DmRel.qrDreDet.SQL.Add(' c000042.historico, ');
  DmRel.qrDreDet.SQL.Add(' c000042.codconta as origem, ');
  DmRel.qrDreDet.SQL.Add(' (c000042.Valor) as Total ');
  DmRel.qrDreDet.SQL.Add(' from ');

  DmRel.qrDreDet.SQL.Add(' c000042 ');
  DmRel.qrDreDet.SQL.Add(
    ' INNER JOIN C000035 ON(C000042.codconta = c000035.CODIGO) ');
  DmRel.qrDreDet.SQL.Add(' where ');
  DmRel.qrDreDet.SQL.Add(' c000042.DATA  between :dataI and :dataF ');

  if Trim(dblkcbbPlanoConta.Text) <> '' then
  begin
    DmRel.qrDreDet.SQL.Add(' and C000042.codconta=' + inttostr
        (dblkcbbPlanoConta.KeyValue));
  end;

  DmRel.qrDreDet.SQL.Add(' )  as tmp ');
  DmRel.qrDreDet.SQL.Add(' order by ');
  DmRel.qrDreDet.SQL.Add(' Classificacao, ');
  DmRel.qrDreDet.SQL.Add(' data, ');
  DmRel.qrDreDet.SQL.Add(' historico, ');
  DmRel.qrDreDet.SQL.Add(' Total ');

  DmRel.qrDreDet.Open;

  {$endregion}

  with DmRel.qrDreDet, SQL do
  begin
    Close;
    Params.ParamByName('DataI').AsDate := dataI.Date;
    Params.ParamByName('DataF').AsDate := dataF.Date;
    Open;
  end;

  Periodo;
  versaoRelatorio;

  with uDmRel.DmRel.frxRepProdCusto do
  begin
    LoadFromFile(ExtractFilePath(ParamStr(0)) + 'rel\DreDet.fr3');
    PrepareReport(True);
    ShowReport;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  LimparFiltros; // limpar filtros

  // desabilita qrweb
  dm.web.Connected := false;

  // testa se tem internet
  try
    IdHTTP.Get('http://www.google.com.br');
    IdHTTP.ProxyParams.BasicAuthentication := True;
    IdHTTP.Request.BasicAuthentication := True;

    // ativa a qrweb ser tiver internet
    dm.web.Connected := True;
    // showmessage('Tem conex�o');
  except
    showmessage(
      'N�o tem internet, n�o ser� possivel acessar o controle de licen�a');
    // dm.web.Connected := false;
  end;

  BtnLiberador.Visible := false;
  // ShowMessage(dm.con.HostName+' - '+dm.con.Database);
  frmPrincipal.caption := caption + ' Vers�o: ' + ExeInfo1.FileVersion;

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
    dm.qrClienteWeb.ParamByName('Bloqueado').AsString := 'SIM';

    dm.qrClienteWeb.ExecSQL;

  end;

  if dm.qrClienteWeb.FieldByName('Bloqueado').Value = 'NAO' then
    BtnLiberador.Visible := True;

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

  with uDmRel.DmRel.frxRepVendaCartaoSnfce do
  begin
    LoadFromFile(ExtractFilePath(ParamStr(0)) + 'rel\VendaCartaoSnfce.fr3');
    PrepareReport(True);
    ShowReport;
  end;
end;

procedure TfrmPrincipal.LimparFiltros;
begin
  dblkcbbPlanoConta.KeyValue := '';
  // dblkcbbPlanoConta.Text := '';
  dataI.Date := Date - 1; // StrToDate('01/05/2018');
  dataF.Date := Date; // StrToDate('31/05/2018');
end;

procedure TfrmPrincipal.Periodo;
begin
  DmRel.qrrelatorio.Open;
  DmRel.qrrelatorio.Edit;
  DmRel.qrrelatorio.FieldByName('LINHA2').AsString := 'Per�odo: ' +
    (FormatDateTime('dd/mm/yyyy', dataI.Date)) + ' a ' +
    (FormatDateTime('dd/mm/yyyy', dataF.Date));

end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  pcAtendimento.Visible := True;
  pcAtendimento.ActivePage := tabRel;
  tabRel.TabVisible := True;
  tabBoleto.TabVisible := false;

end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  pcAtendimento.Visible := True;
  pcAtendimento.ActivePage := tabBoleto;
  tabRel.TabVisible := false;
  tabBoleto.TabVisible := True;
end;

procedure TfrmPrincipal.versaoRelatorio;
begin
  DmRel.qrrelatorio.Open;
  DmRel.qrrelatorio.Edit;
  DmRel.qrrelatorio.FieldByName('LINHA3').AsString :=
    'Vers�o: ' + ExeInfo1.FileVersion;
end;

end.
