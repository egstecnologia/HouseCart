unit View.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Controller.Usuario, Model.Usuario, DMDados,
  View.VinculoResidencia;

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
    imgSenha: TImage;
    imgOlhoFechado: TImage;
    imgConfirmSenha: TImage;
    imgOlhoAberto: TImage;
    procedure sbtnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgSenhaClick(Sender: TObject);
    procedure imgConfirmSenhaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtCadUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtCadSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edtConfSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmailKeyPress(Sender: TObject; var Key: Char);
  private
    FController: TControllerUsuario;
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

uses
  View.CadResidencia;

{$R *.dfm}

procedure TfrmCadastro.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastro.edtCadSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCadastro.edtCadUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCadastro.edtConfSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCadastro.edtEmailKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
    sbtnEntrar.Click;
  end
  else
  if key = #9 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FController.Free;
  Action := caFree;
  frmCadastro := nil;
end;

procedure TfrmCadastro.FormCreate(Sender: TObject);
begin
  FController := TControllerUsuario.Create;
end;

procedure TfrmCadastro.imgSenhaClick(Sender: TObject);
begin
  if edtCadSenha.PasswordChar = #0 then
  begin
    imgSenha.Picture.Assign(imgOlhoAberto.Picture);
    edtCadSenha.PasswordChar := #42;
  end
  else
  begin
    imgSenha.Picture.Assign(imgOlhoFechado.Picture);
    edtCadSenha.PasswordChar := #0;
  end;
end;

procedure TfrmCadastro.imgConfirmSenhaClick(Sender: TObject);
begin
  if edtConfSenha.PasswordChar = #0 then
  begin
    imgConfirmSenha.Picture.Assign(imgOlhoAberto.Picture);
    edtConfSenha.PasswordChar := #42;
  end
  else
  begin
    imgConfirmSenha.Picture.Assign(imgOlhoFechado.Picture);
    edtConfSenha.PasswordChar := #0;
  end;
end;

procedure TfrmCadastro.sbtnEntrarClick(Sender: TObject);
var
  lUsuario: TUsuario;
begin
  lUsuario := TUsuario.Create;
  try
    lUsuario.Nome := edtCadUsuario.Text;
    lUsuario.Senha := edtCadSenha.Text;
    lUsuario.Email := edtEmail.Text;
    try
      if edtConfSenha.Text = '' then
        raise Exception.Create('Digite a confirmação da senha');
      if edtConfSenha.Text <> edtCadSenha.Text then
        raise Exception.Create
          ('As senha são diferentes, reveja a senha novamente');
      FController.Validar(lUsuario);

      if FController.ExistsEmail(lUsuario.Email) then
        raise Exception.Create('Email já existe');
      FController.CadastraUsuario(lUsuario);
      if MessageDlg('Deseja cadastrar uma nova residência?',
        TMsgDlgType.mtConfirmation, mbYesNo, 0) = mrOk then
        TfrmCadResidencia.Create(lUsuario)
      else
        TfrmVinculoResidencia.Create(lUsuario);
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
