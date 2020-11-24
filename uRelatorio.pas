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
  procedure NotasFiscalSaida(DataI, DataF: TDate);
  procedure Comissao(DataI, DataF: TDate);
  procedure VendaRecebimentoResumo(DataI, DataF: TDate);
  procedure ComissaoTodosVendedores(DataI, DataF: TDate);
  procedure ComissaoTodosVendedoresDetalhadado(DataI, DataF: TDate);


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

procedure NotasFiscalSaida(DataI, DataF: TDate);
begin
 with dm.qrCommon do
  begin
  close;
  sql.Clear;
  sql.Text :=
'select dataMes, sum(total) as valor from '+
'(select nf.numero, nf.data, (LPad(extract(year from nf.data),4,''0'')||''.''||LPad(extract(month from nf.data),2,''0'')) as dataMes, nf.total_nota as total from c000061 nf '+
'where nf.arq_xml_can_inu is null  and nf.numero <> '''' and nf.movimento=''S'' '+
  'union '+
'select v.nfce as numero, v.data, (LPad(extract(year from v.data),4,''0'')||''.''||LPad(extract(month from v.data),2,''0'')) as dataMes,  v.total from c000048 v '+
'where v.nfce in  (select nfce.codigo from sequencia_nfce nfce where nfce.status=''ENV'') ) where data between :dataI and :dataF group by dataMes ';

  Params.ParamByName('dataI').AsDate := DataI;
  Params.ParamByName('dataF').AsDate := DataF;
  Open;
  end;
end;

procedure Comissao(DataI, DataF: TDate);
begin
 with dm.qrCommon do
  begin
  close;
  sql.Clear;
  sql.Text :=

'select vd.codigo as codvenda, vend.codigo as codvendedor, vend.nome as nomevendedor,  vd.data as datavenda, vd.total, vp.valor_pago as valoraprazo, ct.valor as valorcartao, vd.meio_dinheiro as valordinheiro  from c000008 vend '+
'left join c000048 vd on (vd.codvendedor = vend.codigo) '+
'left join c000124 ct on (ct.cod_venda=vd.codigo) '+
'left join c000049 vp on (vd.codigo=vp.codvenda) '+
'where ((ct.data_baixa between :dataI and :dataF)  or (vp.data_pagamento between :dataI and :dataF ) or (vd.data between :dataI and :dataF)   ) '+
'and (vp.valor_pago >0 or ct.valor >0 or vd.meio_dinheiro >0  ) '+
'group by codvenda, codvendedor,  nomevendedor, datavenda, vd.total, valoraprazo, valorcartao, valordinheiro '+
'order by vend.codigo, vd.data ';



// Params.ParamByName('dataI').AsDate := DataI;
// Params.ParamByName('dataF').AsDate := DataF;
 ParamByName('dataI').AsDate := DataI;
 ParamByName('dataF').AsDate := DataF;
  Open;
  end;
end;

procedure VendaRecebimentoResumo(DataI, DataF: TDate);
begin
 with dm.qrCommon do
  begin
  close;
  sql.Clear;
  sql.Text :=
'select vend.codigo as codvendedor, vend.nome as nomevendedor, '+
'sum(vd.total - vd.desconto) as total, sum(vp.valor_pago) as valoraprazorecebida, '+
'sum(vp.valor_original-vp.valor_pago) as valoraprazoareceber, '+
'sum(ct.valor) as valorcartaorecebido, '+
'sum(vd.meio_cartaocred+vd.meio_cartaodeb-ct.valor) as cartaocredito_areceber, '+
'sum(vd.meio_dinheiro) as valordinheiro  from c000008 vend '+
'left join c000048 vd on (vd.codvendedor = vend.codigo) '+
'left join c000124 ct on (ct.cod_venda=vd.codigo)       '+
'left join c000049 vp on (vd.codigo=vp.codvenda)        '+
'where                                                  '+
'((ct.data_baixa between :dataI and :dataF)  or (vp.data_pagamento between :dataI and :dataF ) or (vd.data between :dataI and :dataF)   ) '+
'group by  codvendedor, nomevendedor '+
'order by nomevendedor ';



// Params.ParamByName('dataI').AsDate := DataI;
// Params.ParamByName('dataF').AsDate := DataF;
 ParamByName('dataI').AsDate := DataI;
 ParamByName('dataF').AsDate := DataF;
  Open;
  end;
end;

procedure ComissaoTodosVendedores(DataI, DataF: TDate);
begin
 with dm.qrCommon do
  begin
  close;
  sql.Clear;
  sql.Text :=

' select '+
    ' cod_funcionario, fun.nome, '+
    ' sum(comissao_) as comissao_total '+
' from ( '+
      ' /* select dos produtos vendidos pelo funcionario */ '+
    ' select '+
    ' it.data as data_os, '+
    ' IT.codvendedor as cod_funcionario, '+
    ' substring(IT.codnota from 1 for 6) as codnota, '+
    ' sum(case '+
    ' when((os.meio_dinheiro>0) or (os.meio_chequeav>0) or (os.meio_cartaodeb>0)) then it.total *0.025 '+
    ' when((os.meio_crediario>0) or (os.meio_chequeap>0) or (os.meio_cartaocred>0)) then it.total *0.015 '+
    ' else 0 '+
    ' end '+
    ' ) as comissao_ '+
    ' from C000032 IT '+
    ' inner join C000025 PR on(IT.codproduto = PR.codigo) '+
    ' inner join c000051 OS on (substring(IT.codnota from 1 for 6) = os.codigo) '+
    ' left join c000049 vp on (substring(IT.codnota from 1 for 6) = substring(vp.codvenda from 1 for 6)) '+
    ' left join c000040 ch on (substring(IT.codnota from 1 for 6) = substring(ch.codvenda from 1 for 6)) '+
    ' left join c000124 ct on (substring(IT.codnota from 1 for 6) = substring(ct.cod_venda from 1 for 6)) '+
    ' where '+
    ' /*recebido crediario*/   (vp.situacao =2 and vp.data_pagamento between :datai and :dataf) or '+
   ' /*recebido cheque*/   ((ch.situacao = 2 and ch.data_baixa between :datai and :dataf) )  or '+
   ' /*recebido cartao*/   (ct.situacao = ''BAIXADO'' and ct.data_baixa between :datai and :dataf ) or '+
    ' /*avista*/ (((os.meio_dinheiro>0) or (os.meio_chequeav>0) or (os.meio_cartaodeb>0)) and it.data between :datai and :dataf) '+
    ' group by 1,2,3 '+
' UNION ALL '+
    ' /* select dos serviços feito pelo funcionario */ '+
  ' select '+
    ' si.data as data_os, '+
    ' SI.codtecnico as funcionario, '+
    ' substring(SI.codos from 1 for 6) as codnota, '+
    ' sum(case '+
    ' when((os.meio_dinheiro>0) or (os.meio_chequeav>0) or (os.meio_cartaodeb>0)) then si.valor *0.1 '+
    ' when((os.meio_crediario>0) or (os.meio_chequeap>0) or (os.meio_cartaocred>0)) then si.valor *0.1 '+
    ' else 0 '+
    ' end '+
    ' ) as comissao_ '+
    ' from C000053 SI '+
    ' inner join C000011 SE on(SI.codservico = SE.codigo) '+
    ' inner join c000051 OS on (si.codos = os.codigo) '+
    ' left join c000049 vp on (si.codos = substring(vp.codvenda from 1 for 6)) '+
    ' left join c000040 ch on (si.codos = substring(ch.codvenda from 1 for 6)) '+
    ' left join c000124 ct on (si.codos = substring(ct.cod_venda from 1 for 6)) '+
    ' where '+
    ' /*recebido crediario*/   (vp.situacao =2 and vp.data_pagamento between :datai and :dataf) or '+
   ' /*recebido cheque*/   ((ch.situacao = 2 and ch.data_baixa between :datai and :dataf) )  or '+
   ' /*recebido cartao*/   (ct.situacao = ''BAIXADO'' and ct.data_baixa between :datai and :dataf ) or '+
   ' /*avista*/ (((os.meio_dinheiro>0) or (os.meio_chequeav>0) or (os.meio_cartaodeb>0)) and si.data between :datai and :dataf) '+
    ' group by 1,2,3 '+
' ) itens '+
' left join c000051 os on (os.codigo = itens.codnota) '+
' left join c000008 fun on (cod_funcionario = fun.codigo) '+
' where os.st = 4 '+
' group by 1,2 '+
' order by nome ';


 ParamByName('dataI').AsDate := DataI;
 ParamByName('dataF').AsDate := DataF;
  Open;
  end;
end;

procedure ComissaoTodosVendedoresDetalhadado(DataI, DataF: TDate);
begin
 with dm.qrCommon do
  begin
  close;
  sql.Clear;
  sql.Text :=

' select '+
    ' cod_funcionario, fun.nome, codnota, data_os, '+
    ' sum(comissao_) as comissao_total '+
' from ( '+
      ' /* select dos produtos vendidos pelo funcionario */ '+
    ' select '+
    ' it.data as data_os, '+
    ' IT.codvendedor as cod_funcionario, '+
    ' substring(IT.codnota from 1 for 6) as codnota, '+
    ' sum(case '+
    ' when((os.meio_dinheiro>0) or (os.meio_chequeav>0) or (os.meio_cartaodeb>0)) then it.total *0.025 '+
    ' when((os.meio_crediario>0) or (os.meio_chequeap>0) or (os.meio_cartaocred>0)) then it.total *0.015 '+
    ' else 0 '+
    ' end '+
    ' ) as comissao_ '+
    ' from C000032 IT '+
    ' inner join C000025 PR on(IT.codproduto = PR.codigo) '+
    ' inner join c000051 OS on (substring(IT.codnota from 1 for 6) = os.codigo) '+
    ' left join c000049 vp on (substring(IT.codnota from 1 for 6) = substring(vp.codvenda from 1 for 6)) '+
    ' left join c000040 ch on (substring(IT.codnota from 1 for 6) = substring(ch.codvenda from 1 for 6)) '+
    ' left join c000124 ct on (substring(IT.codnota from 1 for 6) = substring(ct.cod_venda from 1 for 6)) '+
    ' where '+
    ' /*recebido crediario*/   (vp.situacao =2 and vp.data_pagamento between :datai and :dataf) or '+
   ' /*recebido cheque*/   ((ch.situacao = 2 and ch.data_baixa between :datai and :dataf) )  or '+
   ' /*recebido cartao*/   (ct.situacao = ''BAIXADO'' and ct.data_baixa between :datai and :dataf ) or '+
    ' /*avista*/ (((os.meio_dinheiro>0) or (os.meio_chequeav>0) or (os.meio_cartaodeb>0)) and it.data between :datai and :dataf) '+
    ' group by 1,2,3 '+
' UNION ALL '+
    ' /* select dos serviços feito pelo funcionario */ '+
  ' select '+
    ' si.data as data_os, '+
    ' SI.codtecnico as funcionario, '+
    ' substring(SI.codos from 1 for 6) as codnota, '+
    ' sum(case '+
    ' when((os.meio_dinheiro>0) or (os.meio_chequeav>0) or (os.meio_cartaodeb>0)) then si.valor *0.1 '+
    ' when((os.meio_crediario>0) or (os.meio_chequeap>0) or (os.meio_cartaocred>0)) then si.valor *0.1 '+
    ' else 0 '+
    ' end '+
    ' ) as comissao_ '+
    ' from C000053 SI '+
    ' inner join C000011 SE on(SI.codservico = SE.codigo) '+
    ' inner join c000051 OS on (si.codos = os.codigo) '+
    ' left join c000049 vp on (si.codos = substring(vp.codvenda from 1 for 6)) '+
    ' left join c000040 ch on (si.codos = substring(ch.codvenda from 1 for 6)) '+
    ' left join c000124 ct on (si.codos = substring(ct.cod_venda from 1 for 6)) '+
    ' where '+
    ' /*recebido crediario*/   (vp.situacao =2 and vp.data_pagamento between :datai and :dataf) or '+
   ' /*recebido cheque*/   ((ch.situacao = 2 and ch.data_baixa between :datai and :dataf) )  or '+
   ' /*recebido cartao*/   (ct.situacao = ''BAIXADO'' and ct.data_baixa between :datai and :dataf ) or '+
   ' /*avista*/ (((os.meio_dinheiro>0) or (os.meio_chequeav>0) or (os.meio_cartaodeb>0)) and si.data between :datai and :dataf) '+
    ' group by 1,2,3 '+
' ) itens '+
' left join c000051 os on (os.codigo = itens.codnota) '+
' left join c000008 fun on (cod_funcionario = fun.codigo) '+
' where os.st = 4 '+
' group by 1,2,3,4 '+
' order by nome, data_os ';




 ParamByName('dataI').AsDate := DataI;
 ParamByName('dataF').AsDate := DataF;
  Open;
  end;
end;


end.
