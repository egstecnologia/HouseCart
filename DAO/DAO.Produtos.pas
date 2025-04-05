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
  try
    try

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
