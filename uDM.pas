unit uDM;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Dialogs;

type
  Tdm = class(TDataModule)
    con: TZConnection;
    qrFilial: TZQuery;
    qrClienteWeb: TZQuery;
    web: TZConnection;
    qrConAux: TZQuery;
    qrPlanoConta: TZQuery;
    dsPlanoConta: TDataSource;
    wdstrngfldPlanoContaCODIGO: TWideStringField;
    wdstrngfldPlanoContaCONTA: TWideStringField;
    wdstrngfldPlanoContaCLASSIFICACAO: TWideStringField;
    conn: TFDConnection;
    qrCommon: TFDQuery;
    qrFornecedores: TFDQuery;
    dsFornecedores: TDataSource;
    qrProdForn: TFDQuery;
    dsProdForn: TDataSource;
    qrProdUltCompras: TFDQuery;
    dsProdUltCompras: TDataSource;
    qrSugestao: TFDQuery;
    dsSugestao: TDataSource;
    qrSugestaoCODPRODUTO: TStringField;
    qrSugestaoESTOQUE_ATUAL: TFloatField;
    qrSugestaoQUANTCOMPRADA: TFloatField;
    qrSugestaoSUGESTAO: TFloatField;
    qrProdFornCODPRODUTO: TStringField;
    qrProdFornPRODUTO: TStringField;
    qrProdFornESTOQUE_ATUAL: TFloatField;
    qrProdFornPRECOCUSTO: TFloatField;
    qrProdFornPRECOVENDA: TFloatField;
    qrProdFornCODFORNECEDOR: TStringField;
    qrCompra: TFDQuery;
    qrCompraItem: TFDQuery;
    qrCompraCODIGO: TStringField;
    qrCompraNUMERO: TStringField;
    qrCompraDATA: TSQLTimeStampField;
    qrCompraCODFORNECEDOR: TStringField;
    dsCompra: TDataSource;
    dsCompraItem: TDataSource;
    qrOrigem: TFDQuery;
    qrDestino: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation
  uses
  IniFiles;

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  ArquivoINI: TIniFile;
  entrada, path : string;
  txt : textfile;

  begin
  // sDir_Sistema:= ExtractFilePath(ParamStr(0));
  con.Connected := False;
  conn.Connected := False;
  //path := ParamStr(0);
  path := 'C:\Apolo\SERVER\';

    begin
      ArquivoINI := TIniFile.Create(path+'Configuracao.ini');
          with conn do begin
        Close;
        with Params do begin
          Clear;
          Add('DriverID=FB');
          Add('port=3050');
          Add('Server='+ ArquivoINI.ReadString('Banco de Dados', '999-002','localhost'));
          Add('Database='+ ArquivoINI.ReadString('Banco de Dados', '999-001','C:\APOLO\bd\BASE.FDB'));
          Add('User_Name=SYSDBA');
          Add('Password=masterkey');
        end;
        Connected :=true;
        Open;

    //    ShowMessage(conn.Params.Text);
      end;

      con.HostName := ArquivoINI.ReadString('Banco de Dados', '999-002','localhost');
      con.Database := ArquivoINI.ReadString('Banco de Dados', '999-001','C:\APOLO\bd\BASE.FDB');
      con.Port:=3050;
      con.User:='SYSDBA';
      con.Password:='masterkey';
      con.Protocol:='firebirdd-2.5';
      con.Connected :=true;

      ArquivoINI.Free;
    end;

 qrFilial.Active:=true;
 qrPlanoConta.Active:=true;

 qrFornecedores.Active:=True;
 qrCommon.Active:=true;

 qrCompra.Active:=true;

// web.Connected :=true;
   end;
end.
