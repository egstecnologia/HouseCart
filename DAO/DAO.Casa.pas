unit DAO.Casa;

interface
uses
  System.SysUtils, 
  Model.Casa,
  DB,
  DMDados,
  Model.Usuario,
  FireDAC.Comp.Client;
  
type
  TDAOCasa = class
    private
      FCOnn : TFDConnection;
    public
      constructor Create (aConn : TFDConnection); reintroduce;
      destructor  Destroy; override;
      procedure Cadastrar(aModelCasa: TCasa; aUsuario: TUsuario);
      function ExisteCasa(aIdUsuario: Integer; aDescricaoCasa: String): Boolean;
  end;



implementation

{ TDAOCasa }

procedure TDAOCasa.Cadastrar(aModelCasa: TCasa; aUsuario: TUsuario);
var
  lQuery : TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  FConn.StartTransaction;
  try
    try
      lQuery.Connection := FCOnn;
      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.Add('INSERT INTO CASA(');
      lQuery.SQL.Add('  descricao, short_id');
      lQuery.SQL.Add(') values (');
      lQuery.SQL.Add(':descricao, :short_id)');

      lQuery.ParamByName('descricao').AsString := aModelCasa.Descricao;
      lQuery.ParamByName('short_id').AsString := aModelCasa.ShortId;
      lQuery.ExecSQL;

      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.Add('SELECT id_casa FROM casa');
      lQuery.SQL.Add('WHERE short_id = :short_id');
      lQuery.SQL.Add('and descricao = :descricao');
      lQuery.ParamByName('short_id').AsString := aModelCasa.ShortId;
      lQuery.ParamByName('descricao').AsString := aModelCasa.Descricao;
      lQuery.Open;
      aModelCasa.ID_CASA := lQuery.FieldByName('id_casa').AsInteger;

      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.Add('INSERT INTO USUARIOS_CASA(');
      lQuery.SQL.Add('  ID_CASA, ID_USUARIO');
      lQuery.SQL.Add(') values (');
      lQuery.SQL.Add(':ID_CASA, :ID_USUARIO');
      lQuery.SQL.Add(')');

      lQuery.ParamByName('ID_CASA').AsInteger := aModelCasa.ID_CASA;
      lQuery.ParamByName('ID_USUARIO').AsInteger := aUsuario.IDUsuario;

      lQuery.ExecSQL;
      FCOnn.Commit;

    except
      on e :Exception do
      begin
        FConn.Rollback;
        raise
      end;
    end;
  finally
    lQuery.Free;
  end;
end;

constructor TDAOCasa.Create(aConn : TFDConnection);
begin
  inherited Create;
  FCOnn := aConn;
end;

destructor TDAOCasa.Destroy;
begin
  FConn.Free;
  inherited;
end;

function TDAOCasa.ExisteCasa(aIdUsuario: Integer; aDescricaoCasa: String): Boolean;
var
  lQuery : TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    try
      lQuery.Connection := FCOnn;
      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.Add('SELECT uc.ID_USUARIO');
      lQuery.SQL.Add('FROM USUARIOS_CASA uc');
      lQuery.SQL.Add('INNER JOIN CASA C ON C.ID_CASA = UC.ID_CASA');
      lQuery.SQL.Add('WHERE UC.ID_USUARIO = :ID_USUARIO AND C.DESCRICAO = :DESCRICAO');

      lQuery.ParamByName('ID_USUARIO').AsInteger := aIdUsuario;
      lQuery.ParamByName('DESCRICAO').AsString := aDescricaoCasa;
      lQuery.Open;

      Result := lQuery.RecordCount > 0;
    except on E: Exception do
      raise
    end;
  finally
   lQuery.Free;
  end;
end;

end.
