object frmUpdateAuxiliar: TfrmUpdateAuxiliar
  Left = 0
  Top = 0
  Caption = 'Update'
  ClientHeight = 430
  ClientWidth = 784
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
  object pnl1: TPanel
    Left = 0
    Top = 389
    Width = 784
    Height = 41
    Align = alBottom
    Caption = 'pnl1'
    TabOrder = 0
    ExplicitTop = 120
    object pbAtualizacao: TProgressBar
      Left = 1
      Top = 1
      Width = 782
      Height = 39
      Align = alClient
      TabOrder = 0
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 113
    Align = alTop
    TabOrder = 1
    object lblAtualizacao: TLabel
      Left = 1
      Top = 1
      Width = 782
      Height = 111
      Align = alClient
      Alignment = taCenter
      Caption = 'Aguarde o sistema ir'#225' iniciar update'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 428
      ExplicitHeight = 29
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 113
    Width = 784
    Height = 276
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 312
    ExplicitTop = 216
    ExplicitWidth = 185
    ExplicitHeight = 41
    object mmo1: TMemo
      Left = 1
      Top = 1
      Width = 782
      Height = 274
      Align = alClient
      Lines.Strings = (
        'mmo1')
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = -3
    end
  end
  object idftp1: TIdFTP
    OnWork = idftp1Work
    OnWorkBegin = idftp1WorkBegin
    IPVersion = Id_IPv4
    AutoLogin = True
    Host = 'ftp.atomsistem.com.br'
    Passive = True
    Password = 'atom2017'
    TransferType = ftBinary
    Username = 'atoms053'
    UseMLIS = False
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 24
    Top = 56
  end
  object exnf1: TExeInfo
    Version = '1.2.2.0'
    Left = 80
    Top = 56
  end
end
