create view produtolucro (data, codproduto, lucro )
as
select itv.data, itv.codproduto, (sum(itv.total) - (sum(itv.qtde) * p.precocusto)) as lucro
from c000032 itv
left join c000025 p on(p.codigo=itv.codproduto)
where itv.movimento<>1
group by itv.codproduto, itv.data, p.precocusto
