unit Dividir;

interface

uses System.Generics.Collections, Modelo.Calculadora.Interfaces;

type
  TDividir = class
  private
    FLista: TList<Integer>;
    FTotal: Integer;
  public
    constructor Create;
    function Executar: Integer;
    property ListaValores: TList<Integer> read FLista write FLista;
  end;

implementation

constructor TDividir.Create;
begin
  FLista := TList<Integer>.Create;
end;

function TDividir.Executar: Integer;
var
  idx: Integer;
begin
  FTotal := FLista[0];
  for idx := 1 to Pred(FLista.Count) do
    FTotal := FTotal div FLista[idx];

  result := FTotal;
end;

end.
