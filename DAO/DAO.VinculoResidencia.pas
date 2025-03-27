unit DAO.VinculoResidencia;

interface

uses
  DMDados,
  System.SysUtils,
  DB,
  FireDAC.Comp.Client;
type
  TDAOVinculoResidencia = class
    private
      FCOnn :TFDConnection;
    public
      constructor Create;
      Destructor Destroy; override;
      function ExiteVincResidencia(aIdCasa: Integer; aShortId: String): Boolean;
  end;

implementation

{ TDAOVinculoResidencia }

constructor TDAOVinculoResidencia.Create;
begin

end;

destructor TDAOVinculoResidencia.Destroy;
begin

  inherited;
end;

function TDAOVinculoResidencia.ExiteVincResidencia(aIdCasa: Integer;
  aShortId: String): Boolean;
var
  lQuery: TFDQuery;

begin


end;

end.
