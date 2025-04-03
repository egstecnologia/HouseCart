unit View.DadosPessoais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Controller.Usuario, Model.Usuario;

type
  TfrmAlterarDadosPessoais = class(TForm)
    pnlContainer: TPanel;
    pnlLateral: TPanel;
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
  private
    FUsuario: TUsuario;
    FController: TControllerUsuario;
  public
    constructor Create(aUsuario : TUsuario); reintroduce;
    destructor Destroy; override;
    procedure ListarDados;
  end;

var
  frmAlterarDadosPessoais: TfrmAlterarDadosPessoais;

implementation

{$R *.dfm}

constructor TfrmAlterarDadosPessoais.Create(aUsuario : TUsuario);
begin
  inherited Create(nil);
  FUsuario := aUsuario;
  FController := TControllerUsuario.Create;
  frmAlterarDadosPessoais := Self;
  frmAlterarDadosPessoais.Show;
end;

destructor TfrmAlterarDadosPessoais.Destroy;
begin
  FUsuario.Free;
  FController.Free;
  inherited
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
    edtSenha.Text := lUsuario.Senha;
  finally
    lUsuario.Free;
  end;
end;

end.
