object frmPedidoCompra: TfrmPedidoCompra
  Left = 0
  Top = 0
  Caption = 'frmPedidoCompra'
  ClientHeight = 729
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object DBLCfornecedor: TDBLookupComboBox
      Left = 69
      Top = 16
      Width = 324
      Height = 21
      KeyField = 'CODIGO'
      ListField = 'FANTASIA'
      ListSource = dm.dsFornecedores
      TabOrder = 0
      OnClick = DBLCfornecedorExit
      OnEnter = DBLCfornecedorExit
      OnExit = DBLCfornecedorExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 1008
    Height = 375
    Align = alTop
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 1006
      Height = 373
      Align = alClient
      DataSource = dm.dsProdForn
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnMouseWheel = DBGrid1MouseWheel
      Columns = <
        item
          Expanded = False
          FieldName = 'CODPRODUTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECOMEDIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDCOMPRADA'
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 432
    Width = 1008
    Height = 297
    Align = alClient
    TabOrder = 2
    object Label2: TLabel
      Left = 168
      Top = 72
      Width = 85
      Height = 13
      Caption = 'ESTOQUE_ATUAL'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 168
      Top = 112
      Width = 92
      Height = 13
      Caption = 'QUANTCOMPRADA'
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 168
      Top = 152
      Width = 53
      Height = 13
      Caption = 'SUGESTAO'
      FocusControl = DBEdit3
    end
    object DBEdit1: TDBEdit
      Left = 168
      Top = 88
      Width = 134
      Height = 21
      DataField = 'ESTOQUE_ATUAL'
      DataSource = dm.dsSugestao
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 168
      Top = 128
      Width = 134
      Height = 21
      DataField = 'QUANTCOMPRADA'
      DataSource = dm.dsSugestao
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 168
      Top = 168
      Width = 134
      Height = 21
      DataField = 'SUGESTAO'
      DataSource = dm.dsSugestao
      TabOrder = 2
    end
  end
end
