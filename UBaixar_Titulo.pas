unit UBaixar_Titulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, ComCtrls, ToolWin, ImgList, URegistro,
  DB, ADODB;

type
  TFrmBaixar_Titulo = class(TForm)
    LblValor: TLabel;
    LblN_Nota_Fiscal: TLabel;
    LblData_Vencimento: TLabel;
    LblParcela: TLabel;
    LblData_Pagamento: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label47: TLabel;
    EdtValor_Parcela: TEdit;
    EdtN_Documento: TEdit;
    MEdtData_Vencimento: TMaskEdit;
    EdtParcela: TEdit;
    MEdtData_Pagamento: TMaskEdit;
    EdtJuros: TEdit;
    EdtValor_Pagar: TEdit;
    EdtDinheiro: TEdit;
    EdtCheque_a_Vista: TEdit;
    EdtCartao: TEdit;
    EdtCheque_a_Prazo: TEdit;
    EdtDesconto: TEdit;
    MmoObservacoes: TMemo;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    EdtOperacao_Bancaria: TEdit;
    EdtTipo_Operacao: TEdit;
    EdtConta: TEdit;
    RGStatus: TRadioGroup;
    EdtCheque: TEdit;
    Label8: TLabel;
    EdtCodigo_Conta: TEdit;
    Label10: TLabel;
    EdtCodigo_Cheque: TEdit;
    Label11: TLabel;
    EdtCodigo_Operacao: TEdit;
    SPAtualiza_Status_Conta: TADOStoredProc;
    SPAtualiza_Status_Conta_Tudo: TADOStoredProc;
    SPAtualiza_Saldo_Bancario: TADOStoredProc;
    CBBanco: TCheckBox;
    Label3: TLabel;
    Label12: TLabel;
    EdtSaldo_Atual: TEdit;
    EdtNovo_Saldo: TEdit;
    Label13: TLabel;
    Label16: TLabel;
    EdtLancamento_Bancario: TEdit;
    EdtCodigo_Lancamento_Bancario: TEdit;
    Label14: TLabel;
    EdtValor_Operacao_Bancaria: TEdit;
    procedure EdtCodigo_CaixaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ChequeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_OperacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_PagamentoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_ParcelaExit(Sender: TObject);
    procedure EdtDinheiroExit(Sender: TObject);
    procedure EdtCheque_a_VistaExit(Sender: TObject);
    procedure EdtCheque_a_PrazoExit(Sender: TObject);
    procedure EdtCartaoExit(Sender: TObject);
    procedure EdtJurosExit(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure EdtValor_PagarExit(Sender: TObject);
    procedure EdtValor_PagarEnter(Sender: TObject);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure MmoObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtDinheiroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCheque_a_VistaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCheque_a_PrazoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCartaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtJurosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_PagarKeyPress(Sender: TObject; var Key: Char);
    procedure CBBancoClick(Sender: TObject);
    procedure EdtCodigo_ContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ChequeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_OperacaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtOperacao_BancariaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_OperacaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNovo_SaldoEnter(Sender: TObject);
    procedure EdtSaldo_AtualKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNovo_SaldoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSaldo_AtualExit(Sender: TObject);
    procedure EdtNovo_SaldoExit(Sender: TObject);
    procedure EdtCodigo_Lancamento_BancarioKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Lancamento_BancarioKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtLancamento_BancarioKeyPress(Sender: TObject; var Key: Char);
  private
    //Util: UGeral.TUtil;
    Movimento_Caixa: URegistro.TMovimento_Caixa;
    Lancamento_Banco: URegistro.TLancamento_Banco;
    Fechamento: URegistro.TFechamento_Caixa;
    procedure Atualiza_Status_Conta;
    procedure Verifica_Banco;
    procedure Verifica_Valor_Maior_Lancamento_Bancario;
    { Private declarations }
  public
    ativo: boolean;
  protected
    function Confira: boolean;
    { Public declarations }
  end;

var
  FrmBaixar_Titulo: TFrmBaixar_Titulo;

implementation

uses UChama_Caixa, UChama_Conta_Corrente, UChama_Cheque,
  UChama_Operacao_Bancaria, UChama_Lancamentos_Financeiros, UDM, UUtilitarios ,
  UChama_Usuario, UChama_Lancamento_Banco, ULog;

{$R *.dfm}
procedure TFrmBaixar_Titulo.Atualiza_Status_Conta;
var
  cod_l_bancario: integer;
begin
  if (EdtCodigo_Lancamento_Bancario.Text = '') then
    cod_l_bancario:= 0
  else
    cod_l_bancario:= StrToInt(EdtCodigo_Lancamento_Bancario.Text);

  if (FrmChama_Lancamentos_Financeiros.CBBaixa.Checked = false) then
  begin
    {with SPAtualiza_Status_Conta do
    begin
      Parameters.ParamByName('@Codigo').Value:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCodigo.AsInteger;
      Parameters.ParamByName('@Parcela').Value:= StrtoInt(EdtParcela.Text);
      Parameters.ParamByName('@Status').Value:= 'PAGO';
      Parameters.ParamByName('@Data_Pagamento').Value:= StrToDateTime(MEdtData_Pagamento.Text);
      Parameters.ParamByName('@Cheque').Value:= EdtCheque.Text;
      Parameters.ParamByName('@Conta').Value:= EdtConta.Text;
      ExecProc;
    end;}
    Util.Atualiza_Status_Conta(FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCodigo.AsInteger,
                               StrtoInt(EdtParcela.Text),
                               'PAGO',
                               StrToDateTime(MEdtData_Pagamento.Text),
                               EdtCheque.Text,
                               EdtConta.Text,
                               cod_l_bancario);
  end
  else
  begin
    FrmChama_Lancamentos_Financeiros.qrychama_lancamento.First;
    while not FrmChama_Lancamentos_Financeiros.qrychama_lancamento.Eof do
    begin
      if (FrmChama_Lancamentos_Financeiros.DBGrid1.SelectedRows.CurrentRowSelected) then
      begin
        with SPAtualiza_Status_Conta do
        begin
          Parameters.ParamByName('@Codigo').Value:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCodigo.AsString;
          Parameters.ParamByName('@Parcela').Value:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoParcela.AsString;
          Parameters.ParamByName('@Status').Value:= 'PAGO';
          Parameters.ParamByName('@Data_Pagamento').Value:= StrToDateTime(MEdtData_Pagamento.Text);
          Parameters.ParamByName('@Cheque').Value:= EdtCheque.Text;
          Parameters.ParamByName('@Conta').Value:= EdtConta.Text;
          ExecProc;
        end;
        FrmChama_Lancamentos_Financeiros.qrychama_lancamento.Next;
      end
      else
        FrmChama_Lancamentos_Financeiros.qrychama_lancamento.Next;
    end;
  end;
end;

procedure TFrmBaixar_Titulo.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmBaixar_Titulo.BBtnSalvarClick(Sender: TObject);
var
  tipo_doc, tipo, tipo_pag: AnsiString;
begin
  if (Confira = true) then
    begin

      if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
      begin

        if (CBBanco.Checked = false) then
          tipo_doc:= 'PAGAS'
        else
          tipo_doc:= 'PAGAS - BANCO';

        tipo:= '-';
      end
      else
      begin

        if (CBBanco.Checked = false) then
          tipo_doc:= 'RECEBIDAS'
        else
          tipo_doc:= 'RECEB. - BANCO';

        tipo:= '+';
      end;

      if (FrmChama_Lancamentos_Financeiros.CBBaixa.Checked = false) then
      begin
        if (EdtDinheiro.Text <> '0,00') and (EdtDinheiro.Text <> '0') then         //o 2 0(zero), se for 0 gera movimento, se for 1, nao gera movimento
          Fechamento.Salva_Conta(0, Codigo_Empresa, Codigo_Caixa, Codigo_Usuario, 0, 0, StrToInt(EdtN_Documento.Text), StrToInt(EdtParcela.Text), 'DINHEIRO', tipo_doc, 'PAGO', tipo, StrToFloat(EdtValor_Pagar.Text), 0, date);

        if (EdtCheque_a_Vista.Text <> '0,00') and (EdtCheque_a_Vista.Text <> '0') then
          Fechamento.Salva_Conta(0, Codigo_Empresa, Codigo_Caixa, Codigo_Usuario, 0, 0, StrToInt(EdtN_Documento.Text), StrToInt(EdtParcela.Text), 'CHEQUE VISTA', tipo_doc, 'PAGO', tipo, StrToFloat(EdtValor_Pagar.Text), 0, date);

        if (EdtCheque_a_Prazo.Text <> '0,00') and (EdtCheque_a_Prazo.Text <> '0') then
          Fechamento.Salva_Conta(0, Codigo_Empresa, Codigo_Caixa, Codigo_Usuario, 0, 0, StrToInt(EdtN_Documento.Text), StrToInt(EdtParcela.Text), 'CHEQUE PRAZO', tipo_doc, 'PAGO', tipo, StrToFloat(EdtValor_Pagar.Text), 0, date);

        Movimento_Caixa.Inserir;
      end
      else
      begin
        if (EdtCheque_a_Vista.Text <> '0,00') and (EdtCheque_a_Vista.Text <> '0') then
          tipo_pag:= 'CHEQUE VISTA'
        else if (EdtCheque_a_Prazo.Text <> '0,00') and (EdtCheque_a_Prazo.Text <> '0') then
          tipo_pag:= 'CHEQUE PRAZO'
        else
          tipo_pag:= 'DINHEIRO';

        FrmChama_Lancamentos_Financeiros.qrychama_lancamento.First;
        while not FrmChama_Lancamentos_Financeiros.qrychama_lancamento.Eof do
        begin
          if (FrmChama_Lancamentos_Financeiros.DBGrid1.SelectedRows.CurrentRowSelected) then
          begin
            Fechamento.Salva_Conta(0, Codigo_Empresa, Codigo_Caixa, Codigo_Usuario, 0, 0, FrmChama_Lancamentos_Financeiros.qrychama_lancamentoN_Documento.AsInteger, FrmChama_Lancamentos_Financeiros.qrychama_lancamentoParcela.AsInteger, tipo_pag, tipo_doc, 'PAGO', tipo, FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor.AsFloat, 0, date);
            Movimento_Caixa.Inserir;
            FrmChama_Lancamentos_Financeiros.qrychama_lancamento.Next;
          end
          else
            FrmChama_Lancamentos_Financeiros.qrychama_lancamento.Next;
        end;

      end;

      if (CBBanco.Checked) then
      begin
        //if (Application.MessageBox('Atualizar saldo bancário?', 'Atenção', MB_YESNO+MB_ICONQUESTION)) = idyes then
        //begin
          Lancamento_Banco.Inserir(Lancamento_Banco, StrToFloat(EdtSaldo_Atual.Text), StrToFloat(EdtNovo_Saldo.Text), 0, 0, 0);

          if (RGStatus.ItemIndex = 1) then
            Util.Atualiza_Saldo_Bancario( StrToInt(EdtCodigo_Conta.Text), StrToFloat(EdtValor_Pagar.Text), EdtTipo_Operacao.Text, 0);

          if (RGStatus.ItemIndex = 1) and (EdtCodigo_Cheque.Text <> '') then
            Util.Atualiza_Cheque(StrToDateTime(MEdtData_Pagamento.Text), 'BAIXADO', StrToInt(EdtCodigo_Cheque.Text));
        //end;
      end;

      Atualiza_Status_Conta;
    end;

    Util.Insere_Historico(usuario, 'BAIXOU TÍTULO A PAGAR/RECEBER NÚMERO ' + EdtN_Documento.Text + '.', TimeToStr(time), alteracao, date);
    Mensagem.Processo_Concluido;
    Close;
    FrmChama_Lancamentos_Financeiros.qrychama_lancamento.close;
    FrmChama_Lancamentos_Financeiros.qrychama_lancamento.open;
    FrmChama_Lancamentos_Financeiros.CBBaixa.Checked:= false;
end;

procedure TFrmBaixar_Titulo.CBBancoClick(Sender: TObject);
begin
  if (CBBanco.Checked) then
    begin
      FrmBaixar_Titulo.Height:= 369;
      //TlbFerramentas.Height:= 339;
      //Label3.Visible:= false;
      //EdtCaixa.Visible:= false;
      //EdtCodigo_Caixa.Visible:= false;
    end
    else
    begin
      FrmBaixar_Titulo.Height:= 253;
      //TlbFerramentas.Height:= 262;
      //Label3.Visible:= true;
      //EdtCaixa.Visible:= true;
      //EdtCodigo_Caixa.Visible:= true;
    end;
end;

function TFrmBaixar_Titulo.Confira: boolean;
begin
  Confira:= false;
  if MEdtData_Pagamento.Text = '  /  /    ' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      MEdtData_Pagamento.SetFocus;
      abort;
    end;

  if (EdtValor_Pagar.Text = '') or (EdtValor_Pagar.Text = '0,00') then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtValor_Pagar.SetFocus;
      abort;
    end;

    if (CBBanco.Checked) then
    begin
      if (EdtCodigo_Conta.Text = '') then
        begin
          Mensagem.Mensagem_Falta_Dados;
          EdtCodigo_Conta.SetFocus;
          abort;
        end;

      if (EdtCodigo_Operacao.Text = '') then
        begin
          Mensagem.Mensagem_Falta_Dados;
          EdtCodigo_Operacao.SetFocus;
          abort;
        end;

      if (EdtSaldo_Atual.Text = '') then
        begin
          Mensagem.Mensagem_Falta_Dados;
          EdtSaldo_Atual.SetFocus;
          abort;
        end;

      if (EdtNovo_Saldo.Text = '') then
        begin
          Mensagem.Mensagem_Falta_Dados;
          EdtNovo_Saldo.SetFocus;
          abort;
        end;

        Verifica_Banco;
    end;

    if (EdtCodigo_Lancamento_Bancario.Text <> '') then
    begin
      Verifica_Valor_Maior_Lancamento_Bancario;
    end;

    Confira:= true;
end;

procedure TFrmBaixar_Titulo.EdtCartaoExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtCartao, StrToFloat(EdtCartao.Text));
end;

