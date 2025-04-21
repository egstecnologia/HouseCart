unit Model.Produtos;

interface

type
  TProduto = class
  private
    FIdProduto: Integer;
    FDescricao: String;
    FQtde: Double;
    FValorUltCompra: Double;
    FValorAtual: Double;
    FUnd: String;
    FValidade: TDate;
    FEstoqueMin: Double;
    FIdCasa: Integer;

  public
    property IdProduto: Integer read FIdProduto write FIdProduto;
    property Descricao: String read FDescricao write FDescricao;
    property Qtde: Double read FQtde write FQtde;
    property ValorUltCompra: Double read FValorUltCompra write FValorUltCompra;
    property ValorAtual: Double read FValorAtual write FValorAtual;
    property Und: String read FUnd write FUnd;
    property Validade: TDate read FValidade write FValidade;
    property EstoqueMin: Double read FEstoqueMin write FEstoqueMin;
    property IdCasa: Integer read FIdCasa write FIdCasa;

  end;

implementation

end.
