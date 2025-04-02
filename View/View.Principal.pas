unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  View.Residencias, Model.Usuario;

type
  TfrmPrincipal = class(TForm)
    pnlContainer: TPanel;
    pnlGroupMenu: TPanel;
    pnlForm: TPanel;
    pnlBtnCasas: TPanel;
    shpBtnCasa: TShape;
    pnlInfoUser: TPanel;
    btnCasas: TSpeedButton;
    pnlBtnDadosPessoais: TPanel;
    shpBtnDadosPessoais: TShape;
    btnDadosPessoais: TSpeedButton;
    procedure btnCasasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FUsuario: TUsuario;
  public
    constructor Create(aUsuario: TUsuario); reintroduce;
    destructor Destroy; override;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCasasClick(Sender: TObject);
begin
  TfrmResidencias.Create(FUsuario);
  frmResidencias.Parent  := pnlForm;
  frmResidencias.Align := alClient;
  frmResidencias.BorderStyle := bsNone;
end;

constructor TfrmPrincipal.Create(aUsuario: TUsuario);
begin
  inherited Create(nil);
  FUsuario := aUsuario;
  frmPrincipal := Self;
  frmPrincipal.ShowModal;
end;

destructor TfrmPrincipal.Destroy;
begin
  FUsuario.Free;
  inherited;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree;
//  frmPrincipal := nil;
end;

end.
