unit uDmRel;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  frxClass, frxDBSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmRel = class(TDataModule)
    qrRelProdCusto: TZQuery;
    dsRelProdCusto: TDataSource;
    qrVendaCartaoSnfce: TZQuery;
    dsVendaCartaoSnfce: TDataSource;
    qrDreDet: TZQuery;
    dsDreDet: TDataSource;

    qrDreRes: TZQuery;
    dsDreRes: TDataSource;
    QrRelatorio: TZQuery;

    DsRelatorio: TDataSource;
    qrVendaMensal: TFDQuery;
    qrCommon: TFDQuery;
    frxDreDet: TfrxReport;
    frxDBdre: TfrxDBDataset;
    frxDBRelatorio: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRel: TdmRel;

implementation

uses uDM;

{$R *.dfm}

procedure TdmRel.DataModuleCreate(Sender: TObject);
begin
qrRelProdCusto.Active:=true;
qrVendaCartaoSnfce.Active:=true;
qrDreDet.Active:=true;
qrDreRes.Active:=true;

qrCommon.Active:=true;
end;

end.