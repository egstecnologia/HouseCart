unit DAO.Produtos;

interface

uses
  System.SysUtils,
  Model.Casa,
  DB,
  Model.Usuario,
  FireDAC.Comp.Client,
  System.Generics.Collections,
  Model.Produtos;

type
  TDAOProdutos = class
  private
    FCon: TFDConnection;
  public
    constructor Create(aCon: TFDConnection);
    destructor Destroy; override;
    procedure Cadastar (aProduto: TProduto);
  end;

implementation

{ TDAOProdutos }

procedure TDAOProdutos.Cadastar(aProduto: TProduto);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  FCon.StartTransaction;
  try
    try
      lQuery.Connection := FCon;
      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.Add('INSERT INTO produto (');
      lQuery.SQL.Add('  descricao, qtde, valor_ult_compra, ');
      lQuery.SQL.Add('  valor_atual, und, validade, estoque_min, idCasa)');

      lQuery.ParamByName('descricao').AsString := aProduto.Descricao;
      lQuery.ParamByName('qtde').AsFloat := aProduto.Qtde;
      lQuery.ParamByName('valor_ult_compra').AsFloat := aProduto.ValorUltCompra;
      lQuery.ParamByName('valor_atual').AsFloat := aProduto.ValorAtual;
      lQuery.ParamByName('und').AsString := aProduto.Und;
      lQuery.ParamByName('validade').AsDate := aProduto.Validade;
      lQuery.ParamByName('estoque_min').AsFloat := aProduto.EstoqueMin;
      lQuery.ExecSQL;

      lQuery.Close;
      lQuery.SQL.Add('SELECT id_casa FROM usuarios_casa');
      lQuery.SQL.Add('WHERE id_usuario = :id_usuario ');

    except
      on E: Exception do
      begin
        //Rolback
        raise
      end;
    end;

  finally
    lQuery.Free;
  end;

end;

constructor TDAOProdutos.Create(aCon: TFDConnection);
begin
  FCon := aCon;
end;

destructor TDAOProdutos.Destroy;
begin
  FCon.Free;
  inherited;
end;

end.
