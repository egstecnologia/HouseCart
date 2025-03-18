unit Controller.Usuario;

interface

uses
  System.SysUtils, DAO.Usuario, Model.Usuario, DMDados;

type
  TControllerUsuario = class
    private
      FDAOUsuario: TDAOUsuario;
      procedure ValidarEmail(aEmail: String);
      procedure IsEnpty(aUsuario: TUsuario);
    public
      constructor Create;
      destructor Destroy; override;
      procedure CadastraUsuario (aUsuario: TUsuario);
      procedure Validar(aModelUsuario: TUsuario);
  end;

implementation

{ TControllerUsuario }

procedure TControllerUsuario.CadastraUsuario(aUsuario: TUsuario);
begin
  FDAOUsuario.CadastrarUsuario(aUsuario);
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

procedure TControllerUsuario.Validar(aModelUsuario: TUsuario);
begin
  ValidarEmail(aModelUsuario.Email);
  IsEnpty(aModelUsuario);

end;

procedure TControllerUsuario.ValidarEmail(aEmail: String);
begin
  if FDAOUsuario.CheckEmail(aEmail) then
    raise Exception.Create('Email já existe');
  if not aEmail.Contains('@') then
    raise Exception.Create('Formato de email invalido');
end;

end.
