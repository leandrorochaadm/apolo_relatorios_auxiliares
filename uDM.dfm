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
    LoginPrompt = False
    Left = 590
    Top = 8
  end
  object qrCommon: TFDQuery
    Connection = conn
    SQL.Strings = (
      
        'select  (LPad(extract(year from v.data),4,'#39'0'#39')||'#39'.'#39'||LPad(extrac' +
        't(month from v.data),2,'#39'0'#39')) as dataMes ,'
      
        'sum(v.meio_dinheiro) as dinhero, (sum(v.meio_chequeav)+sum(v.mei' +
        'o_chequeap)) as cheque, (sum(v.meio_cartaocred) + sum(v.meio_car' +
        'taodeb)) as cartao, sum(v.meio_crediario) as crediario, sum(v.to' +
        'tal) as total from c000048 v'
      
        'where v.situacao=1  and v.data between  '#39'01/12/2018'#39' and '#39'01/02/' +
        '2019'#39' group by dataMes')
    Left = 584
    Top = 88
  end
end
