unit View.PesquisaCasas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Generics.Collections, System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls,
  Model.Casa, Model.Usuario,
  Controller.Casa;

type
  TfrmPesquisaCasa = class(TForm)
    pnlContainer: TPanel;
    pnlLvCasas: TPanel;
    lvCasas: TListView;
    pnlBotoes: TPanel;
    pnlBtnSelecionar: TPanel;
    shpBtnDesvincular: TShape;
    btnBtnSelecionar: TSpeedButton;
    pnlVoltar: TPanel;
    shpBtnVoltar: TShape;
    btnVoltar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnBtnSelecionarClick(Sender: TObject);
  private
   FController: TControllerCasa;
   FUsuario: TUsuario;
   FSelectedCasa: TCasa;
   procedure PopulateLvCasas;
  public
    constructor Create(const aUsuario: TUsuario; aCasa: TCasa); reintroduce;
    destructor Destroy; override;
  end;

var
  frmPesquisaCasa: TfrmPesquisaCasa;

implementation

{$R *.dfm}

{ TForm1 }

constructor TfrmPesquisaCasa.Create(const aUsuario: TUsuario; aCasa: TCasa);
begin
  if not Assigned(frmPesquisaCasa) then
  begin
    inherited Create(nil);
    FUsuario := aUsuario;
    FController := TControllerCasa.Create;
    frmPesquisaCasa := Self;
    FSelectedCasa := aCasa;
  end;

  frmPesquisaCasa.ShowModal;
end;

procedure TfrmPesquisaCasa.btnBtnSelecionarClick(Sender: TObject);
begin
  if lvCasas.Selected.Caption = '' then
  begin
    ShowMessage('Nenhuma casa selecionada');
    Exit;
  end;
  FSelectedCasa.ID_CASA := StrToInt(lvCasas.Selected.Caption);
  Close;
end;

procedure TfrmPesquisaCasa.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

destructor TfrmPesquisaCasa.Destroy;
begin
  FUsuario.Free;
  FController.Free;
  inherited;
end;

procedure TfrmPesquisaCasa.FormShow(Sender: TObject);
begin
  PopulateLvCasas;
end;

procedure TfrmPesquisaCasa.PopulateLvCasas;
var
  lListCasas: TList<TCasa>;
  lItem: TListItem;
  lCasas: TCasa;
begin
  try
    try
      lvCasas.Items.Clear;
      lListCasas := FController.GetCasasVinculadas(FUsuario.IDUsuario);
      for lCasas in lListCasas.List do
      begin
        lItem := lvCasas.Items.Add;
        lItem.Caption := IntToStr(lCasas.ID_CASA);
        lItem.SubItems.Add(lCasas.Descricao);
        lItem.SubItems.Add(lCasas.ShortId);
      end;
      lvCasas.Update;
      if lListCasas.Count < 1 then
      begin
        ShowMessage('Você nao possui nenhuma casa cadastrada');
        Close;
      end;
    except on E: Exception do
      raise Exception.Create(e.Message);
    end;
  finally
    lListCasas.Free;
    lCasas.Free;
  end;

end;

end.
