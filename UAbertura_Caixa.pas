unit UAbertura_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, URegistro, UUtilitarios;

type
  TFrmAbertura_Caixa = class(TForm)
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    Label1: TLabel;
    EdtValor: TEdit;
    EdtForma_Pagamento: TEdit;
    Label2: TLabel;
    EdtCodigo_Forma_Pagamento: TEdit;
    Label3: TLabel;
    EdtCaixa: TEdit;
    EdtCodigo_Caixa: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Forma_PagamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtForma_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Forma_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CaixaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_CaixaKeyPress(Sender: TObject; var Key: Char);
  private
    Util: UUtilitarios.TUtil;
    Mensagem: UUtilitarios.TMensagem;
    Abertura: URegistro.TAbertura_Caixa;
    Fechamento: URegistro.TFechamento_Caixa;
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmAbertura_Caixa: TFrmAbertura_Caixa;

implementation

uses UChama_Caixa, UPrincipal, UChama_Condicao_Pagamento;

{$R *.dfm}

procedure TFrmAbertura_Caixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmAbertura_Caixa.BBtnSalvarClick(Sender: TObject);
var
  valor, forma: Ansistring;
begin
  if (EdtCodigo_Forma_Pagamento.Text = '') or (EdtCodigo_Caixa.Text = '') or (EdtValor.Text = '') or (EdtValor.Text = '0,00') or (EdtValor.Text = '0') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;

  if (Application.MessageBox('Deseja realizar a abertura do caixa?', 'Atenção', MB_YESNO+MB_ICONQUESTION)) = idyes then
  begin
    valor:= FormatFLoat('#0.0,0', StrToFloat(EdtValor.Text));
    forma:= EdtForma_Pagamento.Text;
    Data_Movimento:= date;

    Abertura.Inserir;
    Fechamento.Salva_Conta(0, Codigo_Empresa, StrToInt(EdtCodigo_Caixa.Text), Codigo_Usuario, 0, 0, 0, 0, EdtForma_Pagamento.Text, 'SUPRIMENTO', 'PAGO', '+', StrToFloat(EdtValor.Text), 0, Data_Movimento);

    Codigo_Caixa:= StrToInt(EdtCodigo_Caixa.Text);
    FrmPrincipal.StbStatus.Panels[2].Text:= 'Caixa - ' + EdtCaixa.Text;
    Util.Insere_Historico(usuario, 'REALIZOU ABERTURA DO CAIXA ' + EdtCaixa.Text + '.', TimeToStr(time), insercao, date);

    BBtnSalvar.Enabled:= false;
    Habilitado:= true;
    Mensagem.Processo_Concluido;
  end;
end;

procedure TFrmAbertura_Caixa.EdtCodigo_CaixaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Caixa, FrmChama_Caixa);
      FrmChama_Caixa.ShowModal;
      FrmChama_Caixa.Free;
    end;
end;

procedure TFrmAbertura_Caixa.EdtCodigo_CaixaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAbertura_Caixa.EdtCodigo_Forma_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free;
  end;
end;

procedure TFrmAbertura_Caixa.EdtCodigo_Forma_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAbertura_Caixa.EdtForma_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAbertura_Caixa.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', ',',#08]) then
    key := #0
end;

procedure TFrmAbertura_Caixa.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmAbertura_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmAbertura_Caixa.Free;
  FrmAbertura_Caixa:= Nil;
end;

procedure TFrmAbertura_Caixa.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmAbertura_Caixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    bbtnSalvar.Enabled:= true;
  end;
end;

procedure TFrmAbertura_Caixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
