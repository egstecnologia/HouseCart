program HouseCart;

uses
  Vcl.Forms,
  View.Login in 'View.Login.pas' {frmLogin},
  View.Cadastro in 'View.Cadastro.pas' {frmCadastro},
  View.CadProduto in 'View.CadProduto.pas' {frmCadastroProduto},
  Model.Usuario in '..\Model\Model.Usuario.pas',
  Controller.Usuario in '..\Controller\Controller.Usuario.pas',
  DAO.Usuario in '..\DAO\DAO.Usuario.pas',
  DMDados in '..\DMDados.pas' {DM_Dados: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
