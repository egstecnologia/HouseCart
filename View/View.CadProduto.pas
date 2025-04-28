unit View.CadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Model.Produtos, Controller.Produtos;

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
    edtUltValorCompra: TEdit;
    lblUltValorCompra: TLabel;
    shpUltValorCompra: TShape;
    lblValorAtual: TLabel;
    shpValorAtual: TShape;
    edtValorAtual: TEdit;
    edtQtde: TEdit;
    lblQtde: TLabel;
    shpQtde: TShape;
    edtValidade: TEdit;
    lblValidade: TLabel;
    shpValidade: TShape;
    edtEstMinimo: TEdit;
    lblEstMinimo: TLabel;
    shpEstMinimo: TShape;
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
    procedure btnIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

{$R *.dfm}

procedure TfrmCadastroProduto.btnIncluirClick(Sender: TObject);
begin
  try
    edtDescricaoProduto
  except
    on E: Exception do
  end;
end;

end.
