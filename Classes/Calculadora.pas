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
    procedure LimparLista;
    procedure LimparListaOperacao;
    procedure Adicionar(Value: Integer);
    procedure AdicionarOperacao(Value: String);
    function Total: Integer;
    procedure VerificarOperacao;
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
  FListaOperacao := TList<String>.Create;
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

procedure TCalculadora.AdicionarOperacao(Value: string);
begin
  FListaOperacao.Add(Value);
end;

procedure TCalculadora.LimparLista;
begin
  FLista.Clear;
end;

procedure TCalculadora.LimparListaOperacao;
begin
  FListaOperacao.Clear;
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

procedure TCalculadora.VerificarOperacao;
begin
  if FListaOperacao[0] = '+' then
  begin
    Somar;
  end
  else if FListaOperacao[0] = '-' then
  begin
    Subtrair;
  end
  else if FListaOperacao[0] = '*' then
  begin
    Multiplicar;
  end
  else if FListaOperacao[0] = '/' then
  begin
    Dividir;
  end;

end;

end.