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
    function GetList(aIdCasa: Integer = 0; aTpFilter: Integer = 0;
      aSearchText: String = ''): TList<TProduto>;
    function Get(aIdProduto: integer): TProduto;
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
      lQuery.SQL.Add('  valor_atual, und, validade, estoque_min, id_casa)');
      lQuery.SQL.Add('VALUES (');
      lQuery.SQL.Add('  :descricao, :qtde, :valor_ult_compra,');
      lQuery.SQL.Add('  :valor_atual, :und, :validade, :estoque_min, :id_casa)');

      lQuery.ParamByName('descricao').AsString := aProduto.Descricao;
      lQuery.ParamByName('qtde').AsFloat := aProduto.Qtde;
      lQuery.ParamByName('valor_ult_compra').AsFloat := aProduto.ValorUltCompra;
      lQuery.ParamByName('valor_atual').AsFloat := aProduto.ValorAtual;
      lQuery.ParamByName('und').AsString := aProduto.Und;
      lQuery.ParamByName('validade').AsDate := aProduto.Validade;
      lQuery.ParamByName('estoque_min').AsFloat := aProduto.EstoqueMin;
      lQuery.ParamByName('id_casa').AsInteger := aProduto.IdCasa;

      lQuery.ExecSQL;
      FCOn.Commit;
    except
      on E: Exception do
      begin
        FCon.Rollback;
        raise Exception.Create('Erro ao cadastrar o produto: '+ e.Message);
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

function TDAOProdutos.Get(aIdProduto: integer): TProduto;
var
  lQuery: TFDQuery;
begin
  Result := TProduto.Create;
  lQuery := TFDQuery.Create(nil);
  lQuery.Connection := FCon;
  try
    try
      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.Add('SELECT  id_produto, descricao, qtde, valor_ult_compra,');
      lQuery.SQL.Add('  valor_atual, und, validade, estoque_min, id_casa');
      lQuery.SQL.Add('FROM produto');
      lQuery.SQL.Add('WHERE');
      lQuery.SQL.Add(' id_produto = :id_produto');
      lQuery.ParamByName('id_produto').AsInteger := aIdProduto;
      lQuery.Open;

      Result.IdProduto := lQuery.FieldByName('id_produto').AsInteger;
      Result.Descricao := lQuery.FieldByName('descricao').AsString;
      Result.Qtde := lQuery.FieldByName('qtde').AsFloat;
      Result.ValorUltCompra := lQuery.FieldByName('valor_ult_compra').AsFloat;
      Result.ValorAtual := lQuery.FieldByName('valor_atual').AsFloat;
      Result.Und := lQuery.FieldByName('und').AsString;
      Result.Validade := lQuery.FieldByName('validade').AsDateTime;
      Result.EstoqueMin := lQuery.FieldByName('estoque_min').AsFloat;
      Result.IdCasa := lQuery.FieldByName('id_casa').AsInteger;
      lQuery.SQL.Clear;
    except
      raise;
    end;
  finally
   lQuery.Free;
  end;
end;

function TDAOProdutos.GetList(aIdCasa: Integer = 0; aTpFilter: Integer = 0;
  aSearchText: String = ''): TList<TProduto>;
var
  lQuery: TFDQuery;
  lProduto: TProduto;
begin
  result := TList<TProduto>.Create;
  lQuery := TFDQuery.Create(nil);
  lQuery.Connection := FCon;
  try
    try
      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.Add('SELECT  id_produto, descricao, qtde, valor_ult_compra,');
      lQuery.SQL.Add('  valor_atual, und, validade, estoque_min, id_casa');
      lQuery.SQL.Add('FROM produto');
      lQuery.SQL.Add('WHERE');
      lQuery.SQL.Add('  1=1');
      if aIdCasa <> 0 then
      begin
        lQuery.SQL.Add('  and id_casa = :id_casa');
        lQuery.ParamByName('id_casa').AsInteger := aIdCasa;
      end;

      case aTpFilter of
        1:
        begin
          lQuery.SQL.Add('  and id_produto = :id_produto');
          lQuery.ParamByName('id_produto').AsInteger := StrToInt(aSearchText);
        end;
        2: lQuery.SQL.Add(Format('  and descricao LIKE %s',
          [QuotedStr('%'+aSearchText+'%')]));
      end;

      lQuery.Open;

      while not lQuery.Eof do
      begin
        lProduto := TProduto.Create;
        lProduto.IdProduto := lQuery.FieldByName('id_produto').AsInteger;
        lProduto.Descricao := lQuery.FieldByName('descricao').AsString;
        lProduto.Qtde := lQuery.FieldByName('qtde').AsFloat;
        lProduto.ValorUltCompra := lQuery.FieldByName('valor_ult_compra').AsFloat;
        lProduto.ValorAtual := lQuery.FieldByName('valor_atual').AsFloat;
        lProduto.Und := lQuery.FieldByName('und').AsString;
        lProduto.Validade := lQuery.FieldByName('validade').AsDateTime;
        lProduto.EstoqueMin := lQuery.FieldByName('estoque_min').AsFloat;
        lProduto.IdCasa := lQuery.FieldByName('id_casa').AsInteger;
        Result.Add(lProduto);
        lQuery.Next;
      end;
      Result.TrimExcess;
    except
     on E: Exception do
      raise;
    end;
  finally
    lQuery.Free;
  end;
end;

end.
