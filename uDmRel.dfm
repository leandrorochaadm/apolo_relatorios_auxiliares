object dmRel: TdmRel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 302
  Width = 678
  object frxRepProdCusto: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43250.638496331000000000
    ReportOptions.LastChange = 43292.676422685200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 88
    Top = 216
    Datasets = <
      item
        DataSet = frDBprodCusto
        DataSetName = 'dsRelProdCusto'
      end
      item
        DataSet = frxDBFilial
        DataSetName = 'frxDBFilial'
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
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Frame.Style = fsDot
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 166.299320000000000000
        Width = 1084.725110000000000000
        DataSet = frDBprodCusto
        DataSetName = 'dsRelProdCusto'
        RowCount = 0
        object frxDBDataset1CODIGO: TfrxMemoView
          Left = 3.779530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'CODIGO'
          DataSet = frDBprodCusto
          DataSetName = 'dsRelProdCusto'
          Memo.UTF8W = (
            '[dsRelProdCusto."CODIGO"]')
        end
        object frxDBDataset1NOME_FORN: TfrxMemoView
          Left = 56.692950000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_FORN'
          DataSet = frDBprodCusto
          DataSetName = 'dsRelProdCusto'
          Memo.UTF8W = (
            '[dsRelProdCusto."NOME_FORN"]')
        end
        object frxDBDataset1DESCRICAO: TfrxMemoView
          Left = 249.448980000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO'
          DataSet = frDBprodCusto
          DataSetName = 'dsRelProdCusto'
          Memo.UTF8W = (
            '[dsRelProdCusto."DESCRICAO"]')
        end
        object frxDBDataset1LOCALICAZAO: TfrxMemoView
          Left = 521.575140000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          DataSet = frDBprodCusto
          DataSetName = 'dsRelProdCusto'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dsRelProdCusto."LOCALICAZAO"]')
          ParentFont = False
        end
        object frxDBDataset1PRECO_CUSTO: TfrxMemoView
          Left = 827.717070000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PRECO_CUSTO'
          DataSet = frDBprodCusto
          DataSetName = 'dsRelProdCusto'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dsRelProdCusto."PRECO_CUSTO"]')
          ParentFont = False
        end
        object frxDBDataset1LUCRO_LIQ: TfrxMemoView
          Left = 910.866730000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'LUCRO_LIQ'
          DataSet = frDBprodCusto
          DataSetName = 'dsRelProdCusto'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dsRelProdCusto."LUCRO_LIQ"]')
          ParentFont = False
        end
        object frxDBDataset1PRECOVENDA: TfrxMemoView
          Left = 994.016390000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PRECOVENDA'
          DataSet = frDBprodCusto
          DataSetName = 'dsRelProdCusto'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dsRelProdCusto."PRECOVENDA"]')
          ParentFont = False
        end
        object dsRelProdCustoPRECO_COMPRA: TfrxMemoView
          Left = 740.787880000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frDBprodCusto
          DataSetName = 'dsRelProdCusto'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dsRelProdCusto."PRECO_COMPRA"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 22.677180000000000000
        ParentFont = False
        Top = 83.149660000000000000
        Width = 1084.725110000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 2.519686670000000000
          Width = 49.133890000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 249.448980000000000000
          Top = 3.779530000000000000
          Width = 415.748300000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o Produto')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 668.976810000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 16.377963330000000000
          Memo.UTF8W = (
            'Localiz'#227'o')
        end
        object Memo2: TfrxMemoView
          Left = 56.692950000000000000
          Top = 3.779530000000000000
          Width = 188.976500000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fornecedor')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 740.787880000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'P.Compra')
          ParentFont = False
          WordBreak = True
        end
        object Memo6: TfrxMemoView
          Left = 827.717070000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'P. Custo')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 910.866730000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Lucro l'#237'quido')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 994.016390000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'P.Venda')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 22.677180000000000000
          Width = 1133.858267720000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 18.897650000000000000
        Width = 1084.725110000000000000
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Width = 1077.166050000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de produtos com pre'#231'o custo')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 918.845737780000000000
          Top = 2.519686670000000000
          Width = 157.480416670000000000
          Height = 14.698172220000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8W = (
            'Emiss'#227'o: [Date]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA2: TfrxMemoView
          Left = 340.157700000000000000
          Top = 18.897650000000000000
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
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA2"]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA3: TfrxMemoView
          Left = 925.984850000000000000
          Top = 18.897650000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataField = 'LINHA3'
          DataSet = frxDBRelatorio
          DataSetName = 'frxDBRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA3"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 249.448980000000000000
        Width = 1084.725110000000000000
        object frxDBFilialCNPJ: TfrxMemoView
          Left = 427.086890000000000000
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
          Memo.UTF8W = (
            '[frxDBFilial."CNPJ"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 873.071430000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
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
        object frxDBFilialFILIAL: TfrxMemoView
          Left = 11.338590000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'FILIAL'
          DataSet = frxDBFilial
          DataSetName = 'frxDBFilial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBFilial."FILIAL"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 22.677180000000000000
          Width = 1133.858267720000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frDBprodCusto: TfrxDBDataset
    UserName = 'dsRelProdCusto'
    CloseDataSource = False
    DataSource = dsRelProdCusto
    BCDToCurrency = False
    Left = 96
    Top = 144
  end
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
  object frxDBVendaCartaoSnfce: TfrxDBDataset
    UserName = 'frxDBVendaCartaoSnfce'
    CloseDataSource = False
    DataSource = dsVendaCartaoSnfce
    BCDToCurrency = False
    Left = 192
    Top = 144
  end
  object frxRepVendaCartaoSnfce: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43250.638496331000000000
    ReportOptions.LastChange = 43272.741521423600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 192
    Top = 216
    Datasets = <
      item
        DataSet = frxDBRelatorio
        DataSetName = 'frxDBRelatorio'
      end
      item
        DataSet = frxDBVendaCartaoSnfce
        DataSetName = 'frxDBVendaCartaoSnfce'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 210.000000000000000000
      PaperHeight = 300.000000000000000000
      PaperSize = 256
      LeftMargin = 30.000000000000000000
      RightMargin = 30.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 5.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        Width = 566.929500000000000000
        DataSet = frxDBVendaCartaoSnfce
        DataSetName = 'frxDBVendaCartaoSnfce'
        RowCount = 0
        object frxDBVendaCartaoSnfceCODIGO: TfrxMemoView
          Left = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CODIGO'
          DataSet = frxDBVendaCartaoSnfce
          DataSetName = 'frxDBVendaCartaoSnfce'
          Memo.UTF8W = (
            '[frxDBVendaCartaoSnfce."CODIGO"]')
        end
        object frxDBVendaCartaoSnfceDATA: TfrxMemoView
          Left = 98.267780000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'DATA'
          DataSet = frxDBVendaCartaoSnfce
          DataSetName = 'frxDBVendaCartaoSnfce'
          Memo.UTF8W = (
            '[frxDBVendaCartaoSnfce."DATA"]')
        end
        object frxDBVendaCartaoSnfceTOTAL: TfrxMemoView
          Left = 355.275820000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendaCartaoSnfce
          DataSetName = 'frxDBVendaCartaoSnfce'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVendaCartaoSnfce."TOTAL"]')
          ParentFont = False
        end
        object frxDBVendaCartaoSnfceNOME: TfrxMemoView
          Left = 192.756030000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxDBVendaCartaoSnfce
          DataSetName = 'frxDBVendaCartaoSnfce'
          Memo.UTF8W = (
            '[frxDBVendaCartaoSnfce."NOME"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 22.677180000000000000
        ParentFont = False
        Top = 64.252010000000000000
        Width = 566.929500000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 2.519686670000000000
          Width = 71.811070000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'N'#186' venda')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 98.267780000000000000
          Width = 49.133890000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 355.275820000000000000
          Width = 79.370130000000000000
          Height = 16.377963330000000000
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
        object Memo4: TfrxMemoView
          Left = 192.756030000000000000
          Width = 158.740260000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome do Cliente')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 566.929500000000000000
        object frxDBRelatorioLINHA1: TfrxMemoView
          Width = 563.149970000000000000
          Height = 18.897650000000000000
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
      end
    end
  end
  object frxDBFilial: TfrxDBDataset
    UserName = 'frxDBFilial'
    CloseDataSource = False
    DataSet = dm.qrFilial
    BCDToCurrency = False
    Left = 16
    Top = 216
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
  object frxDBdre: TfrxDBDataset
    UserName = 'frxDBdre'
    CloseDataSource = False
    DataSource = dsDreDet
    BCDToCurrency = False
    Left = 288
    Top = 144
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
    ReportOptions.LastChange = 43306.684248055560000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 288
    Top = 216
    Datasets = <
      item
        DataSet = frxDBdre
        DataSetName = 'frxDBdre'
      end
      item
        DataSet = frxDBFilial
        DataSetName = 'frxDBFilial'
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
          Left = 11.338590000000000000
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
        object Memo9: TfrxMemoView
          Left = 257.008040000000000000
          Top = 3.779530000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          DataField = 'LINHA2'
          DataSet = frxDBRelatorio
          DataSetName = 'frxDBRelatorio'
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA2"]')
        end
        object Memo10: TfrxMemoView
          Left = 574.488560000000000000
          Top = 3.779530000000000000
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
        object frxDBdreHISTORICO: TfrxMemoView
          Left = 170.078850000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'HISTORICO'
          DataSet = frxDBdre
          DataSetName = 'frxDBdre'
          Memo.UTF8W = (
            '[frxDBdre."HISTORICO"]')
        end
        object frxDBdreDATA: TfrxMemoView
          Left = 11.338590000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'DATA'
          DataSet = frxDBdre
          DataSetName = 'frxDBdre'
          Memo.UTF8W = (
            '[frxDBdre."DATA"]')
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
          Top = 3.239597140000000000
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
  object frxDBdreRes: TfrxDBDataset
    UserName = 'frxDBdreRes'
    CloseDataSource = False
    DataSource = dsDreRes
    BCDToCurrency = False
    Left = 360
    Top = 144
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
    ReportOptions.LastChange = 43306.683294548610000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 360
    Top = 216
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
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 81.149660000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Line1: TfrxLineView
          Top = 56.692950000000000000
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
        object Memo26: TfrxMemoView
          Left = 3.779530000000000000
          Top = 59.692950000000000000
          Width = 623.622450000000000000
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
          Left = 638.740570000000000000
          Top = 59.692950000000000000
          Width = 98.267780000000000000
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
        object Memo1: TfrxMemoView
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
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA3"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 15.338590000000000000
        Top = 207.874150000000000000
        Width = 740.409927000000000000
        DataSet = frxDBdreRes
        DataSetName = 'frxDBdreRes'
        RowCount = 0
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
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
          Left = 638.740570000000000000
          Width = 98.267780000000000000
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
          Left = 120.944960000000000000
          Width = 480.000310000000000000
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
        Height = 26.456710000000000000
        Top = 347.716760000000000000
        Width = 740.409927000000000000
        object Line3: TfrxLineView
          Top = 3.779530000000080000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559060000000000000
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
        object Memo7: TfrxMemoView
          Left = 483.779840000000000000
          Top = 7.559060000000000000
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
        object Memo6: TfrxMemoView
          Top = 3.779530000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Grupo de Contas:')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 245.669450000000000000
        Width = 740.409927000000000000
        object Line4: TfrxLineView
          Width = 740.787880000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo11: TfrxMemoView
          Left = 638.740570000000000000
          Width = 98.267780000000000000
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
            '[SUM(<frxDBdreRes."TOTAL">,MasterData1)]')
          ParentFont = False
        end
      end
    end
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
  object frxDBRelatorio: TfrxDBDataset
    UserName = 'frxDBRelatorio'
    CloseDataSource = False
    DataSet = QrRelatorio
    BCDToCurrency = False
    Left = 24
    Top = 144
  end
  object DsRelatorio: TDataSource
    DataSet = QrRelatorio
    Left = 24
    Top = 80
  end
  object qrVendaMensal: TFDQuery
    Active = True
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
  object frxDBVendaMensal: TfrxDBDataset
    UserName = 'frxDBVendaMensal'
    CloseDataSource = False
    DataSet = qrVendaMensal
    BCDToCurrency = False
    Left = 432
    Top = 144
  end
  object frxVendaMensal: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43250.638496331000000000
    ReportOptions.LastChange = 43474.751545381950000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 432
    Top = 216
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
        DataSet = frxDBVendaMensal
        DataSetName = 'frxDBVendaMensal'
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
      Frame.Style = fsDot
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 204.094620000000000000
        Width = 755.906000000000000000
        DataSetName = 'frxDBVendaMes'
        RowCount = 0
        object frxDBVendaMensalDATA: TfrxMemoView
          Left = 26.456710000000000000
          Top = 11.338590000000010000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'DATA'
          DataSet = frxDBVendaMensal
          DataSetName = 'frxDBVendaMensal'
          Memo.UTF8W = (
            '[frxDBVendaMensal."DATA"]')
        end
        object frxDBVendaMensalTOTAL: TfrxMemoView
          Left = 173.858380000000000000
          Top = 11.338590000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL'
          DataSet = frxDBVendaMensal
          DataSetName = 'frxDBVendaMensal'
          Memo.UTF8W = (
            '[frxDBVendaMensal."TOTAL"]')
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 79.574830000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Width = 584.166050000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Vendas Agrupadas Mensalmente')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
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
          HAlign = haRight
          Memo.UTF8W = (
            'Emiss'#227'o: [Date]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA2: TfrxMemoView
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
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA2"]')
          ParentFont = False
        end
        object frxDBRelatorioLINHA3: TfrxMemoView
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
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelatorio."LINHA3"]')
          ParentFont = False
        end
        object frxDBFilialCNPJ: TfrxMemoView
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
          Memo.UTF8W = (
            '[frxDBFilial."CNPJ"]')
          ParentFont = False
        end
        object frxDBFilialFILIAL: TfrxMemoView
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
          Memo.UTF8W = (
            '[frxDBFilial."FILIAL"]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 2.000000000000000000
          Top = 50.102350000000000000
          Width = 1133.858267720000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
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
        Height = 22.897650000000000000
        Top = 359.055350000000000000
        Width = 755.906000000000000000
        object Memo10: TfrxMemoView
          Left = 547.071430000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
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
        Height = 20.677180000000000000
        Top = 158.740260000000000000
        Width = 755.906000000000000000
        Condition = 'frxDBFilial."FILIAL"'
        object Memo1: TfrxMemoView
          Left = 35.779530000000000000
          Top = 0.590496669999993200
          Width = 74.133890000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'ANO/M'#202'S')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 124.692950000000000000
          Top = 0.850339999999988600
          Width = 116.976500000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR')
          ParentFont = False
        end
        object Line2: TfrxLineView
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
        Height = 21.314780000000000000
        Top = 275.905690000000000000
        Width = 755.906000000000000000
        object Memo3: TfrxMemoView
          Left = 38.000000000000000000
          Top = 3.417129999999986000
          Width = 72.976500000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 2.000000000000000000
          Top = 0.417129999999986000
          Width = 1133.858267720000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
    end
    object DialogPage1: TfrxDialogPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Height = 200.000000000000000000
      ClientHeight = 161.000000000000000000
      Left = 424.000000000000000000
      Top = 149.000000000000000000
      Width = 300.000000000000000000
      ClientWidth = 284.000000000000000000
    end
  end
end
