create view roi60 ( codproduto, lucro, entrada, roi60 )
as
select ps.codproduto, sum(ps.lucro) as lucro, sum(pe.entrada) as entrada,  (sum(ps.lucro)/sum(pe.entrada)) as roi60
from produtolucro ps
inner join produtoentrada pe on (pe.codproduto=ps.codproduto)
where ps.data between cast('today' as date)-45 and cast('today' as date)-31 and pe.data between cast('today' as date)-45 and cast('today' as date)-31
group by ps.codproduto
