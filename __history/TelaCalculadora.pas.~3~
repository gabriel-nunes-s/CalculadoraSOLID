unit TelaCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Calculadora;

type
  TForm1 = class(TForm)
    LabelResultado: TLabel;
    Label2: TLabel;
    ButtonSoma: TButton;
    ButtonSubtracao: TButton;
    ButtonMultiplicacao: TButton;
    ButtonDivisao: TButton;
    ButtonCalcular: TButton;
    ButtonNum1: TButton;
    ButtonNum2: TButton;
    ButtonNum3: TButton;
    ButtonNum4: TButton;
    ButtonNum5: TButton;
    ButtonNum6: TButton;
    ButtonNum7: TButton;
    ButtonNum8: TButton;
    ButtonNum9: TButton;
    ButtonNum0: TButton;
    ButtonLimpar: TButton;
    LabelOperacao: TLabel;
    procedure ButtonSomaClick(Sender: TObject);
    procedure ButtonNumClick(Sender: TObject);
    procedure ButtonLimparClick(Sender: TObject);
  private

  public
    calc: TCalculadora;
    procedure CarregarValores;
    procedure MostrarTotal;
    constructor Create;
    destructor Destroy; override;
  end;

var
  Form1: TForm1;

implementation

constructor TForm1.Create;
begin
  calc := TCalculadora.Create;
end;

destructor TForm1.Destroy;
begin
  calc.DisposeOf;
end;

{$R *.dfm}

//Ao clicar no botao, mostra o texto referente ao caption do botao clicado
procedure TForm1.ButtonNumClick(Sender: TObject);
begin
  LabelResultado.Caption := LabelResultado.Caption + (Sender as TButton).Caption;
end;

//Botoes de Operacao
procedure TForm1.ButtonSomaClick(Sender: TObject);
begin
  CarregarValores;
  calc.Somar;

end;

procedure TForm1.ButtonLimparClick(Sender: TObject);
begin
  LabelResultado.Caption := '';
  LabelOperacao.Caption := '';
end;

procedure TForm1.CarregarValores;
begin
  calc.Adicionar(StrToInt(LabelResultado.Caption));
end;

procedure TForm1.MostrarTotal;
begin
  LabelResultado.Caption := IntToStr(calc.Total);
end;


end.
