program atualizar_Auxiliar;

uses
  Forms,
  atualizar_uFrmPrincipal in 'atualizar_uFrmPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
