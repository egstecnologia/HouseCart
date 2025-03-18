unit View.PerguntaResidencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmPerguntaResidencia = class(TForm)
    pnlContainer: TPanel;
    lblPergunta: TLabel;
    pnlBtnSim: TPanel;
    shpBtnSim: TShape;
    btnSim: TSpeedButton;
    pnlBtnNao: TPanel;
    shpBtnNao: TShape;
    btnNao: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPerguntaResidencia: TfrmPerguntaResidencia;

implementation

{$R *.dfm}

end.
