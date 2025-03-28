unit Controller.Usuario;

interface

uses
  System.SysUtils, DAO.Usuario, Model.Usuario, DMDados;

type
  TControllerUsuario = class
    private
      FDAOUsuario: TDAOUsuario;
      procedure IsEnpty(aUsuario: TUsuario);
    public
      constructor Create;
      destructor Destroy; override;
      procedure CadastraUsuario (aUsuario: TUsuario);
      procedure Validar(aModelUsuario: TUsuario);
      procedure LogarUsuario(aUsuario: TUsuario);
      procedure ValidarEmail(aEmail: String);
      function ExistsEmail(aEmail: string): Boolean;
      function CheckSenha(aEmail, aSenha: String): Boolean;
      function GetID(aEmail: String): Integer;
  end;

implementation

{ TControllerUsuario }

procedure TControllerUsuario.CadastraUsuario(aUsuario: TUsuario);
begin
  FDAOUsuario.CadastrarUsuario(aUsuario);
end;

function TControllerUsuario.CheckSenha(aEmail, aSenha: String): Boolean;
begin
  Result := FDAOUsuario.CheckSenha(aEmail, aSenha);
end;

constructor TControllerUsuario.Create;
begin
  FDAOUsuario := TDAOUsuario.Create(DM_Dados.FDConnection2);
end;

destructor TControllerUsuario.Destroy;
begin
  FDAOUsuario.Free;
  inherited;
end;

procedure TControllerUsuario.IsEnpty(aUsuario: TUsuario);
begin
  if aUsuario.Nome = '' then
    raise Exception.Create('Digite o seu nome');
  if aUsuario.Senha = '' then
    raise Exception.Create('Digite a sua senha');
  if aUsuario.Email = '' then
    raise Exception.Create('Digite seu email');
end;

procedure TControllerUsuario.LogarUsuario(aUsuario: TUsuario);
begin
  FDAOUsuario.LogarUsuario(aUsuario);
end;

procedure TControllerUsuario.Validar(aModelUsuario: TUsuario);
begin
  ValidarEmail(aModelUsuario.Email);
  IsEnpty(aModelUsuario);
end;

procedure TControllerUsuario.ValidarEmail(aEmail: String);
begin
  if not aEmail.Contains('@') then
    raise Exception.Create('Formato de email invalido');
end;

function TControllerUsuario.ExistsEmail(aEmail: string): Boolean;
begin
  Result := FDAOUsuario.CheckEmail(aEmail);
end;
function TControllerUsuario.GetID(aEmail: String): Integer;
begin
  Result := FDAOUsuario.GetId(aEmail);
end;

end.