procedure TFrmBaixar_Titulo.EdtCartaoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtCheque_a_PrazoExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtCheque_a_Prazo, StrToFloat(EdtCheque_a_Prazo.Text));
end;

procedure TFrmBaixar_Titulo.EdtCheque_a_PrazoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtCheque_a_VistaExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtCheque_a_Vista, StrToFloat(EdtCheque_a_Vista.Text));
end;

procedure TFrmBaixar_Titulo.EdtCheque_a_VistaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtCodigo_CaixaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Caixa, FrmChama_Caixa);
      FrmChama_Caixa.ShowModal;
      FrmChama_Caixa.Free;
    end;
end;

procedure TFrmBaixar_Titulo.EdtCodigo_ChequeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Cheque, FrmChama_Cheque);
      FrmChama_Cheque.ShowModal;
      FrmChama_Cheque.Free;
    end;
end;

procedure TFrmBaixar_Titulo.EdtCodigo_ChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtCodigo_ContaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
      FrmChama_Conta_Corrente.ShowModal;
      FrmChama_Conta_Corrente.Free;
    end;
end;

procedure TFrmBaixar_Titulo.EdtCodigo_ContaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtCodigo_Lancamento_BancarioKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Lancamento_Banco, FrmChama_Lancamento_Banco);
      FrmChama_Lancamento_Banco.ShowModal;
      FrmChama_Lancamento_Banco.Free;
    end;
