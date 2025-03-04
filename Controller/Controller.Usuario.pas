unit Controller.Usuario;

interface

uses
  System.SysUtils, DAO.Usuario, Model.Usuario;

type
  TControllerUsuario = class
    private
      FDAOUsuario: TDAOUsuario;
    public
      constructor Create;
      destructor Destroy; override;
      function CadastraUsuario (aValue: TUsuario): Boolean;
  end;

implementation

{ TControllerUsuario }

function TControllerUsuario.CadastraUsuario(aValue: TUsuario): Boolean;
begin
  Result := FDAOUsuario.CadastrarUsuario(aValue);
end;

constructor TControllerUsuario.Create;
begin
  FDAOUsuario := TDAOUsuario.Create;
end;

destructor TControllerUsuario.Destroy;
begin
  FDAOUsuario.Free;
  inherited;
end;

end.
