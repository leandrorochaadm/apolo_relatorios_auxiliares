unit uFrmCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
  private
    procedure pedidoToNF(pedido:string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uDM;

{ TForm1 }

procedure TForm1.pedidoToNF(pedido: string);
begin
//log('deletando grupo');
//  with dm.qrDestino do
//  begin
//    Close;
//    sql.Clear;
//    sql.Text:= 'delete from C000017';
//    ExecSQL;
//  end;

//log('subgrupo iniciadas');

 with dm.qrDestino do
  begin
    Close;
    sql.Clear;
    sql.Text:=
    'INSERT INTO C000017 (CODIGO, GRUPO '+
    '  ) '+
    'VALUES (:CODIGO, :GRUPO '+
    '  )';

  end;



  with dm.qrOrigem do
  begin
      Close;
      sql.Clear;
      sql.Text :=
      'SELECT * '+
      '  '+
      ' FROM [hlpdados].[dbo].[grupo]';
    Open;
    First;

  end;

//  pb.Position:=0;
//  pb.Max:= dm.qrOrigem.RecordCount;

  while not dm.qrOrigem.Eof do
  begin


    dm.qrDestino.ParamByName('CODIGO').Value :=
      (dm.qrOrigem.FieldByName('CodGrupo').Value);

   dm.qrDestino.ParamByName('GRUPO').Value :=
     (dm.qrOrigem.FieldByName('Nome').Value);


    dm.qrDestino.ExecSQL;
//    pb.Position:= pb.Position+1;
    dm.qrOrigem.Next;
  end;
//  sequencia('000017');

//  log('grupo concluída : '+IntToStr(pb.Position));

end;

end.
