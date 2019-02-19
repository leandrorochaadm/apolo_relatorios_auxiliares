unit uRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs;

  procedure DreRes(DataI, DataF: TDate);
  procedure DreDet(DataI, DataF: TDate);
  procedure VendaMensal(DataI, DataF: TDate);
  procedure LucroProduto(DataI, DataF: TDate);
  procedure Roi30;
  procedure Roi60;


implementation

uses uDM;

procedure DreRes(DataI, DataF: TDate);
begin
  with dm.qrCommon do
  begin
  close;
  sql.Clear;
  sql.Text :=
'Select Classificacao, max(tipo) as tipo, max(Nome_Conta) as Nome_conta, sum(Total) as Total from '+
'( Select c000035.classificacao as Classificacao, c000035.tipo as tipo, c000035.conta as Nome_Conta, sum(c000042.Valor) as Total '+
'from c000042 INNER JOIN C000035 ON(C000042.codconta = c000035.CODIGO) '+
'where c000042.DATA between :dataI and :dataF '+
'group by Classificacao, tipo, Nome_Conta UNION ALL '+
'Select c000035.classificacao as Classificacao, c000035.tipo as tipo, c000035.conta as Nome_Conta, '+
'sum((coalesce(c000044.entrada,0) - coalesce(c000044.saida,0))) as Total '+
'from c000044 INNER JOIN C000035 ON(C000044.codconta = c000035.codigo) '+
'where 1=1 and c000044.DATA between   :dataI and :dataF '+
'and (coalesce(c000044.entrada,0) - coalesce(c000044.saida,0)) <>0 '+
'and  historico <> ''S A L D O   A N T E R I O R'' '+
'and historico <> ''Acerto do Saldo Anterior'' '+
'group by Classificacao, tipo, Nome_Conta) as tmp group by classificacao ';

  Params.ParamByName('dataI').AsDate := DataI;
  Params.ParamByName('dataF').AsDate := DataF;
  Open;
  end;
end;

procedure DreDet(DataI, DataF: TDate);
begin
 with dm.qrCommon do
  begin
  close;
  sql.Clear;
  sql.Text :=

'Select Classificacao, tipo, Nome_Conta, historico, origem, data, Total from '+
'( Select '+
'c000035.classificacao as Classificacao, '+
'c000035.tipo as tipo, '+
'c000035.conta as Nome_Conta, '+
'c000044.data, '+
'c000044.historico, '+
'c000044.codconta as origem, '+
'(coalesce(c000044.entrada,0) - coalesce(c000044.saida,0)) as Total from c000044 '+
'INNER JOIN C000035 ON(C000044.codconta = c000035.codigo) where '+
'c000044.DATA  between :dataI and :dataF '+
'and (coalesce(c000044.entrada,0) - coalesce(c000044.saida,0)) <>0 '+
'and  historico <> ''S A L D O   A N T E R I O R'' '+
'and historico <> ''Acerto do Saldo Anterior'' union all '+
'Select '+
'c000035.classificacao as Classificacao, '+
'c000035.tipo as tipo, '+
'c000035.conta as Nome_Conta, '+
'c000042.data, '+
'c000042.historico, '+
'c000042.codconta as origem, '+
'(c000042.Valor) as Total '+
'from c000042 '+
'INNER JOIN C000035 ON(C000042.codconta = c000035.CODIGO) '+
'where c000042.DATA  between :dataI and :dataF '+
')  as tmp '+
'order by Classificacao, data, historico, Total ';

  Params.ParamByName('dataI').AsDate := DataI;
  Params.ParamByName('dataF').AsDate := DataF;
  Open;
  end;
end;

procedure VendaMensal(DataI, DataF: TDate);
begin
 with dm.qrCommon do
  begin
  close;
  sql.Clear;
  sql.Text :=

'select  (LPad(extract(year from v.data),4,''0'')||''.''||LPad(extract(month from v.data),2,''0'')) as dataMes , '+
'sum(v.meio_dinheiro) as dinhero, (sum(v.meio_chequeav)+sum(v.meio_chequeap)) as cheque, (sum(v.meio_cartaocred) + sum(v.meio_cartaodeb)) as cartao, sum(v.meio_crediario) as crediario, sum(v.total) as total from c000048 v '+
'where v.situacao=1  and v.data between  :dataI and :dataF group by dataMes ';

  Params.ParamByName('dataI').AsDate := DataI;
  Params.ParamByName('dataF').AsDate := DataF;
  Open;
  end;
end;

procedure LucroProduto(DataI, DataF: TDate);
begin
 with dm.qrCommon do
  begin
  close;
  sql.Clear;
  sql.Text :=
'select c.produto, itv.codproduto,sum(itv.total) as venda ,(sum(itv.total)-(sum(itv.qtde) *c.precocusto )) as lucro '+
'from c000032 itv '+
'left join c000025 c on( c.codigo=itv.codproduto) '+
'where itv.data between :dataI and :dataF '+
'group by itv.codproduto, c.produto, c.precocusto '+
'order by (sum(itv.total)-(sum(itv.qtde) *c.precocusto )) desc ';

  Params.ParamByName('dataI').AsDate := DataI;
  Params.ParamByName('dataF').AsDate := DataF;
  Open;
  end;
end;

procedure Roi30;
begin
 with dm.qrCommon do
  begin
  close;
  sql.Clear;
  sql.Text :=
'select * from roi30';

//  Params.ParamByName('dataI').AsDate := DataI;
//  Params.ParamByName('dataF').AsDate := DataF;
  Open;
  end;
end;

procedure Roi60;
begin
 with dm.qrCommon do
  begin
  close;
  sql.Clear;
  sql.Text :=
'select * from roi60';

//  Params.ParamByName('dataI').AsDate := DataI;
//  Params.ParamByName('dataF').AsDate := DataF;
  Open;
  end;
end;

end.
