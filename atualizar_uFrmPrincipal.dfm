object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Atualiza'#231#227'o do sistema Auxiliar'
  ClientHeight = 161
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
  object lblAtualizacao: TLabel
    Left = 0
    Top = 0
    Width = 784
    Height = 120
    Align = alClient
    Alignment = taCenter
    Caption = 'Aguarde o sistema ir'#225' iniciar atualiza'#231#227'o '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnMouseMove = lblAtualizacaoMouseMove
    ExplicitWidth = 488
    ExplicitHeight = 29
  end
  object pnl1: TPanel
    Left = 0
    Top = 120
    Width = 784
    Height = 41
    Align = alBottom
    Caption = 'pnl1'
    TabOrder = 0
    object pbAtualizacao: TProgressBar
      Left = 1
      Top = 1
      Width = 782
      Height = 39
      Align = alClient
      TabOrder = 0
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
    Username = 'atoms053'
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
