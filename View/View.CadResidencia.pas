unit View.CadResidencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Model.Casa, Controller.Casa, Model.Usuario;

type
  TfrmCadResidencia = class(TForm)
    pnlContainer: TPanel;
    lblDescricao: TLabel;
    shpDescricao: TShape;
    pnlBtnSair: TPanel;
    shpBtnSair: TShape;
    btnSair: TSpeedButton;
    pnlGravar: TPanel;
    shpBtnGravar: TShape;
    btnGravar: TSpeedButton;
    edtDescricao: TEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    FCasa             : TCasa;
    FControllerCasa   : TControllerCasa;
    FUsuario          : TUsuario;
  public
    constructor Create (aUsuario : TUsuario); reintroduce;
    destructor Destroy; override;
  end;

var
  frmCadResidencia: TfrmCadResidencia;

implementation

{$R *.dfm}

procedure TfrmCadResidencia.btnGravarClick(Sender: TObject);
begin
  try
    FCasa.ShortId := FControllerCasa.GetNewId;
    FCasa.Descricao := edtDescricao.Text;
    if edtDescricao.Text = '' then
     raise Exception.Create('Informe o nome da casa');
    if FControllerCasa.ExisteCasa(FUsuario.IDUsuario, edtDescricao.Text) then
      raise Exception.Create('Não é possivel cadastrar mais de uma casa com mesmo nome');

    //PROCEDURES DE VALIDAR
    // VALIDAR SHORTID DESCRICAO E USUARIO
    FControllerCasa.Cadastrar(FCasa, FUsuario);
  except on E: Exception do
    ShowMessage(e.Message);
  end;
end;

procedure TfrmCadResidencia.btnSairClick(Sender: TObject);
begin
  Close;
end;

constructor TfrmCadResidencia.Create(aUsuario: TUsuario);
begin
  inherited Create(nil);
  FUsuario := aUsuario;
  FControllerCasa := TControllerCasa.Create;
  FCasa := TCasa.Create;
  frmCadResidencia := Self;
  frmCadResidencia.Show;
//  frmCadResidencia.ShowModal;
end;

destructor TfrmCadResidencia.Destroy;
begin
  FUsuario.Free;
  FControllerCasa.Free;
  FCasa.Free;
  inherited;
end;

end.
