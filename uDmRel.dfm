object dmRel: TdmRel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 302
  Width = 678
  object qrRelProdCusto: TZQuery
    Connection = dm.con
    Active = True
    SQL.Strings = (
      
        'SELECT F.codigo,F.referencia_fornecedor AS cod_forn, PRODUTO as ' +
        'Descricao, F.localicazao, J.fantasia as nome_forn, f.precocusto ' +
        'as preco_compra, c.custo_margem_0 as preco_custo, c.lucro as luc' +
        'ro_liq, f.precovenda'
      ' FROM C000025 F'
      ' LEFT JOIN C000009 J ON (F.codfornecedor=J.codigo)'
      ' left join c000026 c on (c.codproduto =f.codigo)'
      ''
      'WHERE F.data_ultimacompra between :dataI and :dataF')
    Params = <
      item
        DataType = ftUnknown
        Name = 'dataI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataF'
        ParamType = ptUnknown
      end>
    Left = 96
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dataI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataF'
        ParamType = ptUnknown
      end>
  end
  object dsRelProdCusto: TDataSource
    DataSet = qrRelProdCusto
    Left = 96
    Top = 80
  end
  object qrVendaCartaoSnfce: TZQuery
    Connection = dm.con
    Active = True
    SQL.Strings = (
      
        'select c000048.codigo,  c000048.data, c000007.nome, c000048.tota' +
        'l from c000048'
      'left join c000007 on (c000007.codigo = c000048.codcliente)'
      
        'where (c000048.meio_cartaocred >0 or c000048.meio_cartaodeb>0) a' +
        'nd c000048.nfce is null')
    Params = <>
    Left = 192
    Top = 16
  end
  object dsVendaCartaoSnfce: TDataSource
    DataSet = qrVendaCartaoSnfce
    Left = 192
    Top = 80
  end
  object qrDreDet: TZQuery
    Connection = dm.con
    Active = True
    SQL.Strings = (
      ' Select'
      '     Classificacao,'
      '       tipo,'
      '       Nome_Conta,'
      '       historico,'
      '       origem,'
      'data,'
      ' Total'
      '    from'
      ''
      '(    Select'
      '      c000035.classificacao as Classificacao,'
      '      c000035.tipo as tipo,'
      '      c000035.conta as Nome_Conta,'
      '  c000044.data,'
      '  c000044.historico,'
      '    c000044.codconta as origem,'
      
        '(coalesce(c000044.entrada,0) - coalesce(c000044.saida,0)) as Tot' +
        'al'
      '    from'
      '      c000044'
      '    INNER JOIN C000035 ON(C000044.codconta = c000035.codigo)'
      '    where'
      ''
      '      c000044.DATA  between :dataI and :dataF'
      ''
      
        'and (coalesce(c000044.entrada,0) - coalesce(c000044.saida,0)) <>' +
        '0'
      'and  historico <> '#39'S A L D O   A N T E R I O R'#39
      ' and historico <> '#39'Acerto do Saldo Anterior'#39
      ''
      ''
      ''
      ''
      '      union all'
      ''
      'Select'
      '      c000035.classificacao as Classificacao,'
      '      c000035.tipo as tipo,'
      '      c000035.conta as Nome_Conta,'
      '       c000042.data,'
      '       c000042.historico,'
      '         c000042.codconta as origem,'
      '      (c000042.Valor) as Total'
      '    from'
      ''
      ''
      '      c000042'
      '    INNER JOIN C000035 ON(C000042.codconta = c000035.CODIGO)'
      '    where'
      '      c000042.DATA  between :dataI and :dataF'
      ''
      '      )  as tmp'
      '      order by'
      '           Classificacao,'
      '           data,'
      '       historico,'
      '        Total'
      ''
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'dataI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataF'
        ParamType = ptUnknown
      end>
    Left = 288
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dataI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataF'
        ParamType = ptUnknown
      end>
  end
  object dsDreDet: TDataSource
    DataSet = qrDreDet
    Left = 288
    Top = 80
  end
  object qrDreRes: TZQuery
    Connection = dm.con
    Active = True
    SQL.Strings = (
      'Select'
      '  Classificacao,'
      '  max(tipo) as tipo,'
      '  max(Nome_Conta) as Nome_conta,'
      '  sum(Total) as Total'
      ''
      'from'
      '  ( Select'
      '      c000035.classificacao as Classificacao,'
      '      c000035.tipo as tipo,'
      '      c000035.conta as Nome_Conta,'
      '      sum(c000042.Valor) as Total'
      '    from'
      ''
      ''
      '      c000042'
      '    INNER JOIN C000035 ON(C000042.codconta = c000035.CODIGO)'
      '    where'
      '      c000042.DATA between :dataI and :dataF'
      ''
      '    group by'
      '      Classificacao,'
      '      tipo,'
      '      Nome_Conta'
      ''
      '    UNION ALL'
      ''
      '    Select'
      '      c000035.classificacao as Classificacao,'
      '      c000035.tipo as tipo,'
      '      c000035.conta as Nome_Conta,'
      
        '      sum((coalesce(c000044.entrada,0) - coalesce(c000044.saida,' +
        '0))) as Total'
      '    from'
      '      c000044'
      '    INNER JOIN C000035 ON(C000044.codconta = c000035.codigo)'
      '    where'
      ''
      '      c000044.DATA between   :dataI and :dataF'
      
        '      and (coalesce(c000044.entrada,0) - coalesce(c000044.saida,' +
        '0)) <>0'
      'and  historico <> '#39'S A L D O   A N T E R I O R'#39
      '      and historico <> '#39'Acerto do Saldo Anterior'#39
      ''
      '    group by'
      '      Classificacao,'
      '      tipo,'
      '      Nome_Conta'
      '  )  as tmp'
      '  group by classificacao')
    Params = <
      item
        DataType = ftUnknown
        Name = 'dataI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataF'
        ParamType = ptUnknown
      end>
    Left = 360
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dataI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataF'
        ParamType = ptUnknown
      end>
  end
  object dsDreRes: TDataSource
    DataSet = qrDreRes
    Left = 360
    Top = 80
  end
  object QrRelatorio: TZQuery
    Connection = dm.con
    Active = True
    SQL.Strings = (
      'select * from L000003')
    Params = <>
    Left = 24
    Top = 16
  end
  object DsRelatorio: TDataSource
    DataSet = QrRelatorio
    Left = 24
    Top = 80
  end
  object qrVendaMensal: TFDQuery
    Connection = dm.conn
    SQL.Strings = (
      
        'select  extract(year from v.data)||'#39'.'#39'||extract(month from v.dat' +
        'a) as data , v.meio_dinheiro, v.meio_chequeav, v.meio_chequeap, ' +
        'v.meio_cartaocred, v.meio_cartaodeb, v.meio_crediario, v.total f' +
        'rom c000048 v'
      'where v.situacao=1')
    Left = 432
    Top = 17
  end
  object qrCommon: TFDQuery
    Connection = dm.conn
    SQL.Strings = (
      'select * from L000003')
    Left = 560
    Top = 16
  end
end
