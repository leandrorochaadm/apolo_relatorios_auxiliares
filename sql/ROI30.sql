create view roi30 ( codproduto, lucro, entrada, roi30 )
as
select ps.codproduto, sum(ps.lucro) as lucro, sum(pe.entrada) as entrada, (sum(ps.lucro)/sum(pe.entrada)) as roi30
from produtolucro ps
inner join produtoentrada pe on (pe.codproduto=ps.codproduto)
where ps.data between cast('today' as date)-15 and cast('today' as date) and pe.data between cast('today' as date)-15 and cast('today' as date)
group by ps.codproduto
