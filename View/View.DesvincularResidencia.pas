unit View.DesvincularResidencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Generics.Collections, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls,
  Model.Casa, Controller.Casa, Model.Usuario;

type
  TfrmDesvincularCasas = class(TForm)
    pnlContainer: TPanel;
    lvResidencias: TListView;
    pnlLvResisdencias: TPanel;
    pnlBotoes: TPanel;
  private
    FController: TControllerCasa;
    FUsuario: TUsuario;
    procedure PopulateLvCasas;
  public
    constructor Create(aUsuario: TUsuario); reintroduce;
    destructor Destroy; override;
  end;

var
  frmDesvincularCasas: TfrmDesvincularCasas;

implementation


{$R *.dfm}

{ TForm2 }

constructor TfrmDesvincularCasas.Create(aUsuario: TUsuario);
begin
  inherited Create(nil);
  FUsuario := aUsuario;
  FController := TControllerCasa.Create;
  frmDesvincularCasas := Self;
  frmDesvincularCasas.ShowModal;
end;

destructor TfrmDesvincularCasas.Destroy;
begin
  FUsuario.Free;
  FController.Free;
  inherited;
end;

procedure TfrmDesvincularCasas.PopulateLvCasas;
var
  ListCasas: TList<TCasa>;
  lItem: TListItem;
  lCasa: TCasa;
begin
  try
    try
      Listcasas := FController.GetCasasVinculadas(FUsuario.IDUsuario);
      for lCasa in ListCasas do
      begin
        lItem := lvResidencias.Items.Add;
        lItem.Caption  := IntToStr(lCasa.ID_CASA);
        lItem.SubItems[0] := lCasa.Descricao;
        lItem.SubItems[1] := lCasa.ShortId;
      end;
    except on E: Exception do
      raise Exception.Create(e.Message);
    end;
  finally
    ListCasas.Free;
    lCasa.Free;
  end;
end;

end.
