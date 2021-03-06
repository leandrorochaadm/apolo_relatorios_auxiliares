object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Relat'#243'rios Auxiliares'
  ClientHeight = 380
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 380
    Align = alClient
    TabOrder = 0
    object pcAtendimento: TPageControl
      Left = 1
      Top = 1
      Width = 348
      Height = 378
      ActivePage = tabRel
      Align = alClient
      TabOrder = 0
      object tabRel: TTabSheet
        Caption = 'Relat'#243'rios'
        ExplicitLeft = 8
        ExplicitTop = 28
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
          Caption = 'Vendas recebidas resumida'
          TabOrder = 4
          OnClick = ImprimirClick
        end
        object Button1: TButton
          Left = 80
          Top = 99
          Width = 200
          Height = 25
          Caption = 'Vendas recebidas detalhada'
          TabOrder = 5
          OnClick = Button1Click
        end
        object dataI: TDateTimePicker
          Left = 80
          Top = 18
          Width = 200
          Height = 21
          Date = 43265.000000000000000000
          Time = 0.711674386577215000
          TabOrder = 0
        end
        object dataF: TDateTimePicker
          Left = 80
          Top = 45
          Width = 200
          Height = 21
          Date = 43265.000000000000000000
          Time = 0.711714571756601800
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
          Left = 80
          Top = 317
          Width = 200
          Height = 25
          Caption = 'Limpar Filtros'
          TabOrder = 7
          OnClick = btnLimparFiltroClick
        end
        object Button2: TButton
          Left = 80
          Top = 223
          Width = 200
          Height = 25
          Caption = 'Comiss'#227'o Resumida'
          TabOrder = 8
          OnClick = Button2Click
        end
        object Button4: TButton
          Left = 80
          Top = 286
          Width = 200
          Height = 25
          Caption = 'Lucro por Produto'
          TabOrder = 9
          Visible = False
          OnClick = Button4Click
        end
        object Button9: TButton
          Left = 80
          Top = 254
          Width = 200
          Height = 25
          Caption = 'Comiss'#227'o Detalhada'
          TabOrder = 10
          OnClick = Button9Click
        end
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
  object ActionList1: TActionList
    Left = 16
    Top = 160
    object ParametrosServidor: TAction
      Caption = 'ParametrosServidor'
      ShortCut = 16496
      OnExecute = ParametrosServidorExecute
    end
  end
  object ActionList2: TActionList
    Left = 16
    Top = 120
    object actLiberador: TAction
      Caption = 'Liberador'
      ShortCut = 49228
      OnExecute = actLiberadorExecute
    end
    object actLimparFiltro: TAction
      Caption = 'Limpar Filtro'
      ShortCut = 27
      OnExecute = actLimparFiltroExecute
    end
  end
end
