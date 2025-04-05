unit DAO.Usuario;

interface

uses
  DB,
  DMDados,
  Model.Usuario,
  FireDAC.Comp.Client,
  System.SysUtils;

type
  TDAOUsuario = class
  private
    FConn: TFDConnection;
  public
    constructor Create(aConn: TFDConnection); reintroduce;
    destructor Destroy; override;
    procedure CadastrarUsuario(aUsuario: TUsuario);
    function CheckEmail(aEmail: String; aIdUsuario: Integer = 0): Boolean;
    function CheckSenha(aEmail, aSenha: String): Boolean;
    function GetId(aEmail: String): Integer;
    function GetUser(aIdUsuario: Integer): TUsuario;
    procedure Alterar(aUsuario: TUsuario);
  end;

implementation

uses
  Vcl.Dialogs;

{ TDAOUsuario }

procedure TDAOUsuario.Alterar(aUsuario: TUsuario);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    try
      FConn.StartTransaction;
      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.Connection := FConn;
      lQuery.SQL.Add('UPDATE usuario SET');
      lQuery.SQL.Add('  nome  = :nome,');
      lQuery.SQL.Add('  email = :email,');
      lQuery.SQL.Add('  senha = :senha');
      lQuery.SQL.Add('WHERE');
      lQuery.SQL.Add('  id_usuario = :idUsuario');
      lQuery.ParamByName('idUsuario').AsInteger := aUsuario.IDUsuario;
      lQuery.ParamByName('nome').AsString := aUsuario.Nome;
      lQuery.ParamByName('email').AsString := aUsuario.Email;
      lQuery.ParamByName('senha').AsString := aUsuario.Senha;
      lQuery.ExecSQL;
      FConn.Commit;
    except
      on E: Exception do
      begin
        FConn.Rollback;
        raise
      end;
    end;

  finally
    lQuery.Free;
  end;

end;

procedure TDAOUsuario.CadastrarUsuario(aUsuario: TUsuario);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    try
      FConn.StartTransaction;
      Query.Close;
      Query.SQL.Clear;
      Query.Connection := FConn;
      Query.SQL.Add('INSERT INTO');
      Query.SQL.Add(' usuario');
      Query.SQL.Add('(nome, email, senha)');
      Query.SQL.Add('VALUES');
      Query.SQL.Add(' (:nome, :email, :senha)');
      Query.ParamByName('nome').AsString := aUsuario.Nome;
      Query.ParamByName('email').AsString := aUsuario.Email;
      Query.ParamByName('senha').AsString := aUsuario.Senha;
      Query.ExecSQL;
      FConn.Commit;

      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('SELECT id_usuario FROM usuario');
      Query.SQL.Add('WHERE email = :email');

      Query.ParamByName('email').AsString := aUsuario.Email;
      Query.Open;
      aUsuario.IDUsuario := Query.FieldByName('id_usuario').AsInteger;

    except
      on E: Exception do
      begin
        FConn.Rollback;
        raise Exception.Create('Erro ao cadastrar usuário:'+ E.Message );
      end;
    end;
  finally
    Query.Free;
  end;
end;


function TDAOUsuario.CheckEmail(aEmail: String; aIdUsuario: Integer = 0): Boolean;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  lQuery.Connection := FConn;
  try
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add('SELECT');
    lQuery.SQL.Add('  email');
    lQuery.SQL.Add('FROM');
    lQuery.SQL.Add('  usuario');
    lQuery.SQL.Add('WHERE');
    lQuery.SQL.Add('  email = :email');
    if aIdUsuario <> 0 then
    begin
      lQuery.SQL.Add('  and id_usuario <> :idusuario');
      lQuery.ParamByName('idusuario').AsInteger := aIdUsuario;
    end;
    lQuery.ParamByName('email').AsString := aEmail;

    lQuery.Open;
    Result := lQuery.RecordCount > 0;
  finally
    lQuery.Free;
  end;
end;

function TDAOUsuario.CheckSenha(aEmail, aSenha: String): Boolean;
var
  lQuery: TFDQuery;
begin
  try
    lQuery := TFDQuery.Create(nil);
    lQuery.Connection := FConn;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add('SELECT');
    lQuery.SQL.Add('  senha');
    lQuery.SQL.Add('FROM');
    lQuery.SQL.Add('  usuario');
    lQuery.SQL.Add('WHERE');
    lQuery.SQL.Add('  email = :email');
    lQuery.ParamByName('email').AsString := aEmail;
    lQuery.Open;
    Result := lQuery.FieldByName('senha').AsString = aSenha;
  finally
    lQuery.Free;
  end;

end;

constructor TDAOUsuario.Create(aConn: TFDConnection);
begin
  inherited Create;
  FConn := aConn;
end;

destructor TDAOUsuario.Destroy;
begin
  FConn.Free;
  inherited;
end;

function TDAOUsuario.GetId(aEmail: String): Integer;
var
  lQuery: TFDQuery;
begin
  try
    lQuery := TFDQuery.Create(nil);
    lQuery.Connection := FConn;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add('SELECT');
    lQuery.SQL.Add('  id_usuario');
    lQuery.SQL.Add('FROM');
    lQuery.SQL.Add('  usuario');
    lQuery.SQL.Add('WHERE');
    lQuery.SQL.Add('email = :email');
    lQuery.ParamByName('email').AsString := aEmail;
    lQuery.Open;
    Result := lQuery.FieldByName('id_usuario').AsInteger;
  finally
    lQuery.Free;
  end;
end;
function TDAOUsuario.GetUser(aIdUsuario: Integer): TUsuario;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  Result := TUsuario.Create;
  try
    lQuery.Connection := FConn;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add('SELECT');
    lQuery.SQL.Add('  nome, email, senha');
    lQuery.SQL.Add('FROM');
    lQuery.SQL.Add('  usuario');
    lQuery.SQL.Add('WHERE');
    lQuery.SQL.Add('  id_usuario = :id_usuario');
    lQuery.ParamByName('id_usuario').AsInteger := aIdUsuario;
    lQuery.Open;
    Result.Nome  := lQuery.FieldByName('nome').AsString;
    Result.Email := lQuery.FieldByName('email').AsString;
    Result.Senha := lQuery.FieldByName('senha').AsString;
  finally
    lQuery.Free;
  end;
end;

end.
