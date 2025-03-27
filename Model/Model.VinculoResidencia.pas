unit Model.VinculoResidencia;

interface

type
  TVinculoResidencia = class
    private
    FDescricao: String;
    FShortId: String;
    FId_Casa: Integer;
    public
      property Id_Casa: Integer read FId_Casa write FId_Casa;
      property Descricao: String read FDescricao write FDescricao;
      property ShortId: String read FShortId write FShortId;
  end;

implementation

end.
