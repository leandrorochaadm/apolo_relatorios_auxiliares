object dmRel: TdmRel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 407
  Width = 745
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
    Version = '6.5.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39181.615094942100000000
    ReportOptions.LastChange = 43481.632747638900000000
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
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 81.149660000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 56.692950000000000000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 77.370130000000000000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina: [Page]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 733.228820000000000000
          Height = 18.897650000000000000
          DataSetName = 'fxrelatorio'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DRE - Demonstra'#231#227'o do Resultado do Exerc'#237'cio ')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Emiss'#227'o: [Date]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA2: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA2"]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA3: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 3.779530000000000000
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
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA3"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 207.874150000000000000
        Width = 740.409927000000000000
        DataSet = frxDBdreRes
        DataSetName = 'frxDBdreRes'
        RowCount = 0
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559059999999990000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          DataSetName = 'fsDRE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBdreRes."CLASSIFICACAO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 7.559059999999990000
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
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBdreRes."TOTAL"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 7.559059999999990000
          Width = 393.071120000000000000
          Height = 15.118120000000000000
          DataSetName = 'fsDRE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBdreRes."NOME_CONTA"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 400.630180000000000000
        Width = 740.409927000000000000
        object Line3: TfrxLineView
          AllowVectorExport = True
          Top = 3.779530000000020000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 162.519790000000000000
        Width = 740.409927000000000000
        Condition = 'frxDBdreRes."TIPO"'
        object Shape1: TfrxShapeView
          Align = baClient
          AllowVectorExport = True
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          Fill.BackColor = clBtnFace
          Frame.Color = clNone
          Frame.Typ = []
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779529999999990000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CONTA')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 4.559020940000010000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR-R$')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 4.559059999999990000
          Width = 525.354670000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 253.228510000000000000
        Width = 740.409927000000000000
        object Line4: TfrxLineView
          AllowVectorExport = True
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Style = fsDouble
          Frame.Typ = []
          Diagonal = True
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 7.559060000000020000
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
          Frame.Typ = []
          Memo.UTF8W = (
            'SUBTOTAL:  [SUM(<frxDBdreRes."TOTAL">,MasterData1)]')
          ParentFont = False
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 340.157700000000000000
        Width = 740.409927000000000000
        object Line5: TfrxLineView
          AllowVectorExport = True
          Top = 3.779530000000020000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559059999999990000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
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
    Version = '6.5.4'
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
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frxDBRelatorioLINHA2: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA2"]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA3: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA3"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Emiss'#227'o: [Date]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 400.630180000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
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
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBdre."CLASSIFICACAO"'
        KeepChild = True
        KeepTogether = True
        OutlineText = 'frxDBdre."CLASSIFICACAO"'
        object frxDBdreCLASSIFICACAO: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBdre."CLASSIFICACAO"]')
          ParentFont = False
        end
        object frxDBdreNOME_CONTA: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBdre."NOME_CONTA"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        DataSet = frxDBdre
        DataSetName = 'frxDBdre'
        RowCount = 0
        object frxDBdreTOTAL: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBdre."TOTAL"]')
          ParentFont = False
        end
        object frxDBdreDATA: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBdre."DATA"]')
          ParentFont = False
        end
        object frxDBdreHISTORICO: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBdre."HISTORICO"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'SubTotal: [SUM(<frxDBdre."TOTAL">)]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object Memo4: TfrxMemoView
        AllowVectorExport = True
        Top = 14.038254290000000000
        Width = 711.091572860000000000
        Height = 21.057381430000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'DRE Detalhado')
        ParentFont = False
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 98.267780000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 7.019127140000000000
          Top = 3.239597140000001000
          Width = 88.548988570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
          Width = 326.659378570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Hist'#243'rico')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 3.779529999999994000
          Width = 88.548988570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
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
    Version = '6.5.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43250.638496331000000000
    ReportOptions.LastChange = 43481.753245752290000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 272
    Top = 344
    Datasets = <
      item
        DataSet = frxDBFilial
        DataSetName = 'frxDBFilial'
      end
      item
        DataSet = frxDBRelatorio
        DataSetName = 'frxDBRelatorio'
      end
      item
        DataSet = frxDBVendaMes
        DataSetName = 'frxDBVendaMes'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 204.094620000000000000
        Width = 755.905999999999900000
        DataSet = frxDBVendaMes
        DataSetName = 'frxDBVendaMes'
        RowCount = 0
        object frxDBVendaMesDATAMES: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'DATAMES'
          DataSet = frxDBVendaMes
          DataSetName = 'frxDBVendaMes'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBVendaMes."DATAMES"]')
        end
        object frxDBVendaMesTOTAL: TfrxMemoView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL'
          DataSet = frxDBVendaMes
          DataSetName = 'frxDBVendaMes'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVendaMes."TOTAL"]')
          ParentFont = False
        end
        object frxDBVendaMesDINHERO: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'DINHERO'
          DataSet = frxDBVendaMes
          DataSetName = 'frxDBVendaMes'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVendaMes."DINHERO"]')
          ParentFont = False
        end
        object frxDBVendaMesCHEQUE: TfrxMemoView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CHEQUE'
          DataSet = frxDBVendaMes
          DataSetName = 'frxDBVendaMes'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVendaMes."CHEQUE"]')
          ParentFont = False
        end
        object frxDBVendaMesCARTAO: TfrxMemoView
          AllowVectorExport = True
          Left = 393.071120000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CARTAO'
          DataSet = frxDBVendaMes
          DataSetName = 'frxDBVendaMes'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVendaMes."CARTAO"]')
          ParentFont = False
        end
        object frxDBVendaMesCREDIARIO: TfrxMemoView
          AllowVectorExport = True
          Left = 498.897960000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CREDIARIO'
          DataSet = frxDBVendaMes
          DataSetName = 'frxDBVendaMes'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVendaMes."CREDIARIO"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 79.574830000000000000
        Top = 18.897650000000000000
        Width = 755.905999999999900000
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 584.166050000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Vendas Agrupadas Mensalmente')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 593.845737780000000000
          Top = 2.519686669999999000
          Width = 157.480416670000000000
          Height = 14.698172220000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Emiss'#227'o: [Date]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA2: TfrxMemoView
          AllowVectorExport = True
          Left = 6.157700000000000000
          Top = 24.897650000000000000
          Width = 567.630180000000000000
          Height = 18.897650000000000000
          DataField = 'LINHA2'
          DataSet = frxDBRelatorio
          DataSetName = 'frxDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA2"]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA3: TfrxMemoView
          AllowVectorExport = True
          Left = 595.984850000000000000
          Top = 18.897650000000000000
          Width = 156.181200000000000000
          Height = 18.897650000000000000
          DataField = 'LINHA3'
          DataSet = frxDBRelatorio
          DataSetName = 'frxDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA3"]')
          ParentFont = False
        end
        object frxDBFilialCNPJ: TfrxMemoView
          AllowVectorExport = True
          Left = 332.086890000000000000
          Top = 55.346630000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'CNPJ'
          DataSet = frxDBFilial
          DataSetName = 'frxDBFilial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBFilial."CNPJ"]')
          ParentFont = False
        end
        object frxDBFilialFILIAL: TfrxMemoView
          AllowVectorExport = True
          Left = 4.338590000000000000
          Top = 55.228510000000000000
          Width = 324.630180000000000000
          Height = 18.897650000000000000
          DataField = 'FILIAL'
          DataSet = frxDBFilial
          DataSetName = 'frxDBFilial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBFilial."FILIAL"]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 50.102350000000000000
          Width = 1133.858267720000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 76.102350000000000000
          Width = 1133.858267720000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.897650000000000000
        Top = 332.598640000000000000
        Width = 755.905999999999900000
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 547.071430000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Pag: [<Page>] de [TotalPages#]')
          ParentFont = False
          WordWrap = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 20.677180000000000000
        Top = 158.740260000000000000
        Width = 755.905999999999900000
        Condition = 'frxDBFilial."FILIAL"'
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 5.543290000000000000
          Top = 0.590496669999993200
          Width = 74.133890000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'ANO/M'#202'S')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 86.897650000000000000
          Top = 0.850339999999988500
          Width = 79.181200000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight]
          HAlign = haRight
          Memo.UTF8W = (
            'SUBTOTAL')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 19.747989999999990000
          Width = 1133.858267720000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Width = 79.181200000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'DINHEIRO')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Width = 79.181200000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CHEQUE')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 389.291590000000000000
          Width = 79.181200000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CARTAO')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 498.897960000000000000
          Width = 79.181200000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CREDIARIO')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 21.314780000000000000
        Top = 249.448980000000000000
        Width = 755.905999999999900000
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 0.204700000000000000
          Top = 3.417129999999986000
          Width = 99.433210000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 0.417129999999986000
          Width = 1133.858267720000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBVendaMes."TOTAL">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 173.858380000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBVendaMes."DINHERO">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 275.905690000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBVendaMes."CHEQUE">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBVendaMes."CARTAO">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 483.779840000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBVendaMes."CREDIARIO">,MasterData1)]')
          ParentFont = False
        end
      end
    end
    object DialogPage1: TfrxDialogPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      DoubleBuffered = False
      Height = 200.000000000000000000
      ClientHeight = 161.000000000000000000
      Left = 424.000000000000000000
      Top = 149.000000000000000000
      Width = 300.000000000000000000
      Scaled = True
      ClientWidth = 284.000000000000000000
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
  object frxDBlucroProduto: TfrxDBDataset
    UserName = 'frxDBdre'
    CloseDataSource = False
    DataSet = dm.qrCommon
    BCDToCurrency = False
    Left = 424
    Top = 288
  end
  object frxLucroProduto: TfrxReport
    Version = '6.5.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43265.621622812500000000
    ReportOptions.LastChange = 43514.624337557900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 424
    Top = 344
    Datasets = <
      item
        DataSet = frxDBRelatorio
        DataSetName = 'frxDBRelatorio'
      end
      item
        DataSet = frxDBVendaMes
        DataSetName = 'frxDBVendaMes'
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
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frxDBRelatorioLINHA2: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA2"]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA3: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA3"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Emiss'#227'o: [Date]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 309.921460000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
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
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        DataSet = frxDBlucroProduto
        DataSetName = 'frxDBdre'
        RowCount = 0
        object frxDBVendaMesPRODUTO: TfrxMemoView
          AllowVectorExport = True
          Left = 257.008040000000000000
          Width = 461.102660000000000000
          Height = 18.897650000000000000
          DataField = 'PRODUTO'
          DataSet = frxDBVendaMes
          DataSetName = 'frxDBVendaMes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBVendaMes."PRODUTO"]')
          ParentFont = False
        end
        object frxDBVendaMesVENDA: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'VENDA'
          DataSet = frxDBVendaMes
          DataSetName = 'frxDBVendaMes'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVendaMes."VENDA"]')
          ParentFont = False
        end
        object frxDBVendaMesCODPRODUTO: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'CODPRODUTO'
          DataSet = frxDBVendaMes
          DataSetName = 'frxDBVendaMes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBVendaMes."CODPRODUTO"]')
          ParentFont = False
        end
        object frxDBVendaMesLUCRO: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'LUCRO'
          DataSet = frxDBVendaMes
          DataSetName = 'frxDBVendaMes'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVendaMes."LUCRO"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 206.711217690000000000
          Top = 0.872199230000000000
          Width = 47.970957690000000000
          Height = 14.536653850000000000
          DisplayFormat.FormatStr = '%2.1n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[(<frxDBVendaMes."LUCRO">/<frxDBVendaMes."VENDA">)*100]%')
          ParentFont = False
        end
      end
      object Memo4: TfrxMemoView
        AllowVectorExport = True
        Top = 14.038254290000000000
        Width = 711.091572860000000000
        Height = 21.057381430000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'LUCRO POR PRODUTO')
        ParentFont = False
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 98.267780000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 3.779530000000000000
          Width = 341.777498570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O DO PRODUTO')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 3.779529999999990000
          Width = 65.871808570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VENDA')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 147.401670000000000000
          Top = 3.779530000000000000
          Width = 65.871808570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'LUCRO')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = -0.539932860000000000
          Top = 3.239597140000000000
          Width = 69.651338570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CODIGO')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 219.212740000000000000
          Top = 3.779530000000000000
          Width = 65.871808570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '%LUCRO')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 257.008040000000000000
          Top = 3.779530000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBVendaMes."LUCRO">,MasterData1)] DE LUCRO')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBVendaMes."VENDA">,MasterData1)] DE VENDA')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 506.457020000000000000
          Top = 3.779530000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.1n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<frxDBVendaMes."LUCRO">,MasterData1)/SUM(<frxDBVendaMes."VE' +
              'NDA">,MasterData1)*100]% DE LUCRO')
          ParentFont = False
        end
      end
    end
  end
  object frxDBroi30: TfrxDBDataset
    UserName = 'frxDBroi30'
    CloseDataSource = False
    DataSet = dm.qrCommon
    BCDToCurrency = False
    Left = 520
    Top = 288
  end
  object frxRoi30: TfrxReport
    Version = '6.5.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43265.621622812500000000
    ReportOptions.LastChange = 43514.788003796290000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 520
    Top = 344
    Datasets = <
      item
        DataSet = frxDBRelatorio
        DataSetName = 'frxDBRelatorio'
      end
      item
        DataSet = frxDBVendaMes
        DataSetName = 'frxDBVendaMes'
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
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frxDBRelatorioLINHA2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDBRelatorio
          DataSetName = 'frxDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DOS '#218'LTIMOS 30 DIAS')
          ParentFont = False
        end
        object frxDBRelatorioLINHA3: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA3"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Emiss'#227'o: [Date]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 309.921460000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
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
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        DataSet = frxDBroi30
        DataSetName = 'frxDBroi30'
        RowCount = 0
        object frxDBVendaMesVENDA: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'ENTRADA'
          DataSet = frxDBroi30
          DataSetName = 'frxDBroi30'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBroi30."ENTRADA"]')
          ParentFont = False
        end
        object frxDBVendaMesCODPRODUTO: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'CODPRODUTO'
          DataSet = frxDBroi30
          DataSetName = 'frxDBroi30'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBroi30."CODPRODUTO"]')
          ParentFont = False
        end
        object frxDBVendaMesLUCRO: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'LUCRO'
          DataSet = frxDBroi30
          DataSetName = 'frxDBroi30'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBroi30."LUCRO"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 206.711217690000000000
          Top = 0.872199230000006800
          Width = 47.970957690000000000
          Height = 14.536653850000000000
          DisplayFormat.FormatStr = '%2.1n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[(<frxDBVendaMes."LUCRO">/<frxDBVendaMes."ENTRADA">)*100]%')
          ParentFont = False
        end
        object frxDBVendaMesPRODUTO: TfrxMemoView
          AllowVectorExport = True
          Left = 272.126160000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'PRODUTO'
          DataSet = frxDBVendaMes
          DataSetName = 'frxDBVendaMes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBVendaMes."PRODUTO"]')
          ParentFont = False
        end
      end
      object Memo4: TfrxMemoView
        AllowVectorExport = True
        Top = 14.038254290000000000
        Width = 711.091572860000000000
        Height = 21.057381430000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'ROI POR PRODUTO')
        ParentFont = False
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 98.267780000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 3.779529999999994000
          Width = 341.777498570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O DO PRODUTO')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 3.779529999999994000
          Width = 65.871808570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'COMPRA')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 147.401670000000000000
          Top = 3.779529999999994000
          Width = 65.871808570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'LUCRO')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = -0.539932860000000000
          Top = 3.239597140000001000
          Width = 69.651338570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CODIGO')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 219.212740000000000000
          Top = 3.779529999999994000
          Width = 65.871808570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '%LUCRO')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBVendaMes."ENTRADA">,MasterData1)] TOTAL DE COMPRA')
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[SUM(<frxDBVendaMes."LUCRO">,MasterData1)/SUM(<frxDBVendaMes."EN' +
              'TRADA">,MasterData1)*100]%  ROI')
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 3.779529999999994000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBVendaMes."ROI30">,MasterData1)] TOTAL DE LUCRO')
        end
      end
    end
  end
  object frxDBroi60: TfrxDBDataset
    UserName = 'frxDBroi60'
    CloseDataSource = False
    DataSet = dm.qrCommon
    BCDToCurrency = False
    Left = 592
    Top = 288
  end
  object frxRoi60: TfrxReport
    Version = '6.5.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43265.621622812500000000
    ReportOptions.LastChange = 43514.788240381900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 592
    Top = 344
    Datasets = <
      item
        DataSet = frxDBRelatorio
        DataSetName = 'frxDBRelatorio'
      end
      item
        DataSet = frxDBVendaMes
        DataSetName = 'frxDBVendaMes'
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
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frxDBRelatorioLINHA2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDBRelatorio
          DataSetName = 'frxDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DE 31 A 60 DIAS ATR'#193'S')
          ParentFont = False
        end
        object frxDBRelatorioLINHA3: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA3"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Emiss'#227'o: [Date]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 309.921460000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
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
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        DataSet = frxDBroi60
        DataSetName = 'frxDBroi60'
        RowCount = 0
        object frxDBVendaMesVENDA: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'ENTRADA'
          DataSet = frxDBroi60
          DataSetName = 'frxDBroi60'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBroi60."ENTRADA"]')
          ParentFont = False
        end
        object frxDBVendaMesCODPRODUTO: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'CODPRODUTO'
          DataSet = frxDBroi60
          DataSetName = 'frxDBroi60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBroi60."CODPRODUTO"]')
          ParentFont = False
        end
        object frxDBVendaMesLUCRO: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'LUCRO'
          DataSet = frxDBroi60
          DataSetName = 'frxDBroi60'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBroi60."LUCRO"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 206.711217690000000000
          Top = 0.872199230000006800
          Width = 47.970957690000000000
          Height = 14.536653850000000000
          DisplayFormat.FormatStr = '%2.1n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[(<frxDBVendaMes."LUCRO">/<frxDBVendaMes."ENTRADA">)*100]%')
          ParentFont = False
        end
        object frxDBVendaMesPRODUTO: TfrxMemoView
          AllowVectorExport = True
          Left = 272.126160000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'PRODUTO'
          DataSet = frxDBVendaMes
          DataSetName = 'frxDBVendaMes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBVendaMes."PRODUTO"]')
          ParentFont = False
        end
      end
      object Memo4: TfrxMemoView
        AllowVectorExport = True
        Top = 14.038254290000000000
        Width = 711.091572860000000000
        Height = 21.057381430000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'ROI POR PRODUTO')
        ParentFont = False
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 98.267780000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 3.779529999999994000
          Width = 341.777498570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O DO PRODUTO')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 3.779529999999994000
          Width = 65.871808570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'COMPRA')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 147.401670000000000000
          Top = 3.779529999999994000
          Width = 65.871808570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'LUCRO')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = -0.539932860000000000
          Top = 3.239597140000001000
          Width = 69.651338570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CODIGO')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 219.212740000000000000
          Top = 3.779529999999994000
          Width = 65.871808570000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '%LUCRO')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBVendaMes."ENTRADA">,MasterData1)] TOTAL DE COMPRA')
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 253.228510000000000000
          Top = 3.779529999999994000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBVendaMes."LUCRO">,MasterData1)] TOTAL DE LUCRO')
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 548.031850000000000000
          Top = 3.779529999999994000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[SUM(<frxDBVendaMes."LUCRO">,MasterData1)/SUM(<frxDBVendaMes."EN' +
              'TRADA">,MasterData1)*100]%  ROI')
        end
      end
    end
  end
  object frxDBnotaFiscal: TfrxDBDataset
    UserName = 'frxDBnotaFiscal'
    CloseDataSource = False
    DataSet = dm.qrCommon
    BCDToCurrency = False
    Left = 664
    Top = 288
  end
  object frxNotaFiscal: TfrxReport
    Version = '6.5.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43250.638496331000000000
    ReportOptions.LastChange = 43517.715192500000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 664
    Top = 344
    Datasets = <
      item
        DataSet = frxDBFilial
        DataSetName = 'frxDBFilial'
      end
      item
        DataSet = frxDBRelatorio
        DataSetName = 'frxDBRelatorio'
      end
      item
        DataSet = frxDBVendaMes
        DataSetName = 'frxDBVendaMes'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 204.094620000000000000
        Width = 755.906000000000000000
        DataSet = frxDBVendaMes
        DataSetName = 'frxDBVendaMes'
        RowCount = 0
        object frxDBVendaMesDATAMES: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'DATAMES'
          DataSet = frxDBVendaMes
          DataSetName = 'frxDBVendaMes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVendaMes."DATAMES"]')
          ParentFont = False
        end
        object frxDBVendaMesTOTAL: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR'
          DataSet = frxDBVendaMes
          DataSetName = 'frxDBVendaMes'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVendaMes."VALOR"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 79.574830000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 750.465370000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Notas Fiscais e  Cupons Agrupadas Mensalmente')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 597.625267780000000000
          Top = 21.417336670000000000
          Width = 157.480416670000000000
          Height = 14.698172220000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Emiss'#227'o: [Date]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA2: TfrxMemoView
          AllowVectorExport = True
          Left = 6.157700000000000000
          Top = 24.897650000000000000
          Width = 567.630180000000000000
          Height = 18.897650000000000000
          DataField = 'LINHA2'
          DataSet = frxDBRelatorio
          DataSetName = 'frxDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA2"]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA3: TfrxMemoView
          AllowVectorExport = True
          Left = 599.764380000000000000
          Top = 37.795300000000000000
          Width = 156.181200000000000000
          Height = 11.338590000000000000
          DataField = 'LINHA3'
          DataSet = frxDBRelatorio
          DataSetName = 'frxDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA3"]')
          ParentFont = False
        end
        object frxDBFilialCNPJ: TfrxMemoView
          AllowVectorExport = True
          Left = 332.086890000000000000
          Top = 55.346630000000010000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'CNPJ'
          DataSet = frxDBFilial
          DataSetName = 'frxDBFilial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBFilial."CNPJ"]')
          ParentFont = False
        end
        object frxDBFilialFILIAL: TfrxMemoView
          AllowVectorExport = True
          Left = 4.338590000000000000
          Top = 55.228510000000000000
          Width = 324.630180000000000000
          Height = 18.897650000000000000
          DataField = 'FILIAL'
          DataSet = frxDBFilial
          DataSetName = 'frxDBFilial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBFilial."FILIAL"]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 50.102350000000000000
          Width = 1133.858267720000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 76.102350000000000000
          Width = 1133.858267720000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.897650000000000000
        Top = 332.598640000000000000
        Width = 755.906000000000000000
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 547.071430000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Pag: [<Page>] de [TotalPages#]')
          ParentFont = False
          WordWrap = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 20.677180000000000000
        Top = 158.740260000000000000
        Width = 755.906000000000000000
        Condition = 'frxDBFilial."FILIAL"'
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 5.543290000000000000
          Top = 0.590496669999993200
          Width = 74.133890000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'ANO/M'#202'S')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 83.118120000000000000
          Top = 0.850339999999988600
          Width = 79.181200000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'SUBTOTAL')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 19.747989999999990000
          Width = 1133.858267720000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 21.314780000000000000
        Top = 249.448980000000000000
        Width = 755.906000000000000000
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 0.204700000000000000
          Top = 3.417129999999986000
          Width = 99.433210000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 0.417129999999986000
          Width = 1133.858267720000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBVendaMes."VALOR">,MasterData1)]')
          ParentFont = False
        end
      end
    end
    object DialogPage1: TfrxDialogPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      DoubleBuffered = False
      Height = 200.000000000000000000
      ClientHeight = 161.000000000000000000
      Left = 424.000000000000000000
      Top = 149.000000000000000000
      Width = 300.000000000000000000
      Scaled = True
      ClientWidth = 284.000000000000000000
    end
  end
  object frxDBComissao: TfrxDBDataset
    UserName = 'frxDBcomissao'
    CloseDataSource = False
    DataSet = dm.qrCommon
    BCDToCurrency = False
    Left = 680
    Top = 120
  end
  object frxComissao: TfrxReport
    Version = '6.5.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39181.615094942100000000
    ReportOptions.LastChange = 44138.747801469910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 680
    Top = 176
    Datasets = <
      item
        DataSet = frxDBComissao
        DataSetName = 'frxDBcomissao'
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
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 81.149660000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 56.692950000000000000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 77.370130000000000000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina: [Page]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 733.228820000000000000
          Height = 18.897650000000000000
          DataSetName = 'fxrelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Vendas recebidas por vendedor detalhada')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Emiss'#227'o: [Date]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA2: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA2"]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA3: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 3.779530000000000000
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
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA3"]')
          ParentFont = False
        end
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Left = 578.268090000000000000
          Top = 238.110390000000000000
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          Fill.BackColor = clBtnFace
          Frame.Color = clNone
          Frame.Typ = []
        end
        object Memo18: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 1137.638530000000000000
          Top = 241.889920000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'NOMEVENDEDOR'
          DataSet = frxDBComissao
          DataSetName = 'frxDBcomissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBcomissao."NOMEVENDEDOR"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 230.551330000000000000
        Width = 740.409927000000000000
        DataSet = frxDBComissao
        DataSetName = 'frxDBcomissao'
        RowCount = 0
        object frxDBcomissaoDATA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'DATAVENDA'
          DataSet = frxDBComissao
          DataSetName = 'frxDBcomissao'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBcomissao."DATAVENDA"]')
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 515.390454550000000000
          Top = 1.374374550000000000
          Width = 74.559819090000000000
          Height = 19.012181210000000000
          DataField = 'CODVENDA'
          DataSet = frxDBComissao
          DataSetName = 'frxDBcomissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBcomissao."CODVENDA"]')
          ParentFont = False
        end
        object frxDBcomissaoVALORAPRAZO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 136.063080000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'VALORAPRAZO'
          DataSet = frxDBComissao
          DataSetName = 'frxDBcomissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBcomissao."VALORAPRAZO"]')
          ParentFont = False
        end
        object frxDBcomissaoVALORCARTAO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'VALORCARTAO'
          DataSet = frxDBComissao
          DataSetName = 'frxDBcomissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBcomissao."VALORCARTAO"]')
          ParentFont = False
        end
        object frxDBcomissaoVALORDINHEIRO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 325.039580000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'VALORDINHEIRO'
          DataSet = frxDBComissao
          DataSetName = 'frxDBcomissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBcomissao."VALORDINHEIRO"]')
          ParentFont = False
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 22.677180000000000000
          Width = 593.386210000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 389.291590000000000000
        Width = 740.409927000000000000
        object Line3: TfrxLineView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 162.519790000000000000
        Width = 740.409927000000000000
        Condition = 'frxDBcomissao."CODVENDEDOR"'
        object Shape1: TfrxShapeView
          Align = baClient
          AllowVectorExport = True
          Width = 740.409927000000000000
          Height = 45.354360000000000000
          Fill.BackColor = clBtnFace
          Frame.Color = clNone
          Frame.Typ = []
        end
        object frxDBcomissaoCODVENDEDOR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'CODVENDEDOR'
          DataSet = frxDBComissao
          DataSetName = 'frxDBcomissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBcomissao."CODVENDEDOR"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 22.677180000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Data Venda/Rec')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 22.677180000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'A Prazo')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 222.992270000000000000
          Top = 22.677180000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Cart'#227'o')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 321.260050000000000000
          Top = 22.677180000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'A Vista')
          ParentFont = False
        end
        object frxDBcomissaoNOMEVENDEDOR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'NOMEVENDEDOR'
          DataSet = frxDBComissao
          DataSetName = 'frxDBcomissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBcomissao."NOMEVENDEDOR"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 502.677490000000000000
          Top = 22.677180000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'cod Venda')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 279.685220000000000000
        Width = 740.409927000000000000
        object Line4: TfrxLineView
          AllowVectorExport = True
          Top = 47.244094490000000000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Style = fsDouble
          Frame.Typ = []
          Diagonal = True
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 5.768756320000000000
          Top = 20.687953680000000000
          Width = 125.122335260000000000
          Height = 15.714887890000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total do vendedor:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'A Prazo')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 219.212740000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Cart'#227'o')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480520000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'A Vista')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 135.466312110000000000
          Top = 18.897650000000000000
          Width = 77.778748950000000000
          Height = 19.892263160000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBcomissao."VALORAPRAZO">)]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 222.992270000000000000
          Top = 18.897650000000000000
          Width = 81.558278950000000000
          Height = 19.892263160000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBcomissao."VALORCARTAO">)]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480520000000000000
          Top = 18.897650000000000000
          Width = 85.337808950000000000
          Height = 19.892263160000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBcomissao."VALORDINHEIRO">)]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Style = fsDouble
          Frame.Typ = []
          Diagonal = True
        end
        object Memo19: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 510.236550000000000000
          Top = 18.897650000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'CODVENDEDOR'
          DataSet = frxDBComissao
          DataSetName = 'frxDBcomissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBcomissao."CODVENDEDOR"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 563.149970000000000000
          Top = 18.897650000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'NOMEVENDEDOR'
          DataSet = frxDBComissao
          DataSetName = 'frxDBcomissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBcomissao."NOMEVENDEDOR"]')
          ParentFont = False
        end
      end
    end
  end
  object qrComissao: TZQuery
    Connection = dm.con
    Active = True
    SQL.Strings = (
      
        'select vend.codigo as codvendedor, vend.nome as nomevendedor, su' +
        'm(vd.total - vd.desconto) as total, sum(vp.valor_pago) as valora' +
        'prazorecebida, sum(vp.valor_original-vp.valor_pago) as valorapra' +
        'zoareceber, sum(ct.valor) as valorcartaorecebido, sum(vd.meio_ca' +
        'rtaocred+vd.meio_cartaodeb-ct.valor) as cartaocredito_areceber, ' +
        'sum(vd.meio_dinheiro) as valordinheiro  from c000008 vend'
      'left join c000048 vd on (vd.codvendedor = vend.codigo)'
      'left join c000124 ct on (ct.cod_venda=vd.codigo)'
      'left join c000049 vp on (vd.codigo=vp.codvenda)'
      'where'
      
        ' ((ct.data_baixa between '#39'01.09.2020'#39' and '#39'30.09.2020'#39')  or (vp.' +
        'data_pagamento between '#39'01.09.2020'#39' and '#39'30.09.2020'#39' ) or (vd.da' +
        'ta between '#39'01.09.2020'#39' and '#39'30.09.2020'#39')   )'
      ''
      'group by  codvendedor, nomevendedor'
      'order by nomevendedor')
    Params = <>
    Left = 424
    Top = 16
  end
  object frxDBVendaRecebimentoResumido: TfrxDBDataset
    UserName = 'frxDBcomissao'
    CloseDataSource = False
    DataSet = qrComissao
    BCDToCurrency = False
    Left = 544
    Top = 120
  end
  object frxVendaRecebimentoResumido: TfrxReport
    Version = '6.5.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39181.615094942100000000
    ReportOptions.LastChange = 44138.747281828700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 544
    Top = 176
    Datasets = <
      item
        DataSet = frxDBVendaRecebimentoResumido
        DataSetName = 'frxDBcomissao'
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
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692913385826800000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina: [Page]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 733.228820000000000000
          Height = 18.897650000000000000
          DataSetName = 'fxrelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Vendas recebidas por vendedor resumida')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Emiss'#227'o: [Date]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA2: TfrxMemoView
          AllowVectorExport = True
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
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA2"]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA3: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 3.779530000000000000
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
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA3"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 1137.638530000000000000
          Top = 241.889920000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'NOMEVENDEDOR'
          DataSet = frxDBVendaRecebimentoResumido
          DataSetName = 'frxDBcomissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBcomissao."NOMEVENDEDOR"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 181.417440000000000000
        Width = 740.409927000000000000
        DataSet = frxDBVendaRecebimentoResumido
        DataSetName = 'frxDBcomissao'
        RowCount = 0
        object frxDBcomissaoVALORAPRAZO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 268.346630000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendaRecebimentoResumido
          DataSetName = 'frxDBcomissao'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBcomissao."VALORAPRAZORECEBIDA"]')
          ParentFont = False
        end
        object frxDBcomissaoVALORCARTAO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 359.055350000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendaRecebimentoResumido
          DataSetName = 'frxDBcomissao'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBcomissao."VALORCARTAORECEBIDO"]')
          ParentFont = False
        end
        object frxDBcomissaoVALORDINHEIRO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 457.323130000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendaRecebimentoResumido
          DataSetName = 'frxDBcomissao'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBcomissao."VALORDINHEIRO"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 26.456710000000000000
          Width = 661.417396060000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[<frxDBcomissao."VALORAPRAZORECEBIDA">+<frxDBcomissao."VALORCART' +
              'AORECEBIDO">+<frxDBcomissao."VALORDINHEIRO">]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 136.063080000000000000
        Width = 740.409927000000000000
        Condition = 'frxDBcomissao."CODVENDEDOR"'
        object Shape1: TfrxShapeView
          Align = baClient
          AllowVectorExport = True
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          Fill.BackColor = clHighlightText
          Frame.Color = clNone
          Frame.Typ = []
        end
        object frxDBcomissaoCODVENDEDOR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'CODVENDEDOR'
          DataSet = frxDBVendaRecebimentoResumido
          DataSetName = 'frxDBcomissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBcomissao."CODVENDEDOR"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'A Prazo')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 355.275820000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Cart'#227'o')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 453.543600000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'A Vista')
          ParentFont = False
        end
        object frxDBcomissaoNOMEVENDEDOR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'NOMEVENDEDOR'
          DataSet = frxDBVendaRecebimentoResumido
          DataSetName = 'frxDBcomissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBcomissao."NOMEVENDEDOR"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 570.709030000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 234.330860000000000000
        Width = 740.409927000000000000
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 58.682176320000000000
          Top = 20.687953680000000000
          Width = 200.712935260000000000
          Height = 19.494417890000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total de todos os vendedores:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 268.346630000000000000
          Top = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'A Prazo')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 275.308922110000000000
          Top = 22.677180000000000000
          Width = 77.778748950000000000
          Height = 19.892263160000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBcomissao."VALORAPRAZORECEBIDA">)]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 362.834880000000000000
          Top = 22.677180000000000000
          Width = 81.558278950000000000
          Height = 19.892263160000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBcomissao."VALORCARTAORECEBIDO">)]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055350000000000000
          Top = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Cart'#227'o')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 457.323130000000000000
          Top = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'A Vista')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 457.323130000000000000
          Top = 22.677180000000000000
          Width = 85.337808950000000000
          Height = 19.892263160000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBcomissao."VALORDINHEIRO">)]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 563.149970000000000000
          Top = 22.677180000000000000
          Width = 92.896868950000000000
          Height = 19.892263160000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<frxDBcomissao."VALORDINHEIRO">)+SUM(<frxDBcomissao."VALORA' +
              'PRAZORECEBIDA">)+SUM(<frxDBcomissao."VALORCARTAORECEBIDO">)]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 570.709030000000000000
          Top = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total Geral')
          ParentFont = False
        end
      end
    end
  end
end