end;

procedure TFrmBaixar_Titulo.EdtCodigo_Lancamento_BancarioKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtCodigo_OperacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Operacao_Bancaria, FrmChama_Operacao_Bancaria);
      FrmChama_Operacao_Bancaria.ShowModal;
      FrmChama_Operacao_Bancaria.Free;
    end;
end;

procedure TFrmBaixar_Titulo.EdtCodigo_OperacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtDescontoExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtDesconto, StrToFloat(EdtDesconto.Text));
end;

procedure TFrmBaixar_Titulo.EdtDescontoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtDinheiroExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtDinheiro, StrToFloat(EdtDinheiro.Text));
end;

procedure TFrmBaixar_Titulo.EdtDinheiroKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtJurosExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtJuros, StrToFloat(EdtJuros.Text));
end;

procedure TFrmBaixar_Titulo.EdtJurosKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtLancamento_BancarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtNovo_SaldoEnter(Sender: TObject);
var
  valor_op, saldo_atual, novo_saldo: double;
begin
  valor_op:= StrToFloat(EdtValor_Pagar.Text);
  saldo_atual:= StrToFloat(EdtSaldo_Atual.Text);

  if (RGStatus.ItemIndex = 1) then
  begin
    if (EdtTipo_Operacao.Text = 'DÉBITO') then
      novo_saldo:= saldo_atual - valor_op
    else if (EdtTipo_Operacao.Text = 'CRÉDITO') then
      novo_saldo:= saldo_atual + valor_op;
  end
  else
  begin
    novo_saldo:= StrToFloat(EdtSaldo_Atual.Text);
  end;

  Util.FormataFloat(2, EdtNovo_Saldo, novo_saldo);
