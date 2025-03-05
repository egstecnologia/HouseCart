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

  public
    function LogarUsuario(aValue :TUsuario) : TUsuario;
    function CadastrarUsuario (aValue :TUsuario): Boolean;
  end;

implementation

uses
  Vcl.Dialogs;

{ TDAOUsuario }

function TDAOUsuario.CadastrarUsuario(aValue: TUsuario): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);

  if Query = nil then
  begin
    ShowMessage('Erro ao criar Query.');
    Exit;
  end;

  try
    if DM_Dados = nil then
    begin
      ShowMessage('Erro: DataModule não foi instanciado.');
      Exit;
    end;

    if DM_Dados.FDConnection1 = nil then
    begin
      ShowMessage('Erro: FDConnection1 não foi inicializado.');
      Exit;
    end;

    if not DM_Dados.FDConnection1.Connected then
      DM_Dados.FDConnection1.Connected := True;

    Query.Connection := DM_Dados.FDConnection1;
    Query.SQL.Text := 'INSERT INTO usuario (nome, email, senha) VALUES (:nome, :email, :senha)';

    Query.ParamByName('nome').AsString := aValue.Nome;
    Query.ParamByName('email').AsString := aValue.Email;
    Query.ParamByName('senha').AsString := aValue.Senha;

    try
      Query.ExecSQL;
      Result := True;
    except
      on E: Exception do
        ShowMessage('Erro ao cadastrar usuário: ' + E.Message);
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
