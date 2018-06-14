unit uFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExeInfo, ComCtrls, ExtCtrls, StdCtrls, Grids, DBGrids,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

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
    pcRel: TPageControl;
    tabProdCusto: TTabSheet;
    tabBoleto: TTabSheet;
    tabVendaCartaoSnfce: TTabSheet;
    Button1: TButton;
    Imprimir: TButton;
    IdHTTP: TIdHTTP;
    procedure BtnLiberadorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
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

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin

with uDmRel.DmRel.frxRepProdCusto do
begin
LoadFromFile(ExtractFilePath(ParamStr(0))+'rel\PrecCusto.fr3');
PrepareReport(True);
ShowReport;
end;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
//desabilita qrweb
dm.web.Connected := false;

//testa se tem internet
 try
    IdHTTP.Get('http://www.google.com.br');
    idHttp.ProxyParams.BasicAuthentication  := True;
    idHttp.Request.BasicAuthentication      := True;

//ativa a qrweb ser tiver internet
    dm.web.Connected := true;
//    showmessage('Tem conexão');
  except
    showmessage('Não tem internet, não será possivel acessar o controle de licença');
//    dm.web.Connected := false;
  end;



BtnLiberador.Visible:=false;
//ShowMessage(dm.con.HostName+' - '+dm.con.Database);
frmPrincipal.caption:= caption + '         Versão: '+ExeInfo1.FileVersion ;

with dm.qrClienteWeb, SQL do
  begin
    close;
    Clear;
    text:='select * from cliente where cpf_cnpj = :cnpj';
    ParamByName('cnpj').Value := dm.qrFilial.FieldByName('cnpj').Value;
    open;
  end;

//  ShowMessage(inttostr(dm.qrClienteWeb.RecordCount));
if dm.qrClienteWeb.RecordCount = 0 then
  begin
    dm.qrClienteWeb.close;
    dm.qrClienteWeb.sql.Clear;
    dm.qrClienteWeb.sql.text:='INSERT INTO `atoms053_web`.`cliente` '+
    '(`cod`, `razao`, `cpf_cnpj`, bloqueado) '+
    ' VALUES (:cod, :razao, :cpf_cnpj, :bloqueado)'  ;

    dm.qrClienteWeb.ParamByName('cod').AsInteger := 1000;
    dm.qrClienteWeb.ParamByName('razao').AsString := dm.qrFilial.FieldByName('FILIAL').AsString ;
    dm.qrClienteWeb.ParamByName('cpf_cnpj').AsString := dm.qrFilial.FieldByName('cnpj').AsString;
    dm.qrClienteWeb.ParamByName('Bloqueado').AsString  := 'SIM';

    dm.qrClienteWeb.ExecSQL;

  end;

if dm.qrClienteWeb.FieldByName('Bloqueado').Value = 'NAO' then
  BtnLiberador.Visible:=true;

end;

procedure TfrmPrincipal.ImprimirClick(Sender: TObject);
begin
with uDmRel.dmRel.frxRepVendaCartaoSnfce do
begin
LoadFromFile(ExtractFilePath(ParamStr(0))+'rel\VendaCartaoSnfce.fr3');
PrepareReport(True);
ShowReport;
end;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
pcAtendimento.Visible:=true;
pcAtendimento.ActivePage := tabRel;
tabRel.TabVisible:=true;
tabBoleto.TabVisible:=false;

end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
pcAtendimento.Visible:=true;
pcAtendimento.ActivePage := tabBoleto;
tabRel.TabVisible:=false;
tabBoleto.TabVisible:=true;
end;

end.
