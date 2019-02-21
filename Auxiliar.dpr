program Auxiliar;

uses
  Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uDM in 'uDM.pas' {dm: TDataModule},
  uDmRel in 'uDmRel.pas' {dmRel: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  uRelatorio in 'uRelatorio.pas',
  uFrmPedidoCompra in 'uFrmPedidoCompra.pas' {frmPedidoCompra},
  uFrmCompra in 'uFrmCompra.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Lavender Classico');
  Application.Title := 'Auxiliar Apolo';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TdmRel, dmRel);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
