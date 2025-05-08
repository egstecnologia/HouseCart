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
  View.Principal in 'View.Principal.pas' {frmPrincipal},
  View.Residencias in 'View.Residencias.pas' {frmResidencias},
  View.DadosPessoais in 'View.DadosPessoais.pas' {frmAlterarDadosPessoais},
  DAO.Produtos in '..\DAO\DAO.Produtos.pas',
  Model.Produtos in '..\Model\Model.Produtos.pas',
  Controller.Produtos in '..\Controller\Controller.Produtos.pas',
  View.PesquisaCasas in 'View.PesquisaCasas.pas' {frmPesquisaCasa},
  View.PesquisaProduto in 'View.PesquisaProduto.pas' {frmPesquisarProduto},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM_Dados, DM_Dados);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
