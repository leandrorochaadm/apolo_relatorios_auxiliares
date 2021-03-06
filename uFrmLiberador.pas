unit uFrmLiberador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, {RzEdit,} StdCtrls;

type
  TfrmLiberador = class(TForm)
    DBEditRazao: TEdit;
    DBEditCNPJ: TEdit;
    EditNumControle: TEdit;
    btnGerarReset: TButton;
    EditReset: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Data: TLabel;
    Label3: TLabel;
    Label4: TLabel;

    function Modulo10(S: String): Word;
    procedure btnGerarResetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLiberador: TfrmLiberador;

implementation

uses uDM;

{$R *.dfm}

{ TfrmLiberador }

procedure TfrmLiberador.btnGerarResetClick(Sender: TObject);
var i,m : integer;
str,data,datan,datan1,senha1,senha2,senha3:string;
begin

  if DBEditCNPJ.Text='' then
    begin
       ShowMessage('Verifique a conex�o com o seu Servidor');
       Exit;
    end;

  if EditNumControle.Text='' then
    begin
       ShowMessage('INFORMAR O COMPLEMENTO!');
       Exit;
    end;

  data:= FormatDateTime('ddmmyyyy',now+strtoint(EditNumControle.Text));

  datan:='';
  datan1:='';

  for i:=1 to length(data) do
   begin
      datan:=datan+inttostr(Modulo10(inttostr(ord(data[i])))) ;
   end;

  for i:=1 to length(dataN) do
   begin
      datan1:=datan1+inttostr(Modulo10(inttostr(ord(dataN[i])))) ;
   end;

  str:=datan+DBEditCNPJ.Text+datan1+DBEditRazao.Text;
  senha1:='';

  for i:=1 to length(str) do
   begin
      senha1:=senha1+inttostr(Modulo10(inttostr(ord(str[i])))) ;
   end;

  m:=1;
  str:=senha1;

  for i:=1 to length(str) do
   begin
      inc(m);
      senha2:=senha2+inttostr(strtoint(str[i])*m);
      if m=3 then
         m:=1;
   end;

  senha3:=  copy(senha2,1,1)+
            copy(senha2,length(senha2),1)+'.'+
            copy(senha2,2,1)+
            copy(senha2,length(senha2)-1,1)+'.'+
            copy(senha2,3,1)+
            copy(senha2,length(senha2)-2,1)+'.'+
            copy(senha2,4,1)+
            copy(senha2,length(senha2)-3,1);

  EditReset.Text:=senha3;

 { try
    //Gravar dados da liberacao no banco de dados
    with DM_GLOBAL.qaux, SQL do
    begin
      Close;
      Clear;
      Add('insert into reset (ID_CLIENTE, CNPJ, RAZAO, RESET, DATA, ANO, MES, USUARIO, COMPLEMENTO, TIPO) values ');
      Add('(:ID_CLIENTE, :CNPJ, :RAZAO, :RESET, :DATA, :ANO, :MES, :USUARIO, :COMPLEMENTO, :TIPO)');

      ParamByName('ID_CLIENTE').Value := DM_GLOBAL.QClientecod.AsInteger;
      ParamByName('CNPJ').Value := DM_GLOBAL.QClienteCpf_Cnpj.AsString;
      ParamByName('RAZAO').Value := DM_GLOBAL.QClienteRazao.AsString;
      ParamByName('RESET').Value := senha3;
      ParamByName('DATA').Value := Now;
      ParamByName('ANO').Value := FormatDateTime('yyyy', date);
      ParamByName('MES').Value := FormatDateTime('mm', date);
      ParamByName('USUARIO').Value := '000001';
      ParamByName('COMPLEMENTO').Value := fMain.zerarcodigo(EditNumControle.Text, 3);
      ParamByName('TIPO').Value := 'OFF';

      ExecSQL;
    end;
  finally
    begin
      ShowMessage('N�mero de S�rie gerado com sucesso!');
    end;
  end;  }

     with dm.qrClienteWeb, SQL do
  begin
    close;
    clear;
    Add('INSERT INTO liberacao (cnpj,complemento,serie, razao) values ');
    Add('(:cnpj, :complemento, :serie, :razao)');

    ParamByName('razao').Value := DBEditRazao.Text;
    ParamByName('cnpj').Value := DBEditCNPJ.Text;
    ParamByName('complemento').Value := EditNumControle.Text;
    ParamByName('serie').Value := senha3;

    ExecSQL;
  end;

  EditNumControle.CopyToClipboard;

  ShowMessage('Numero de S�rie foi gerada com sucesso!'+
  #13+#13+
  'Caso o n�mero seja inv�lido,'#13+
  'reinicie o sistema Apolo,'+#13+
  'pra que ele informe um novo complemento');
end;

procedure TfrmLiberador.FormShow(Sender: TObject);
begin
//dm.qrFilial.Close;
DBEditCNPJ.Text  :=      dm.qrFilial.FieldByName('CNPJ').AsString ;
DBEditRazao.Text :=  dm.qrFilial.FieldByName('FILIAL').AsString ;
  now ;
//ShowMessage(dm.qrFilial.FieldByName('FILIAL').AsString) ;
end;

function TfrmLiberador.Modulo10(S: String): Word;
var
Indice: ShortInt;
Peso: ShortInt;
Soma: Integer;
Total: ShortInt;
DV: ShortInt;
begin
Soma := 0;
Peso := 2;
for Indice := Length(S) downto 1 do
    begin
    Total := StrToInt(Copy(S, Indice, 1)) * Peso;
    if Total > 9 then
       begin
       Soma := Soma + 1 + (Total - 10);
       end
    else
       begin
       Soma := Soma + Total;
       end;
    if Peso = 1 then
       begin
       Peso := 2
       end
    else
       begin
       Peso := 1;
       end;
    end;
DV := 10 - Soma Mod 10;
if DV = 10 then
   begin
   DV := 0;
   end;
Result := DV;
end;



end.
