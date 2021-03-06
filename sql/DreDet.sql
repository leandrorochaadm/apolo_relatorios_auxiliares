 Select
     Classificacao,
       tipo,
       Nome_Conta,
       historico,
       origem,
data,
 Total
    from

(    Select
      c000035.classificacao as Classificacao,
      c000035.tipo as tipo,
      c000035.conta as Nome_Conta,
  c000044.data,
  c000044.historico,
    c000044.codconta as origem,
(coalesce(c000044.entrada,0) - coalesce(c000044.saida,0)) as Total
    from
      c000044
    INNER JOIN C000035 ON(C000044.codconta = c000035.codigo)
    where

      c000044.DATA  between :dataI and :dataF

and (coalesce(c000044.entrada,0) - coalesce(c000044.saida,0)) <>0
and  historico <> 'S A L D O   A N T E R I O R'
 and historico <> 'Acerto do Saldo Anterior'




      union all

Select
      c000035.classificacao as Classificacao,
      c000035.tipo as tipo,
      c000035.conta as Nome_Conta,
       c000042.data,
       c000042.historico,
         c000042.codconta as origem,
      (c000042.Valor) as Total
    from


      c000042
    INNER JOIN C000035 ON(C000042.codconta = c000035.CODIGO)
    where
      c000042.DATA  between :dataI and :dataF

      )  as tmp
      order by
           Classificacao,
           data,
       historico,
        Total


