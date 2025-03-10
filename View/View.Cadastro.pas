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
    edtConfSenha: TEdit;
    lblConfSenha: TLabel;
    shpConfSenha: TShape;
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
  lUsuario: TUsuario;
  lController : TControllerUsuario;
begin
  lUsuario := TUsuario.Create;
  lController := TControllerUsuario.Create;
  try
    if edtConfSenha.Text = '' then
      raise Exception.Create('Digite a confirmação da senha');
    if edtConfSenha.Text <> edtCadSenha.Text  then
      raise Exception.Create('As senha são diferentes, reveja a senha novamente');
    lUsuario.Nome  := edtCadUsuario.Text;
    lUsuario.Senha := edtCadSenha.Text;
    lUsuario.Email := edtEmail.Text;
    try
      lController.Validar(lUsuario);
      lController.CadastraUsuario(lUsuario);
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    lUsuario.Free;
    lController.Free;
  end;
end;

end.
