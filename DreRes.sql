Select
  Classificacao,
  max(tipo) as tipo,
  max(Nome_Conta) as Nome_conta,
  sum(Total) as Total

from
  ( Select
      c000035.classificacao as Classificacao,
      c000035.tipo as tipo,
      c000035.conta as Nome_Conta,
      sum(c000042.Valor) as Total
    from


      c000042
    INNER JOIN C000035 ON(C000042.codconta = c000035.CODIGO)
    where
      c000042.DATA between :dataI and :dataF

    group by
      Classificacao,
      tipo,
      Nome_Conta

    UNION ALL

    Select
      c000035.classificacao as Classificacao,
      c000035.tipo as tipo,
      c000035.conta as Nome_Conta,
      sum((coalesce(c000044.entrada,0) - coalesce(c000044.saida,0))) as Total
    from
      c000044
    INNER JOIN C000035 ON(C000044.codconta = c000035.codigo)
    where

      c000044.DATA between   :dataI and :dataF
      and (coalesce(c000044.entrada,0) - coalesce(c000044.saida,0)) <>0
and  historico <> 'S A L D O   A N T E R I O R'
      and historico <> 'Acerto do Saldo Anterior'

    group by
      Classificacao,
      tipo,
      Nome_Conta
  )  as tmp
  group by classificacao
