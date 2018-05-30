unit uFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExeInfo, ComCtrls, ExtCtrls, StdCtrls;

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
    TabSheet3: TTabSheet;
    tabVendaCartaoSnfce: TTabSheet;
    Button1: TButton;
    Imprimir: TButton;
    procedure BtnLiberadorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
LoadFromFile(ExtractFilePath(ParamStr(0))+'\rel\VendaCartaoSnfce.fr3');
PrepareReport(True);
ShowReport;
end;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
//ShowMessage(dm.con.HostName+' - '+dm.con.Database);
frmPrincipal.caption:= caption + '         Versão: '+ExeInfo1.FileVersion
end;

procedure TfrmPrincipal.ImprimirClick(Sender: TObject);
begin
with uDmRel.dmRel.frxRepVendaCartaoSnfce do
begin
LoadFromFile(ExtractFilePath(ParamStr(0))+'\rel\VendaCartaoSnfce.fr3');
PrepareReport(True);
ShowReport;
end;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
//pcAtendimento;
end;

end.
