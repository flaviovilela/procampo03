unit ULancamento_Banco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, URegistro,
  ExtCtrls, UUtilitarios;

type
  TFrmLancamento_Banco = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    BBtnPesquisar: TToolButton;
    LblMarca: TLabel;
    EdtDocumento: TEdit;
    Label6: TLabel;
    EdtPlano: TEdit;
    EdtCodigo_Plano: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    MEdtData_Lancamento: TMaskEdit;
    EdtValor: TEdit;
    Label16: TLabel;
    EdtDescricao: TEdit;
    Label1: TLabel;
    EdtConta: TEdit;
    EdtCodigo_Conta: TEdit;
    Label2: TLabel;
    EdtCodigo_Operacao: TEdit;
    EdtOperacao_Bancaria: TEdit;
    EdtTipo_Operacao: TEdit;
    RGStatus: TRadioGroup;
    SPAtualiza_Saldo_Bancario: TADOStoredProc;
    Label3: TLabel;
    EdtCheque: TEdit;
    EdtCodigo_Cheque: TEdit;
    Label4: TLabel;
    EdtSaldo_Atual: TEdit;
    Label5: TLabel;
    EdtNovo_Saldo: TEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label10: TLabel;
    EdtConta_Destino: TEdit;
    EdtCodigo_Conta_Destino: TEdit;
    EdtSaldo_Atual_Destino: TEdit;
    Label11: TLabel;
    EdtNovo_Saldo_Destino: TEdit;
    CBTransferencia: TCheckBox;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_PlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_LancamentoEnter(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure MEdtData_LancamentoExit(Sender: TObject);
    procedure MmoObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_OperacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_OperacaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtOperacao_BancariaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PlanoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPlanoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ChequeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtChequeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ChequeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtNovo_SaldoEnter(Sender: TObject);
    procedure EdtSaldo_AtualExit(Sender: TObject);
    procedure EdtNovo_SaldoExit(Sender: TObject);
    procedure EdtCodigo_Conta_DestinoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Conta_DestinoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNovo_Saldo_DestinoEnter(Sender: TObject);
    procedure CBTransferenciaClick(Sender: TObject);
  private
    Lancamento_Banco: URegistro.TLancamento_Banco;
    Util: TUtil;

    Fechamento: URegistro.TFechamento_Caixa;
  public
    ativo, achei: boolean;
    transferencia: Integer;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmLancamento_Banco: TFrmLancamento_Banco;
implementation

uses UChama_Plano_Financeiro, UChama_Conta_Corrente,
  UChama_Operacao_Bancaria, UChama_Lancamento_Banco, UDM, UChama_Cheque;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmLancamento_Banco.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmLancamento_Banco);
  Util.Desabilita_Campos(FrmLancamento_Banco);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  FrmLancamento_Banco.Height:= 240;
  CBTransferencia.Checked:= false;
end;

procedure TFrmLancamento_Banco.BBtnExcluirClick(Sender: TObject);
var
  valor, saldo_atual, novo_saldo: double;
  codigo_conta: integer;
