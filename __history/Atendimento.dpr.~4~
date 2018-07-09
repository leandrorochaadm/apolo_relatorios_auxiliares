program Atendimento;

uses
  Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uDM in 'uDM.pas' {dm: TDataModule},
  uFrmLiberador in 'uFrmLiberador.pas' {frmLiberador},
  uDmRel in 'uDmRel.pas' {dmRel: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TdmRel, dmRel);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
