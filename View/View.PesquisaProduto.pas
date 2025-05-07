unit View.PesquisaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList;

type
  TfrmPesquisarProduto = class(TForm)
    pnlContainer: TPanel;
    pnlPesquisa: TPanel;
    pnlLv: TPanel;
    ListView1: TListView;
    pnlBtns: TPanel;
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
    cbFiltro: TComboBox;
    btnEdtpesquisarProduto: TButtonedEdit;
    cbCasa: TComboBox;
    imgListProd: TImageList;
    lblFiltro: TLabel;
    lblProduto: TLabel;
    lblCasa: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisarProduto: TfrmPesquisarProduto;

implementation

{$R *.dfm}

end.
