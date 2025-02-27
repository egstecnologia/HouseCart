program HouseCart;

uses
  Vcl.Forms,
  View.CadLogin in 'View.CadLogin.pas' {frmCadLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadLogin, frmCadLogin);
  Application.Run;
end.
