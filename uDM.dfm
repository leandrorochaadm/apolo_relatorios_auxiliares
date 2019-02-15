object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 362
  Width = 668
  object con: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'AutoEncodeStrings=ON'
      'controls_cp=CP_UTF16')
    Connected = True
    HostName = 'localhost'
    Port = 3050
    Database = 'C:\Apolo\BD\BASE.FDB'
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
      'DriverID=FB'
      'Port=3050'
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\Apolo\BD\BASE.FDB'
      'Server=localhost')
    Connected = True
    LoginPrompt = False
    Left = 590
    Top = 8
  end
  object qrCommon: TFDQuery
    Active = True
    Connection = conn
    SQL.Strings = (
      
        'select c.produto, itv.codproduto,sum(itv.total) as venda ,(sum(i' +
        'tv.total)-(sum(itv.qtde) *c.precocusto )) as lucro'
      'from c000032 itv'
      'left join c000025 c on( c.codigo=itv.codproduto)'
      ''
      'where itv.data between '#39'01.12.2018'#39' and '#39'31.12.2018'#39
      'group by itv.codproduto, c.produto, c.precocusto'
      'order by (sum(itv.total)-(sum(itv.qtde) *c.precocusto )) desc')
    Left = 584
    Top = 88
  end
end
