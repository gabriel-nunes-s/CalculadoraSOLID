unit Calculadora;

interface

uses Somar, Multiplicar, Modelo.Calculadora.Interfaces, System.Generics.Collections,
  Dividir, Subtrair;

type
  TCalculadora = class
  private
    FLista: TList<Integer>;
    FListaOperacao: TList<String>;
    FTotal: Integer;
    FSomar: TSomar;
    FDiv: TDividir;
    FSub: TSubtrair;
    FMult: TMultiplicar;
    //
  public
    constructor Create;
    destructor Destroy; override;
    //
    procedure Limpar;
    procedure Adicionar(Value: Integer);
    procedure AdicionarOperacao(operacao: String);
    function Total: Integer;
    procedure Somar;
    procedure Multiplicar;
    procedure Dividir;
    procedure Subtrair;
  end;

implementation

{ TCalculadora }

//Construtor
constructor TCalculadora.Create;
begin
  FSomar := TSomar.Create;
  FMult := TMultiplicar.Create;
  FDiv := TDividir.Create;
  FSub := TSubtrair.Create;
  FLista := TList<Integer>.Create;
end;

//Destrutor
destructor TCalculadora.Destroy;
begin
  FSomar.DisposeOf;
  FMult.DisposeOf;
  FSub.DisposeOf;
  FDiv.DisposeOf;
end;

//Procedimentos para adicionar e limpar (sem retorno)
procedure TCalculadora.Adicionar(Value: Integer);
begin
  FLista.Add(Value);
end;

procedure TCalculadora.AdicionarOperacao(operacao: string);
begin
  FListaOperacao.Add(operacao);
end;

procedure TCalculadora.Limpar;
begin
  FLista.Clear;
end;

//Procedimentos operacoes
procedure TCalculadora.Dividir;
begin
  FDiv.ListaValores := FLista;
  FTotal := FDiv.Executar;
end;

procedure TCalculadora.Multiplicar;
begin
  FMult.ListaValores := FLista;
  FTotal := FMult.Executar;
end;

procedure TCalculadora.Somar;
begin
  FSomar.ListaValores := FLista;
  FTotal := FSomar.Executar;

end;

procedure TCalculadora.Subtrair;
begin
  FSub.ListaValores := FLista;
  FTotal := FSub.Executar;

end;

//Retorna o valor total
function TCalculadora.Total: Integer;
begin
  result := FTotal;
end;

end.