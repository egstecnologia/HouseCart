program HouseCart;

uses
  Vcl.Forms,
  View.Login in 'View.Login.pas' {frmLogin},
  View.Cadastro in 'View.Cadastro.pas' {frmCadastro},
  View.CadProduto in 'View.CadProduto.pas' {frmCadastroProduto},
  Model.Usuario in '..\Model\Model.Usuario.pas',
  Controller.Usuario in '..\Controller\Controller.Usuario.pas',
  DAO.Usuario in '..\DAO\DAO.Usuario.pas',
  DMDados in '..\DMDados.pas' {DM_Dados: TDataModule},
  View.CadResidencia in 'View.CadResidencia.pas' {frmCadResidencia},
  View.VinculoResidencia in 'View.VinculoResidencia.pas' {frmVinculoResidencia},
  Model.Casa in '..\Model\Model.Casa.pas',
  Controller.Casa in '..\Controller\Controller.Casa.pas',
  DAO.Casa in '..\DAO\DAO.Casa.pas',
  View.Principal in 'View.Principal.pas' {Form1},
  View.DesvincularResidencia in 'View.DesvincularResidencia.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM_Dados, DM_Dados);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmCadResidencia, frmCadResidencia);
  Application.CreateForm(TfrmVinculoResidencia, frmVinculoResidencia);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
