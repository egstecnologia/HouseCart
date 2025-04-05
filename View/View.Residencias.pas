unit View.Residencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Generics.Collections, System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls,
  Model.Casa, Model.Usuario, Controller.Casa, Controller.Usuario, DAO.Casa;

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
    pnlVoltar: TPanel;
    shpBtnVoltar: TShape;
    btnVoltar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDesvincularClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FController: TControllerCasa;
    FUsuario: TUsuario;
    procedure PopulateLvCasas;
    function GetSelectedItem: TListItem;
  public
    constructor Create(aUsuario: TUsuario; aOwner: TObject); reintroduce;
    destructor Destroy; override;
  end;

var
  frmResidencias: TfrmResidencias;

implementation

uses
  View.VinculoResidencia, View.CadResidencia;


{$R *.dfm}

{ TForm2 }

procedure TfrmResidencias.btnAlterarClick(Sender: TObject);
var
  lDescricao: String;
  lItem: TListItem;
begin
  lItem := GetSelectedItem;
  try
    if MessageDlg('Deseja realmente alterar a descrição?',
      TMsgDlgType.mtConfirmation, mbYesNo, 0) = mrYes
    then
    begin
      lDescricao:= InputBox('Descrição', 'Digite aqui a descrição desejada',
        'Descrição');

      if lDescricao = '' then
        raise Exception.Create('Digite a descrição');

      FController.Alterar(StrToInt(lItem.Caption), lDescricao);
      PopulateLvCasas;
    end;
  except
    on E: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
end;

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
      begin
        TfrmCadResidencia.Create(FUsuario);
        frmCadResidencia.Parent  := pnlContainer;
        frmCadResidencia.Align := alClient;
        frmCadResidencia.BorderStyle := bsNone;
//        frmCadResidencia.pnlContainer.Align := alClient;
      end
    else
      begin
        TfrmVinculoResidencia.Create(FUsuario);
        frmVinculoResidencia.Parent  := pnlContainer;
        frmVinculoResidencia.Align := alClient;
        frmVinculoResidencia.BorderStyle := bsNone;
//        frmVinculoResidencia.pnlContainer.Align := alClient;
      end;
  except
    on E: Exception do
      ShowMessage(e.Message);
  end;
end;

procedure TfrmResidencias.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

constructor TfrmResidencias.Create(aUsuario: TUsuario; aOwner: TObject);
begin
  if not Assigned(frmResidencias) then
  begin
    inherited Create(nil);
    FUsuario := aUsuario;
    FController := TControllerCasa.Create;
    frmResidencias := Self;
    frmResidencias.Parent  := aOwner as TPanel;
    frmResidencias.Align := alClient;
    frmResidencias.BorderStyle := bsNone;
  end;
  frmResidencias.Show;
//frmResidencias.ShowModal;
end;

destructor TfrmResidencias.Destroy;
begin
  FUsuario.Free;
  FController.Free;
  inherited;
end;

procedure TfrmResidencias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  frmResidencias := nil;
//  Action := caFree;
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
