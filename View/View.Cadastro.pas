unit View.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

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
    edtCadUsuarui: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

end.
