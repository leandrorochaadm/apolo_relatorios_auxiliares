object dmRel: TdmRel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 407
  Width = 431
  object qrRelProdCusto: TZQuery
    Connection = dm.con
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
  object frxDreRes: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39181.615094942100000000
    ReportOptions.LastChange = 43481.632747638890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 120
    Top = 344
    Datasets = <
      item
        DataSet = frxDBdreRes
        DataSetName = 'frxDBdreRes'
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
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Style = fsDash
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 81.149660000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Line1: TfrxLineView
          Top = 56.692949999999990000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Top = 77.370130000000000000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          Left = 623.622450000000000000
          Top = 38.574830000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '000#'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina: [Page]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000001000
          Width = 733.228820000000000000
          Height = 18.897650000000000000
          DataSetName = 'fxrelatorio'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'DRE - Demonstra'#231#227'o do Resultado do Exerc'#237'cio ')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 623.622450000000000000
          Top = 22.677180000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Emiss'#227'o: [Date]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA2: TfrxMemoView
          Left = 211.653680000000000000
          Top = 22.677180000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DataField = 'LINHA2'
          DataSet = frxDBRelatorio
          DataSetName = 'frxDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA2"]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA3: TfrxMemoView
          Left = 623.622450000000000000
          Top = 3.779530000000001000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'LINHA3'
          DataSet = frxDBRelatorio
          DataSetName = 'frxDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA3"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 207.874150000000000000
        Width = 740.409927000000000000
        DataSet = frxDBdreRes
        DataSetName = 'frxDBdreRes'
        RowCount = 0
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559059999999988000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          DataSetName = 'fsDRE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdreRes."CLASSIFICACAO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 120.944960000000000000
          Top = 7.559059999999988000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataSetName = 'fsDRE'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,###,##0.00 C;###,###,###,##0.00 D'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBdreRes."TOTAL"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 207.874150000000000000
          Top = 7.559059999999988000
          Width = 393.071120000000000000
          Height = 15.118120000000000000
          DataSetName = 'fsDRE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdreRes."NOME_CONTA"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 400.630180000000000000
        Width = 740.409927000000000000
        object Line3: TfrxLineView
          Top = 3.779530000000022000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 162.519790000000000000
        Width = 740.409927000000000000
        Condition = 'frxDBdreRes."TIPO"'
        object Shape1: TfrxShapeView
          Align = baClient
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          Fill.BackColor = clBtnFace
          Frame.Color = clNone
        end
        object Memo26: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'CONTA')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 120.944960000000000000
          Top = 4.559020940000011000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR-R$')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 207.874150000000000000
          Top = 4.559059999999988000
          Width = 525.354670000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 253.228510000000000000
        Width = 740.409927000000000000
        object Line4: TfrxLineView
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Style = fsDouble
          Diagonal = True
        end
        object Memo11: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559060000000017000
          Width = 196.535560000000000000
          Height = 15.118120000000000000
          DataSetName = 'fsDRE'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '###,###,##0.00 C;###,###,###,##0.00 D'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'SUBTOTAL:  [SUM(<frxDBdreRes."TOTAL">,MasterData1)]')
          ParentFont = False
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 340.157700000000000000
        Width = 740.409927000000000000
        object Line5: TfrxLineView
          Top = 3.779530000000022000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
        end
        object SysMemo1: TfrxSysMemoView
          Left = 3.779530000000000000
          Top = 7.559059999999988000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Saldo Geral:  [SUM(<frxDBdreRes."TOTAL">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBdreRes: TfrxDBDataset
    UserName = 'frxDBdreRes'
    CloseDataSource = False
    DataSet = dm.qrCommon
    BCDToCurrency = False
    Left = 120
    Top = 288
  end
  object frxDBRelatorio: TfrxDBDataset
    UserName = 'frxDBRelatorio'
    CloseDataSource = False
    DataSet = QrRelatorio
    BCDToCurrency = False
    Left = 32
    Top = 288
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
    ReportOptions.LastChange = 43507.365555763900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 200
    Top = 344
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA2"]')
          ParentFont = False
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
        Top = 400.630180000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 226.771800000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#] de [TotalPages#]')
          ParentFont = False
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
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBdre."CLASSIFICACAO"'
        KeepChild = True
        KeepTogether = True
        OutlineText = 'frxDBdre."CLASSIFICACAO"'
        object frxDBdreCLASSIFICACAO: TfrxMemoView
          Left = 238.110390000000000000
          Width = 170.078850000000000000
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
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        DataSet = frxDBdre
        DataSetName = 'frxDBdre'
        RowCount = 0
        object frxDBdreTOTAL: TfrxMemoView
          Left = 75.590600000000000000
          Width = 102.047310000000000000
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
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'DATA'
          DataSet = frxDBdre
          DataSetName = 'frxDBdre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdre."DATA"]')
          ParentFont = False
        end
        object frxDBdreHISTORICO: TfrxMemoView
          Left = 211.653680000000000000
          Width = 457.323130000000000000
          Height = 18.897650000000000000
          DataField = 'HISTORICO'
          DataSet = frxDBdre
          DataSetName = 'frxDBdre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdre."HISTORICO"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 108.526504290000000000
          Width = 137.142945710000000000
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
            'SubTotal: [SUM(<frxDBdre."TOTAL">)]')
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
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 98.267780000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 7.019127140000000000
          Top = 3.239597140000001000
          Width = 88.548988570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 238.110390000000000000
          Width = 326.659378570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hist'#243'rico')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 109.606370000000000000
          Top = 3.779529999999994000
          Width = 88.548988570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 3.779530000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Geral: [SUM(<frxDBdre."TOTAL">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBdre: TfrxDBDataset
    UserName = 'frxDBdre'
    CloseDataSource = False
    DataSet = dm.qrCommon
    BCDToCurrency = False
    Left = 200
    Top = 288
  end
  object frxVendaMensal: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43265.621622812500000000
    ReportOptions.LastChange = 43507.364483761570000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 272
    Top = 344
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
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
          Top = 34.015770000000010000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'LINHA2'
          DataSet = frxDBRelatorio
          DataSetName = 'frxDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA2"]')
          ParentFont = False
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
        Top = 396.850650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 226.771800000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#] de [TotalPages#]')
          ParentFont = False
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
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBdre."CLASSIFICACAO"'
        KeepChild = True
        KeepTogether = True
        OutlineText = 'frxDBdre."CLASSIFICACAO"'
        object frxDBdreCLASSIFICACAO: TfrxMemoView
          Left = 234.330860000000000000
          Width = 170.078850000000000000
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
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        DataSet = frxDBdre
        DataSetName = 'frxDBdre'
        RowCount = 0
        object frxDBdreTOTAL: TfrxMemoView
          Left = 75.590600000000000000
          Width = 102.047310000000000000
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
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'DATA'
          DataSet = frxDBdre
          DataSetName = 'frxDBdre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdre."DATA"]')
          ParentFont = False
        end
        object frxDBdreHISTORICO: TfrxMemoView
          Left = 211.653680000000000000
          Width = 457.323130000000000000
          Height = 18.897650000000000000
          DataField = 'HISTORICO'
          DataSet = frxDBdre
          DataSetName = 'frxDBdre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBdre."HISTORICO"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 108.526504290000000000
          Width = 137.142945710000000000
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
            'SubTotal: [SUM(<frxDBdre."TOTAL">)]')
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
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 98.267780000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 10.798657140000000000
          Top = 3.239597140000001000
          Width = 88.548988570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 238.110390000000000000
          Width = 326.659378570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hist'#243'rico')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 109.606370000000000000
          Top = 3.779529999999994000
          Width = 88.548988570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 3.779530000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Geral: [SUM(<frxDBdre."TOTAL">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBVendaMes: TfrxDBDataset
    UserName = 'frxDBVendaMes'
    CloseDataSource = False
    DataSet = dm.qrCommon
    BCDToCurrency = False
    Left = 272
    Top = 288
  end
  object frxDBFilial: TfrxDBDataset
    UserName = 'frxDBFilial'
    CloseDataSource = False
    DataSet = dm.qrFilial
    BCDToCurrency = False
    Left = 360
    Top = 288
  end
end
