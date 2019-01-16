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

  server, database:string;

begin

// sDir_Sistema:= ExtractFilePath(ParamStr(0));
con.Connected :=false;
//path := ParamStr(0);
path := 'C:\Apolo\SERVER\';
// Arquivo_ini := TIniFile.Create('C:\APOLO\Server\com.ini');
// showmenssa

  if FileExists(path+'com.ini') then
    begin
      assignfile(txt,path+'com.ini');

      reset(txt);
      while not eof(txt) do
      begin
        readln(txt,entrada);

        if copy(entrada,1,7) = '999-001' then con.Database := trim(copy(entrada,9,50));
        if copy(entrada,1,7) = '999-002' then con.HostName := trim(copy(entrada,9,50));
        end;
      end

    else

      begin
        ArquivoINI := TIniFile.Create(path+'Configuracao.ini');

        server := ArquivoINI.ReadString('Banco de Dados', '999-002','localhost');
        database := ArquivoINI.ReadString('Banco de Dados', '999-001','C:\APOLO\bd\BASE.FDB');

        ShowMessage('server: '+ server+' - base:'+database);
             ShowMessage(conn.Params.Text);

        con.HostName := server;
        con.Database := database;
        CON.Port:=3050;
        CON.User:='SYSDBA';
        CON.Password:='masterkey';
        con.Protocol:='firebirdd-2.5';

      with conn do begin
      Close;
      with Params do begin
        Clear;
        Add('port=3050');
        Add('DriverID=FB');
        Add('Server='+ server);
        Add('Database='+ database);
        Add('User_Name=SYSDBA');
        Add('Password=masterkey');
      end;
      Open;

    end;
        ArquivoINI.Free;
      end;

     ShowMessage(conn.Params.Text);
//  caminho:= 'C:\APOLO\Server\com.ini';




// con.HostName := Arquivo_ini.ReadString('999-002', '999-002', '');
// con.Database := arquivo_ini.ReadString('999-001', '999-001', '');

    with conn do begin
  Close;
  // create temporary connection definition
  with Params do begin
    Clear;
    Add('DriverID=FB');
    Add('Server='+ ArquivoINI.ReadString('Banco de Dados', '999-002','localhost'));
    Add('Database='+ ArquivoINI.ReadString('Banco de Dados', '999-001','C:\APOLO\bd\BASE.FDB'));
    Add('User_Name=sysdba');
    Add('Password=masterkey');
  end;
  Open;
end;





 con.Connected :=true;
 conn.Connected := True;
 qrFilial.Active:=true;
 qrPlanoConta.Active:=true;

 qrCommon.Active:=true;

// web.Connected :=true;




end;

end.
