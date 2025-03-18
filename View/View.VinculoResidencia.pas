unit View.VinculoResidencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

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
    edtVinculoResidencia: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVinculoResidencia: TfrmVinculoResidencia;

implementation

{$R *.dfm}

end.
