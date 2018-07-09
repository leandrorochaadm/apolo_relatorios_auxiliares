unit uDmRel;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  frxClass, frxDBSet;

type
  TdmRel = class(TDataModule)
    frxRepProdCusto: TfrxReport;
    frDBprodCusto: TfrxDBDataset;
    qrRelProdCusto: TZQuery;
    dsRelProdCusto: TDataSource;
    qrVendaCartaoSnfce: TZQuery;
    dsVendaCartaoSnfce: TDataSource;
    frxDBVendaCartaoSnfce: TfrxDBDataset;
    frxRepVendaCartaoSnfce: TfrxReport;
    frxDBFilial: TfrxDBDataset;
    qrDreDet: TZQuery;
    dsDreDet: TDataSource;
    frxDBdre: TfrxDBDataset;
    frxDreDet: TfrxReport;
    qrDreRes: TZQuery;
    dsDreRes: TDataSource;
    frxDBdreRes: TfrxDBDataset;
    frxDreRes: TfrxReport;
    QrRelatorio: TZQuery;
    frxDBRelatorio: TfrxDBDataset;
    DsRelatorio: TDataSource;
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
