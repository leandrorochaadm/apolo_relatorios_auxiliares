object frmLiberador: TfrmLiberador
  Left = 0
  Top = 0
  Caption = 'Controle Licen'#231'a'
  ClientHeight = 213
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 68
    Top = 19
    Width = 30
    Height = 13
    Caption = 'Raz'#227'o'
  end
  object Label2: TLabel
    Left = 68
    Top = 59
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object Data: TLabel
    Left = 68
    Top = 96
    Width = 23
    Height = 13
    Caption = 'Data'
    Visible = False
  end
  object Label3: TLabel
    Left = 28
    Top = 135
    Width = 65
    Height = 13
    Caption = 'Complemento'
  end
  object Label4: TLabel
    Left = 67
    Top = 176
    Width = 24
    Height = 13
    Caption = 'Serie'
  end
  object DBEditRazao: TEdit
    Left = 104
    Top = 16
    Width = 300
    Height = 21
    TabStop = False
    TabOrder = 2
  end
  object DBEditCNPJ: TEdit
    Left = 104
    Top = 51
    Width = 200
    Height = 21
    TabStop = False
    TabOrder = 3
  end
  object RzDateBase: TRzDateTimeEdit
    Left = 104
    Top = 88
    Width = 121
    Height = 21
    TabStop = False
    EditType = etDate
    TabOrder = 4
    Visible = False
  end
  object EditNumControle: TEdit
    Left = 104
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btnGerarReset: TButton
    Left = 231
    Top = 126
    Width = 75
    Height = 25
    Caption = 'Gerar S'#233'rie'
    TabOrder = 5
    OnClick = btnGerarResetClick
  end
  object EditReset: TEdit
    Left = 104
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 1
  end
end
