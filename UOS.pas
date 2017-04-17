unit UOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios, DateUtils;

type
  TFrmOS = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Cadastro: TMaskEdit;
    LblData_Cadastro: TLabel;
    BBtnPesquisar: TToolButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label3: TLabel;
    EdtCliente: TEdit;
    EdtCodigo_Cliente: TEdit;
    Label15: TLabel;
    EdtN_Pedido: TEdit;
    MEdtData_Previsao_Entrega: TMaskEdit;
    Label2: TLabel;
    Label1: TLabel;
    MMODescricao_PC: TMemo;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    EdtServico: TEdit;
    EdtCodigo_Servico: TEdit;
    Panel1: TPanel;
    LblNumero: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EdtValor_Unitario: TEdit;
    EdtQuantidade: TEdit;
    EdtSub_Total: TEdit;
    EdtDesconto: TEdit;
    EdtValor_Servico: TEdit;
    Label5: TLabel;
    MMOObservacao: TMemo;
    Label6: TLabel;
    MEdtHora: TMaskEdit;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Codigo_Servico: TIntegerField;
    ADOQuery1Valor_Unitario: TFloatField;
    ADOQuery1Quantidade: TIntegerField;
    ADOQuery1Sub_Total: TFloatField;
    ADOQuery1Desconto: TFloatField;
    ADOQuery1Valor_Servico: TFloatField;
    ADOQuery1Descricao: TStringField;
    EdtTotal_Pedido: TEdit;
    Edit7: TEdit;
    EdtQuantidade_Itens: TEdit;
    Edit9: TEdit;
    EdtDesconto_Total: TEdit;
    EdtAcrescimo: TEdit;
    EdtValor_Pagar: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    BBtnImprimir: TToolButton;
    LblDescricao: TLabel;
    LblObs: TLabel;
    EdtDinheiro: TEdit;
    EdtCheque_a_Vista: TEdit;
    EdtCheque_a_Prazo: TEdit;
    Edit8: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    EdtValor_Recebido: TEdit;
    EdtTroco: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    CBFechar_Caixa: TCheckBox;
    Label7: TLabel;
    EdtCondicao_Pagamento: TEdit;
    EdtCodigo_Condicao_Pagamento: TEdit;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtTemaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_Previsao_EntregaEnter(Sender: TObject);
    procedure MEdtData_Previsao_EntregaExit(Sender: TObject);
    procedure EdtCodigo_ServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ServicoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtServicoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_UnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_UnitarioExit(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSub_TotalEnter(Sender: TObject);
    procedure EdtSub_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSub_TotalExit(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure EdtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_ServicoEnter(Sender: TObject);
    procedure EdtValor_ServicoExit(Sender: TObject);
    procedure EdtValor_ServicoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_ServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtValor_PagarEnter(Sender: TObject);
    procedure EdtDesconto_TotalExit(Sender: TObject);
    procedure EdtDesconto_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAcrescimoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAcrescimoExit(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure MMODescricao_PCChange(Sender: TObject);
    procedure MMOObservacaoChange(Sender: TObject);
    procedure EdtDinheiroExit(Sender: TObject);
    procedure EdtDinheiroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCheque_a_VistaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCheque_a_PrazoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_RecebidoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTrocoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCheque_a_VistaExit(Sender: TObject);
    procedure EdtCheque_a_PrazoExit(Sender: TObject);
    procedure EdtValor_RecebidoExit(Sender: TObject);
    procedure EdtValor_RecebidoEnter(Sender: TObject);
    procedure EdtTrocoEnter(Sender: TObject);
    procedure EdtCondicao_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Condicao_PagamentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    Util: TUtil;
    OS: TOS;
    Itens_OS: TItens_OS;
    Mensagem: TMensagem;
    qtde_itens: integer;
    iniciado: boolean;
    Fechamento: TFechamento_Caixa;

    function Confira: boolean;
    function Confira_Itens: boolean;
    procedure Gera_Codigo;
    procedure Limpa_Menor;
    procedure Verifica_Produto_Lancado;
    procedure Calcula_Total;
    procedure Calcula_Total_Deletado;
    procedure Escreve_Texto;
    procedure Grava_Caixa;
    procedure Atualiza_Status_Pedido;
    procedure Gera_Financeiro;

  public
    ativo, enderec, achei: boolean;
    tipo_pagamento, status, n_pedido, endereco, numero, complemento, setor, cidade, telefone, celular: AnsiString;

    parcela, prazo: integer;
    procedure Atualiza_Dados;
  protected
  end;

  const
    descricao = 70;
    obs = 70;

var
  FrmOS: TFrmOS;
implementation

uses UDM, UChama_Cliente, UChama_Servico, UChama_OS, URel_OS_Selecionado,
  UChama_Condicao_Pagamento;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmOS.Atualiza_Dados;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select IOS.*, CS.Descricao from Itens_OS IOS');
    add('left join Cadastro_Servico CS on (IOS.Codigo_Servico = CS.Codigo)');
    add('where IOS.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmOS.BBtnCancelarClick(Sender: TObject);
begin
  if (achei = false) then
    Itens_OS.Excluir_Tudo;

  ADOQuery1.Close;
  Util.Limpa_Campos(FrmOS);
  Util.Desabilita_Campos(FrmOS);
  Escreve_Texto;
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  iniciado:= false;
end;

procedure TFrmOS.Verifica_Produto_Lancado;
begin
  if (ADOQuery1.IsEmpty = false) then
  begin
    if ADOQuery1.Locate('Codigo;Codigo_Servico', VarArrayOf([StrToInt(EdtCodigo.Text), StrToInt(EdtCodigo_Servico.Text)]), []) then
    begin
      Mensagem.Produto_Lancado;
      Limpa_Menor;
      EdtCodigo_Servico.SetFocus;
      abort;
    end;
  end;
end;

procedure TFrmOS.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      OS.Excluir;
      Itens_OS.Excluir_Tudo;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU OS ' + EdtN_Pedido.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnImprimir.Enabled:= false;
    Util.Desabilita_Campos(FrmOS);
    iniciado:= false;
  end;
end;

procedure TFrmOS.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmOS.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_OS_Selecionado:= TFrmRel_OS_Selecionado.create(self);
  FrmRel_OS_Selecionado.Release;
  FrmRel_OS_Selecionado:= Nil;
end;

procedure TFrmOS.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_OS, FrmChama_OS);
  FrmChama_OS.ShowModal;
  FrmChama_OS.Free;
end;

procedure TFrmOS.BBtnSalvarClick(Sender: TObject);
begin
  if (status = 'PAGO') then
  begin
    Mensagem.Pedido_Fechado;
    abort;
  end;

  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        try
          OS.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'REGISTROU OS ' + EdtN_Pedido.Text + '.', TimeToStr(time), insercao, date);
        except
          Mensagem.Impossivel_Executar;
        end;
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
      try
        OS.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU OS ' + EdtN_Pedido.Text + '.', TimeToStr(time), alteracao, date);
      except
        Mensagem.Impossivel_Executar;
      end;
      end
      else
        exit;
    end;

    if (tipo_pagamento = 'A PRAZO') then
      Gera_Financeiro;

    if (CBFechar_Caixa.Checked) then
    begin
      Grava_Caixa;
      Atualiza_Status_Pedido;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnImprimir.Enabled:= true;
    Util.Desabilita_Campos(FrmOS);
    iniciado:= false;
end;

procedure TFrmOS.Gera_Financeiro;
var
  qAux, qAux2: TADOQuery;
  codigo, i, doc: integer;
  data_vencim: TDate;
begin
  qAux:= TADOQuery.Create(self);
  qAux2:= TADOQuery.Create(self);
  try
    //pega o código do lançamento
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from Lancamento_Financeiro');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    data_vencim:= IncDay(date, prazo);
    //data_vencim:= date;

    doc:= StrToInt(EdtN_Pedido.Text);

    with qAux2, SQL do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('Insert into Lancamento_Financeiro (Codigo, Tipo, N_Documento, Codigo_Empresa, Codigo_Forma_Pagamento, ');
        add('Codigo_Cli_For, Codigo_Tipo_Documento, Historico, Codigo_Departamento, Codigo_Plano, Data_Lancamento,');
        add('Data_Vencimento, Valor_Documento, Desconto, Multa, Valor_Cobrado, Observacoes, Status) values (');
        add(':Codigo, :Tipo, :N_Documento, :Codigo_Empresa, :Codigo_Forma_Pagamento, :Codigo_Cli_For, :Codigo_Tipo_Documento, ');
        add(':Historico, :Codigo_Departamento, :Codigo_Plano, :Data_Lancamento, :Data_Vencimento, :Valor_Documento, ');
        add(':Desconto, :Multa, :Valor_Cobrado, :Observacoes, :Status)');

        Parameters.ParamByName('Codigo').Value:= codigo;
        Parameters.ParamByName('Tipo').Value:= 'RECEBER';

        Parameters.ParamByName('N_Documento').Value:= doc;

        Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;
        Parameters.ParamByName('Codigo_Forma_Pagamento').Value:= StrToInt(EdtCodigo_Condicao_Pagamento.Text);

        Parameters.ParamByName('Codigo_Cli_For').Value:= StrToInt(EdtCodigo_Cliente.Text);

        Parameters.ParamByName('Codigo_Tipo_Documento').Value:= 0;
        Parameters.ParamByName('Historico').Value:= '';
        Parameters.ParamByName('Codigo_Departamento').Value:= 0;
        Parameters.ParamByName('Codigo_Plano').Value:= 0;
        Parameters.ParamByName('Data_Lancamento').Value:= date;
        Parameters.ParamByName('Data_Vencimento').Value:= data_vencim;
        Parameters.ParamByName('Valor_Documento').Value:= StrToFloat(EdtValor_Pagar.Text);
        Parameters.ParamByName('Desconto').Value:= 0;
        Parameters.ParamByName('Multa').Value:= 0;
        Parameters.ParamByName('Valor_Cobrado').Value:= StrToFloat(EdtValor_Pagar.Text);
        Parameters.ParamByName('Observacoes').Value:= '';
        Parameters.ParamByName('Status').Value:= 'PENDENTE';
        ExecSQL;
      end;

      for i := 1 to parcela do
      begin
        with qAux2, SQL do
          begin
            close;
            Connection:= dm.ADOConnection1;
            clear;
            add('Insert into Parcelas_Lancamentos (Codigo, N_Documento, Data_Vencimento, Data_Pagamento, ');
            add('Parcela, Status, Valor) values (:Codigo, :N_Documento, :Data_Vencimento, :Data_Pagamento, ');
            add(':Parcela, :Status, :Valor)');
            Parameters.ParamByName('Codigo').Value:= codigo;

            Parameters.ParamByName('N_Documento').Value:= doc;

            Parameters.ParamByName('Data_Vencimento').Value:= data_vencim;
            Parameters.ParamByName('Data_Pagamento').Value:= NULL;

            data_vencim:= IncDay(data_vencim, prazo);
            inc(doc);
            Parameters.ParamByName('Parcela').Value:= i;
            Parameters.ParamByName('Status').Value:= 'PENDENTE';
            Parameters.ParamByName('Valor').Value:= StrToFloat(EdtValor_Pagar.Text) / parcela;
            ExecSQL;
          end;
      end;
  finally
    FreeAndNil(qAux);
    FreeAndNil(qAux2);
  end;
end;

procedure TFrmOS.Atualiza_Status_Pedido;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update OS set Status = :Status');
      add('where N_Pedido = :Pedido');
      Parameters.ParamByName('Pedido').Value:= EdtN_Pedido.Text;
      Parameters.ParamByName('Status').Value:= 'PAGO';
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmOS.Grava_Caixa;
var
  tipo_doc, tipo: AnsiString;
  val_troco: double;
begin
  tipo_doc:= 'OS';
  tipo:= '+';
  val_troco:= StrToFloat(EdtTroco.Text);

  if (EdtDinheiro.Text <> '0,00') and (EdtCheque_a_Vista.Text <> '0,00') and (EdtCheque_a_Prazo.Text <> '0,00') then
    val_troco:= val_troco / 3
  else if (EdtDinheiro.Text <> '0,00') and (EdtCheque_a_Vista.Text <> '0,00') and (EdtCheque_a_Prazo.Text = '0,00') then
    val_troco:= val_troco / 2
  else if (EdtDinheiro.Text <> '0,00') and (EdtCheque_a_Prazo.Text <> '0,00') and (EdtCheque_a_Vista.Text = '0,00') then
    val_troco:= val_troco / 2
  else if (EdtDinheiro.Text <> '0,00') and (EdtCheque_a_Prazo.Text = '0,00') and (EdtCheque_a_Vista.Text = '0,00') then
    val_troco:= val_troco / 1
  else if (EdtCheque_a_Vista.Text <> '0,00') and (EdtDinheiro.Text = '0,00') and (EdtCheque_a_Prazo.Text = '0,00') then
    val_troco:= val_troco / 1
  else if (EdtCheque_a_Prazo.Text <> '0,00') and (EdtCheque_a_Vista.Text = '0,00') and (EdtDinheiro.Text = '0,00') then
    val_troco:= val_troco / 1
  else if (EdtCheque_a_Prazo.Text <> '0,00') and (EdtCheque_a_Vista.Text <> '0,00') and (EdtDinheiro.Text = '0,00') then
    val_troco:= val_troco / 2;

  if (EdtDinheiro.Text <> '0,00') and (EdtDinheiro.Text <> '0') then         //o 2 0(zero), se for 0 gera movimento, se for 1, nao gera movimento
    Fechamento.Salva_Conta(0, Codigo_Empresa, Codigo_Caixa, Codigo_Usuario, 0, 0, StrToInt(EdtN_Pedido.Text), 0, 'DINHEIRO'    , tipo_doc, 'PAGO', tipo, StrToFloat(EdtDinheiro.Text)      , val_troco, Data_Movimento);

  if (EdtCheque_a_Vista.Text <> '0,00') and (EdtCheque_a_Vista.Text <> '0') then
    Fechamento.Salva_Conta(0, Codigo_Empresa, Codigo_Caixa, Codigo_Usuario, 0, 0, StrToInt(EdtN_Pedido.Text), 0, 'CHEQUE VISTA', tipo_doc, 'PAGO', tipo, StrToFloat(EdtCheque_a_Vista.Text), val_troco, Data_Movimento);

  if (EdtCheque_a_Prazo.Text <> '0,00') and (EdtCheque_a_Prazo.Text <> '0') then
    Fechamento.Salva_Conta(0, Codigo_Empresa, Codigo_Caixa, Codigo_Usuario, 0, 0, StrToInt(EdtN_Pedido.Text), 0, 'CHEQUE PRAZO', tipo_doc, 'PAGO', tipo, StrToFloat(EdtCheque_a_Prazo.Text), val_troco, Data_Movimento);
end;

function TFrmOS.Confira: boolean;
begin
  Confira:= false;

  if EdtCodigo_Cliente.Text = '' then
   begin
     Mensagem.Mensagem_Falta_Dados;
     EdtCodigo_Cliente.SetFocus;
     abort;
    end;

  if EdtCodigo_Condicao_Pagamento.Text = '' then
   begin
     Mensagem.Mensagem_Falta_Dados;
     EdtCodigo_Condicao_Pagamento.SetFocus;
     abort;
    end;

  if MEdtData_Previsao_Entrega.Text = '  /  /    ' then
   begin
     Mensagem.Mensagem_Falta_Dados;
     MEdtData_Previsao_Entrega.SetFocus;
     abort;
    end;

  Confira:= true;
end;

function TFrmOS.Confira_Itens: boolean;
begin
  Confira_Itens:= false;

  if EdtCodigo_Servico.Text = '' then
   begin
     Mensagem.Mensagem_Falta_Dados;
     EdtCodigo_Servico.SetFocus;
     abort;
    end;

  Confira_Itens:= true;

end;

procedure TFrmOS.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_DELETE) then
  begin
    if (Mensagem.Confirma_Exclusao) then
    begin
      Calcula_Total_Deletado;
      Itens_OS.Excluir;
      Atualiza_Dados;
      Limpa_Menor;
      EdtCodigo_Servico.SetFocus;
    end;
  end;
end;

procedure TFrmOS.Escreve_Texto;
begin
  Edit9.Text:= 'Qtde. Itens';
  Edit7.Text:= 'Total Pedido';
  Edit2.Text:= 'Desconto';
  Edit3.Text:= 'Acréscimo';
  Edit4.Text:= 'Valor Pagar';
  Edit5.Text:= 'Valor Rec.';
  Edit6.Text:= 'Troco';
  Edit8.Text:= 'Dinheiro';
  Edit10.Text:= 'Ch. Vista';
  Edit11.Text:= 'Ch. Prazo';

  EdtQuantidade_Itens.Text:= '0';
  EdtTotal_Pedido.Text:= '0,00';
  EdtDesconto_Total.Text:= '0,00';
  EdtAcrescimo.Text:= '0,00';
  EdtValor_Pagar.Text:= '0,00';
  EdtValor_Recebido.Text:= '0,00';
  EdtTroco.Text:= '0,00';

  EdtDinheiro.Text:= '0,00';
  EdtCheque_a_Vista.Text:= '0,00';
  EdtCheque_a_Prazo.Text:= '0,00';
end;

procedure TFrmOS.EdtAcrescimoExit(Sender: TObject);
begin
  if (EdtAcrescimo.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtAcrescimo.SetFocus;
    abort;
  end;

  EdtAcrescimo.Text:= FormatFloat('#0.0,0', StrToFloat(EdtAcrescimo.Text));
  EdtAcrescimo.Text:= StringReplace(EdtAcrescimo.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtAcrescimoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtCheque_a_PrazoExit(Sender: TObject);
begin
  if (EdtCheque_a_Prazo.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtCheque_a_Prazo.SetFocus;
    abort;
  end;

  EdtCheque_a_Prazo.Text:= FormatFloat('#0.0,0', StrToFloat(EdtCheque_a_Prazo.Text));
  EdtCheque_a_Prazo.Text:= StringReplace(EdtCheque_a_Prazo.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtCheque_a_PrazoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtCheque_a_VistaExit(Sender: TObject);
begin
  if (EdtCheque_a_Vista.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtCheque_a_Vista.SetFocus;
    abort;
  end;

  EdtCheque_a_Vista.Text:= FormatFloat('#0.0,0', StrToFloat(EdtCheque_a_Vista.Text));
  EdtCheque_a_Vista.Text:= StringReplace(EdtCheque_a_Vista.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtCheque_a_VistaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtClienteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F3 then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmOS.EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F3 then
  begin
    Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free;
  end;
end;

procedure TFrmOS.EdtCodigo_Condicao_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtCodigo_ServicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F3 then
  begin
    Application.CreateForm(TFrmChama_Servico, FrmChama_Servico);
    FrmChama_Servico.ShowModal;
    FrmChama_Servico.Free;
  end;
end;

procedure TFrmOS.EdtCodigo_ServicoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtCondicao_PagamentoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtDescontoExit(Sender: TObject);
begin
  if (EdtDesconto.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtDesconto.SetFocus;
    abort;
  end;

  EdtDesconto.Text:= FormatFloat('#0.0,0', StrToFloat(EdtDesconto.Text));
  EdtDesconto.Text:= StringReplace(EdtDesconto.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtDescontoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtDesconto_TotalExit(Sender: TObject);
begin
  if (EdtDesconto_Total.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtDesconto_Total.SetFocus;
    abort;
  end;

  EdtDesconto_Total.Text:= FormatFloat('#0.0,0', StrToFloat(EdtDesconto_Total.Text));
  EdtDesconto_Total.Text:= StringReplace(EdtDesconto_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtDesconto_TotalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtDinheiroExit(Sender: TObject);
begin
  if (EdtDinheiro.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtDinheiro.SetFocus;
    abort;
  end;

  EdtDinheiro.Text:= FormatFloat('#0.0,0', StrToFloat(EdtDinheiro.Text));
  EdtDinheiro.Text:= StringReplace(EdtDinheiro.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtDinheiroKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtQuantidadeExit(Sender: TObject);
begin
  if (EdtQuantidade.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtQuantidade.SetFocus;
    abort;
  end;

end;

procedure TFrmOS.EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmOS.EdtServicoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtSub_TotalEnter(Sender: TObject);
var
  valor_total, qtde, valor_unitario: double;
begin
  valor_unitario:= StrToFloat(EdtValor_Unitario.Text);
  qtde:= StrToFloat(EdtQuantidade.Text);
  valor_total:= valor_unitario * qtde;

  EdtSub_Total.Text:= FormatFloat('#0.0,0', valor_total);
  EdtSub_Total.Text:= StringReplace(EdtSub_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtSub_TotalExit(Sender: TObject);
begin
  if (EdtSub_Total.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtSub_Total.SetFocus;
    abort;
  end;

  EdtSub_Total.Text:= FormatFloat('#0.0,0', StrToFloat(EdtSub_Total.Text));
  EdtSub_Total.Text:= StringReplace(EdtSub_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtSub_TotalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtTemaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtTrocoEnter(Sender: TObject);
var
  valor_pagar, valor_rec, troco: double;
begin
  valor_pagar:= StrToFloat(EdtValor_Pagar.Text);
  valor_rec:= StrToFloat(EdtValor_Recebido.Text);

  troco:= valor_rec - valor_pagar;

  EdtTroco.Text:= FormatFloat('#0.0,0', troco);
  EdtTroco.Text:= StringReplace(EdtTroco.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtTrocoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtValor_PagarEnter(Sender: TObject);
var
  total_pedido, desconto, acrescimo, valor_pagar: double;
begin
  total_pedido:= StrToFloat(EdtTotal_Pedido.Text);
  desconto:= StrToFloat(EdtDesconto_Total.Text);
  acrescimo:= StrToFloat(EdtAcrescimo.Text);

  valor_pagar:= total_pedido  - desconto + acrescimo;

  EdtValor_Pagar.Text:= FormatFloat('#0.0,0', valor_pagar);
  EdtValor_Pagar.Text:= StringReplace(EdtValor_Pagar.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtValor_RecebidoEnter(Sender: TObject);
var
  dinheiro, cheque_vis, cheque_pra, total: double;
begin
  dinheiro:= StrToFloat(EdtDinheiro.Text);
  cheque_vis:= StrToFloat(EdtCheque_a_Vista.Text);
  cheque_pra:= StrToFloat(EdtCheque_a_Prazo.Text);
  total:= dinheiro + cheque_vis + cheque_pra;

  EdtValor_Recebido.Text:= FormatFloat('#0.0,0', total);
  EdtValor_Recebido.Text:= StringReplace(EdtValor_Recebido.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtValor_RecebidoExit(Sender: TObject);
begin
  if (EdtValor_Recebido.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor_Recebido.SetFocus;
    abort;
  end;

  if (StrToFloat(EdtValor_Recebido.Text) < StrToFloat(EdtValor_Pagar.Text)) then
  begin
    Mensagem.Valor_Menor;
    EdtValor_Recebido.SetFocus;
    abort;
  end;

  EdtValor_Recebido.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor_Recebido.Text));
  EdtValor_Recebido.Text:= StringReplace(EdtValor_Recebido.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtValor_RecebidoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtValor_ServicoEnter(Sender: TObject);
var
  sub_total, desconto, perc, valor_venda: double;
begin
  sub_total:= StrToFloat(EdtSub_Total.Text);
  desconto:= StrToFloat(EdtDesconto.Text);
  valor_venda:= sub_total - desconto;

  EdtValor_Servico.Text:= FormatFloat('#0.0,0', valor_venda);
  EdtValor_Servico.Text:= StringReplace(EdtValor_Servico.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtValor_ServicoExit(Sender: TObject);
begin
  if (EdtValor_Servico.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor_Servico.SetFocus;
    abort;
  end;

  EdtValor_Servico.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor_Servico.Text));
  EdtValor_Servico.Text:= StringReplace(EdtValor_Servico.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtValor_ServicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (Confira_Itens) then
    begin
      Verifica_Produto_Lancado;

      Calcula_Total;

      Itens_OS.Inserir;
      Mensagem.Confirma_Insercao;
      Atualiza_Dados;
      Limpa_Menor;
      EdtCodigo_Servico.SetFocus;
    end;
  end;
end;

procedure TFrmOS.Calcula_Total_Deletado;
var
  total_pedido, valor_venda, total: double;
begin
  total_pedido:= StrToFloat(EdtTotal_Pedido.Text);
  valor_venda:= ADOQuery1Valor_Servico.AsFloat;

  total:= total_pedido - valor_venda;

  qtde_itens:= StrToInt(EdtQuantidade_Itens.Text);
  Dec(qtde_itens);

  EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);

  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtValor_Pagar.Text:= FormatFloat('#0.0,0', total);
  EdtValor_Pagar.Text:= StringReplace(EdtValor_Pagar.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.Calcula_Total;
var
  total_pedido, valor_venda, total: double;
begin
  total_pedido:= StrToFloat(EdtTotal_Pedido.Text);
  valor_venda:= StrToFloat(EdtValor_Servico.Text);

  total:= total_pedido + valor_venda;

  qtde_itens:= StrToInt(EdtQuantidade_Itens.Text);
  inc(qtde_itens);
  EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);

  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtValor_Pagar.Text:= FormatFloat('#0.0,0', total);
  EdtValor_Pagar.Text:= StringReplace(EdtValor_Pagar.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtValor_ServicoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtValor_UnitarioExit(Sender: TObject);
begin
  if (EdtValor_Unitario.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor_Unitario.SetFocus;
    abort;
  end;

  EdtValor_Unitario.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor_Unitario.Text));
  EdtValor_Unitario.Text:= StringReplace(EdtValor_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmOS.EdtValor_UnitarioKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmOS.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmOS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmOS.Free;
        FrmOS:= Nil;
      end;
end;

procedure TFrmOS.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmOS);
  Util.Limpa_Campos(FrmOS);
  Util.Desabilita_Campos(FrmOS);
  Escreve_Texto;
  Limpa_Menor;
  iniciado:= false;
  CBFechar_Caixa.Checked:= false;
end;

procedure TFrmOS.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      if (iniciado = false) then
      begin
        Util.Habilita_Campos(FrmOS);
        Util.Limpa_Campos(FrmOS);
        ADOQuery1.Close;
        BBtnSalvar.Enabled:= true;
        BBtnExcluir.Enabled:= false;
        BBtnPesquisar.Enabled:= false;
        BBtnCancelar.Enabled:= true;
        BBtnImprimir.Enabled:= false;
        achei:= false;
        Limpa_Menor;
        Gera_Codigo;
        Escreve_Texto;
        CBFechar_Caixa.Checked:= false;
        MEdtData_Cadastro.SetFocus;
        status:= '';
        iniciado:= true;
      end;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmOS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmOS.Gera_Codigo;
var
  qAux: TADOQuery;
  codigo, n_ped: integer;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(Codigo) as codigo from OS');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(cast(N_Pedido as integer)) as N_Pedido from OS');
      open;
    end;
    n_ped:= qAux.FieldByName('N_Pedido').AsInteger + 1;
    EdtN_Pedido.Text:= StringOfChar('0', 10-Length(IntToStr(n_ped))) + IntToStr(n_ped);
    n_pedido:= EdtN_Pedido.Text;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmOS.Limpa_Menor;
begin
  EdtCodigo_Servico.Clear;
  EdtServico.Clear;
  EdtValor_Unitario.Text:= '0,00';
  EdtQuantidade.Text:= '1';
  EdtSub_Total.Text:= '0,00';
  EdtDesconto.Text:= '0,00';
  EdtValor_Servico.Text:= '0,00';
end;

procedure TFrmOS.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmOS.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmOS.MEdtData_Previsao_EntregaEnter(Sender: TObject);
begin
  MEdtData_Previsao_Entrega.Text:= DateToStr(date);
end;

procedure TFrmOS.MEdtData_Previsao_EntregaExit(Sender: TObject);
begin
  if (MEdtData_Previsao_Entrega.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Previsao_Entrega);
end;

procedure TFrmOS.MMODescricao_PCChange(Sender: TObject);
begin
  LblDescricao.Caption:= 'Restante: ' + IntToStr(descricao - Length(MMODescricao_PC.Text));
end;

procedure TFrmOS.MMOObservacaoChange(Sender: TObject);
begin
  LblObs.Caption:= 'Restante: ' + IntToStr(descricao - Length(MMOObservacao.Text));
end;

end.
