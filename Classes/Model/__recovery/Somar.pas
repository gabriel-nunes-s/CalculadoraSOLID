unit Somar;

interface

uses System.Generics.Collections, Modelo.Calculadora.Interfaces;

type
  TSomar = class
  private
    FLista: TList<Integer>;
    FTotal: Integer;
  public
    constructor Create;
    function Executar: Integer;
    property ListaValores: TList<Integer> read FLista write FLista;
  end;

implementation

constructor TSomar.Create;
begin
  FLista := TList<Integer>.Create;
end;

function TSomar.Executar: Integer;
var
  idx: integer;
begin
  FTotal := 0;
  for idx := 0 to Pred(FLista.Count) do
    FTotal := FTotal + FLista[idx];

  result := FTotal;
end;

end.
