object dmRel: TdmRel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 313
  Width = 327
  object frxRepProdCusto: TfrxReport
    Version = '5.1.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43250.638496331000000000
    ReportOptions.LastChange = 43258.712848576400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 24
    Top = 216
    Datasets = <
      item
        DataSet = frDBprodCusto
        DataSetName = 'dsRelProdCusto'
      end
      item
        DataSet = frxDBFilial
        DataSetName = 'frxDBFilial'
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
        Top = 154.960730000000000000
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
        Top = 71.811070000000000000
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
        Height = 30.236240000000000000
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
          Left = 922.625267780000000000
          Top = 2.519686670000000000
          Width = 149.921356670000000000
          Height = 14.698172220000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8W = (
            'Data: [Date]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 238.110390000000000000
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
    Left = 32
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
      ' left join c000026 c on (c.codproduto =f.codigo)')
    Params = <>
    Left = 32
    Top = 16
  end
  object dsRelProdCusto: TDataSource
    DataSet = qrRelProdCusto
    Left = 32
    Top = 80
  end
  object qrVendaCartaoSnfce: TZQuery
    Connection = dm.con
    SQL.Strings = (
      'select codigo, c000048.data, total from c000048'
      
        'where (c000048.meio_cartaocred >0 or c000048.meio_cartaodeb>0) a' +
        'nd c000048.nfce is null')
    Params = <>
    Left = 128
    Top = 16
  end
  object dsVendaCartaoSnfce: TDataSource
    DataSet = qrVendaCartaoSnfce
    Left = 128
    Top = 80
  end
  object frxDBVendaCartaoSnfce: TfrxDBDataset
    UserName = 'frxDBVendaCartaoSnfce'
    CloseDataSource = False
    DataSource = dsVendaCartaoSnfce
    BCDToCurrency = False
    Left = 128
    Top = 144
  end
  object frxRepVendaCartaoSnfce: TfrxReport
    Version = '5.1.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43250.638496331000000000
    ReportOptions.LastChange = 43250.667687615700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 128
    Top = 216
    Datasets = <
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
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 102.047310000000000000
        Width = 1084.725110000000000000
        DataSet = frxDBVendaCartaoSnfce
        DataSetName = 'frxDBVendaCartaoSnfce'
        RowCount = 0
        object frxDBVendaCartaoSnfceCODIGO: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559060000000000000
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
          Top = 7.559060000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'DATA'
          DataSet = frxDBVendaCartaoSnfce
          DataSetName = 'frxDBVendaCartaoSnfce'
          Memo.UTF8W = (
            '[frxDBVendaCartaoSnfce."DATA"]')
        end
        object frxDBVendaCartaoSnfceTOTAL: TfrxMemoView
          Left = 257.008040000000000000
          Top = 7.559060000000000000
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
        Top = 18.897650000000000000
        Width = 1084.725110000000000000
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
          Left = 264.567100000000000000
          Width = 49.133890000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor')
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
    Left = 216
    Top = 144
  end
end
