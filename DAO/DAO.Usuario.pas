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
begin

  try
    with DM_Dados.FDQuery1 do
    begin
      SQL.Text := 'INSERT INTO usuario (nome, email, senha) values' +
                                      '(:nome, :email, :senha)';
      ParamByName('nome').AsString := aValue.Nome;
      ParamByName('email').AsString := aValue.Email;
      ParamByName('senha').AsString := aValue.Senha;
      ExecSQL;
    end;
    Result := True;
  except
    Result := False;
    ShowMessage('Erro ao cadastrar usu�rio!');
  end;

end;

function TDAOUsuario.LogarUsuario(aValue: TUsuario): TUsuario;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    with DM_Dados.FDQuery1 do
    begin
      SQL.Text := 'SELETC * FROM usuario where email = email';
      ParamByName('email').AsString := aValue.Email;
      open;
      if not IsEmpty then
        begin
        //Ver com Erick se h� a necessidade de trazer o ID_USUARIO do banco
        //mesmo que n�o venha ser exibido
         Usuario.Email := FieldByName('email').AsString;
         Usuario.Senha := FieldByName('senha').AsString;
        end;
    end;
    Result := Usuario;
  except
    FreeAndNil(Usuario);
    ShowMessage('Verifique se email e senha est�o corretos!');
    raise
  end;
end;

end.
