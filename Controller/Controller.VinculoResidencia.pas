unit Controller.VinculoResidencia;

interface

uses Model.VinculoResidencia;
type
  TControllerVincResidencia = class
    private
    public
      constructor Create;
      destructor Destroy; override;
      function ValidarShortId(aModelShotId: TVinculoResidencia

  end;

implementation

{ TControllerVincResidencia }

constructor TControllerVincResidencia.Create;
begin

end;

destructor TControllerVincResidencia.Destroy;
begin

  inherited;
end;

end.
