unit View.PesquisaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.ImageList, System.Generics.Collections, System.StrUtils, Math,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage,  Vcl.ImgList,
  Model.Casa, Model.Usuario, Model.Produtos,
  View.CadProduto,
  Controller.Casa, Controller.Produtos;

type
  TfrmPesquisarProduto = class(TForm)
    pnlContainer: TPanel;
    pnlPesquisa: TPanel;
    pnlLv: TPanel;
    lvProdutos: TListView;
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
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
  private
    FControllerCasa: TControllerCasa;
    FControllerProduto: TControllerProduto;
    FCasa: TCasa;
    FUsuario: TUsuario;
    FProdutos: TProduto;
  public
    constructor Create(aUsuario: TUsuario; aOwner: TObject); reintroduce;
    destructor Destroy; override;
    procedure PopulateComboCasas;
    procedure PopulateListView;
  end;

var
  frmPesquisarProduto: TfrmPesquisarProduto;

implementation

{$R *.dfm}

procedure TfrmPesquisarProduto.btnIncluirClick(Sender: TObject);
begin
  TfrmCadastroProduto.Create(Self.Parent, FUsuario);
end;

constructor TfrmPesquisarProduto.Create(aUsuario: TUsuario; aOwner: TObject);
begin
  if not Assigned(frmPesquisarProduto) then
  begin
    inherited Create(nil);
    FControllerCasa := TControllerCasa.Create;
    FControllerProduto := TControllerProduto.Create;
    FUsuario := aUsuario;
    frmPesquisarProduto := Self;
    frmPesquisarProduto.Align := alClient;
    frmPesquisarProduto.Parent := aOwner as TPanel;
    frmPesquisarProduto.BorderStyle := bsNone;
  end;
  frmPesquisarProduto.Show;
end;

destructor TfrmPesquisarProduto.Destroy;
begin
  FControllerCasa.Free;
  FControllerproduto.Free;
end;

procedure TfrmPesquisarProduto.FormShow(Sender: TObject);
begin
  PopulateComboCasas;
  PopulateListView;
end;

procedure TfrmPesquisarProduto.PopulateComboCasas;
var
  lCasa: TCasa;
  lListCasas: TList<TCasa>;
begin
  lListCasas := FControllerCasa.GetCasasVinculadas(FUsuario.IDUsuario);
  cbCasa.Clear;
  cbCasa.Items.Add('TODAS');
  try
    for lCasa in lListCasas do
    begin
      cbCasa.Items.AddObject(lCasa.Descricao, TObject(lCasa));
    end;
  finally
    lListCasas.Free;
  end;
  cbCasa.ItemIndex := 0;
end;

procedure TfrmPesquisarProduto.PopulateListView;
var
  lProduto: TProduto;
  lListProdutos: Tlist<TProduto>;
  lItem: TListItem;
  lIDCasa: Integer;
begin
  lIdCasa := 0;
  if cbCasa.ItemIndex <> 0 then
    lIdCasa := TCasa(cbCasa.Items.Objects[cbCasa.ItemIndex]).ID_CASA;
  lListProdutos := FControllerProduto.Get(lIdCasa);
  try
    lvProdutos.Items.Clear;
    for lProduto in lListProdutos do
    begin
      lItem := lvProdutos.Items.Add;
      lItem.Caption := IntToStr(lProduto.IdProduto);
      lItem.SubItems.Add(lProduto.Descricao);
      lItem.SubItems.Add(lproduto.Und);
      lItem.SubItems.Add(FloatToStr(lProduto.Qtde));
      lItem.SubItems.Add(DateToStr(lproduto.Validade));
      lItem.SubItems.Add(FloatToStr(lProduto.EstoqueMin));
      lItem.SubItems.Add(FormatFloat('R$ ##.#0,00', lProduto.ValorAtual));
      lItem.SubItems.Add(FormatFloat('R$ ##.#0,00', lProduto.ValorUltCompra));
      lItem.SubItems.Add(IntToStr(lProduto.IdCasa));
    end;
    lvProdutos.Update;
  finally
    lListProdutos.Free;
  end;
end;

end.
