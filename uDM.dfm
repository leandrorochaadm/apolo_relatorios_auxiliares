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
    Left = 16
    Top = 8
  end
  object qrFilial: TZQuery
    Connection = con
    SQL.Strings = (
      'select filial, cnpj from c000004')
    Params = <>
    Left = 64
    Top = 8
  end
  object qrClienteWeb: TZQuery
    Connection = web
    SQL.Strings = (
      'SELECT * FROM `liberacao`')
    Params = <>
    Left = 80
    Top = 120
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
    Left = 16
    Top = 120
  end
  object qrConAux: TZQuery
    Connection = con
    Params = <>
    Left = 120
    Top = 8
  end
  object qrPlanoConta: TZQuery
    Connection = con
    SQL.Strings = (
      
        'select pc.codigo, pc.conta, pc.classificacao from c000035 pc whe' +
        're pc.conta is not null and pc.conta <>'#39#39' order by pc.conta')
    Params = <>
    Left = 184
    Top = 8
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
    Left = 184
    Top = 64
  end
  object conn: TFDConnection
    Params.Strings = (
      'Database=C:\Apolo\BD\base.FDB'
      'DriverID=FB'
      'Password=masterkey'
      'Port=3050'
      'Server=localhost'
      'User_Name=sysdba')
    Connected = True
    LoginPrompt = False
    Left = 582
    Top = 8
  end
  object qrCommon: TFDQuery
    Active = True
    Connection = conn
    SQL.Strings = (
      ''
      
        'Select Classificacao, max(tipo) as tipo, max(Nome_Conta) as Nome' +
        '_conta, sum(Total) as Total from'
      
        '( Select c000035.classificacao as Classificacao, c000035.tipo as' +
        ' tipo, c000035.conta as Nome_Conta, sum(c000042.Valor) as Total'
      
        'from c000042 INNER JOIN C000035 ON(C000042.codconta = c000035.CO' +
        'DIGO)'
      'where c000042.DATA between '#39'01/12/2018'#39' and '#39'01/02/2019'#39
      'group by Classificacao, tipo, Nome_Conta UNION ALL'
      
        'Select c000035.classificacao as Classificacao, c000035.tipo as t' +
        'ipo, c000035.conta as Nome_Conta,'
      
        'sum((coalesce(c000044.entrada,0) - coalesce(c000044.saida,0))) a' +
        's Total'
      
        'from c000044 INNER JOIN C000035 ON(C000044.codconta = c000035.co' +
        'digo)'
      'where 1=1 and c000044.DATA between '#39'01/12/2018'#39' and '#39'01/02/2019'#39
      
        'and (coalesce(c000044.entrada,0) - coalesce(c000044.saida,0)) <>' +
        '0'
      'and  historico <> '#39'S A L D O   A N T E R I O R'#39
      'and historico <> '#39'Acerto do Saldo Anterior'#39
      
        'group by Classificacao, tipo, Nome_Conta) as tmp group by classi' +
        'ficacao')
    Left = 584
    Top = 88
  end
end
