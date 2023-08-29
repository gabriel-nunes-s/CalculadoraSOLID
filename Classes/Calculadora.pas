unit Calculadora;

interface

uses
  Somar, Multiplicar, Modelo.Calculadora.Interfaces, System.Generics.Collections,
  Dividir, Subtrair, Contnrs;

type
  TCalculadora = class
  private
    FLista: TList<Variant>;
    FPilhaOperandos: TList<Integer>;
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
    procedure RealizarOperacao(Operacao: String);
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
  FPilhaOperandos := TList<Integer>.Create;
end;

destructor TCalculadora.Destroy;
begin
  FSomar.DisposeOf;
  FMult.DisposeOf;
  FSub.DisposeOf;
  FDiv.DisposeOf;
  FPilhaOperandos.Free;
end;

procedure TCalculadora.Adicionar(Value: Variant);
begin
  FLista.Add(Value);
end;

procedure TCalculadora.LimparLista;
begin
  FLista.Clear;
  FPilhaOperandos.Clear;
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
  for idx := 0 to FLista.Count - 1 do
  begin
    Item := FLista[idx];
    if Item.isNumeric then
    begin
      FPilhaOperandos.Add(Item);
    end
    else
    begin
      RealizarOperacao(Item);
    end;
  end;
end;

procedure TCalculadora.RealizarOperacao(Operacao: String);
var
  Operando2, Operando1: Integer;
  FListaOperandos: TList<Variant>;
begin
  if FPilhaOperandos.Count >= 2 then
  begin
    Operando2 := FPilhaOperandos[FPilhaOperandos.Count - 1];
    FPilhaOperandos.Delete(FPilhaOperandos.Count - 1);

    Operando1 := FPilhaOperandos[FPilhaOperandos.Count - 1];
    FPilhaOperandos.Delete(FPilhaOperandos.Count - 1);

    FListaOperandos.Add(Operando2);
    FListaOperandos.Add(Operando1);

    if Operacao = '+' then
      begin
        Somar(FListaOperandos);
      end
      else if Operacao = '-' then
        begin
          Subtrair(FListaOperandos);
        end
        else if Operacao = '*' then
          begin
            Multiplicar(FListaOperandos);
          end
          else if Operacao = '/' then
            begin
              Dividir(FListaOperandos);
            end;

  end;
end;

end.

