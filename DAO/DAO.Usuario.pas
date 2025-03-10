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
    function LogarUsuario(aValue :TUsuario): TUsuario;
    function CadastrarUsuario(aValue :TUsuario): Integer;
    function CheckEmail(aEmail: String): Boolean;
  end;

implementation

uses
  Vcl.Dialogs;

{ TDAOUsuario }

function TDAOUsuario.CadastrarUsuario(aValue: TUsuario): Integer;
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
      Query.ParamByName('nome').AsString := aValue.Nome;
      Query.ParamByName('email').AsString := aValue.Email;
      Query.ParamByName('senha').AsString := aValue.Senha;
      Query.ExecSQL;
      FConn.Commit;
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


//var
//  Query: TFDQuery;
//begin
//  Result := False;
//  Query := TFDQuery.Create(nil);
//  try
//    Query.Connection := DM_Dados.FDConnection1;
//    Query.SQL.Text := 'INSERT INTO usuario (nome, email, senha) VALUES (:nome, :email, :senha)';
//
//    Query.ParamByName('nome').AsString := aValue.Nome;
//    Query.ParamByName('email').AsString := aValue.Email;
//    Query.ParamByName('senha').AsString := aValue.Senha;
//
//    try
//      Query.ExecSQL;
//      Result := True;
//    except
//      on E: Exception do
//        ShowMessage('Erro ao cadastrar usuário: ' + E.Message);
//    end;
//  finally
//    Query.Free;
//  end;
//end;

function TDAOUsuario.CheckEmail(aEmail: String): Boolean;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add('SELECT');
    lQuery.SQL.Add('  email');
    lQuery.SQL.Add('FROM');
    lQuery.SQL.Add('  usuario');
    lQuery.SQL.Add('WHERE');
    lQuery.SQL.Add('  email = :email');
    lQuery.ParamByName('email').AsString := aEmail;
    lQuery.Open;
    Result := lQuery.RecordCount > 0;
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

function TDAOUsuario.LogarUsuario(aValue: TUsuario): TUsuario;
//var
//  Usuario: TUsuario;
//  Query : TFDQuery;
begin
//  Query := TFDQuery.Create(nil);
//  Usuario := TUsuario.Create;
//  try
//    with DM_Dados.FDConnection1 do
//    begin
//      Query.SQL.Text := 'SELETC * FROM usuario where email = email';
//      Query.ParamByName('email').AsString := aValue.Email;
//      open;
//      if not IsEmpty then
//        begin
//        //Ver com Erick se há a necessidade de trazer o ID_USUARIO do banco
//        //mesmo que não venha ser exibido
//         Usuario.Email := Query.FieldByName('email').AsString;
//         Usuario.Senha := Query.FieldByName('senha').AsString;
//        end;
//    end;
//    Result := Usuario;
//  except
//    FreeAndNil(Usuario);
//    ShowMessage('Verifique se email e senha estão corretos!');
//    raise
//  end;
end;

end.
