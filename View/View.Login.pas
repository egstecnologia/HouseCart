unit View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Controller.Usuario,
  Model.Usuario, System.StrUtils;

type
  TfrmLogin = class(TForm)
    pnlContainerLogin: TPanel;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pnlClient: TPanel;
    pnlImg: TPanel;
    pnlLoginSenha: TPanel;
    lblLogin: TLabel;
    lblSenha: TLabel;
    lblUsuario: TLabel;
    shpSenha: TShape;
    shpUsuario: TShape;
    sbtnEntrar: TSpeedButton;
    shpEntrar: TShape;
    pnlBtnEntrar: TPanel;
    pnlSair: TPanel;
    shpSair: TShape;
    btnSair: TSpeedButton;
    pnlUserSenha: TPanel;
    imgLogin: TImage;
    edtLogin: TEdit;
    edtSenha: TEdit;
    lblTextoCadastro: TLabel;
    lblClickAqui: TLabel;
    imgSenha: TImage;
    imgOlhoFechado: TImage;
    imgOlhoAberto: TImage;
    procedure lblClickAquiClick(Sender: TObject);
    procedure imgSenhaClick(Sender: TObject);
    procedure sbtnEntrarClick(Sender: TObject);
  private
    FController : TControllerUsuario;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation
uses
  View.Cadastro;

{$R *.dfm}

procedure TfrmLogin.imgSenhaClick(Sender: TObject);
begin
if edtSenha.PasswordChar = #0 then
  begin
    imgSenha.Picture.Assign(imgOlhoAberto.Picture);
    edtSenha.PasswordChar := #42;
  end
  else
  begin
    imgSenha.Picture.Assign(imgOlhoFechado.Picture);
    edtSenha.PasswordChar := #0;
  end;

end;

procedure TfrmLogin.lblClickAquiClick(Sender: TObject);
begin
  frmCadastro := TfrmCadastro.Create(nil);
  try
    frmCadastro.ShowModal;
  finally
    FreeAndNil(frmCadastro);
  end;
end;

procedure TfrmLogin.sbtnEntrarClick(Sender: TObject);
var
  lUsuario: TUsuario;
begin

  lUsuario := TUsuario.Create;
  try
    lUsuario.Email := edtLogin.Text;
    lUsuario.Senha := edtSenha.Text;
    try
     if not ContainsText(edtLogin.Text, '@') then
        raise Exception.Create('Formato de email invalido');
      FController.CadastraUsuario(lUsuario);
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    lUsuario.Free;

  end;
end;

end.
