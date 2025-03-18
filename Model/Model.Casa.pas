unit Model.Casa;

interface

type
  TCasa = class
    private
    FDescricao: String;
    FShortId: String;
    FID_CASA: Integer;
    public
      property ID_CASA: Integer read FID_CASA write FID_CASA;
      property Descricao: String read FDescricao write FDescricao;
      property ShortId : String read FShortId write FShortId;
  end;

implementation

end.
