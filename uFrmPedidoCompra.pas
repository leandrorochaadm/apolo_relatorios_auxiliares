unit uFrmPedidoCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TfrmPedidoCompra = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBLCfornecedor: TDBLookupComboBox;
    Panel3: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    procedure atualizarProdutoFornecedores;
    procedure DBLCfornecedorExit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure atualizarSugestao;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoCompra: TfrmPedidoCompra;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmPedidoCompra.atualizarProdutoFornecedores;
begin
  with DM.qrProdForn do
  begin
    ParamByName('fornecedor').Value :=
//     '000002';
    DBLCfornecedor.KeyValue;
//    ShowMessage(DBLCfornecedor.KeyValue);
    Open;
    dm.dsProdForn.DataSet.Refresh;
  end
end;

procedure TfrmPedidoCompra.atualizarSugestao;
begin
//ShowMessage(DBGrid1.Fields[0].AsString);

  with DM.qrSugestao do
  begin
    Open;
    Refresh;
    ParamByName('codproduto').Value :=
//     '000002';
    DBGrid1.Fields[0].AsString;
//    ShowMessage(DBLCfornecedor.KeyValue);
    Refresh;
    Open;
//    dm.dsProdForn.DataSet.Refresh;
  end
end;

procedure TfrmPedidoCompra.DBGrid1CellClick(Column: TColumn);
begin
atualizarSugestao
end;

procedure TfrmPedidoCompra.DBGrid1MouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
atualizarSugestao;
end;

procedure TfrmPedidoCompra.DBLCfornecedorExit(Sender: TObject);
begin
atualizarProdutoFornecedores;
end;

end.
