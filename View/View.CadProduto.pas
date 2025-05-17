unit View.CadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.ImageList, Vcl.ImgList, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Model.Produtos,
  Controller.Produtos,
  View.PesquisaCasas, Model.Usuario;

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
    lblValidade: TLabel;
    edtEstMinimo: TEdit;
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
    lblEstMinimo: TLabel;
    Label3: TLabel;
    btnEdtCasa: TButtonedEdit;
    dtValidade: TDateTimePicker;
    imgList: TImageList;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnEdtCasaRightButtonClick(Sender: TObject);
  private
    FControler: TControllerProduto;
    FUsuario: TUsuario;
    function PopulateClass: TProduto;
    procedure ShowPesquisaCasa;
    procedure ListarProduto(aProduto: TProduto);
  public
    constructor Create (aOwner: TObject; aUsuario: TUsuario;
      aProduto: TProduto = nil); reintroduce;
    destructor Destroy; override;
  end;
var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

uses
  Model.Casa;

{$R *.dfm}

procedure TfrmCadastroProduto.btnEdtCasaRightButtonClick(Sender: TObject);
begin
  ShowPesquisaCasa;
end;

procedure TfrmCadastroProduto.btnIncluirClick(Sender: TObject);
var
  lProduto: TProduto;
begin
  lProduto := PopulateClass;
  try
    try
      FControler.IsEmpity(lProduto);
      FControler.Cadastar(lProduto);
      ShowMessage('Produto cadastrado com sucesso');
    except
      on E: Exception do
        ShowMessage(e.Message);
    end;
  finally
    lProduto.Free;
  end;
end;

procedure TfrmCadastroProduto.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

constructor TfrmCadastroProduto.Create(aOwner: TObject; aUsuario: TUsuario;
  aProduto: TProduto = nil);
begin
  if not Assigned(frmCadastroProduto) then
  begin
    inherited Create(nil);
    FControler := TControllerProduto.Create;
    frmCadastroProduto := Self;
    frmCadastroProduto.Parent := aOwner as TPanel;
    frmCadastroProduto.Align := alClient;
    frmcadastroProduto.BorderStyle := bsNone;
    FUsuario := aUsuario;

    if Assigned (aProduto) then
    begin
      btnIncluir.Enabled := False;
      ListarProduto(aProduto);
    end;
  end;
  frmCadastroProduto.Show;
end;

destructor TfrmCadastroProduto.Destroy;
begin
  FControler.Free;
  FUsuario.Free;
  inherited;
end;

function TfrmCadastroProduto.PopulateClass: TProduto;
begin
   Result := TProduto.Create;
   Result.Descricao := edtDescricaoProduto.Text;
   Result.Und := edtUnd.Text;
   Result.Qtde  := StrToFloatDef(edtQtde.Text, 0);
   Result.Validade := dtValidade.DateTime;
   Result.ValorAtual := StrToFloatDef(edtValorAtual.Text, 0);
   Result.EstoqueMin := StrToFloatDef(edtEstMinimo.Text, 0);
   Result.IdCasa := StrToIntDef(btnEdtCasa.Text, 0);
end;

procedure TfrmCadastroProduto.ShowPesquisaCasa;
var
  lCasa: TCasa;
begin
  lCasa := TCasa.Create;
  try
    TfrmPesquisaCasa.Create(FUsuario, lCasa);
    if Assigned(lCasa) then
    begin
      btnEdtCasa.Text := IntToStr(lCasa.ID_CASA);
    end;
  finally
    lCasa.Free;
  end;
end;

procedure TfrmCadastroProduto.ListarProduto(aProduto: TProduto);
begin
  edtDescricaoProduto.Text := aProduto.Descricao;
  edtUnd.Text := aProduto.Und;
  edtQtde.Text := FloatToStr(aProduto.Qtde);
  dtValidade.DateTime :=  aProduto.Validade ;
  edtValorAtual.Text := FormatFloat('R$ ##,##0.00', aProduto.ValorAtual);
  edtEstMinimo.Text := FloatToStr(aProduto.EstoqueMin);
  btnEdtCasa.Text := IntToStr(aProduto.IdCasa);
end;

end.
