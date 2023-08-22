program Project1;

uses
  Vcl.Forms,
  TelaCalculadora in 'TelaCalculadora.pas' {Form1},
  Modelo.Calculadora.Interfaces in 'Classes\Interfaces\Modelo.Calculadora.Interfaces.pas',
  Dividir in 'Classes\Model\Dividir.pas',
  Somar in 'Classes\Model\Somar.pas',
  Multiplicar in 'Classes\Model\Multiplicar.pas',
  Subtrair in 'Classes\Model\Subtrair.pas',
  Calculadora in 'Classes\Calculadora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
