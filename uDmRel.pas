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
    frxDreRes: TfrxReport;
    frxDBdreRes: TfrxDBDataset;
    frxDBRelatorio: TfrxDBDataset;
    frxDreDet: TfrxReport;
    frxDBdre: TfrxDBDataset;
    frxVendaMensal: TfrxReport;
    frxDBVendaMes: TfrxDBDataset;
    frxDBFilial: TfrxDBDataset;
    frxDBlucroProduto: TfrxDBDataset;
    frxLucroProduto: TfrxReport;
    frxDBroi30: TfrxDBDataset;
    frxRoi30: TfrxReport;
    frxDBroi60: TfrxDBDataset;
    frxRoi60: TfrxReport;
    frxDBnotaFiscal: TfrxDBDataset;
    frxNotaFiscal: TfrxReport;
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


end;

end.
