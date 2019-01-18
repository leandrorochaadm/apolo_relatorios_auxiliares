object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Auxiliar Apolo'
  ClientHeight = 367
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 50
    Align = alTop
    TabOrder = 0
    object BtnLiberador: TSpeedButton
      Left = 111
      Top = 1
      Width = 105
      Height = 49
      Caption = 'Controle Licen'#231'a'
      Transparent = False
      OnClick = BtnLiberadorClick
    end
    object btnRelatorio: TSpeedButton
      Left = 0
      Top = 1
      Width = 105
      Height = 49
      Caption = 'Relatorios Extras'
      OnClick = btnRelatorioClick
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
    Width = 350
    Height = 317
    Align = alClient
    TabOrder = 1
    object pcAtendimento: TPageControl
      Left = 1
      Top = 1
      Width = 348
      Height = 315
      ActivePage = tabRel
      Align = alClient
      TabOrder = 0
      Visible = False
      object tabRel: TTabSheet
        Caption = 'Relat'#243'rios'
        object lblDataI: TLabel
          Left = 15
          Top = 24
          Width = 53
          Height = 13
          Caption = 'Data Inicial'
        end
        object lblDataF: TLabel
          Left = 15
          Top = 53
          Width = 48
          Height = 13
          Caption = 'Data Final'
        end
        object lblPlanoConta: TLabel
          Left = 16
          Top = 80
          Width = 58
          Height = 13
          Caption = 'Plano Conta'
          Visible = False
        end
        object btnDreDet: TButton
          Left = 80
          Top = 192
          Width = 200
          Height = 25
          Caption = 'Dre Detelhado'
          TabOrder = 1
          OnClick = btnDreDetClick
        end
        object Imprimir: TButton
          Left = 80
          Top = 130
          Width = 200
          Height = 25
          Caption = 'Vendas Cart'#227'o s/ Cupom'
          TabOrder = 4
          Visible = False
          OnClick = ImprimirClick
        end
        object Button1: TButton
          Left = 80
          Top = 99
          Width = 200
          Height = 25
          Caption = 'Produto Pre'#231'o Custo'
          TabOrder = 5
          Visible = False
          OnClick = Button1Click
        end
        object dataI: TDateTimePicker
          Left = 80
          Top = 18
          Width = 200
          Height = 21
          Date = 43265.711674386580000000
          Time = 43265.711674386580000000
          TabOrder = 0
        end
        object dataF: TDateTimePicker
          Left = 80
          Top = 45
          Width = 200
          Height = 21
          Date = 43265.711714571760000000
          Time = 43265.711714571760000000
          TabOrder = 2
        end
        object btnDreRes: TButton
          Left = 80
          Top = 161
          Width = 200
          Height = 25
          Caption = 'Dre Resumido'
          TabOrder = 6
          OnClick = btnDreResClick
        end
        object dblkcbbPlanoConta: TDBLookupComboBox
          Left = 80
          Top = 72
          Width = 200
          Height = 21
          DropDownRows = 15
          KeyField = 'CODIGO'
          ListField = 'CONTA;CLASSIFICACAO'
          ListSource = dm.dsPlanoConta
          TabOrder = 3
          Visible = False
        end
        object btnLimparFiltro: TButton
          Left = 262
          Top = 259
          Width = 75
          Height = 25
          Caption = 'Limpar Filtro'
          TabOrder = 7
          OnClick = btnLimparFiltroClick
        end
        object Button2: TButton
          Left = 80
          Top = 223
          Width = 200
          Height = 25
          Caption = 'Vendas Mensais'
          TabOrder = 8
          OnClick = Button2Click
        end
      end
      object tabBoleto: TTabSheet
        Caption = 'tabBoleto'
        ImageIndex = 1
      end
    end
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 16
    Top = 224
  end
  object IdFTP1: TIdFTP
    OnWork = IdFTP1Work
    IPVersion = Id_IPv4
    Host = 'ftp.atomsistem.com.br'
    Passive = True
    ConnectTimeout = 0
    Password = 'atom2017'
    TransferType = ftBinary
    Username = 'atoms053'
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 16
    Top = 288
  end
end
