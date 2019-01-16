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
    Active = True
    Connection = dm.conn
    SQL.Strings = (
      ''
      
        'Select Classificacao, tipo, Nome_Conta, historico, origem, data,' +
        ' Total from'
      '( Select'
      'c000035.classificacao as Classificacao,'
      'c000035.tipo as tipo,'
      'c000035.conta as Nome_Conta,'
      'c000044.data,'
      'c000044.historico,'
      'c000044.codconta as origem,'
      
        '(coalesce(c000044.entrada,0) - coalesce(c000044.saida,0)) as Tot' +
        'al from c000044'
      'INNER JOIN C000035 ON(C000044.codconta = c000035.codigo) where'
      'c000044.DATA  between  '#39'01/12/2018'#39' and '#39'01/02/2019'#39
      
        'and (coalesce(c000044.entrada,0) - coalesce(c000044.saida,0)) <>' +
        '0'
      'and  historico <> '#39'S A L D O   A N T E R I O R'#39
      'and historico <> '#39'Acerto do Saldo Anterior'#39' union all'
      'Select'
      'c000035.classificacao as Classificacao,'
      'c000035.tipo as tipo,'
      'c000035.conta as Nome_Conta,'
      'c000042.data,'
      'c000042.historico,'
      'c000042.codconta as origem,'
      '(c000042.Valor) as Total'
      'from c000042'
      'INNER JOIN C000035 ON(C000042.codconta = c000035.CODIGO)'
      'where c000042.DATA  between  '#39'01/12/2018'#39' and '#39'01/02/2019'#39
      ')  as tmp'
      'order by Classificacao, data, historico, Total')
    Left = 560
    Top = 16
  end
  object frxDreDet: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43265.621622812500000000
    ReportOptions.LastChange = 43481.459677141200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 520
    Top = 184
    Datasets = <
      item
        DataSet = frxDBdre
        DataSetName = 'frxDBdre'
      end
      item
        DataSet = frxDBRelatorio
        DataSetName = 'frxDBRelatorio'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 300.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frxDBRelatorioLINHA2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'LINHA2'
          DataSet = frxDBRelatorio
          DataSetName = 'frxDBRelatorio'
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA2"]')
        end
        object frxDBRelatorioLINHA3: TfrxMemoView
          Left = 548.031850000000000000
          Top = 18.897650000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DataField = 'LINHA3'
          DataSet = frxDBRelatorio
          DataSetName = 'frxDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA3"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 450.843935710000000000
          Top = 37.255367140000000000
          Width = 261.867435710000000000
          Height = 19.437582860000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Emiss'#227'o: [Date]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 347.716760000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 226.771800000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#] de [TotalPages#]')
          Formats = <
            item
            end
            item
            end>
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBdre."CLASSIFICACAO"'
        KeepChild = True
        KeepTogether = True
        OutlineText = 'frxDBdre."CLASSIFICACAO"'
        object frxDBdreNOME_CONTA: TfrxMemoView
          Left = 3.779530000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_CONTA'
          DataSet = frxDBdre
          DataSetName = 'frxDBdre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBdre."NOME_CONTA"]')
          ParentFont = False
        end
        object frxDBdreCLASSIFICACAO: TfrxMemoView
          Left = 241.889920000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'CLASSIFICACAO'
          DataSet = frxDBdre
          DataSetName = 'frxDBdre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBdre."CLASSIFICACAO"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        DataSet = frxDBdre
        DataSetName = 'frxDBdre'
        RowCount = 0
        object frxDBdreTOTAL: TfrxMemoView
          Left = 574.488560000000000000
          Width = 136.063080000000000000
          Height = 15.118120000000000000
          DataSet = frxDBdre
          DataSetName = 'frxDBdre'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBdre."TOTAL"]')
          ParentFont = False
        end
        object frxDBdreDATA: TfrxMemoView
          Left = 7.559060000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          DataField = 'DATA'
          DataSet = frxDBdre
          DataSetName = 'frxDBdre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBdre."DATA"]')
          ParentFont = False
        end
        object frxDBdreHISTORICO: TfrxMemoView
          Left = 170.078850000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          DataField = 'HISTORICO'
          DataSet = frxDBdre
          DataSetName = 'frxDBdre'
          Memo.UTF8W = (
            '[frxDBdre."HISTORICO"]')
        end
        object frxDBdreORIGEM: TfrxMemoView
          Left = 461.102660000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'ORIGEM'
          DataSet = frxDBdre
          DataSetName = 'frxDBdre'
          Memo.UTF8W = (
            '[frxDBdre."ORIGEM"]')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 264.567100000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 509.696617140000000000
          Width = 120.944960000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'SubTotal')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 633.881174290000000000
          Width = 80.449995710000000000
          Height = 18.897637800000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBdre."TOTAL">)]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 18.897650000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object Memo4: TfrxMemoView
        Top = 14.038254290000000000
        Width = 711.091572860000000000
        Height = 21.057381430000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.UTF8W = (
          'DRE Detalhado')
        ParentFont = False
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 19.437582850000000000
        Top = 98.267780000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 7.019127140000000000
          Top = 3.239597140000001000
          Width = 77.210398570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 241.889920000000000000
          Width = 326.659378570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hist'#243'rico')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 574.488560000000000000
          Width = 137.682878570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
      end
    end
  end
  object frxDBdre: TfrxDBDataset
    UserName = 'frxDBdre'
    CloseDataSource = False
    DataSet = qrCommon
    BCDToCurrency = False
    Left = 520
    Top = 128
  end
  object frxDBRelatorio: TfrxDBDataset
    UserName = 'frxDBRelatorio'
    CloseDataSource = False
    DataSource = DsRelatorio
    BCDToCurrency = False
    Left = 432
    Top = 128
  end
end
