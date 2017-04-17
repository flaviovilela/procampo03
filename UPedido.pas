unit UPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios, DateUtils;

type
  TFrmPedido = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Movimento: TMaskEdit;
    LblData_Cadastro: TLabel;
    BBtnPesquisar: TToolButton;
    Label6: TLabel;
    CmbTipo: TComboBox;
    Label2: TLabel;
    EdtMesa: TEdit;
    EdtCodigo_Mesa: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtCodigo_Cliente: TEdit;
    EdtCliente: TEdit;
    LblMarca: TLabel;
    EdtEndereco: TEdit;
    EdtNumero: TEdit;
    EdtSetor: TEdit;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MEdtTelefone: TMaskEdit;
    MEdtCelular: TMaskEdit;
    Label4: TLabel;
    EdtAtendente: TEdit;
    EdtCodigo_Atendente: TEdit;
    Label15: TLabel;
    EdtN_Pedido: TEdit;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1N_Pedido: TStringField;
    ADOQuery1Codigo_Produto: TIntegerField;
    ADOQuery1Tamanho: TStringField;
    ADOQuery1Borda: TStringField;
    ADOQuery1Valor_Unitario: TFloatField;
    ADOQuery1Quantidade: TFloatField;
    ADOQuery1Sub_Total: TFloatField;
    ADOQuery1Desconto: TFloatField;
    ADOQuery1Valor_Venda: TFloatField;
    ADOQuery1Descricao: TStringField;
    Label16: TLabel;
    EdtCondicao_Pagamento: TEdit;
    EdtCodigo_Condicao_Pagamento: TEdit;
    MMOObservacao: TMemo;
    Label17: TLabel;
    EdtTotal_Pedido: TEdit;
    EdtTaxa_Entrega: TEdit;
    EdtDesconto_Total: TEdit;
    EdtAcrescimo: TEdit;
    EdtValor_Pagar: TEdit;
    Edit7: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    EdtQuantidade_Itens: TEdit;
    Edit9: TEdit;
    ADOQuery1Observacao: TStringField;
    BBtnImprimir: TToolButton;
    ADOQuery1Cozinha: TStringField;
    CBFechar_Caixa: TCheckBox;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    LblNumero: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    EdtProduto: TEdit;
    CmbTamanho: TComboBox;
    EdtBorda: TEdit;
    EdtValor_Unitario: TEdit;
    EdtQuantidade: TEdit;
    EdtSub_Total: TEdit;
    EdtDesconto: TEdit;
    EdtValor_Venda: TEdit;
    Memo1: TMemo;
    EdtCodigo_Produto: TEdit;
    Label19: TLabel;
    EdtSabor_Borda: TEdit;
    ADOQuery1Sabor_Borda: TStringField;
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
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_MovimentoEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure MEdtData_MovimentoExit(Sender: TObject);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtValor_UnitarioEnter(Sender: TObject);
    procedure EdtSub_TotalEnter(Sender: TObject);
    procedure EdtValor_VendaEnter(Sender: TObject);
    procedure EdtValor_UnitarioExit(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure EdtSub_TotalExit(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure EdtValor_VendaExit(Sender: TObject);
    procedure EdtValor_UnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSub_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_VendaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtCelularKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_MesaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMesaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_AtendenteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAtendenteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ClienteExit(Sender: TObject);
    procedure EdtCodigo_AtendenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtValor_PagarEnter(Sender: TObject);
    procedure EdtTrocoEnter(Sender: TObject);
    procedure EdtTaxa_EntregaExit(Sender: TObject);
    procedure EdtDesconto_TotalExit(Sender: TObject);
    procedure EdtAcrescimoExit(Sender: TObject);
    procedure EdtValor_RecebidoExit(Sender: TObject);
    procedure EdtCodigo_Condicao_PagamentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtValor_RecebidoEnter(Sender: TObject);
    procedure EdtTaxa_EntregaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDesconto_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAcrescimoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDinheiroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCheque_a_VistaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCheque_a_PrazoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_RecebidoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDinheiroExit(Sender: TObject);
    procedure EdtCheque_a_VistaExit(Sender: TObject);
    procedure EdtCheque_a_PrazoExit(Sender: TObject);
  private
    Util: TUtil;
    Pedido: TPedido;
    Mensagem: TMensagem;
    Fechamento: TFechamento_Caixa;
    Itens_Pedido: URegistro.TItens_Pedido;

    qtde_itens: integer;
    qtde_produtos, controla_qtde_fracao: double;
    qtde_faltando: AnsiString;
    falta_metade: boolean;

    function Confira: boolean;
    function Confira_Itens: boolean;
    procedure Gera_Codigo;
    procedure Limpa_Menor;
    procedure Verifica_Produto_Lancado;
    procedure Escreve_Texto;
    procedure Calcula_Total;
    procedure Calcula_Total_Deletado;
    procedure Verifica_Produto_Fracionado;
    procedure Verifica_Produto_Fracionado_Fechar;
    function Verifica_Numero_Inteiro(Valor: Double): boolean;
    procedure Gera_Financeiro;
    procedure Grava_Caixa;
    procedure Atualiza_Status_Pedido;
    procedure Verifica_Metade_Faltando;
    procedure Verifica_Metade_Faltando_Deletar;
    procedure Bloqueia_Metade;

  public
    ativo, enderec, achei, cliente: boolean;
    n_pedido, fracionado: AnsiString;

    //------------condição de pagamento--------------//
    parcela, prazo: integer;
    tipo_pagamento: AnsiString;

    //--------------------------------//

    valor_mini,     borda_mini,
    valor_pequena,  borda_pequena,
    valor_media,    borda_media,
    valor_grande,   borda_grande,
    valor_gigante,  borda_gigante,
    valor_familia,  borda_familia: double;

    procedure Atualiza_Dados;
  end;

var
  FrmPedido: TFrmPedido;
implementation

uses UDM, UChama_Produto, UChama_Cliente,
  UChama_Condicao_Pagamento, UChama_Pedido, URel_Pedido_Selecionado,
  UEscolha_Impressao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmPedido.Gera_Financeiro;
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
        add('Insert into Lancamento_Financeiro (Tipo, N_Documento, Codigo_Empresa, Codigo_Forma_Pagamento, ');
        add('Codigo_Cli_For, Codigo_Tipo_Documento, Historico, Codigo_Departamento, Codigo_Plano, Data_Lancamento,');
        add('Data_Vencimento, Valor_Documento, Desconto, Multa, Valor_Cobrado, Observacoes, Status) values (');
        add(':Tipo, :N_Documento, :Codigo_Empresa, :Codigo_Forma_Pagamento, :Codigo_Cli_For, :Codigo_Tipo_Documento, ');
        add(':Historico, :Codigo_Departamento, :Codigo_Plano, :Data_Lancamento, :Data_Vencimento, :Valor_Documento, ');
        add(':Desconto, :Multa, :Valor_Cobrado, :Observacoes, :Status)');

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

procedure TFrmPedido.Grava_Caixa;
var
  tipo_doc, tipo: AnsiString;
  val_troco: double;
begin
  tipo_doc:= 'PEDIDO';
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

procedure TFrmPedido.Atualiza_Dados;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select IP.*, CP.Descricao, CP.Cozinha from Itens_Pedido IP');
    add('inner join Cadastro_Produto CP on (IP.Codigo_Produto = CP.Codigo)');
    add('where IP.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmPedido.Atualiza_Status_Pedido;
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
      add('update Pedido set Status = :Status, Hora_Fechamento = :Hora_Fechamento');
      add('where N_Pedido = :Pedido');
      Parameters.ParamByName('Pedido').Value:= EdtN_Pedido.Text;
      Parameters.ParamByName('Status').Value:= 'FECHADO';
      Parameters.ParamByName('Hora_Fechamento').Value:= time;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmPedido.BBtnCancelarClick(Sender: TObject);
begin
  if (achei = false) then
    Itens_Pedido.Excluir_Tudo;

  ADOQuery1.Close;
  Util.Limpa_Campos(FrmPedido);
  Util.Desabilita_Campos(FrmPedido);
  Escreve_Texto;
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
end;

procedure TFrmPedido.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Pedido.Excluir;
      Itens_Pedido.Excluir_Tudo;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU PEDIDO DE PRODUÇÃO ' + EdtN_Pedido.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnImprimir.Enabled:= false;
    Util.Desabilita_Campos(FrmPedido);
  end;
end;

procedure TFrmPedido.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmPedido.BBtnImprimirClick(Sender: TObject);
begin
  Application.CreateForm(TFrmEscolha_Impressao, FrmEscolha_Impressao);
  FrmEscolha_Impressao.ShowModal;
  FrmEscolha_Impressao.Free;
end;

procedure TFrmPedido.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Pedido, FrmChama_Pedido);
  FrmChama_Pedido.ShowModal;
  FrmChama_Pedido.Free;
end;

procedure TFrmPedido.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Verifica_Produto_Fracionado_Fechar;
        try
          Pedido.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'LANÇOU PEDIDO DE PRODUÇÃO ' + EdtN_Pedido.Text + '.', TimeToStr(time), insercao, date);
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
        Pedido.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU PEDIDO DE PRODUÇÃO ' + EdtN_Pedido.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmPedido);
end;

procedure TFrmPedido.Calcula_Total;
var
  total_pedido, valor_venda, total: double;
begin
  total_pedido:= StrToFloat(EdtTotal_Pedido.Text);
  valor_venda:= StrToFloat(EdtValor_Venda.Text);

  total:= total_pedido + valor_venda;

  EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);

  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtValor_Pagar.Text:= FormatFloat('#0.0,0', total);
  EdtValor_Pagar.Text:= StringReplace(EdtValor_Pagar.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmPedido.Calcula_Total_Deletado;
var
  total_pedido, valor_venda, total: double;
begin
  total_pedido:= StrToFloat(EdtTotal_Pedido.Text);
  valor_venda:= ADOQuery1Valor_Venda.AsFloat;

  total:= total_pedido - valor_venda;

  qtde_itens:= StrToInt(EdtQuantidade_Itens.Text);
  Dec(qtde_itens);
  EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);

  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtValor_Pagar.Text:= FormatFloat('#0.0,0', total);
  EdtValor_Pagar.Text:= StringReplace(EdtValor_Pagar.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

function TFrmPedido.Confira: boolean;
begin
  Confira:= false;

  if (EdtCodigo_Cliente.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Cliente.SetFocus;
    abort;
  end;

  if (CmbTipo.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    CmbTipo.SetFocus;
    abort;
  end;

  if (EdtTaxa_Entrega.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtTaxa_Entrega.SetFocus;
    abort;
  end;

  if (EdtDesconto_Total.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtDesconto_Total.SetFocus;
    abort;
  end;

  if (EdtAcrescimo.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtAcrescimo.SetFocus;
    abort;
  end;

  {if (EdtValor_Recebido.Text = '') or (EdtValor_Recebido.Text = '0,00') or (EdtValor_Recebido.Text = '0') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Recebido.SetFocus;
    abort;
  end;}

  Confira:= true;
end;

function TFrmPedido.Confira_Itens: boolean;
begin
  Confira_Itens:= false;

  if (EdtCodigo_Produto.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Produto.SetFocus;
    abort;
  end;

  if (CmbTamanho.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    CmbTamanho.SetFocus;
    abort;
  end;

  if (EdtBorda.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtBorda.SetFocus;
    abort;
  end;

  Confira_Itens:= true;
end;

procedure TFrmPedido.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_DELETE) then
  begin
    if (Mensagem.Confirma_Exclusao) then
    begin
      qtde_itens:= StrToInt(EdtQuantidade_Itens.Text);
      Dec(qtde_itens);
      qtde_produtos:= qtde_produtos - ADOQuery1Quantidade.AsFloat;
      Calcula_Total_Deletado;
      Verifica_Metade_Faltando_Deletar;
      Itens_Pedido.Excluir;
      Atualiza_Dados;
      Limpa_Menor;
    end;
  end;
end;

procedure TFrmPedido.EdtAcrescimoExit(Sender: TObject);
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

procedure TFrmPedido.EdtAcrescimoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPedido.EdtAtendenteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.EdtCheque_a_PrazoExit(Sender: TObject);
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

procedure TFrmPedido.EdtCheque_a_PrazoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPedido.EdtCheque_a_VistaExit(Sender: TObject);
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

procedure TFrmPedido.EdtCheque_a_VistaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPedido.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.EdtClienteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.EdtCodigo_AtendenteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    cliente:= false;
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmPedido.EdtCodigo_AtendenteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.EdtCodigo_ClienteExit(Sender: TObject);
begin
  MMOObservacao.SetFocus;
end;

procedure TFrmPedido.EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    cliente:= true;
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmPedido.EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free;
  end;
end;

procedure TFrmPedido.EdtCodigo_Condicao_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.EdtCodigo_MesaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmPedido.EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.EdtDescontoExit(Sender: TObject);
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

procedure TFrmPedido.EdtDescontoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPedido.EdtDesconto_TotalExit(Sender: TObject);
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

procedure TFrmPedido.EdtDesconto_TotalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPedido.EdtDinheiroExit(Sender: TObject);
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

procedure TFrmPedido.EdtDinheiroKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPedido.EdtEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.EdtMesaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.EdtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.EdtQuantidadeExit(Sender: TObject);
begin
  if (EdtQuantidade.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtQuantidade.SetFocus;
    abort;
  end;

  EdtQuantidade.Text:= FormatFloat('#0.0,0', StrToFloat(EdtQuantidade.Text));
  EdtQuantidade.Text:= StringReplace(EdtQuantidade.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmPedido.EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPedido.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.EdtSub_TotalEnter(Sender: TObject);
var
  valor_total, qtde, valor_unitario: double;
begin
  valor_unitario:= StrToFloat(EdtValor_Unitario.Text);
  qtde:= StrToFloat(EdtQuantidade.Text);
  valor_total:= valor_unitario * qtde;

  EdtSub_Total.Text:= FormatFloat('#0.0,0', valor_total);
  EdtSub_Total.Text:= StringReplace(EdtSub_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmPedido.EdtSub_TotalExit(Sender: TObject);
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

procedure TFrmPedido.EdtSub_TotalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPedido.EdtTaxa_EntregaExit(Sender: TObject);
begin
  if (EdtTaxa_Entrega.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtTaxa_Entrega.SetFocus;
    abort;
  end;

  EdtTaxa_Entrega.Text:= FormatFloat('#0.0,0', StrToFloat(EdtTaxa_Entrega.Text));
  EdtTaxa_Entrega.Text:= StringReplace(EdtTaxa_Entrega.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmPedido.EdtTaxa_EntregaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPedido.EdtTrocoEnter(Sender: TObject);
var
  valor_pagar, valor_rec, troco: double;
begin
  valor_pagar:= StrToFloat(EdtValor_Pagar.Text);
  valor_rec:= StrToFloat(EdtValor_Recebido.Text);

  troco:= valor_rec - valor_pagar;

  EdtTroco.Text:= FormatFloat('#0.0,0', troco);
  EdtTroco.Text:= StringReplace(EdtTroco.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmPedido.EdtValor_PagarEnter(Sender: TObject);
var
  total_pedido, tx_ent, desconto, acrescimo, valor_pagar: double;
begin
  total_pedido:= StrToFloat(EdtTotal_Pedido.Text);
  tx_ent:= StrToFloat(EdtTaxa_Entrega.Text);
  desconto:= StrToFloat(EdtDesconto_Total.Text);
  acrescimo:= StrToFloat(EdtAcrescimo.Text);

  valor_pagar:= total_pedido + tx_ent - desconto + acrescimo;

  EdtValor_Pagar.Text:= FormatFloat('#0.0,0', valor_pagar);
  EdtValor_Pagar.Text:= StringReplace(EdtValor_Pagar.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmPedido.EdtValor_RecebidoEnter(Sender: TObject);
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

procedure TFrmPedido.EdtValor_RecebidoExit(Sender: TObject);
begin
  if (EdtValor_Recebido.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor_Recebido.SetFocus;
    abort;
  end;

  EdtValor_Recebido.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor_Recebido.Text));
  EdtValor_Recebido.Text:= StringReplace(EdtValor_Recebido.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmPedido.EdtValor_RecebidoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPedido.EdtValor_UnitarioEnter(Sender: TObject);
var
  valor_unitario: double;
begin
  if (CmbTamanho.ItemIndex = 0) then
  begin
    if (EdtBorda.Text = 'S') then
      valor_unitario:= valor_mini + borda_mini
    else if (EdtBorda.Text = 'N') then
      valor_unitario:= valor_mini;
  end
  else if (CmbTamanho.ItemIndex = 1) then
  begin
    if (EdtBorda.Text = 'S') then
      valor_unitario:= valor_pequena + borda_pequena
    else if (EdtBorda.Text = 'N') then
      valor_unitario:= valor_pequena;
  end
  else if (CmbTamanho.ItemIndex = 2) then
  begin
    if (EdtBorda.Text = 'S') then
      valor_unitario:= valor_media + borda_media
    else if (EdtBorda.Text = 'N') then
      valor_unitario:= valor_media;
  end
  else if (CmbTamanho.ItemIndex = 3) then
  begin
    if (EdtBorda.Text = 'S') then
      valor_unitario:= valor_grande + borda_grande
    else if (EdtBorda.Text = 'N') then
      valor_unitario:= valor_grande;
  end
  else if (CmbTamanho.ItemIndex = 4) then
  begin
    if (EdtBorda.Text = 'S') then
      valor_unitario:= valor_gigante + borda_gigante
    else if (EdtBorda.Text = 'N') then
      valor_unitario:= valor_gigante;
  end
  else if (CmbTamanho.ItemIndex = 5) then
  begin
    if (EdtBorda.Text = 'S') then
      valor_unitario:= valor_familia + borda_familia
    else if (EdtBorda.Text = 'N') then
      valor_unitario:= valor_familia;
  end;

  EdtValor_Unitario.Text:= FormatFloat('#0.0,0', valor_unitario);
  EdtValor_Unitario.Text:= StringReplace(EdtValor_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmPedido.EdtValor_UnitarioExit(Sender: TObject);
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

procedure TFrmPedido.EdtValor_UnitarioKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPedido.EdtValor_VendaEnter(Sender: TObject);
var
  sub_total, desconto, valor_venda: double;
begin
  sub_total:= StrToFloat(EdtSub_Total.Text);
  desconto:= StrToFloat(EdtDesconto.Text);
  valor_venda:= sub_total - desconto;

  EdtValor_Venda.Text:= FormatFloat('#0.0,0', valor_venda);
  EdtValor_Venda.Text:= StringReplace(EdtValor_Venda.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmPedido.EdtValor_VendaExit(Sender: TObject);
begin
  if (EdtValor_Venda.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor_Venda.SetFocus;
    abort;
  end;

  EdtValor_Venda.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor_Venda.Text));
  EdtValor_Venda.Text:= StringReplace(EdtValor_Venda.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmPedido.EdtValor_VendaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPedido.Escreve_Texto;
begin
  Edit9.Text:= 'Qtde. Itens';
  Edit7.Text:= 'Total Pedido';
  Edit1.Text:= 'Tx. Entrega';
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
  EdtTaxa_Entrega.Text:= '0,00';
  EdtDesconto_Total.Text:= '0,00';
  EdtAcrescimo.Text:= '0,00';
  EdtValor_Pagar.Text:= '0,00';
  EdtValor_Recebido.Text:= '0,00';
  EdtTroco.Text:= '0,00';

  EdtDinheiro.Text:= '0,00';
  EdtCheque_a_Vista.Text:= '0,00';
  EdtCheque_a_Prazo.Text:= '0,00';
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmPedido.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmPedido.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmPedido.Free;
        FrmPedido:= Nil;
      end;
end;

procedure TFrmPedido.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmPedido);
  Util.Limpa_Campos(FrmPedido);
  Util.Desabilita_Campos(FrmPedido);
  PageControl2.TabIndex:= 0;
  qtde_faltando:= '0';

  Escreve_Texto;
end;

procedure TFrmPedido.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmPedido);
      Util.Limpa_Campos(FrmPedido);
      Escreve_Texto;
      Limpa_Menor;
      Gera_Codigo;
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      BBtnImprimir.Enabled:= false;
      achei:= false;
      CBFechar_Caixa.Checked:= false;
      PageControl2.TabIndex:= 0;
      qtde_faltando:= '0';
      MEdtData_Movimento.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmPedido.Gera_Codigo;
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
      add('select max(Codigo) as Codigo from Pedido');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(cast(N_Pedido as integer)) as N_Pedido from Pedido');
      open;
    end;
    n_ped:= qAux.FieldByName('N_Pedido').AsInteger + 1;
    EdtN_Pedido.Text:= StringOfChar('0', 10-Length(IntToStr(n_ped))) + IntToStr(n_ped);
    n_pedido:= EdtN_Pedido.Text;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmPedido.Limpa_Menor;
begin
  EdtCodigo_Produto.Clear;
  EdtProduto.Clear;
  CmbTamanho.ItemIndex:= -1;
  EdtBorda.Clear;
  EdtValor_Unitario.Text:= '0,00';
  EdtSub_Total.Text:= '0,00';
  EdtDesconto.Text:= '0,00';
  EdtValor_Venda.Text:= '0,00';
  EdtSabor_Borda.Clear;
  EdtQuantidade.Clear;
  Memo1.Clear;
  EdtCodigo_Produto.SetFocus;
end;

procedure TFrmPedido.MEdtCelularKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.MEdtData_MovimentoEnter(Sender: TObject);
begin
  MEdtData_Movimento.Text:= DateToStr(date);
end;

procedure TFrmPedido.MEdtData_MovimentoExit(Sender: TObject);
begin
  if (MEdtData_Movimento.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Movimento);
end;

procedure TFrmPedido.MEdtTelefoneKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPedido.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if Confira_Itens then
    begin
      Verifica_Produto_Lancado;
      Verifica_Produto_Fracionado;

      Bloqueia_Metade;
      Verifica_Metade_Faltando;

      qtde_itens:= StrToInt(EdtQuantidade_Itens.Text);
      inc(qtde_itens);

      n_pedido:= EdtN_Pedido.Text;
      n_pedido:= n_pedido + '/' + IntToStr(qtde_itens);

      qtde_produtos:= qtde_produtos + StrToFloat(EdtQuantidade.Text);

      Calcula_Total;
      Itens_Pedido.Inserir;
      Atualiza_Dados;
      Mensagem.Confirma_Insercao;
      Limpa_Menor;
    end;
  end;
end;

procedure TFrmPedido.Bloqueia_Metade;
var
  total: double;
begin
  if (Verifica_Numero_Inteiro(StrToFloat(EdtQuantidade.Text))) and falta_metade then
  begin
    Mensagem.Complete_Pizza;
    EdtQuantidade.SetFocus;
    abort;
  end;

  total:= controla_qtde_fracao + StrToFloat(EdtQuantidade.Text);
  if ( total > 1 ) and (falta_metade) then
  begin
    Mensagem.Pizza_Incompleta;
    EdtQuantidade.SetFocus;
    abort;
  end;
end;

procedure TFrmPedido.Verifica_Metade_Faltando;
begin
  if (Verifica_Numero_Inteiro(StrToFloat(EdtQuantidade.Text)) = false) then
  begin
    controla_qtde_fracao:= controla_qtde_fracao + StrToFloat(EdtQuantidade.Text);
    qtde_faltando:= FormatFloat('#0.0,0', 1-controla_qtde_fracao);

    if (StrToFloat(qtde_faltando) <> 0) then
      falta_metade:= true
    else
    begin
      falta_metade:= false;
      controla_qtde_fracao:= 0;
      qtde_faltando:= '0';
    end;
  end
  else
    falta_metade:= false;
end;

procedure TFrmPedido.Verifica_Metade_Faltando_Deletar;
begin
  if (Verifica_Numero_Inteiro(ADOQuery1Quantidade.AsFloat) = false) then
  begin
    controla_qtde_fracao:= controla_qtde_fracao - ADOQuery1Quantidade.AsFloat;
    qtde_faltando:= FormatFloat('#0.0,0', 1+controla_qtde_fracao);

    if (StrToFloat(qtde_faltando) <> 0) then
      falta_metade:= true
    else
    begin
      falta_metade:= false;
      controla_qtde_fracao:= 0;
      qtde_faltando:= '0';
    end;
  end
  else
    falta_metade:= false;
end;

function TFrmPedido.Verifica_Numero_Inteiro(Valor: Double): boolean;
begin
  if Frac(Valor) = 0 then
    Result:= true
  else
    Result:= false;
end;

procedure TFrmPedido.Verifica_Produto_Fracionado;
begin
  if (Verifica_Numero_Inteiro(StrToFloat(EdtQuantidade.Text)) = false) and (fracionado = 'NÃO') then
  begin
    Mensagem.Produto_Fracionado;
    EdtQuantidade.SetFocus;
    abort;
  end;
end;

procedure TFrmPedido.Verifica_Produto_Fracionado_Fechar;
begin
  if (Verifica_Numero_Inteiro(qtde_produtos) = false) then
  begin
    Mensagem.Fechar_Fracionado;
    abort;
  end;
end;

procedure TFrmPedido.Verifica_Produto_Lancado;
begin
  if (ADOQuery1.IsEmpty = false) then
  begin
    if ADOQuery1.Locate('Codigo;Codigo_Produto', VarArrayOf([StrToInt(EdtCodigo.Text), StrToInt(EdtCodigo_Produto.Text)]), []) then
    begin
      if not Mensagem.Produto_Lancado then
      begin
        Limpa_Menor;
        abort;
      end;
    end;
  end;
end;

end.
