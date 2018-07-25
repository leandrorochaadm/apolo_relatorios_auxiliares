object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Apolo Atendimento'
  ClientHeight = 367
  ClientWidth = 350
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
      OnClick = BtnLiberadorClick
    end
    object btnRelatorio: TSpeedButton
      Left = 0
      Top = 0
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
          Left = 15
          Top = 80
          Width = 58
          Height = 13
          Caption = 'Plano Conta'
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
          OnClick = ImprimirClick
        end
        object Button1: TButton
          Left = 80
          Top = 99
          Width = 200
          Height = 25
          Caption = 'Produto Pre'#231'o Custo'
          TabOrder = 5
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
      end
      object tabBoleto: TTabSheet
        Caption = 'tabBoleto'
        ImageIndex = 1
      end
    end
  end
  object ExeInfo1: TExeInfo
    Version = '1.2.2.0'
    Left = 72
    Top = 304
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
    Left = 24
    Top = 304
  end
  object IdFTP1: TIdFTP
    OnWork = IdFTP1Work
    IPVersion = Id_IPv4
    AutoLogin = True
    Host = 'ftp.atomsistem.com.br'
    Passive = True
    Password = 'atom2017'
    TransferType = ftBinary
    Username = 'atoms053'
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 112
    Top = 312
  end
end
