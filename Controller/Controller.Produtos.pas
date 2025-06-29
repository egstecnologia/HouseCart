unit Controller.Produtos;

interface
uses
  System.SysUtils,
  Model.Casa,
  DB,
  DMDados,
  Model.Usuario,
  FireDAC.Comp.Client,
  System.Generics.Collections, Model.Produtos, DAO.Produtos;

type
  TControllerProduto = class
  private
    FDAO: TDAOProdutos;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Cadastar (aProduto: TProduto);
    function GetList(aIdCasa: Integer = 0; aTpFilter: Integer = 0;
      aSearchText: String = ''): TList<TProduto>;
    function Get(aIdProduto: integer): TProduto;
    procedure IsEmpity (aProduto: TProduto);
  end;

implementation

{ TControllerProduto }

procedure TControllerProduto.Cadastar(aProduto: TProduto);
begin
  try
    FDAO.Cadastar(aProduto);
  except on E: Exception do
    raise;
  end;
end;

constructor TControllerProduto.Create;
begin
  FDAO := TDAOProdutos.Create(DM_Dados.FDConnection1);
end;

destructor TControllerProduto.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TControllerProduto.Get(aIdProduto: integer): TProduto;
begin
  try
    Result := FDAO.Get(aIdProduto);
  except
    on E: Exception do
    begin
      raise Exception.Create('Ouve um erro'+ e.Message);
    end;
  end;
end;

function TControllerProduto.GetList(aIdCasa: Integer = 0; aTpFilter: Integer = 0;
  aSearchText: String = ''): TList<TProduto>;
begin
  try
    Result := FDAO.GetList(aIdCasa, aTpFilter, aSearchText);
  except
    on E: Exception do
    begin
      raise Exception.Create('Ouve um erro'+ e.Message);
    end;
  end;
end;

procedure TControllerProduto.IsEmpity(aProduto: TProduto);
begin
  if aProduto.Descricao = '' then
    raise Exception.Create('Digite uma descri��o');
  if aProduto.Qtde = 0 then
    raise Exception.Create('Digite a quantidade comprada');
  if aProduto.ValorAtual = 0 then
    raise Exception.Create('Informe o valor atual da compra');
  if aProduto.Und = '' then
    raise Exception.Create('Informe a unidade de medida');
  if aProduto.Validade = 0  then
    raise Exception.Create('Informe a data de validade do produto');
  if aProduto.EstoqueMin = 0 then
    raise Exception.Create('Qual a quantidade minima desse produto?');
  if aProduto.IdCasa = 0  then
    raise Exception.Create('Selecione de qual residencia � esse produto');
end;

end.
