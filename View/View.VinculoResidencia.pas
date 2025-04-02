unit View.VinculoResidencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Controller.Casa, Model.Usuario;

type
  TfrmVinculoResidencia = class(TForm)
    pnlContainer: TPanel;
    lblVinculoResidencia: TLabel;
    shpDescricao: TShape;
    pnlBtnSair: TPanel;
    shpBtnSair: TShape;
    btnSair: TSpeedButton;
    pnlBtnGravar: TPanel;
    shpBtnGravar: TShape;
    btnGravar: TSpeedButton;
    edtShortId: TEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    FControllerCasa : TControllerCasa;
    FUsuario : TUsuario;
  public
    constructor Create(aUsuario: TUsuario); reintroduce;
    destructor Destroy; override;
  end;

var
  frmVinculoResidencia: TfrmVinculoResidencia;

implementation

{$R *.dfm}

procedure TfrmVinculoResidencia.btnGravarClick(Sender: TObject);
begin
  try
    if edtShortId.Text = '' then
      raise Exception.Create('Digite o ID da casa');
    FControllerCasa.Vincular(FUsuario.IDUsuario, edtShortId.Text);
  except on E: Exception do
    ShowMessage(e.Message);
  end;
end;

procedure TfrmVinculoResidencia.btnSairClick(Sender: TObject);
begin
  Close;
end;

constructor TfrmVinculoResidencia.Create(aUsuario: TUsuario);
begin
  inherited Create(nil);
  FUsuario := aUsuario;
  FControllerCasa := TControllerCasa.Create;
  frmVinculoResidencia := Self;
  frmVinculoResidencia.Show;
end;

destructor TfrmVinculoResidencia.Destroy;
begin
  FUsuario.Free;
  FControllerCasa.Free;
  inherited
end;

end.
