object dmRel: TdmRel
  OldCreateOrder = False
  Height = 598
  Width = 496
  object frxRepProdCusto: TfrxReport
    Version = '5.1.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43250.638496331000000000
    ReportOptions.LastChange = 43250.658918252320000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 16
    Top = 216
    Datasets = <
      item
        DataSet = frDBprodCusto
        DataSetName = 'dsRelProdCusto'
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
            '[frxDBDataset1."CODIGO"]')
        end
        object frxDBDataset1NOME_FORN: TfrxMemoView
          Left = 56.692950000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_FORN'
          DataSet = frDBprodCusto
          DataSetName = 'dsRelProdCusto'
          Memo.UTF8W = (
            '[frxDBDataset1."NOME_FORN"]')
        end
        object frxDBDataset1DESCRICAO: TfrxMemoView
          Left = 249.448980000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO'
          DataSet = frDBprodCusto
          DataSetName = 'dsRelProdCusto'
          Memo.UTF8W = (
            '[frxDBDataset1."DESCRICAO"]')
        end
        object frxDBDataset1LOCALICAZAO: TfrxMemoView
          Left = 668.976810000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'LOCALICAZAO'
          DataSet = frDBprodCusto
          DataSetName = 'dsRelProdCusto'
          Memo.UTF8W = (
            '[frxDBDataset1."LOCALICAZAO"]')
        end
        object frxDBDataset1PRECO_COMPRA: TfrxMemoView
          Left = 737.008350000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
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
            '[frxDBDataset1."PRECO_COMPRA"]')
          ParentFont = False
        end
        object frxDBDataset1PRECO_CUSTO: TfrxMemoView
          Left = 827.717070000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
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
            '[frxDBDataset1."PRECO_CUSTO"]')
          ParentFont = False
        end
        object frxDBDataset1LUCRO_LIQ: TfrxMemoView
          Left = 910.866730000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
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
            '[frxDBDataset1."LUCRO_LIQ"]')
          ParentFont = False
        end
        object frxDBDataset1PRECOVENDA: TfrxMemoView
          Left = 1001.575450000000000000
          Top = 3.779530000000000000
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
            '[frxDBDataset1."PRECOVENDA"]')
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
          Width = 64.252010000000000000
          Height = 16.377963330000000000
          Memo.UTF8W = (
            'Localiz'#227'o')
        end
        object Memo6: TfrxMemoView
          Left = 827.717070000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 16.377963330000000000
          Memo.UTF8W = (
            'Localiz'#227'o')
        end
        object Memo7: TfrxMemoView
          Left = 910.866730000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 16.377963330000000000
          Memo.UTF8W = (
            'Localiz'#227'o')
        end
        object Memo8: TfrxMemoView
          Left = 1001.575450000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 16.377963330000000000
          Memo.UTF8W = (
            'Localiz'#227'o')
        end
      end
    end
  end
  object frDBprodCusto: TfrxDBDataset
    UserName = 'dsRelProdCusto'
    CloseDataSource = False
    DataSource = dsRelProdCusto
    BCDToCurrency = False
    Left = 24
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
    Left = 24
    Top = 16
  end
  object dsRelProdCusto: TDataSource
    DataSet = qrRelProdCusto
    Left = 24
    Top = 80
  end
  object qrVendaCartaoSnfce: TZQuery
    Connection = dm.con
    Active = True
    SQL.Strings = (
      'select codigo, c000048.data, total from c000048'
      
        'where (c000048.meio_cartaocred >0 or c000048.meio_cartaodeb>0) a' +
        'nd c000048.nfce is null')
    Params = <>
    Left = 120
    Top = 16
  end
  object dsVendaCartaoSnfce: TDataSource
    DataSet = qrVendaCartaoSnfce
    Left = 120
    Top = 80
  end
  object frxDBVendaCartaoSnfce: TfrxDBDataset
    UserName = 'frxDBVendaCartaoSnfce'
    CloseDataSource = False
    DataSource = dsVendaCartaoSnfce
    BCDToCurrency = False
    Left = 120
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
    ReportOptions.LastChange = 43250.667687615740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 120
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
end
