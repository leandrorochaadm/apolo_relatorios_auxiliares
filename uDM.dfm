object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 242
  Width = 913
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
    Left = 254
    Top = 32
  end
  object qrCommon: TFDQuery
    Connection = conn
    SQL.Strings = (
      'select * from roi30')
    Left = 256
    Top = 96
  end
  object qrFornecedores: TFDQuery
    Connection = conn
    SQL.Strings = (
      
        'select forn.codigo, forn.nome, forn.fantasia from c000009 forn -' +
        '-where forn.')
    Left = 504
    Top = 89
  end
  object dsFornecedores: TDataSource
    DataSet = qrFornecedores
    Left = 504
    Top = 152
  end
  object qrProdForn: TFDQuery
    Connection = conn
    SQL.Strings = (
      
        'select itv.codproduto, prod.produto, (sum(itv.total) / sum(itv.q' +
        'tde)) as precomedio, sum(itv.qtde) as qtdcomprada --, (sum(itv.q' +
        'tde)-est.estoque_atual) as su'
      'from c000032 itv'
      'left join c000025 prod on (prod.codigo= itv.codproduto)'
      'left join c000100 est on (est.codproduto=itv.codproduto)'
      'where itv.movimento=1'
      'and itv.codcliente = :fornecedor'
      'and itv.data < cast('#39'today'#39' as date)-35'
      'group by itv.codproduto, produto')
    Left = 424
    Top = 88
    ParamData = <
      item
        Name = 'FORNECEDOR'
        DataType = ftString
        ParamType = ptInput
        Size = 6
        Value = Null
      end>
    object qrProdFornCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Origin = 'CODPRODUTO'
      Size = 6
    end
    object qrProdFornPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qrProdFornPRECOMEDIO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'PRECOMEDIO'
      Origin = 'PRECOMEDIO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object qrProdFornQTDCOMPRADA: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'QTDCOMPRADA'
      Origin = 'QTDCOMPRADA'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsProdForn: TDataSource
    DataSet = qrProdForn
    Left = 432
    Top = 152
  end
  object qrProdUltCompras: TFDQuery
    Active = True
    IndexFieldNames = 'CODPRODUTO'
    MasterSource = dsProdForn
    MasterFields = 'CODPRODUTO'
    DetailFields = 'CODPRODUTO'
    Connection = conn
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'select itv.codproduto, itv.data, itv.qtde, itv.unitario, itv.tot' +
        'al from c000032 itv'
      
        'where itv.codproduto = :codproduto and itv.data < cast('#39'today'#39' a' +
        's date)-90'
      'order by itv.data desc')
    Left = 344
    Top = 96
    ParamData = <
      item
        Name = 'CODPRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 6
        Value = '000004'
      end>
  end
  object dsProdUltCompras: TDataSource
    DataSet = qrProdUltCompras
    Left = 344
    Top = 152
  end
  object qrSugestao: TFDQuery
    Active = True
    Connection = conn
    SQL.Strings = (
      
        'select est.codproduto, est.estoque_atual, sum(itv.qtde) as quant' +
        'comprada, (sum(itv.qtde) - est.estoque_atual) as sugestao'
      'from  c000032 itv '
      'inner join c000100 est on (itv.codproduto=est.codproduto)'
      'where est.codproduto= :codproduto'
      'and itv.data < cast('#39'today'#39' as date)-35'
      'and itv.movimento<>1'
      'group by est.codproduto, est.estoque_atual')
    Left = 584
    Top = 89
    ParamData = <
      item
        Name = 'CODPRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end>
    object qrSugestaoCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Origin = 'CODPRODUTO'
      Size = 10
    end
    object qrSugestaoESTOQUE_ATUAL: TFloatField
      FieldName = 'ESTOQUE_ATUAL'
      Origin = 'ESTOQUE_ATUAL'
      DisplayFormat = '0.000'
    end
    object qrSugestaoQUANTCOMPRADA: TFloatField
      FieldName = 'QUANTCOMPRADA'
      Origin = 'QUANTCOMPRADA'
      DisplayFormat = '0.000'
    end
    object qrSugestaoSUGESTAO: TFloatField
      FieldName = 'SUGESTAO'
      Origin = 'SUGESTAO'
      DisplayFormat = '0.000'
    end
  end
  object dsSugestao: TDataSource
    DataSet = qrSugestao
    Left = 584
    Top = 152
  end
end
