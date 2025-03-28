unit View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Controller.Usuario,
  Model.Usuario, System.StrUtils, View.PerguntaResidencia, View.CadResidencia,
  View.VinculoResidencia;

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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure lblClickAquiClick(Sender: TObject);
    procedure imgSenhaClick(Sender: TObject);
    procedure sbtnEntrarClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
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

procedure TfrmLogin.Label2Click(Sender: TObject);
begin
  frmPerguntaResidencia := TfrmPerguntaResidencia.Create(nil);
  try
    frmPerguntaResidencia.ShowModal;
  finally
    FreeAndNil(frmPerguntaResidencia);
  end;
end;

procedure TfrmLogin.Label3Click(Sender: TObject);
begin
  frmCadResidencia := TfrmCadResidencia.Create(nil);
  try
    frmCadResidencia.ShowModal;
  finally
    FreeAndNil(frmCadResidencia);
  end;
end;

procedure TfrmLogin.Label4Click(Sender: TObject);
begin
  frmVinculoResidencia := TfrmVinculoResidencia.Create(nil);
  try
    frmVinculoResidencia.ShowModal;
  finally
    FreeAndNil(frmVinculoResidencia);
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
     if not (FController.ExistsEmail(lUsuario.Email)) then
      raise Exception.Create('Usuario não foi cadastrado');
     if not (FController.CheckSenha(lUsuario.Email, lUsuario.Senha))  then
      raise Exception.Create('Senha invalida');
      lUsuario.IDUsuario := FController.GetID(lUsuario.Email);
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