end;

procedure TFrmBaixar_Titulo.EdtNovo_SaldoExit(Sender: TObject);
begin
  if (EdtNovo_Saldo.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    Abort;
  end;

end;

procedure TFrmBaixar_Titulo.EdtNovo_SaldoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtOperacao_BancariaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtSaldo_AtualExit(Sender: TObject);
begin
  if (EdtSaldo_Atual.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    Abort;
  end;

end;

procedure TFrmBaixar_Titulo.EdtSaldo_AtualKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtTipo_OperacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtValor_PagarEnter(Sender: TObject);
var
  vpar, j, des, res, tro: double;
begin
  vpar:= StrtoFloat(EdtValor_Parcela.Text);
  j:= StrtoFloat(EdtJuros.Text);
  des:= StrToFloat(EdtDesconto.Text);
  res:= vpar + j - des;
  EdtValor_Pagar.Text:= Floattostr(res);
  Util.FormataFloat(2, EdtValor_Pagar, StrToFloat(EdtValor_Pagar.Text));
end;

procedure TFrmBaixar_Titulo.EdtValor_PagarExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtValor_Pagar, StrToFloat(EdtValor_Pagar.Text));
end;

procedure TFrmBaixar_Titulo.EdtValor_PagarKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtValor_ParcelaExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtValor_Parcela, StrToFloat(EdtValor_Parcela.Text));
end;

