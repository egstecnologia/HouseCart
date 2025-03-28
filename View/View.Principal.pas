unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  View.DesvincularResidencia, Model.Usuario;

type
  TfrmPrincipal = class(TForm)
    pnlContainer: TPanel;
    pnlGroupMenu: TPanel;
    pnlForm: TPanel;
    pnlBtnCasas: TPanel;
    shpBtnCasa: TShape;
    pnlInfoUser: TPanel;
    btnCasas: TSpeedButton;
    procedure btnCasasClick(Sender: TObject);
  private
    FUsuario: TUsuario;
  public
    constructor Create(aUsuario: TUsuario); reintroduce;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCasasClick(Sender: TObject);
begin
  TfrmDesvincularCasas.Create(FUsuario);
end;

constructor TfrmPrincipal.Create(aUsuario: TUsuario);
begin
  FUsuario := aUsuario;
end;

end.
