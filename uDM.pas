unit uDM;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

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
    inifiles;

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
var
//  arquivo_ini: TIniFile;
  entrada, caminho : string;
  txt : textfile;
//  sDir_Sistema: string;


begin
// sDir_Sistema:= ExtractFilePath(ParamStr(0));
con.Connected :=false;
// Arquivo_ini := TIniFile.Create('C:\APOLO\Server\com.ini');

  caminho:= 'C:\APOLO\Server\com.ini';

  assignfile(txt,caminho);

  reset(txt);
  while not eof(txt) do
  begin
    readln(txt,entrada);


 if copy(entrada,1,7) = '999-001' then con.Database := trim(copy(entrada,9,50));
 if copy(entrada,1,7) = '999-002' then con.HostName := trim(copy(entrada,9,50));
    end;



// con.HostName := Arquivo_ini.ReadString('999-002', '999-002', '');
// con.Database := arquivo_ini.ReadString('999-001', '999-001', '');



 con.Connected :=true;
 qrFilial.Active:=true;
 qrPlanoConta.Active:=true;

// web.Connected :=true;




end;

end.
