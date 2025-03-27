unit View.DesvincularResidencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Generics.Collections, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls,
  Model.Casa, Controller.Casa;

type
  TForm2 = class(TForm)
    pnlContainer: TPanel;
    lvResidencias: TListView;
    pnlLvResisdencias: TPanel;
    pnlBotoes: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FController: TControllerCasa;
    procedure PopulateLvCasas;
  public
    constructor Create(aIdusuario:
  end;

var
  Form2: TForm2;

implementation


{$R *.dfm}

{ TForm2 }

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin

end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.PopulateLvCasas;
var
  ListCasas: TList<TCasa>;
begin
  try

  except on E: Exception do
  end;
end;

end.