begin
  if (Mensagem.CONFIRMA_EXCLUSAO) then
  BEGIN
    //Lancamento_Banco.Excluir(Lancamento_Banco);

    valor:= StrToFloat(EdtValor.Text);
    codigo_conta:= StrToInt(EdtCodigo_Conta.Text);
    saldo_atual:= Util.Pega_Saldo_Atual_Conta(codigo_conta);

    if (RGStatus.ItemIndex = 1) then
    begin
      if (EdtTipo_Operacao.Text = 'DÉBITO') then
        novo_saldo:= saldo_atual + valor
      else
        novo_saldo:= saldo_atual - valor;
    end
    else
    begin
      novo_saldo:= saldo_atual;
    end;

    Util.Insere_Extrato_Bancario(Codigo_Empresa, StrToInt(EdtDocumento.Text), date, codigo_conta, 0, StrToInt(EdtCodigo_Operacao.Text),
                             0, 'ESTORNO DE VALOR LIBERADO', valor, 'LIBERADO', saldo_atual, novo_saldo,
                             0, 0, 0);

    if (RGStatus.ItemIndex = 1) then
    begin
      Util.Atualiza_Saldo_Bancario( StrToInt(EdtCodigo_Conta.Text), StrToFloat(EdtValor.Text), EdtTipo_Operacao.Text, 1);

      if (CBTransferencia.Checked) then
      begin
        Util.Atualiza_Saldo_Bancario( StrToInt(EdtCodigo_Conta_Destino.Text), StrToFloat(EdtValor.Text), 'CRÉDITO', 1);
      end;
    end;

    Util.Insere_Historico(usuario, 'EXCLUIU LANÇAMENTO BANCÁRIO ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Mensagem.Processo_Concluido;
    Util.Desabilita_Campos(FrmLancamento_Banco);
  END;
end;

procedure TFrmLancamento_Banco.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmLancamento_Banco.BBtnSalvarClick(Sender: TObject);
var
  tipo: AnsiString;
  cod_conta: integer;
begin
  try
    if (EdtCodigo_Conta_Destino.Text = '') then
    begin
      cod_conta := 0;
    end
    else
    begin
      cod_conta:= StrToInt(EdtCodigo_Conta_Destino.Text);
    end;

    if (achei = false) then
      begin
        if (Confira = true) then
        begin
          Lancamento_Banco.Inserir(Lancamento_Banco, StrToFloat(EdtSaldo_Atual.Text), StrToFloat(EdtNovo_Saldo.Text), cod_conta, StrToFloat(EdtSaldo_Atual_Destino.Text), StrToFloat(EdtNovo_Saldo_Destino.Text));
          Util.Insere_Historico(usuario, 'EFETUOU LANÇAMENTO BANCÁRIO ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
          //Parcela.Inserir(Parcela);
        end
        else
          exit;
      end
      else
      begin
        if (Confira = true) then
        BEGIN
          Lancamento_Banco.Alterar(Lancamento_Banco, StrToFloat(EdtSaldo_Atual.Text), StrToFloat(EdtNovo_Saldo.Text), cod_conta, StrToFloat(EdtSaldo_Atual_Destino.Text), StrToFloat(EdtNovo_Saldo_Destino.Text));
          Util.Insere_Historico(usuario, 'ALTEROU LANÇAMENTO BANCÁRIO ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
        END
        else
          exit;
      end;

      if (RGStatus.ItemIndex = 1) then
      begin
        Util.Atualiza_Saldo_Bancario( StrToInt(EdtCodigo_Conta.Text), StrToFloat(EdtValor.Text), EdtTipo_Operacao.Text, 0);

        if (CBTransferencia.Checked) then
        begin
          Util.Atualiza_Saldo_Bancario( StrToInt(EdtCodigo_Conta_Destino.Text), StrToFloat(EdtValor.Text), 'CRÉDITO', 0);
        end;

        if (EdtTipo_Operacao.Text = 'CRÉDITO') then
          tipo:= '+'
        else
          tipo:= '-';

        if (EdtTipo_Operacao.Text = 'CRÉDITO') then
          Fechamento.Salva_Conta(0, Codigo_empresa, Codigo_Caixa, Codigo_Usuario, 0, 0, StrToInt(EdtDocumento.Text), 1, 'DINHEIRO', 'RECEB. - BANCO', 'PAGO', tipo, StrToFloat(EdtValor.Text), 0, date)
        else
          Fechamento.Salva_Conta(0, Codigo_empresa, Codigo_Caixa, Codigo_Usuario, 0, 0, StrToInt(EdtDocumento.Text), 1, 'DINHEIRO', 'PAGAS - BANCO', 'PAGO', tipo, StrToFloat(EdtValor.Text), 0, date);
      end;

      if (RGStatus.ItemIndex = 1) and (EdtCodigo_Cheque.Text <> '') then
        Util.Atualiza_Cheque(StrToDateTime(MEdtData_Lancamento.Text), 'BAIXADO', StrToInt(EdtCodigo_Cheque.Text));

      Mensagem.Processo_Concluido;
      BBtnSalvar.Enabled:= false;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= true;
      BBtnCancelar.Enabled:= false;
      Util.Desabilita_Campos(FrmLancamento_Banco);
  except on e:Exception do
  begin
    Application.MessageBox(PWideChar('Erro ao gravar Lançamento bancário: '+e.Message), 'Erro', MB_OK+MB_ICONHAND);

  end;

  end;
end;

procedure TFrmLancamento_Banco.CBTransferenciaClick(Sender: TObject);
begin
  if (CBTransferencia.Checked) then
  begin
    FrmLancamento_Banco.Height:= 300
  end
  else
  begin
    FrmLancamento_Banco.Height:= 240;
  end;
end;

function TFrmLancamento_Banco.Confira: boolean;
begin
    Confira:= false;
    if EdtDocumento.Text = '' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtDocumento.SetFocus;
        abort;
      end;

    if MEdtData_Lancamento.Text = '  /  /    ' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        MEdtData_Lancamento.SetFocus;
        abort;
      end;

    if EdtCodigo_Conta.Text = '' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtCodigo_Conta.SetFocus;
        abort;
      end;

    if EdtCodigo_Operacao.Text = '' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtCodigo_Conta.SetFocus;
        abort;
      end;

    if (EdtValor.Text = '') or (EdtValor.Text = '0,00') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtValor.SetFocus;
        abort;
      end;

    if (CBTransferencia.Checked) then
    begin
      if (EdtCodigo_Conta_Destino.Text = '') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtCodigo_Conta_Destino.SetFocus;
        abort;
      end;

      if (EdtNovo_Saldo_Destino.Text = '') or ((EdtNovo_Saldo_Destino.Text = '0,00') or ((EdtNovo_Saldo_Destino.Text = '0')))then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtNovo_Saldo_Destino.SetFocus;
        abort;
      end;
    end;
     Confira:= true;
end;

procedure TFrmLancamento_Banco.EdtChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtCodigo_ChequeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Cheque, FrmChama_Cheque);
      FrmChama_Cheque.ShowModal;
      FrmChama_Cheque.Free;
    end;
end;

procedure TFrmLancamento_Banco.EdtCodigo_ChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtCodigo_ContaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      transferencia:= 0;
      Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
      FrmChama_Conta_Corrente.ShowModal;
      FrmChama_Conta_Corrente.Free;
    end;
end;

procedure TFrmLancamento_Banco.EdtCodigo_ContaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtCodigo_Conta_DestinoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      transferencia:= 1;
      Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
      FrmChama_Conta_Corrente.ShowModal;
      FrmChama_Conta_Corrente.Free;
    end;
end;

procedure TFrmLancamento_Banco.EdtCodigo_Conta_DestinoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtCodigo_OperacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Operacao_Bancaria, FrmChama_Operacao_Bancaria);
      FrmChama_Operacao_Bancaria.ShowModal;
      FrmChama_Operacao_Bancaria.Free;
    end;
end;

procedure TFrmLancamento_Banco.EdtCodigo_OperacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtCodigo_PlanoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
      FrmChama_Plano_Financeiro.ShowModal;
      FrmChama_Plano_Financeiro.Free;
    end;
end;

procedure TFrmLancamento_Banco.EdtCodigo_PlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtContaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtNovo_SaldoEnter(Sender: TObject);
var
  valor_op, saldo_atual, novo_saldo: double;
begin
  valor_op:= StrToFloat(EdtValor.Text);
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

procedure TFrmLancamento_Banco.EdtNovo_SaldoExit(Sender: TObject);
begin
  if (EdtNovo_Saldo.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    Abort;
  end;
  Util.FormataFloat(2, EdtNovo_Saldo, StrToFloat(EdtNovo_Saldo.Text));
end;

procedure TFrmLancamento_Banco.EdtNovo_Saldo_DestinoEnter(Sender: TObject);
var
  valor_op, saldo_atual, novo_saldo: double;
begin
  valor_op:= StrToFloat(EdtValor.Text);
  saldo_atual:= StrToFloat(EdtSaldo_Atual_Destino.Text);

  if (RGStatus.ItemIndex = 1) then
  begin
    novo_saldo:= saldo_atual + valor_op;
  end
  else
  begin
    novo_saldo:= StrToFloat(EdtSaldo_Atual_Destino.Text);
  end;

  Util.FormataFloat(2, EdtNovo_Saldo_Destino, novo_saldo);
end;

procedure TFrmLancamento_Banco.EdtOperacao_BancariaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtPlanoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtSaldo_AtualExit(Sender: TObject);
begin
  if (EdtSaldo_Atual.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    Abort;
  end;
  Util.FormataFloat(2, EdtSaldo_Atual, StrToFloat(EdtSaldo_Atual.Text));
end;

procedure TFrmLancamento_Banco.EdtValorExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtValor, StrToFloat(EdtValor.Text));
end;

procedure TFrmLancamento_Banco.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmLancamento_Banco.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmLancamento_Banco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmLancamento_Banco.Free;
        FrmLancamento_Banco:= Nil;
      end;
end;

procedure TFrmLancamento_Banco.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmLancamento_Banco);
  Util.Limpa_Campos(FrmLancamento_Banco);
  Util.Desabilita_Campos(FrmLancamento_Banco);
  EdtValor.Text:= '0,00';
  EdtSaldo_Atual.Text:= '0,00';
  EdtNovo_Saldo.Text:= '0,00';
  EdtSaldo_Atual_Destino.Text:= '0,00';
  EdtNovo_Saldo_Destino.Text:= '0,00';

  FrmLancamento_Banco.Height:= 240;
  CBTransferencia.Checked:= false;
end;

procedure TFrmLancamento_Banco.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmLancamento_Banco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmLancamento_Banco);
      Util.Limpa_Campos(FrmLancamento_Banco);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      EdtDocumento.SetFocus;
      EdtValor.Text:= '0,00';
      EdtSaldo_Atual.Text:= '0,00';
      EdtNovo_Saldo.Text:= '0,00';
      EdtSaldo_Atual_Destino.Text:= '0,00';
      EdtNovo_Saldo_Destino.Text:= '0,00';
      FrmLancamento_Banco.Height:= 240;
      CBTransferencia.Checked:= false;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmLancamento_Banco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmLancamento_Banco.MEdtData_LancamentoEnter(Sender: TObject);
begin
  MEdtData_Lancamento.Text:= DateToStr(date);
end;

procedure TFrmLancamento_Banco.MEdtData_LancamentoExit(Sender: TObject);
begin
  if (MEdtData_Lancamento.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Lancamento);
end;

procedure TFrmLancamento_Banco.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmLancamento_Banco.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Lancamento_Banco, FrmChama_Lancamento_Banco);
  FrmChama_Lancamento_Banco.ShowModal;
  FrmChama_Lancamento_Banco.Release;
end;

end.
