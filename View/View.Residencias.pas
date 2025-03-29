unit View.Residencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Generics.Collections, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls,
  Model.Casa, Model.Usuario, Controller.Casa, Controller.Usuario;

type
  TfrmResidencias = class(TForm)
    pnlContainer: TPanel;
    lvResidencias: TListView;
    pnlLvResisdencias: TPanel;
    pnlBotoes: TPanel;
    pnlBtnAlterar: TPanel;
    shpBtnAlterar: TShape;
    btnAlterar: TSpeedButton;
    pnlBtnDesvincular: TPanel;
    shpBtnDesvincular: TShape;
    btnDesvincular: TSpeedButton;
    pnlInluir: TPanel;
    shpBtnIncluir: TShape;
    btnIncluir: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDesvincularClick(Sender: TObject);
  private
    FController: TControllerCasa;
    FUsuario: TUsuario;
    procedure PopulateLvCasas;
    function GetSelectedItem: TListItem;
  public
    constructor Create(aUsuario: TUsuario); reintroduce;
    destructor Destroy; override;
  end;

var
  frmResidencias: TfrmResidencias;

implementation

uses
  View.VinculoResidencia, View.CadResidencia;


{$R *.dfm}

{ TForm2 }

procedure TfrmResidencias.btnDesvincularClick(Sender: TObject);
begin
  try
    FController.Desvincular(FUsuario.IDUsuario,
      StrToInt(GetSelectedItem.Caption)
    );
    PopulateLvCasas;
    ShowMessage('Casa desvinculada com sucesso');
  except
    on E: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmResidencias.btnIncluirClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja cadastrar uma nova residência?', TMsgDlgType.mtConfirmation,
      mbYesNo, 0) = mrOk then
      TfrmCadResidencia.Create(FUsuario)
    else
      TfrmVinculoResidencia.Create(FUsuario);
  except
    on E: Exception do
      ShowMessage(e.Message);
  end;
end;

constructor TfrmResidencias.Create(aUsuario: TUsuario);
begin
  inherited Create(nil);
  FUsuario := aUsuario;
  FController := TControllerCasa.Create;
  frmResidencias := Self;
  frmResidencias.ShowModal;
end;

destructor TfrmResidencias.Destroy;
begin
  FUsuario.Free;
  FController.Free;
  inherited;
end;

procedure TfrmResidencias.FormShow(Sender: TObject);
begin
  PopulateLvCasas;
end;

procedure TfrmResidencias.PopulateLvCasas;
var
  ListCasas: TList<TCasa>;
  lItem: TListItem;
  lCasa: TCasa;
begin
  try
    try
      lvResidencias.Items.Clear;
      Listcasas := FController.GetCasasVinculadas(FUsuario.IDUsuario);
      for lCasa in ListCasas.List do
      begin
        lItem := lvResidencias.Items.Add;
        lItem.Caption  := IntToStr(lCasa.ID_CASA);
        lItem.SubItems.Add(lCasa.Descricao);
        lItem.SubItems.Add(lCasa.ShortId);
      end;
      lvResidencias.Update;
    except on E: Exception do
      raise Exception.Create(e.Message);
    end;
  finally
    ListCasas.Free;
    lCasa.Free;
  end;
end;
function TfrmResidencias.GetSelectedItem: TListItem;
begin
  Result := lvResidencias.Selected;
  if NOT Assigned(Result) then
    raise Exception.Create('Nenhuma casa foi selecionada');
end;

end.
