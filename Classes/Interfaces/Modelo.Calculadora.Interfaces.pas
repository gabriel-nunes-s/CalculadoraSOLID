unit Modelo.Calculadora.Interfaces;

interface

type
  iModeloCalculadora = interface
  ['{EC57B8C2-8D91-4D34-AC43-8E702A2AE7F9}']
  procedure Executar;
  procedure Limpar;
  procedure Adicionar (value : Variant);
  function Total : Variant;
  end;

implementation

end.
