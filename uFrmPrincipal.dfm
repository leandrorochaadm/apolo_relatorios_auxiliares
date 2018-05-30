object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Apolo Atendimento'
  ClientHeight = 367
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 659
    Height = 41
    Align = alTop
    TabOrder = 0
    object BtnLiberador: TSpeedButton
      Left = 8
      Top = -8
      Width = 105
      Height = 49
      Caption = 'Controle Licen'#231'a'
      OnClick = BtnLiberadorClick
    end
    object SpeedButton1: TSpeedButton
      Left = 230
      Top = -8
      Width = 105
      Height = 49
      Caption = 'Relatorios Extras'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 119
      Top = -8
      Width = 105
      Height = 49
      Caption = 'Boleto'
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 659
    Height = 326
    Align = alClient
    TabOrder = 1
    object pcAtendimento: TPageControl
      Left = 1
      Top = 1
      Width = 657
      Height = 324
      ActivePage = tabRel
      Align = alClient
      TabOrder = 0
      object tabRel: TTabSheet
        Caption = 'Relat'#243'rios'
        object pcRel: TPageControl
          Left = 0
          Top = 0
          Width = 649
          Height = 296
          ActivePage = tabProdCusto
          Align = alClient
          TabOrder = 0
          object tabProdCusto: TTabSheet
            Caption = 'tabProdCusto'
            object Button1: TButton
              Left = 3
              Top = 16
              Width = 75
              Height = 25
              Caption = 'Imprimir'
              TabOrder = 0
              OnClick = Button1Click
            end
          end
          object tabVendaCartaoSnfce: TTabSheet
            Caption = 'Vendas Cart'#227'o s/ Cupom'
            ImageIndex = 1
            object Imprimir: TButton
              Left = 16
              Top = 16
              Width = 75
              Height = 25
              Caption = 'Imprimir'
              TabOrder = 0
              OnClick = ImprimirClick
            end
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'TabSheet3'
        ImageIndex = 1
      end
    end
  end
  object ExeInfo1: TExeInfo
    Version = '1.2.2.0'
    Left = 448
    Top = 192
  end
end
