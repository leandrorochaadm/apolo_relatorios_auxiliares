object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 198
  Width = 307
  object con: TZConnection
    ControlsCodePage = cCP_UTF16
    Connected = True
    HostName = 'localhost'
    Port = 3050
    Database = 'C:\APOLO\BD\base.FDB'
    User = 'SYSDBA'
    Password = 'masterkey'
    Protocol = 'firebirdd-2.5'
    Left = 88
    Top = 56
  end
  object qrFilial: TZQuery
    Connection = con
    SQL.Strings = (
      'select filial, cnpj from c000004')
    Params = <>
    Left = 136
    Top = 56
  end
  object qrClienteWeb: TZQuery
    Connection = web
    SQL.Strings = (
      'SELECT * FROM `liberacao`')
    Params = <>
    Left = 152
    Top = 120
  end
  object web: TZConnection
    ControlsCodePage = cCP_UTF16
    Connected = True
    HostName = '192.185.223.44'
    Port = 3306
    Database = 'atoms053_web'
    User = 'atoms053_suporte'
    Password = 'atom2017'
    Protocol = 'mysql-5'
    Left = 88
    Top = 120
  end
  object qrConAux: TZQuery
    Connection = con
    Params = <>
    Left = 192
    Top = 56
  end
end
