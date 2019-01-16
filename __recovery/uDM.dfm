object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 362
  Width = 668
  object con: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
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
    Top = 224
  end
  object web: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = '192.185.223.44'
    Port = 3306
    Database = 'atoms053_web'
    User = 'atoms053_suporte'
    Password = 'atom2017'
    Protocol = 'mysql-5'
    Left = 88
    Top = 224
  end
  object qrConAux: TZQuery
    Connection = con
    Params = <>
    Left = 192
    Top = 56
  end
  object qrPlanoConta: TZQuery
    Connection = con
    SQL.Strings = (
      
        'select pc.codigo, pc.conta, pc.classificacao from c000035 pc whe' +
        're pc.conta is not null and pc.conta <>'#39#39' order by pc.conta')
    Params = <>
    Left = 256
    Top = 56
    object wdstrngfldPlanoContaCODIGO: TWideStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 6
    end
    object wdstrngfldPlanoContaCONTA: TWideStringField
      FieldName = 'CONTA'
    end
    object wdstrngfldPlanoContaCLASSIFICACAO: TWideStringField
      FieldName = 'CLASSIFICACAO'
      Size = 6
    end
  end
  object dsPlanoConta: TDataSource
    DataSet = qrPlanoConta
    Left = 256
    Top = 112
  end
  object qrCommon: TZQuery
    Connection = con
    SQL.Strings = (
      'select * from l000003')
    Params = <>
    Left = 272
    Top = 240
  end
  object conn: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'Database=C:\Apolo\BD\base.FDB'
      'Password=masterkey'
      'Server=localhost'
      'User_Name=sysdba'
      'Port=3050')
    Connected = True
    LoginPrompt = False
    Left = 470
    Top = 40
  end
end
