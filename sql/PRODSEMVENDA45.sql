create view prodSemVenda45 ( codigo, produto )
as
select p.codigo, p.produto from c000025 p where p.codigo not in (
select itv.codproduto from c000032 itv where itv.data between cast('today' as date)-45 and cast('today' as date) and itv.movimento<>1 group by itv.codproduto)
