unit Controller.Casa;

interface
uses
  System.SysUtils, StrUtils, DMDados, DAO.Casa, Model.Casa, Model.Usuario;

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
  end;

implementation


{ TControllerCasa }

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
