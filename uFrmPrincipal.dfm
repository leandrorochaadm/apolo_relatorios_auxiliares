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
    Height = 50
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = -5
    object BtnLiberador: TSpeedButton
      Left = 111
      Top = 1
      Width = 105
      Height = 49
      Caption = 'Controle Licen'#231'a'
      OnClick = BtnLiberadorClick
    end
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 0
      Width = 105
      Height = 49
      Caption = 'Relatorios Extras'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 222
      Top = 1
      Width = 105
      Height = 49
      Caption = 'Boleto'
      Visible = False
      OnClick = SpeedButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 50
    Width = 659
    Height = 317
    Align = alClient
    TabOrder = 1
    ExplicitTop = 41
    ExplicitHeight = 326
    object pcAtendimento: TPageControl
      Left = 1
      Top = 1
      Width = 657
      Height = 315
      ActivePage = tabRel
      Align = alClient
      TabOrder = 0
      Visible = False
      ExplicitHeight = 324
      object tabRel: TTabSheet
        Caption = 'Relat'#243'rios'
        ExplicitHeight = 296
        object pcRel: TPageControl
          Left = 0
          Top = 0
          Width = 649
          Height = 287
          ActivePage = tabProdCusto
          Align = alClient
          TabOrder = 0
          object tabProdCusto: TTabSheet
            Caption = 'Produto Pre'#231'o Custo'
            ExplicitHeight = 268
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
            ExplicitHeight = 268
            object Imprimir: TButton
              Left = 3
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
      object tabBoleto: TTabSheet
        Caption = 'tabBoleto'
        ImageIndex = 1
        ExplicitHeight = 296
      end
    end
  end
  object ExeInfo1: TExeInfo
    Version = '1.2.2.0'
    Left = 448
    Top = 192
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 320
    Top = 192
  end
end
