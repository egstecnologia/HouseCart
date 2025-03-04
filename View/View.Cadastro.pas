unit View.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Controller.Usuario, Model.Usuario;

type
  TfrmCadastro = class(TForm)
    pnlContainerLogin: TPanel;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pnlClient: TPanel;
    pnlImg: TPanel;
    imgCadastro: TImage;
    pnlCadastro: TPanel;
    pnlCadUsuario: TPanel;
    lblCasdastreSe: TLabel;
    lblSenha: TLabel;
    lblUsuario: TLabel;
    shpSenha: TShape;
    shpUsuario: TShape;
    pnlBtnEntrar: TPanel;
    shpEntrar: TShape;
    sbtnEntrar: TSpeedButton;
    pnlSair: TPanel;
    shpSair: TShape;
    btnSair: TSpeedButton;
    lblEmail: TLabel;
    shpEmail: TShape;
    edtEmail: TEdit;
    edtCadSenha: TEdit;
    edtCadUsuario: TEdit;
    procedure sbtnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

procedure TfrmCadastro.sbtnEntrarClick(Sender: TObject);
var
  Usuario: TUsuario;
  Controller : TControllerUsuario;
  MyClass: TComponent;
begin
  Usuario := TUsuario.Create;
  Controller := TControllerUsuario.Create;
  try
    Usuario.Nome  := edtCadUsuario.Text;
    Usuario.Senha := edtCadSenha.Text;
    Usuario.Email := edtEmail.Text;

    if Controller.CadastraUsuario(Usuario) then
      ShowMessage('Usuario cadastrado com sucesso!')
    else
      ShowMessage('Erro, tente novamente')
  finally
    Usuario.Free;
    Controller.Free;
  end;
end;

end.
