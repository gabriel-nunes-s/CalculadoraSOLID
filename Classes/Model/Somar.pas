unit Somar;

interface

uses System.Generics.Collections, Modelo.Calculadora.Interfaces;

type
  TSomar = class
  private
    FLista: TList<Variant>;
    FTotal: Variant;
  public
    constructor Create;
    function Executar: Variant;
    property ListaValores: TList<Variant> read FLista write FLista;
  end;

implementation

constructor TSomar.Create;
begin
  FLista := TList<Variant>.Create;
end;

function TSomar.Executar: Variant;
var
  idx: Integer;
begin
  FTotal := FLista[0];
  for idx := 1 to Pred(FLista.Count) do
    FTotal := FTotal + FLista[idx];

  result := FTotal;
end;

end.
