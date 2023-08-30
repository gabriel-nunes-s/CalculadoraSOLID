unit Calculadora;

interface

uses
  Somar, Multiplicar, Modelo.Calculadora.Interfaces, System.Generics.Collections,
  Dividir, Subtrair, Contnrs, System.SysUtils;

type
  TCalculadora = class
  private
    FLista: TList<Variant>;
    FListaOperandos : TList<Variant>;
    FTotal: Variant;
    FSomar: TSomar;
    FDiv: TDividir;
    FSub: TSubtrair;
    FMult: TMultiplicar;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LimparLista;
    procedure Adicionar(Value: Variant);
    function Total: Variant;
    procedure VerificarOperacao;
    procedure Somar(List: TList<Variant>);
    procedure Multiplicar(List: TList<Variant>);
    procedure Dividir(List: TList<Variant>);
    procedure Subtrair(List: TList<Variant>);
  end;

implementation

{ TCalculadora }

constructor TCalculadora.Create;
begin
  FSomar := TSomar.Create;
  FMult := TMultiplicar.Create;
  FDiv := TDividir.Create;
  FSub := TSubtrair.Create;
  FLista := TList<Variant>.Create;
  FListaOperandos := TList<Variant>.Create;
end;

destructor TCalculadora.Destroy;
begin
  FSomar.DisposeOf;
  FMult.DisposeOf;
  FSub.DisposeOf;
  FDiv.DisposeOf;
  FLista.DisposeOf;
  FListaOperandos.DisposeOf;
end;

procedure TCalculadora.Adicionar(Value: Variant);
begin
  FLista.Add(Value);
end;

procedure TCalculadora.LimparLista;
begin
  FLista.Clear;
  FListaOperandos.Clear;
end;

procedure TCalculadora.Dividir(List: TList<Variant>);
begin
  FDiv.ListaValores := List;
  FTotal := FTotal + FDiv.Executar;
end;

procedure TCalculadora.Multiplicar(List: TList<Variant>);
begin
  FMult.ListaValores := List;
  FTotal := FTotal + FMult.Executar;
end;

procedure TCalculadora.Somar(List: TList<Variant>);
begin
  FSomar.ListaValores := List;
  FTotal := FTotal + FSomar.Executar;

end;

procedure TCalculadora.Subtrair(List: TList<Variant>);
begin
  FSub.ListaValores := List;
  FTotal := FTotal + FSub.Executar;

end;

function TCalculadora.Total: Variant;
begin
  Result := FTotal;
end;

procedure TCalculadora.VerificarOperacao;
var
  idx: Integer;
  Item: Variant;
begin
  for idx := 0 to Pred(FLista.Count) do
  begin
    Item := FLista[idx];
    if (Item = '*') then
    begin
      FListaOperandos.Add(FLista[idx -1]);
      FListaOperandos.Add(FLista[idx +1]);
      Multiplicar(FListaOperandos);
      FListaOperandos.Clear;
    end
    else if (Item = '/') then
    begin
      FListaOperandos.Add(FLista[idx -1]);
      FListaOperandos.Add(FLista[idx +1]);
      Dividir(FListaOperandos);
      FListaOperandos.Clear;
    end
    else if (Item = '-') then
    begin
      FListaOperandos.Add(FLista[idx -1]);
      FListaOperandos.Add(FLista[idx +1]);
      Subtrair(FListaOperandos);
      FListaOperandos.Clear;
    end
    else if (Item = '+') then
    begin
      FListaOperandos.Add(FLista[idx -1]);
      FListaOperandos.Add(FLista[idx +1]);
      Somar(FListaOperandos);
      FListaOperandos.Clear;
    end;

  end;

  LimparLista;

end;


end.

