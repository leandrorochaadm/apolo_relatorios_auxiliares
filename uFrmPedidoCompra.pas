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
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    btnAdd: TButton;
    procedure atualizarProdutoFornecedores;
    procedure DBLCfornecedorExit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure atualizarSugestao;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoCompra: TfrmPedidoCompra;

implementation

{$R *.dfm}

uses uDM, FireDAC.Stan.Param;

procedure TfrmPedidoCompra.atualizarProdutoFornecedores;
begin
  with DM.qrProdForn do
  begin
   Open;
    ParamByName('fornecedor').Value :=
//     '000002';
    DBLCfornecedor.KeyValue;
//    ShowMessage(DBLCfornecedor.KeyValue);
    Refresh;

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

procedure TfrmPedidoCompra.btnAddClick(Sender: TObject);
begin
//DBGrid1.Fields[0].AsString;
dm.qrCompra.Open;
dm.qrCompra.Append;
dm.qrCompraCODIGO.Value := '999999';
dm.qrCompraCODFORNECEDOR.Value := DBLCfornecedor.KeyValue;
//dm.qrCompraDATA.Value := EncodeDate(2019,2, 28);
//ShowMessage(FormatDateTime('dd/mm/yyyy',now));
dm.qrCompra.Post;
end;

procedure TfrmPedidoCompra.DBGrid1CellClick(Column: TColumn);
begin
atualizarSugestao
end;

procedure TfrmPedidoCompra.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
atualizarSugestao;
end;

procedure TfrmPedidoCompra.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
atualizarSugestao;
end;

procedure TfrmPedidoCompra.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
atualizarSugestao;
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
