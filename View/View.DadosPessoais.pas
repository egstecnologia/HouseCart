unit View.DadosPessoais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Controller.Usuario, Model.Usuario;

type
  TfrmAlterarDadosPessoais = class(TForm)
    pnlContainer: TPanel;
    pnlInfo: TPanel;
    pnlEmail: TPanel;
    lblEmail: TLabel;
    shpEmail: TShape;
    edtEmail: TEdit;
    pnlSenha: TPanel;
    lblSenha: TLabel;
    shpSenha: TShape;
    edtSenha: TEdit;
    pnlConfSenha: TPanel;
    lblConfSenha: TLabel;
    shpConfSenha: TShape;
    edtConfSenha: TEdit;
    pnlNomeUser: TPanel;
    lblNomeUser: TLabel;
    shpNomeUser: TShape;
    edtNomeUser: TEdit;
    pnlBotoes: TPanel;
    pnlBtnGravar: TPanel;
    shpBtnGravar: TShape;
    btnGravar: TSpeedButton;
    pnlVoltar: TPanel;
    shpBtnVoltar: TShape;
    btnVoltar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
  private
    FUsuario: TUsuario;
    FController: TControllerUsuario;
  public
    constructor Create(aUsuario : TUsuario; aOwner: TObject); reintroduce;
    destructor Destroy; override;
    procedure ListarDados;
  end;

var
  frmAlterarDadosPessoais: TfrmAlterarDadosPessoais;

implementation

{$R *.dfm}

procedure TfrmAlterarDadosPessoais.btnGravarClick(Sender: TObject);
begin
  try
    FUsuario.Nome := edtNomeUser.Text;
    FUsuario.Email := edtEmail.Text;
    FUsuario.Senha := edtSenha.Text;
    FController.IsEnpty(FUsuario);
    if edtConfSenha.Text <> edtSenha.Text then
      raise Exception.Create('As senhas não coincidem, digite novamente!');
    FController.ValidarEmail(FUsuario.Email);
    if FController.ExistsEmail(FUsuario.Email, FUsuario.IDUsuario) then
      raise Exception.Create('Email já cadastrado em nossa base');
    FController.Alterar(FUsuario);
    ShowMessage('Usuario alterado com sucesso');
  except
    on E: Exception do
    ShowMessage(e.Message)
  end;
end;

procedure TfrmAlterarDadosPessoais.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

constructor TfrmAlterarDadosPessoais.Create(aUsuario : TUsuario; aOwner: TObject);
begin
  if not Assigned(frmAlterarDadosPessoais) then
  begin
    inherited Create(nil);
    FUsuario := aUsuario;
    FController := TControllerUsuario.Create;
    frmAlterarDadosPessoais := Self;
    frmAlterarDadosPessoais.Parent := aOwner as TPanel;
    frmAlterarDadosPessoais.Align := alClient;
    frmAlterarDadosPessoais.BorderStyle := bsNone;
  end;
  frmAlterarDadosPessoais.Show;
end;

destructor TfrmAlterarDadosPessoais.Destroy;
begin
  FUsuario.Free;
  FController.Free;
  inherited
end;

procedure TfrmAlterarDadosPessoais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action := caFree;
//  frmAlterarDadosPessoais := nil;
end;

procedure TfrmAlterarDadosPessoais.FormShow(Sender: TObject);
begin
  ListarDados;
end;

procedure TfrmAlterarDadosPessoais.ListarDados;
var
  lUsuario: TUsuario;
begin
  lUsuario := FController.GetUser(FUsuario.IDUsuario);
  try
    edtNomeUser.Text := lUsuario.Nome;
    edtEmail.Text := lUsuario.Email;
    edtSenha.Text := lUsuario.Senha;
    edtConfSenha.Text := lUsuario.Senha;
  finally
    lUsuario.Free;
  end;
end;

end.
