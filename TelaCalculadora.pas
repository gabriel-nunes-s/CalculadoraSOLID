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
    procedure FormCreate(Sender: TObject);
    procedure ButtonCalcularClick(Sender: TObject);
    procedure ButtonSubtracaoClick(Sender: TObject);
    procedure ButtonMultiplicacaoClick(Sender: TObject);
    procedure ButtonDivisaoClick(Sender: TObject);
  private

  public
    calc: TCalculadora;
    procedure CarregarValores(Operacao: String);
    procedure MostrarTotal;
    procedure Limpar;

  end;

var
  Form1: TForm1;

implementation

  {$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  calc := TCalculadora.Create;
end;

//Ao clicar no botao, mostra o texto referente ao caption do botao clicado
procedure TForm1.ButtonNumClick(Sender: TObject);
begin
  LabelResultado.Caption := LabelResultado.Caption + (Sender as TButton).Caption;
end;

//Botoes de Operacao
procedure TForm1.ButtonSomaClick(Sender: TObject);
begin
  CarregarValores('+');
  Limpar;

end;

procedure TForm1.ButtonSubtracaoClick(Sender: TObject);
begin
  CarregarValores('-');
  Limpar;
end;

procedure TForm1.ButtonCalcularClick(Sender: TObject);
begin
  CarregarValores('=');
  calc.VerificarOperacao;
  MostrarTotal;
  calc.LimparLista;
  calc.LimparListaOperacao;
end;

procedure TForm1.ButtonDivisaoClick(Sender: TObject);
begin
  CarregarValores('/');
  Limpar;
end;

procedure TForm1.ButtonLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TForm1.ButtonMultiplicacaoClick(Sender: TObject);
begin
  CarregarValores('*');
  Limpar;

end;

procedure TForm1.CarregarValores(Operacao: String);
begin
  calc.Adicionar(StrToInt(LabelResultado.Caption));
  calc.AdicionarOperacao(Operacao);
end;

procedure TForm1.MostrarTotal;
begin
  LabelResultado.Caption := IntToStr(calc.Total);
end;

procedure TForm1.Limpar;
begin
  LabelResultado.Caption := '';
  LabelOperacao.Caption := '';
end;


end.
