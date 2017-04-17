unit URetorno_Cotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, URegistro,
  ExtCtrls, Provider, DBClient, RSPrint, Buttons, StrUtils, UUtilitarios;

type
  TFrmRetorno_Cotacao = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Cotacao: TMaskEdit;
    LblData_Cadastro: TLabel;
    LblNome: TLabel;
    EdtCodigo_Fornecedor: TEdit;
    EdtFornecedor: TEdit;
    Label2: TLabel;
    MEdtData_Retorno: TMaskEdit;
    Label3: TLabel;
    EdtOutras_Despesas: TEdit;
    RGTipo_Frete: TRadioGroup;
    Label4: TLabel;
    EdtValor_Frete: TEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label11: TLabel;
    EdtN_Cotacao: TEdit;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    BalloonHint1: TBalloonHint;
    qrycotacao: TADOQuery;
    qrycotacaoCodigo: TAutoIncField;
    qrycotacaoN_Pedido: TStringField;
    qrycotacaoCodigo_Cliente: TIntegerField;
    qrycotacaoCodigo_Condicao_Pagamento: TIntegerField;
    qrycotacaoOutras_Despesas: TFloatField;
    qrycotacaoTipo_Frete: TStringField;
    qrycotacaoValor_Frete: TFloatField;
    qrycotacaoData_Venda: TDateTimeField;
    qrycotacaoData_Previsao_Entrega: TDateTimeField;
    qrycotacaoQtde_Itens: TIntegerField;
    qrycotacaoTotal_Produtos: TFloatField;
    qrycotacaoPeso_Total: TFloatField;
    qrycotacaoDesconto: TFloatField;
    qrycotacaoTotal_Pedido: TFloatField;
    qrycotacaoObservacoes: TStringField;
    qrycotacaoTipo: TStringField;
    qrycotacaoStatus: TStringField;
    qrycotacaoHora_Entrega: TStringField;
    qAux: TADOQuery;
    qAux2: TADOQuery;
    rs: TRSPrinter;
    LblCPF: TLabel;
    LblEndereco: TLabel;
    LblSetor: TLabel;
    LblTelefone: TLabel;
    LblCidade: TLabel;
    LblUF: TLabel;
    LblTipo_Logradouro: TLabel;
    LblNumero: TLabel;
    Label10: TLabel;
    MmoObservacao: TMemo;
    Label1: TLabel;
    EdtCodigo_Condicao_Pagamento: TEdit;
    EdtCondicao_Pagamento: TEdit;
    Label14: TLabel;
    EdtResponsavel: TEdit;
    LblPedido: TLabel;
    qryitens_cotacao: TADOQuery;
    ds_qry_itens_compra: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo: TAutoIncField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Sigla: TStringField;
    Label5: TLabel;
    EdtPrazo_Entrega: TEdit;
    Label6: TLabel;
    qryitens_retorno_cotacao: TADOQuery;
    qryitens_cotacaoN_Cotacao: TIntegerField;
    qryitens_cotacaoCodigo_Produto: TIntegerField;
    qryitens_cotacaoQtde: TFloatField;
    qryitens_retorno_cotacaoCodigo: TIntegerField;
    qryitens_retorno_cotacaoN_Cotacao: TIntegerField;
    qryitens_retorno_cotacaoCodigo_Produto: TIntegerField;
    qryitens_retorno_cotacaoQtde: TFloatField;
    qryitens_retorno_cotacaoValor_Unitario: TFloatField;
    qryitens_retorno_cotacaoDesconto: TFloatField;
    qryitens_retorno_cotacaoSub_Total: TFloatField;
    qryitens_retorno_cotacaoDescricao: TStringField;
    qryitens_retorno_cotacaoUn: TStringField;
    qryitens_retorno_cotacaoTipo_Desconto: TStringField;
    Edit2: TEdit;
    EdtQuantidade_Itens: TEdit;
    EdtTotal_Produtos: TEdit;
    Edit4: TEdit;
    EdtPeso_Total: TEdit;
    Edit7: TEdit;
    EdtDesconto: TEdit;
    Edit8: TEdit;
    Edit5: TEdit;
    EdtTotal_Pedido: TEdit;
    RGDesconto: TRadioGroup;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_CotacaoEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Escreve_Texto;
    procedure MEdtData_RetornoEnter(Sender: TObject);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Gera_N_Pedido;
    procedure Calcula_Total;
    procedure Calcula_Total_Deletado;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtN_CotacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDescontoEnter(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_FornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Condicao_PagamentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCondicao_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_FuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrazo_EntregaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtOutras_DespesasKeyPress(Sender: TObject; var Key: Char);
    procedure qryitens_retorno_cotacaoPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure qryitens_retorno_cotacaoDescontoValidate(Sender: TField);
    procedure EdtValor_FreteExit(Sender: TObject);
    procedure EdtOutras_DespesasExit(Sender: TObject);
    procedure EdtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_CotacaoExit(Sender: TObject);
    procedure MEdtData_RetornoExit(Sender: TObject);
    procedure EdtN_CotacaoKeyPress(Sender: TObject; var Key: Char);
  private
    Retorno_Cotacao: URegistro.TRetorno_Cotacao;
    Itens_Retorno_Cotacao: URegistro.TItens_Retorno_Cotacao;
    Util: TUtil;
    Mensagem: UUtilitarios.TMensagem;
    codigo, qtde_itens: integer;
    iniciado: boolean;

    procedure Atualiza_Query;
    procedure Insere_Itens;
    procedure Totaliza;
    function Chama_Retorno: boolean;
    procedure Atualiza_Dados;
    procedure Atualiza_Itens_Retorno;
    function Chama_Cotacao: boolean;
    procedure Ver_Pedido;
    procedure Ver_Pedido_Retorno;
    procedure Gera_Codigo;
  public
    ativo, achei: boolean;
    tipo: string;
  protected
    function Confira_Pedido: boolean;
    function Confira_Itens_Pedido: boolean;
  end;

var
  FrmRetorno_Cotacao: TFrmRetorno_Cotacao;
implementation

uses UDM, UChama_Produto, UChama_Cliente, UChama_Condicao_Pagamento;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmRetorno_Cotacao.Atualiza_Dados;
begin
{  with qryitens_cotacao, sql do
  begin
    close;
    clear;
    add('select IC.*, IRC.Valor_Unitario, IRC.Desconto, IRC.Tipo_Desconto, IRC.Sub_Total');
    add(' from Itens_Cotacao_Preco_Produto IC');
    add('left join Itens_Retorno_Cotacao_Preco IRC on (IC.N_Cotacao = IRC.N_Cotacao)');
    add('where IC.N_Cotacao = :N_Cotacao');
    Parameters.ParamByName('N_Cotacao').Value:= StrToInt(EdtN_Cotacao.Text);
    open;
  end;}
  ADOQuery1.Close;
  ADOQuery1.open;
  with qryitens_cotacao, sql do
  begin
    close;
    clear;
    add('select IC.* from Itens_Cotacao_Preco_Produto IC');
    add('where IC.N_Cotacao = :N_Cotacao');
    Parameters.ParamByName('N_Cotacao').Value:= StrToInt(EdtN_Cotacao.Text);
    open;
  end;

  Insere_Itens;

  Atualiza_Itens_Retorno;
end;

procedure TFrmRetorno_Cotacao.Atualiza_Itens_Retorno;
begin
  with qryitens_retorno_cotacao, sql do
  begin
    close;
    clear;
    add('select IRC.* from Itens_Retorno_Cotacao_Preco IRC');
    add('where IRC.N_Cotacao = :N_Cotacao and IRC.Codigo = :Codigo');
    Parameters.ParamByName('N_Cotacao').Value:= StrToInt(EdtN_Cotacao.Text);
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmRetorno_Cotacao.Atualiza_Query;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select Pro.Tipo, Pro.Codigo, Pro.Codigo_Venda, Pro.Descricao, UM.Sigla from Produto Pro');
    add('inner join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
    open;
  end;
end;

procedure TFrmRetorno_Cotacao.BBtnCancelarClick(Sender: TObject);
begin
  if (achei = false) then
  begin
    if (qryitens_cotacao.IsEmpty = false) then
      Itens_Retorno_Cotacao.Excluir;
  end;

  Util.Limpa_Campos(FrmRetorno_Cotacao);
  Escreve_Texto;
  Util.Desabilita_Campos(FrmRetorno_Cotacao);
  qryitens_retorno_cotacao.Close;
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnCancelar.Enabled:= false;
  iniciado:= false;
end;

procedure TFrmRetorno_Cotacao.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao) then
  begin
    Retorno_Cotacao.Excluir;
    Itens_Retorno_Cotacao.Excluir;
    Mensagem.Exclusao_Realizada;
    Util.Insere_Historico(usuario, 'EXCLUIU O RETORNO DA COTAÇÃO ' + EdtN_Cotacao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnCancelar.Enabled:= false;
    iniciado:= false;
    Util.Desabilita_Campos(FrmRetorno_Cotacao);
  end;
end;

procedure TFrmRetorno_Cotacao.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRetorno_Cotacao.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira_Pedido = true) then
      BEGIN
        Retorno_Cotacao.Inserir;
        Mensagem.Confirma_Insercao;
        Util.Insere_Historico(usuario, 'CADASTROU O RETORNO DA COTAÇÃO ' + EdtN_Cotacao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira_Pedido = true) then
      begin
        Retorno_Cotacao.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU O RETORNO DA COTAÇÃO ' + EdtN_Cotacao.Text + '.', TimeToStr(time), alteracao, date);
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnCancelar.Enabled:= false;
    iniciado:= false;
    Util.Desabilita_Campos(FrmRetorno_Cotacao);
end;

procedure TFrmRetorno_Cotacao.Calcula_Total;
var
  sub_total, total_produtos, peso_total, desconto, total_pedido, outras_despesas, valor_frete: double;
begin
{  sub_total:= StrToFloat(EdtValor_Total.Text);
  outras_despesas:= StrToFloat(EdtOutras_Despesas.Text);
  valor_frete:= StrToFloat(EdtValor_Frete.Text);

  Inc(qtde_itens);
  EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);

  total_produtos:= sub_total + StrToFloat(EdtTotal_Produtos.Text);
  EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
  EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

  total_pedido:= sub_total + StrToFloat(EdtTotal_Pedido.Text) + outras_despesas + valor_frete;
  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);}

