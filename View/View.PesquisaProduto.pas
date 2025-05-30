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
    edtpesquisarProduto: TButtonedEdit;
    cbCasa: TComboBox;
    imgListProd: TImageList;
    lblFiltro: TLabel;
    lblProduto: TLabel;
    lblCasa: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure edtpesquisarProdutoRightButtonClick(Sender: TObject);
    procedure edtpesquisarProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure cbFiltroChange(Sender: TObject);
  private
    FControllerCasa: TControllerCasa;
    FControllerProduto: TControllerProduto;
    FUsuario: TUsuario;
  public
    constructor Create(aUsuario: TUsuario; aOwner: TObject); reintroduce;
    destructor Destroy; override;
    procedure PopulateComboCasas;
    procedure PopulateListView(const AListProdutos: TList<TProduto>);
  end;

var
  frmPesquisarProduto: TfrmPesquisarProduto;

implementation

{$R *.dfm}


procedure TfrmPesquisarProduto.edtpesquisarProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    edtpesquisarProdutoRightButtonClick(Self);
end;

procedure TfrmPesquisarProduto.edtpesquisarProdutoRightButtonClick(
  Sender: TObject);
var
  lIdCasa: Integer;
  lListProdutos: TList<TProduto>;
begin
  lListProdutos := TList<TProduto>.Create;
  try
    try
      lIdCasa := 0;
      if edtpesquisarProduto.Text = '' then
        raise Exception.Create('Preencha o campo de pesquisa');
      if cbCasa.ItemIndex <> 0 then
        lIdCasa := TCasa(cbCasa.Items.Objects[cbCasa.ItemIndex]).ID_CASA;

      lListProdutos := FControllerProduto.GetList(lIdCasa, cbFiltro.ItemIndex + 1,
        edtpesquisarProduto.text);
      PopulateListView(lListProdutos);
    except
      on E: Exception do
      begin
        ShowMessage(e.Message);
      end;
    end;
  finally
    lListprodutos.Free;
  end;
end;

procedure TfrmPesquisarProduto.btnAlterarClick(Sender: TObject);
var
  lProduto: TProduto;
begin
  lProduto := TProduto.Create;
  if Assigned(lvProdutos.Selected) then
  begin
    lProduto := FControllerProduto.Get(StrToInt(lvProdutos.Selected.Caption));
    TfrmCadastroProduto.Create(Self.Parent, FUsuario, lProduto);
  end;
end;

procedure TfrmPesquisarProduto.btnIncluirClick(Sender: TObject);
begin
  TfrmCadastroProduto.Create(Self.Parent, FUsuario);
end;

procedure TfrmPesquisarProduto.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesquisarProduto.cbFiltroChange(Sender: TObject);
begin
  edtpesquisarProduto.NumbersOnly := cbFiltro.ItemIndex = 0;
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
var
  lListProduto: TList<TProduto>;
begin
  try
    lListProduto := FControllerProduto.GetList;
    PopulateComboCasas;
    PopulateListView(lListProduto);
  finally
    lListProduto.Free;
  end;
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

procedure TfrmPesquisarProduto.PopulateListView(const AListProdutos: TList<TProduto>);
var
  lProduto: TProduto;
  lItem: TListItem;
begin
  lvProdutos.Items.Clear;
  for lProduto in AListProdutos do
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
end;

end.
