CREATE OR ALTER VIEW PRODUTOSAIDA(
    DATA,
    CODPRODUTO,
    SAIDA)
AS
select data,  codproduto, sum(total) as saida
from c000032
where movimento<>1
group by codproduto, data
;
