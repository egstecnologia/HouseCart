unit DAO.Casa;

interface
uses
  System.SysUtils,
  Model.Casa,
  DB,
  DMDados,
  Model.Usuario,
  FireDAC.Comp.Client,
  System.Generics.Collections;

type
  TDAOCasa = class
    private
      FCOnn : TFDConnection;
    public
      constructor Create (aConn : TFDConnection); reintroduce;
      destructor  Destroy; override;
      procedure Cadastrar(aModelCasa: TCasa; aUsuario: TUsuario);
      function ExisteCasa(aIdUsuario: Integer; aDescricaoCasa: String): Boolean; overload;
      function ExisteCasa(aIdUsuario, aIdCasa: Integer): Boolean; overload;
      procedure Vincular(const aIdUsuario: Integer; const aShortId: String);
      function GetId(const aShortId: String) : Integer;
      function GetCasasVinculadas(const aIdUsuario: Integer): TList<TCasa>;
      procedure Desvincular(const aIdUsuario, aIdCasa: Integer);
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

procedure TDAOCasa.Desvincular(const aIdUsuario, aIdCasa: Integer);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    try
      FCOnn.StartTransaction;
      lQuery.Connection := FCOnn;
      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.Add('DELETE FROM');
      lQuery.SQL.Add('  usuarios_casa');
      lQuery.SQL.Add('WHERE');
      lQuery.SQL.Add('  id_usuario = :idUsuario');
      lQuery.SQL.Add('AND');
      lQuery.SQL.Add('  id_casa = :idCasa');
      lQuery.ParamByName('idusuario').AsInteger := aIdUsuario;
      lQuery.ParamByName('idCasa').AsInteger := aIdCasa;
      lQuery.ExecSQL;
      FCOnn.Commit;
    except
      on E: Exception do
      begin
        FCOnn.Rollback;
        raise
      end;
    end;
  finally
    lQuery.Free;
  end;
end;

function TDAOCasa.ExisteCasa(aIdUsuario, aIdCasa: Integer): Boolean;
var
  lQuery : TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    try
      lQuery.Connection := FCOnn;
      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.Add('SELECT id_usuario');
      lQuery.SQL.Add('FROM usuarios_casa');
      lQuery.SQL.Add('WHERE id_usuario = :id_usuario AND id_casa = :id_casa');

      lQuery.ParamByName('id_usuario').AsInteger := aIdUsuario;
      lQuery.ParamByName('id_casa').AsInteger := aIdCasa;
      lQuery.Open;

      Result := lQuery.RecordCount > 0;
    except on E: Exception do
      raise
    end;
  finally
   lQuery.Free;
  end;
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

procedure TDAOCasa.Vincular(const aIdUsuario: Integer; const aShortId: String);
var
  lQuery: TFDQuery;
  lIdCasa: Integer;
begin
  lQuery := TFDQuery.Create(nil);
  try
    try
      lQuery.Connection := FCOnn;
      lQuery.Close;
      lQuery.SQL.Clear;
      lIdCasa := GetId(aShortId);
      FCOnn.StartTransaction;
      lQuery.SQL.Add('INSERT INTO usuarios_casa');
      lQuery.SQL.Add('(id_casa, id_usuario)');
      lQuery.SQL.Add('  VALUES');
      lQuery.SQL.Add('(:id_casa, :id_usuario)');
      lQuery.ParamByName('id_casa').AsInteger := lIdCasa;
      lQuery.ParamByName('id_usuario').AsInteger := aIdUsuario;
      lQuery.ExecSQL;
      FCOnn.Commit;

    except on E: Exception do
      begin
        FCOnn.Rollback;
        raise
      end;
    end;

  finally
    lQuery.Free;
  end;

end;

function TDAOCasa.GetCasasVinculadas(const aIdUsuario: Integer): TList<TCasa>;
var
  lQuery: TFDQuery;
  lItem: TCasa;
begin
  lQuery:= TFDQuery.Create(nil);
  try
    try
      lQuery.Connection := FCOnn;
      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.Add('SELECT uc.id_casa, c.descricao, c.short_id');
      lQuery.SQL.Add('FROM usuarios_casa uc');
      lQuery.SQL.Add('INNER JOIN casa c on c.id_casa = uc.id_casa');
      lQuery.SQL.Add('WHERE uc.id_usuario = :idUsuario');
      lQuery.ParamByName('idUsuario').AsInteger := aIdUsuario;
      lQuery.Open;
      Result := TList<TCasa>.create;
      while not lQuery.Eof do
      begin
        lItem := TCasa.Create;
        lItem.ID_CASA := lQuery.FieldByName('id_casa').AsInteger;
        lItem.Descricao := lQuery.FieldByName('descricao').AsString;
        lItem.ShortId := lQuery.FieldByName('short_id').AsString;
        Result.Add(lItem);
        lQuery.Next;
      end;
      Result.TrimExcess;
    except on E: Exception do
      raise
    end;
  finally
    lQuery.Free;
  end;
end;

function TDAOCasa.GetId (const aShortId: String) : Integer;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FCOnn;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add('SELECT id_casa FROM casa');
    lQuery.SQL.Add('WHERE short_id = :short_id');
    lQuery.ParamByName('short_id').AsString := aShortId;
    lQuery.Open;
    Result := lQuery.FieldByName('id_casa').AsInteger;
  finally
    lQuery.Free;
  end;
end;

end.
