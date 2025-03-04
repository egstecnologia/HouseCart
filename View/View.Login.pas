unit View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

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
    edtUsuario: TEdit;
    edtSenha: TEdit;
    lblTextoCadastro: TLabel;
    lblClickAqui: TLabel;
    procedure lblClickAquiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation
uses
  View.Cadastro;

{$R *.dfm}

procedure TfrmLogin.lblClickAquiClick(Sender: TObject);
begin
  frmCadastro := TfrmCadastro.Create(nil);
  try
    frmCadastro.ShowModal;
  finally
    FreeAndNil(frmCadastro);
  end;
end;

end.