procedure TFrmBaixar_Titulo.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmBaixar_Titulo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  //FrmBaixar_Titulo.Free;
  FrmBaixar_Titulo:= Nil;
end;

procedure TFrmBaixar_Titulo.FormCreate(Sender: TObject);
begin
  //CBBanco.Checked:= true;
end;

procedure TFrmBaixar_Titulo.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmBaixar_Titulo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmBaixar_Titulo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmBaixar_Titulo.MEdtData_PagamentoEnter(Sender: TObject);
begin
  MEdtData_Pagamento.Text:= DateToStr(date);
end;

procedure TFrmBaixar_Titulo.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmBaixar_Titulo.Verifica_Banco;
begin
  if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) and (EdtTipo_Operacao.Text = 'CRÉDITO') then
  begin
    Application.MessageBox('Por favor, verifique o tipo de operação.', 'Operação errada', MB_OK+MB_ICONHAND);
    abort;
  end;

  if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) and (EdtTipo_Operacao.Text = 'DÉBITO') then
  begin
    Application.MessageBox('Por favor, verifique o tipo de operação.', 'Operação errada', MB_OK+MB_ICONHAND);
    abort;
  end;

end;

procedure TFrmBaixar_Titulo.Verifica_Valor_Maior_Lancamento_Bancario;
var
  qAux: TADOQuery;
  valor_operacao_bancaria, valor_pagar: double;
begin
  try
    //try
      TLog.Debug('---Método para verificar se o valor da parcela + a somatória dos lançamentos bancários é maior que o permitido---');
      TLog.Debug(' ');
      valor_operacao_bancaria:= StrToFloat(EdtValor_Operacao_Bancaria.Text);
      valor_pagar:= StrToFloat(EdtValor_Pagar.Text);

      qAux:= TADOQuery.Create(nil);
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        Clear;
        Add('select sum(Valor) as Valor from Parcelas_Lancamentos');
        add('where Status = :Status and Codigo_Lancamento_Bancario = :CLB');
        Parameters.ParamByName('Status').Value:= 'PAGO';
        Parameters.ParamByName('CLB').Value:= StrToInt(EdtCodigo_Lancamento_Bancario.Text);
        open;

        TLog.Debug('Valor já encontrado para o código do lançamento '+EdtCodigo_Lancamento_Bancario.Text+': '+qAux.FieldByName('Valor').AsString);
        if (IsEmpty = false) then
        begin
          if (qAux.FieldByName('Valor').AsFloat + valor_pagar) > valor_operacao_bancaria then
          begin
            TLog.Debug('Valor da parcela + a somatória das contas já pagas por esse mesmo lançamento bancário é maior que o valor da operação bancária.');
            Application.MessageBox(PWideChar('O valor da parcela somado com as contas já pagas com esse lançamento bancário é maior que o valor do lançamento bancário. Por favor, verifique.'+#10+#13+#10+#13+'Somatório das contas já pagas com essa conta: '+FormatFloat('#0.0,0',qAux.FieldByName('Valor').AsFloat)+#10+#13+'Valor da operação: '+FloatToStr(valor_pagar)+#10+#13+'Valor do lançamento bancário: '+EdtValor_Operacao_Bancaria.Text), 'Atenção', MB_OK+MB_ICONHAND);
            abort;
          end
          else
            TLog.Debug('Valor da parcela + a somatória das contas já pagas por esse mesmo lançamento bancário é menor que o valor da operação bancária.');
        end;
      end;
    //except on e:Exception do
    //begin
    //  Application.MessageBox(PWideChar('Erro ao verificar se valor da operação está acima do permitido: '+e.Message), 'Erro', MB_OK+MB_ICONHAND);
    //  TLog.Error('Erro ao verificar se valor da operação está acima do permitido: '+e.Message);
    //end;
    //end;
    TLog.Debug('---FIM DO MÉTODO---');
  finally
    FreeAndNil(qAux);
  end;
end;

end.
