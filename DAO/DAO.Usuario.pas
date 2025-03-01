unit DAO.Usuario;

interface

uses
  DB, DMDados, Model.Usuario;

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
begin

  try
    with DM_Dados.FDQuery1 do
    begin
      SQL.Text := 'INSERT INTO usuario (nome, email, senha) values (:nome, :email, :senha)';
      ParamByName('nome').AsString := aValue.Nome;
      ParamByName('email').AsString := aValue.Email;
      ParamByName('senha').AsString := aValue.Senha;
      ExecSQL;
    end;
    Result := True;
  except
    Result := False;
    ShowMessage('Erro ao cadastrar usuário!');
  end;

end;

function TDAOUsuario.LogarUsuario(aValue: TUsuario): TUsuario;
begin

end;

end.
