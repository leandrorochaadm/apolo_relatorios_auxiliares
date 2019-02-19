create view produtoEntrada (data, codproduto, entrada )
as
select data, codproduto, sum(total) as entrada
from c000032
where movimento=1
group by codproduto, data
