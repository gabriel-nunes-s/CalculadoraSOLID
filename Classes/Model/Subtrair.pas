unit Subtrair;

interface

uses System.Generics.Collections, Modelo.Calculadora.Interfaces;

type
  TSubtrair = class
  private
    FLista: TList<Integer>;
    FTotal: Variant;
  public
    constructor Create;
    function Executar: Integer;
    property ListaValores: TList<Integer> read FLista write FLista;
  end;

implementation

constructor TSubtrair.Create;
begin
  FLista := TList<Integer>.Create;
end;

function TSubtrair.Executar: Integer;
var
  idx: integer;
begin
  FTotal := FLista[0];
  for idx := 1 to Pred(FLista.Count) do
    FTotal := FTotal - FLista[idx];

  result := FTotal;
end;

end.
