unit Dividir;

interface

uses System.Generics.Collections, Modelo.Calculadora.Interfaces;

type
  TDividir = class
  private
    FLista: TList<Variant>;
    FTotal: Variant;
  public
    constructor Create;
    function Executar: Variant;
    property ListaValores: TList<Variant> read FLista write FLista;
  end;

implementation

constructor TDividir.Create;
begin
  FLista := TList<Variant>.Create;
end;

function TDividir.Executar: Variant;
var
  idx: Integer;
begin
  FTotal := FLista[0];
  for idx := 1 to Pred(FLista.Count) do
    FTotal := FTotal / FLista[idx];

  result := FTotal;
end;

end.
