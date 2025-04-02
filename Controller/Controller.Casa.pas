unit Controller.Casa;

interface
uses
  System.SysUtils, System.Generics.Collections, StrUtils,
  DMDados, DAO.Casa, Model.Casa, Model.Usuario;

type
  TControllerCasa = class
    private
      FDAOCasa : TDAOCasa;
    public
      constructor Create;
      destructor Destroy; override;
      procedure Cadastrar(aModelCasa: TCasa; aUsuario: TUsuario);
      function GetNewId: String;
      function ExisteCasa(aIdUsuario: Integer; aDescricaoCasa: String): Boolean;
      procedure Vincular(aIdUsuario: Integer; aShortId: String);
      function GetCasasVinculadas(aIdUsuario: Integer): TList<TCasa>;
      procedure Desvincular(const aIdUsuario, aIdCasa: Integer);
      procedure Alterar(const aIdCasa: Integer; aDescricao: String);
  end;

implementation


{ TControllerCasa }

procedure TControllerCasa.Alterar(const aIdCasa: Integer; aDescricao: String);
begin
  try
    FDAOCasa.Alterar(aIdCasa, aDescricao);
  except
    on E: Exception do
    raise Exception.Create('Erro ao alterar a descrição da casa');
  end;
end;

procedure TControllerCasa.Cadastrar(aModelCasa: TCasa; aUsuario: TUsuario);
begin
  try
    FDAOCasa.Cadastrar(aModelCasa, aUsuario);
  except on E: Exception do
    raise Exception.Create('Erro ao cadastrar Casa' + e.Message);
  end;
end;

constructor TControllerCasa.Create;
begin
  FDAOCasa := TDAOCasa.Create(DM_Dados.FDConnection1);
end;

destructor TControllerCasa.Destroy;
begin
  FDAOCasa.Free;
  inherited;
end;

procedure TControllerCasa.Desvincular(const aIdUsuario, aIdCasa: Integer);
begin
  try
    FDAOCasa.Desvincular(aIdUsuario, aIdCasa);
  except
    on E: Exception do
    raise Exception.Create('Erro ao desvincular a casa selecionada');
  end;
end;

function TControllerCasa.GetCasasVinculadas(aIdUsuario: Integer): TList<TCasa>;
begin
  Result := FDAOCasa.GetCasasVinculadas(aIdUsuario);
end;

function TControllerCasa.GetNewId: String;
var
  lID: String;
  I: Integer;
begin
  lID := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789';

  Randomize;
  Result := EmptyStr;
  for I := 1 to 4 do
    Result := Result + lID[Random(Length(lID)) +1];
end;

procedure TControllerCasa.Vincular(aIdUsuario: Integer; aShortId: String);
begin
  try
    if FDAOCasa.ExisteCasa(aIdUsuario, FDAOCasa.GetId(aShortId)) then
      raise Exception.Create('Essa casa ja está vicunlada a este usuario');
    FDAOCasa.Vincular(aIdUsuario, aShortId);
  except on E: Exception do
    raise
  end;
end;

function TControllerCasa.ExisteCasa(aIdUsuario: Integer;
  aDescricaoCasa: String): Boolean;
begin
  try
    Result := FDAOCasa.ExisteCasa(aIdUsuario, aDescricaoCasa);
  except on E: Exception do
    Raise;
  end;
end;

end.