end;

procedure TFrmRetorno_Cotacao.Calcula_Total_Deletado;
var
  sub_total, total_produtos, peso_total, desconto, total_pedido, outras_despesas, valor_frete,
  limite_compra, limite_compra_disponivel: double;
begin
  sub_total:= qryitens_retorno_cotacaoSub_Total.AsFloat;
  outras_despesas:= StrToFloat(EdtOutras_Despesas.Text);
  valor_frete:= StrToFloat(EdtValor_Frete.Text);

  Dec(qtde_itens);
  EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);

  total_produtos:= StrToFloat(EdtTotal_Produtos.Text) - sub_total;
  EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
  EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

  total_pedido:= StrToFloat(EdtTotal_Pedido.Text) - sub_total;
  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

function TFrmRetorno_Cotacao.Chama_Cotacao: boolean;
begin
  with qAux, sql do
  begin
    close;
    clear;
    add('Select CP.* from Cotacao_Preco_Produto CP');
    add('where CP.N_Cotacao = :N_Cotacao');
    Parameters.ParamByName('N_Cotacao').Value:= EdtN_Cotacao.Text;
    open;
  end;

  if (qAux.IsEmpty = false) then
    Result:= true
  else
    Result:= false;
end;

function TFrmRetorno_Cotacao.Chama_Retorno: boolean;
begin
  with qAux, sql do
  begin
    close;
    clear;
    add('Select RC.*, Forn.Nome_Fantasia, CP.Descricao, F.Nome from Retorno_Cotacao_Preco RC');
    add('inner join Fornecedor Forn on (Forn.Codigo = RC.Codigo_Fornecedor)');
    add('inner join Condicao_Pagamento CP on (CP.Codigo = RC.Codigo_Condicao_Pagamento)');
    add('inner join Funcionario F on (F.Codigo = RC.Codigo_Funcionario)');
    add('where RC.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;

  if (qAux.IsEmpty = false) then
    Result:= true
  else
    Result:= false;
end;

function TFrmRetorno_Cotacao.Confira_Itens_Pedido: boolean;
begin
  Confira_Itens_Pedido:= false;


  Confira_Itens_Pedido:= true;
end;

function TFrmRetorno_Cotacao.Confira_Pedido: boolean;
begin
  Confira_Pedido:= false;

  if (EdtCodigo.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo.SetFocus;
    abort;
  end;

  if (EdtN_Cotacao.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtN_Cotacao.SetFocus;
    abort;
  end;

  if (EdtPrazo_Entrega.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtPrazo_Entrega.SetFocus;
    abort;
  end;

  if (EdtCodigo_Fornecedor.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Fornecedor.SetFocus;
    abort;
  end;

  if (EdtCodigo_Condicao_Pagamento.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Condicao_Pagamento.SetFocus;
    abort;
  end;

  if (EdtOutras_Despesas.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtOutras_Despesas.SetFocus;
    abort;
  end;

  if (EdtValor_Frete.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Frete.SetFocus;
    abort;
  end;

  if (MEdtData_Cotacao.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtData_Cotacao.SetFocus;
    abort;
  end;

  if (MEdtData_Retorno.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtData_Retorno.SetFocus;
    abort;
  end;

  Confira_Pedido:= true;
end;

procedure TFrmRetorno_Cotacao.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmRetorno_Cotacao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_delete) then
  begin
    if (Mensagem.Confirma_Exclusao = true) then
      begin
        Itens_Retorno_Cotacao.Excluir_Selecionado;
        Calcula_Total_Deletado;
      end;
  end;
end;

procedure TFrmRetorno_Cotacao.EdtCodigo_FornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.RGTipo.ItemIndex:= 1;
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmRetorno_Cotacao.EdtCodigo_FornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRetorno_Cotacao.EdtCodigo_FuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRetorno_Cotacao.EdtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (Chama_Retorno = true) then
    begin
      Ver_Pedido_Retorno;
      achei:= true;
    end
    else
    begin
      EdtCodigo.SetFocus;
      achei:= false;
    end;
  end;
end;

procedure TFrmRetorno_Cotacao.EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free;
  end;
end;

procedure TFrmRetorno_Cotacao.EdtCodigo_Condicao_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRetorno_Cotacao.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmRetorno_Cotacao.EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRetorno_Cotacao.EdtCondicao_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRetorno_Cotacao.EdtDescontoEnter(Sender: TObject);
begin
  RGDesconto.Visible:= true;
end;

procedure TFrmRetorno_Cotacao.EdtDescontoExit(Sender: TObject);
begin
  RGDesconto.Visible:= false;
end;

procedure TFrmRetorno_Cotacao.EdtFornecedorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRetorno_Cotacao.EdtN_CotacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  qAux: TADOQuery;
begin
  if (key = vk_return) then
  begin
    if (achei = false) then
    begin
      try
        qAux:= TADOQuery.Create(self);
        with qAux, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('select RCP.N_Cotacao, RCP.Codigo_Fornecedor from Retorno_Cotacao_Preco RCP');
          add('where RCP.N_Cotacao = :Cotacao and RCP.Codigo_Fornecedor  = :Fornecedor');
          Parameters.ParamByName('Cotacao').Value:= StrToInt(EdtN_Cotacao.Text);
          Parameters.ParamByName('Fornecedor').Value:= StrToInt(EdtCodigo_Fornecedor.Text);
          open;

          if (IsEmpty = false) then
          begin
            Mensagem.Mensagem_Cotacao_Existente;
            abort;
          end;
        end;
      finally
        FreeAndNil(qAux);
      end;

      if (Chama_Cotacao = true) then
      begin
        Ver_Pedido;
        Atualiza_Dados;
      end
      else
      begin
        Mensagem.Nao_Selecionado;
        EdtN_Cotacao.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmRetorno_Cotacao.EdtN_CotacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmRetorno_Cotacao.EdtOutras_DespesasExit(Sender: TObject);
begin
  if (EdtOutras_Despesas.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtOutras_Despesas.SetFocus;
    abort;
  end;

    Util.FormataFloat(2, EdtOutras_Despesas, StrToFloat(EdtOutras_Despesas.Text));
end;

procedure TFrmRetorno_Cotacao.EdtOutras_DespesasKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmRetorno_Cotacao.EdtPrazo_EntregaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmRetorno_Cotacao.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRetorno_Cotacao.EdtValor_FreteExit(Sender: TObject);
begin
  if (EdtValor_Frete.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Frete.SetFocus;
    abort;
  end;

    Util.FormataFloat(2, EdtValor_Frete, StrToFloat(EdtValor_Frete.Text));
end;

procedure TFrmRetorno_Cotacao.EdtValor_FreteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmRetorno_Cotacao.Escreve_Texto;
begin
  Edit2.Text:= 'Qtde Itens';
  Edit4.Text:= 'Total Produtos';
  Edit7.Text:= 'Peso Total';
  Edit8.Text:= 'Desconto';
  Edit5.Text:= 'Total do Pedido';
  EdtQuantidade_Itens.Text:= '0';
  EdtTotal_Produtos.Text:= '0,00';
  EdtPeso_Total.Text:= '0,00';
  EdtDesconto.Text:= '0,00';
  EdtTotal_Pedido.Text:= '0,00';
  EdtOutras_Despesas.Text:= '0,00';
  EdtValor_Frete.Text:= '0,00';
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmRetorno_Cotacao.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmRetorno_Cotacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmRetorno_Cotacao.Free;
        FrmRetorno_Cotacao:= Nil;
      end;
end;

procedure TFrmRetorno_Cotacao.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmRetorno_Cotacao);
  Util.Limpa_Campos(FrmRetorno_Cotacao);
  Escreve_Texto;
  qtde_itens:= 0;
  Util.Desabilita_Campos(FrmRetorno_Cotacao);
  PageControl2.TabIndex:= 0;
  qryitens_retorno_cotacao.Close;
  iniciado:= false;
end;

procedure TFrmRetorno_Cotacao.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmRetorno_Cotacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      if (iniciado = false) then
      begin
        Util.Habilita_Campos(FrmRetorno_Cotacao);
        Util.Limpa_Campos(FrmRetorno_Cotacao);
        Escreve_Texto;
        BBtnSalvar.Enabled:= true;
        BBtnExcluir.Enabled:= false;
        BBtnCancelar.Enabled:= true;
        achei:= false;
        PageControl2.TabIndex:= 0;
        Gera_N_Pedido;
        EdtCodigo_Fornecedor.SetFocus;
        qryitens_retorno_cotacao.Close;
        iniciado:= true;
      end;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmRetorno_Cotacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmRetorno_Cotacao.Gera_Codigo;
var
  qAux, qAux2: TADOQuery;
  n_pedido: integer;
begin
  try
    qAux:= TADOQuery.Create(self);
    qAux2:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from Retorno_Cotacao_Preco ');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmRetorno_Cotacao.Gera_N_Pedido;
var
  qAux, qAux2: TADOQuery;
  n_pedido: integer;
begin
  try
    qAux:= TADOQuery.Create(self);
    qAux2:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from Retorno_Cotacao_Preco ');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmRetorno_Cotacao.Insere_Itens;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    qryitens_cotacao.First;
    while not qryitens_cotacao.Eof do
    begin
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('insert into Itens_Retorno_Cotacao_Preco (Codigo, N_Cotacao, Codigo_Produto, Qtde, Tipo_Desconto, Status) values ');
        add('(:Codigo, :N_Cotacao, :Codigo_Produto, :Qtde, :Tipo_Desconto, :Status)');
        Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
        Parameters.ParamByName('N_Cotacao').Value:= qryitens_cotacaoN_Cotacao.AsInteger;
        Parameters.ParamByName('Codigo_Produto').Value:= qryitens_cotacaoCodigo_Produto.AsInteger;
        Parameters.ParamByName('Qtde').Value:= qryitens_cotacaoQtde.AsFloat;
        //Parameters.ParamByName('Desconto').Value:= 0;
        Parameters.ParamByName('Tipo_Desconto').Value:= '$';
        Parameters.ParamByName('Status').Value:= 'PENDENTE';
        ExecSQL;
      end;
      qryitens_cotacao.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmRetorno_Cotacao.MEdtData_RetornoEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Retorno.Text:= DateToStr(date);
end;

procedure TFrmRetorno_Cotacao.MEdtData_RetornoExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Retorno);
end;

procedure TFrmRetorno_Cotacao.qryitens_retorno_cotacaoDescontoValidate(
  Sender: TField);
begin
  Totaliza;
end;

procedure TFrmRetorno_Cotacao.qryitens_retorno_cotacaoPostError(
  DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  Mensagem.Mensagem_Falta_Dados;
end;

procedure TFrmRetorno_Cotacao.Totaliza;
var
  valor_un, desconto, valor_total, qtde, sub_total: double;
begin
  if (qryitens_retorno_cotacaoTipo_Desconto.AsString = '%') and (qryitens_retorno_cotacaoDesconto.AsFloat <> 0) then
  begin
    valor_un:= qryitens_retorno_cotacaoValor_Unitario.AsFloat;
    qtde:= qryitens_retorno_cotacaoQtde.AsFloat;
    desconto:= qryitens_retorno_cotacaoDesconto.AsFloat;
    sub_total:= valor_un * qtde;

    valor_total:= sub_total * (desconto / 100);
    valor_total:= sub_total - valor_total;
    qryitens_retorno_cotacaoSub_Total.AsFloat:= valor_total;
  end
  else if (qryitens_retorno_cotacaoTipo_Desconto.AsString = '$') and (qryitens_retorno_cotacaoDesconto.AsFloat <> 0) then
  begin
    valor_un:= qryitens_retorno_cotacaoValor_Unitario.AsFloat;
    qtde:= qryitens_retorno_cotacaoQtde.AsFloat;
    desconto:= qryitens_retorno_cotacaoDesconto.AsFloat;
    sub_total:= valor_un * qtde;

    valor_total:= sub_total - desconto;
    qryitens_retorno_cotacaoSub_Total.AsFloat:= valor_total;
  end
  else
  begin
    valor_un:= qryitens_retorno_cotacaoValor_Unitario.AsFloat;
    qtde:= qryitens_retorno_cotacaoQtde.AsFloat;
    sub_total:= valor_un * qtde;

    qryitens_retorno_cotacaoSub_Total.AsFloat:= sub_total;
  end;
end;

procedure TFrmRetorno_Cotacao.MEdtData_CotacaoEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cotacao.Text:= DateToStr(date);
end;

procedure TFrmRetorno_Cotacao.MEdtData_CotacaoExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cotacao);
end;

procedure TFrmRetorno_Cotacao.Ver_Pedido;
begin
  MEdtData_Cotacao.Text:= qAux.FieldByName('Data_Cotacao').AsString;

  with qAux2, sql do
  begin
    close;
    clear;
    add('select Forn.*, Ci.Cidade, Ci.UF, Se.Descricao, L.Logradouro, L.Tipo_Logradouro from Cadastro_Cliente Forn');
    add('left join Cadastro_Cidade Ci on (Forn.Codigo_Cidade = Ci.Codigo)');
    add('left join Cadastro_Setor Se on (Forn.Codigo_Setor = Se.Codigo)');
    add('left join Cadastro_Logradouro L on (Forn.Codigo_Endereco = L.Codigo)');
    add('where Forn.Codigo = :Fornecedor');
    Parameters.ParamByName('Fornecedor').Value:= StrToInt(EdtCodigo_Fornecedor.Text);
    open;
  end;

end;

procedure TFrmRetorno_Cotacao.Ver_Pedido_Retorno;
begin
  EdtCodigo.Text:= qAux.FieldByName('Codigo').AsString;
  EdtN_Cotacao.Text:= qAux.FieldByName('N_Cotacao').AsString;
  EdtCodigo_Fornecedor.Text:= qAux.FieldByName('Codigo_Fornecedor').AsString;
  EdtFornecedor.Text:= qAux.FieldByName('Nome_Fantasia').AsString;

  EdtCodigo_Condicao_Pagamento.Text:= qAux.FieldByName('Codigo_Condicao_Pagamento').AsString;
  EdtCondicao_Pagamento.Text:= qAux.FieldByName('Descricao').AsString;

  EdtResponsavel.Text:= qAux.FieldByName('Responsavel').AsString;

  if (qAux.FieldByName('Tipo_Frete').AsString = 'CIF') then
    RGTipo_Frete.ItemIndex:= 0
  else if (qAux.FieldByName('Tipo_Frete').AsString = 'FOB') then
    RGTipo_Frete.ItemIndex:= 2
  else if (qAux.FieldByName('Tipo_Frete').AsString = 'TERCEIROS') then
    RGTipo_Frete.ItemIndex:= 3
  else if (qAux.FieldByName('Tipo_Frete').AsString = 'ISENTO') then
    RGTipo_Frete.ItemIndex:= 4;

  EdtValor_Frete.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Valor_Frete').AsFloat);
  EdtValor_Frete.Text:= StringReplace(EdtValor_Frete.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtOutras_Despesas.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Outras_Despesas').AsFloat);
  EdtOutras_Despesas.Text:= StringReplace(EdtOutras_Despesas.Text, ThousandSeparator, '', [rfReplaceAll]);

  MEdtData_Cotacao.Text:= qAux.FieldByName('Data_Cotacao').AsString;
  MEdtData_Retorno.Text:= qAux.FieldByName('Data_Retorno').AsString;
  EdtPrazo_Entrega.Text:= qAux.FieldByName('Prazo_Entrega').AsString;

  EdtQuantidade_Itens.Text:= qAux.FieldByName('Qtde_Itens').AsString;

  EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Total_Produtos').AsFloat);
  EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtPeso_Total.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Peso_Total').AsFloat);
  EdtPeso_Total.Text:= StringReplace(EdtPeso_Total.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtDesconto.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Desconto').AsFloat);
  EdtDesconto.Text:= StringReplace(EdtDesconto.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Total_Pedido').AsFloat);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

  MmoObservacao.Text:= qAux.FieldByName('Observacoes').AsString;

  Atualiza_Itens_Retorno;

  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= true;
  BBtnCancelar.Enabled:= true;
end;

end.
