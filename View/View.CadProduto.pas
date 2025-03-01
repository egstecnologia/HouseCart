unit View.CadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmCadastroProduto = class(TForm)
    pnlConteiner: TPanel;
    pnlMenuLateral: TPanel;
    pnlCampos: TPanel;
    pnlCamposProdutos: TPanel;
    lblDescricaoProduto: TLabel;
    shpDescricaoProduto: TShape;
    edtDescricaoProduto: TEdit;
    edtUnd: TEdit;
    lblUnd: TLabel;
    shpUnd: TShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

{$R *.dfm}

end.
