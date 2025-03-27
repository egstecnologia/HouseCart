unit Model.Casa;

interface
uses
  System.Generics.Collections, System.Classes;
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
  TListCasa = TList<TCasa>
    private

    public
  end;


implementation

end.
