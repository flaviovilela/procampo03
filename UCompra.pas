unit UCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, URegistro,
  ExtCtrls, Provider, DBClient, RSPrint, Buttons, StrUtils, UUtilitarios;

type
  TFrmCompra = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Pedido: TMaskEdit;
    LblData_Cadastro: TLabel;
    LblNome: TLabel;
    EdtCodigo_Fornecedor: TEdit;
    EdtFornecedor: TEdit;
    Label2: TLabel;
    MEdtPrevisao_Entrega: TMaskEdit;
    Label3: TLabel;
    EdtOutras_Despesas: TEdit;
    RGTipo_Frete: TRadioGroup;
    Label4: TLabel;
    EdtValor_Frete: TEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    EdtCodigo_Produto: TEdit;
    EdtProduto: TEdit;
    Label6: TLabel;
    EdtUnidade: TEdit;
    Label7: TLabel;
    EdtQuantidade: TEdit;
    Label8: TLabel;
    EdtValor_Unitario: TEdit;
    Label9: TLabel;
    EdtValor_Total: TEdit;
    Label11: TLabel;
    EdtN_Pedido: TEdit;
    MEdtHora_Pedido: TMaskEdit;
    Label12: TLabel;
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
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    BalloonHint1: TBalloonHint;
    qrycompra: TADOQuery;
    qrycompraCodigo: TAutoIncField;
    qrycompraN_Pedido: TStringField;
    qrycompraCodigo_Cliente: TIntegerField;
    qrycompraCodigo_Condicao_Pagamento: TIntegerField;
    qrycompraOutras_Despesas: TFloatField;
    qrycompraTipo_Frete: TStringField;
    qrycompraValor_Frete: TFloatField;
    qrycompraData_Venda: TDateTimeField;
    qrycompraData_Previsao_Entrega: TDateTimeField;
    qrycompraQtde_Itens: TIntegerField;
    qrycompraTotal_Produtos: TFloatField;
    qrycompraPeso_Total: TFloatField;
    qrycompraDesconto: TFloatField;
    qrycompraTotal_Pedido: TFloatField;
    qrycompraObservacoes: TStringField;
    qrycompraTipo: TStringField;
    qrycompraStatus: TStringField;
    qrycompraHora_Entrega: TStringField;
    qAux: TADOQuery;
    qAux2: TADOQuery;
    Label13: TLabel;
    EdtDesconto_Item: TEdit;
    RGDesconto_Item: TRadioGroup;
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
    qryitens_compra: TADOQuery;
    ds_qry_itens_compra: TDataSource;
    qryitens_compraCodigo: TIntegerField;
    qryitens_compraN_Pedido: TIntegerField;
    qryitens_compraCodigo_Produto: TIntegerField;
    qryitens_compraQtde: TFloatField;
    qryitens_compraValor_Unitario: TFloatField;
    qryitens_compraDesconto: TFloatField;
    qryitens_compraTipo_Desconto: TStringField;
    qryitens_compraSub_Total: TFloatField;
    qryitens_compraDescricao: TStringField;
    qryitens_compraSigla: TStringField;
    BBtnImportar: TToolButton;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_PedidoEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Escreve_Texto;
    procedure MEdtPrevisao_EntregaEnter(Sender: TObject);
    procedure MEdtHora_PedidoEnter(Sender: TObject);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtValor_TotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Gera_N_Pedido;
    procedure Limpa_Menor;
    procedure Calcula_Total;
    procedure Calcula_Total_Deletado;
    procedure EdtValor_TotalEnter(Sender: TObject);
    procedure EdtValor_UnitarioExit(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Atualiza_Dados;
    function Chama_Compra: boolean;
    procedure Ver_Pedido;
    procedure EdtN_PedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDesconto_ItemExit(Sender: TObject);
    procedure EdtDesconto_ItemEnter(Sender: TObject);
    procedure RGDesconto_ItemEnter(Sender: TObject);
    procedure RGDesconto_ItemExit(Sender: TObject);
    procedure RGDesconto_ItemClick(Sender: TObject);
    procedure EdtValor_UnitarioEnter(Sender: TObject);
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
    procedure BBtnImportarClick(Sender: TObject);
    procedure EdtValor_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtOutras_DespesasKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_PedidoExit(Sender: TObject);
    procedure MEdtPrevisao_EntregaExit(Sender: TObject);
  private
    Compra: URegistro.TCompra;
    Itens_Compra: URegistro.TItens_Compra;
    Util: TUtil;
    codigo: integer;
    iniciado: boolean;
  public
    ativo, achei: boolean;
    tipo: string;
    qtde_itens: integer;
  protected
    function Confira_Pedido: boolean;
    function Confira_Itens_Pedido: boolean;
  end;

var
  FrmCompra: TFrmCompra;
implementation

uses UDM, UChama_Produto, UChama_Cliente, UChama_Condicao_Pagamento,
  UEscolha_Cotacao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCompra.Atualiza_Dados;
begin
  with qryitens_compra, sql do
  begin
    close;
    clear;
    add('select IC.*, P.Descricao, UM.Sigla from Itens_Compra IC');
    add('left join Cadastro_Produtos P on (P.Codigo = IC.Codigo_Produto)');
    add('left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade)');
    add('where IC.N_Pedido = :Pedido');
    Parameters.ParamByName('Pedido').Value:= StrToInt(LblPedido.Caption);
    open;
  end;
end;

procedure TFrmCompra.BBtnCancelarClick(Sender: TObject);
begin
  if (qryitens_compra.IsEmpty = false) then
    Itens_Compra.Excluir;

  Util.Limpa_Campos(FrmCompra);
  Escreve_Texto;
  Util.Desabilita_Campos(FrmCompra);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnCancelar.Enabled:= false;
  BBtnImportar.Enabled:= false;
  qryitens_compra.Close;
  iniciado:= false;
end;

procedure TFrmCompra.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao) then
  begin
    Compra.Excluir;
    Itens_Compra.Excluir;
    Util.Insere_Historico(usuario, 'EXCLUIU PEDIDO DE COMPRA ' + EdtN_Pedido.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnCancelar.Enabled:= false;
    BBtnImportar.Enabled:= false;
    iniciado:= false;
    Util.Desabilita_Campos(FrmCompra);
  end;
end;

procedure TFrmCompra.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCompra.BBtnImportarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmEscolha_Cotacao, FrmEscolha_Cotacao);
  FrmEscolha_Cotacao.ShowModal;
  FrmEscolha_Cotacao.Free;
end;

procedure TFrmCompra.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira_Pedido = true) then
      BEGIN
        Compra.Inserir;
        Mensagem.Confirma_Insercao;
        Util.Insere_Historico(usuario, 'REALIZOU PEDIDO DE COMPRA ' + EdtN_Pedido.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira_Pedido = true) then
      BEGIN
        Compra.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU PEDIDO DE COMPRA ' + EdtN_Pedido.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnCancelar.Enabled:= false;
    BBtnImportar.Enabled:= false;
    iniciado:= false;
    Util.Desabilita_Campos(FrmCompra);
end;

procedure TFrmCompra.Calcula_Total;
var
  sub_total, total_produtos, peso_total, desconto, total_pedido, outras_despesas, valor_frete: double;
begin
  sub_total:= StrToFloat(EdtValor_Total.Text);
  outras_despesas:= StrToFloat(EdtOutras_Despesas.Text);
  valor_frete:= StrToFloat(EdtValor_Frete.Text);

  qtde_itens:= StrToInt(FrmCompra.EdtQuantidade_Itens.Text);
  Inc(qtde_itens);
  EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);

  total_produtos:= sub_total + StrToFloat(EdtTotal_Produtos.Text);
  EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
  EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

  total_pedido:= total_produtos + outras_despesas + valor_frete;
  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

end;

procedure TFrmCompra.Calcula_Total_Deletado;
var
  sub_total, total_produtos, peso_total, desconto, total_pedido, outras_despesas, valor_frete,
  limite_compra, limite_compra_disponivel: double;
begin
  sub_total:= qryitens_compraSub_Total.AsFloat;
  outras_despesas:= StrToFloat(EdtOutras_Despesas.Text);
  valor_frete:= StrToFloat(EdtValor_Frete.Text);

  qtde_itens:= StrToInt(FrmCompra.EdtQuantidade_Itens.Text);
  Dec(qtde_itens);
  EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);

  total_produtos:= StrToFloat(EdtTotal_Produtos.Text) - sub_total;
  EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
  EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

  total_pedido:= StrToFloat(EdtTotal_Pedido.Text) - sub_total;
  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

function TFrmCompra.Chama_Compra: boolean;
begin
  with qAux, sql do
  begin
    close;
    clear;
    add('Select C.*, Forn.Nome_Fantasia, CP.Descricao, F.Nome from Compra C');
    add('inner join Fornecedor Forn on (Forn.Codigo = C.Codigo_Fornecedor)');
    add('inner join Condicao_Pagamento CP on (CP.Codigo = C.Codigo_Condicao_Pagamento)');
    add('inner join Funcionario F on (F.Codigo = C.Codigo_Funcionario)');
    add('where C.N_Pedido = :Pedido and C.Status = :Status');
    Parameters.ParamByName('Pedido').Value:= EdtN_Pedido.Text;
    Parameters.ParamByName('Status').Value:= 'PENDENTE';
    open;
  end;

  if (qAux.IsEmpty = false) then
    Result:= true
  else
    Result:= false;
end;

function TFrmCompra.Confira_Itens_Pedido: boolean;
begin
  Confira_Itens_Pedido:= false;

  if (EdtCodigo_Produto.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Produto.SetFocus;
    abort;
  end;

  if (EdtQuantidade.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtQuantidade.SetFocus;
    abort;
  end;

  if (EdtValor_Total.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Total.SetFocus;
    abort;
  end;

  Confira_Itens_Pedido:= true;
end;

function TFrmCompra.Confira_Pedido: boolean;
begin
  Confira_Pedido:= false;

  if (EdtCodigo.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo.SetFocus;
    abort;
  end;

  if (EdtN_Pedido.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtN_Pedido.SetFocus;
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

  if (MEdtData_Pedido.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtData_Pedido.SetFocus;
    abort;
  end;

  if (MEdtPrevisao_Entrega.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtPrevisao_Entrega.SetFocus;
    abort;
  end;

  Confira_Pedido:= true;
end;

procedure TFrmCompra.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TFrmCompra.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_delete) then
  begin
    if (Mensagem.Confirma_Exclusao = true) then
      begin
        Itens_Compra.Excluir_Selecionado;
        Calcula_Total_Deletado;
        Atualiza_Dados;
      end;
  end;
end;

procedure TFrmCompra.EdtCodigo_FornecedorKeyDown(Sender: TObject;
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

procedure TFrmCompra.EdtCodigo_FornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCompra.EdtCodigo_FuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCompra.EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free;
  end;
end;

procedure TFrmCompra.EdtCodigo_Condicao_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCompra.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmCompra.EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCompra.EdtCondicao_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCompra.EdtDesconto_ItemEnter(Sender: TObject);
begin
  RGDesconto_Item.Visible:= true;
end;

procedure TFrmCompra.EdtDesconto_ItemExit(Sender: TObject);
begin
  if (EdtDesconto_Item.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtDesconto_Item.SetFocus;
    abort;
  end
  else
  begin
    EdtDesconto_Item.Text:= FormatFloat('#0.0,0', StrToFloat(EdtDesconto_Item.Text));
    EdtDesconto_Item.Text:= StringReplace(EdtDesconto_Item.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
  //RGDesconto_Item.Visible:= false;
end;

procedure TFrmCompra.EdtFornecedorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCompra.EdtN_PedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (Chama_Compra = true) then
    begin
      Ver_Pedido;
      Atualiza_Dados;
      achei:= true;
    end
    else
    begin
      EdtN_Pedido.SetFocus;
      achei:= false;
    end;
  end;
end;

procedure TFrmCompra.EdtOutras_DespesasKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCompra.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCompra.EdtQuantidadeExit(Sender: TObject);
begin
  if (EdtQuantidade.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtQuantidade.SetFocus;
    abort;
  end
  else
  begin
    EdtQuantidade.Text:= FormatFloat('#0.0,0', StrToFloat(EdtQuantidade.Text));
    EdtQuantidade.Text:= StringReplace(EdtQuantidade.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmCompra.EdtValor_FreteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCompra.EdtValor_TotalEnter(Sender: TObject);
var
  qtde, valor_unitario, total: double;
  desconto, cdesconto, ctotalitem: double;
begin
  RGDesconto_Item.Visible:= false;
  qtde:= StrToFloat(EdtQuantidade.Text);
  valor_unitario:= StrToFloat(EdtValor_Unitario.Text);
  total:= qtde * valor_unitario;

  if (RGDesconto_Item.ItemIndex = 0) then
    begin
      desconto:= 0;
      cdesconto:= 0;
      ctotalitem:= 0;

      desconto:= StrtoFloat(EdtDesconto_Item.Text);
      cdesconto:= total * (desconto / 100);
      ctotalitem:= total - cdesconto;
      EdtValor_Total.Text:= FormatFloat('#0.0,0', ctotalitem);
      EdtValor_Total.Text:= StringReplace(EdtValor_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
    end
    else
    begin
      desconto:= 0;
      ctotalitem:= 0;

      desconto:= StrtoFloat(EdtDesconto_Item.Text);
      ctotalitem:= total - desconto;
      EdtValor_Total.Text:= FormatFloat('#0.0,0', ctotalitem);
      EdtValor_Total.Text:= StringReplace(EdtValor_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
    end;
end;

procedure TFrmCompra.EdtValor_TotalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (Confira_Itens_Pedido = true) then
    begin
      Itens_Compra.Inserir;
      Atualiza_Dados;
      Mensagem.Confirma_Insercao;
      Calcula_Total;
      Limpa_Menor;
      BBtnSalvar.Enabled:= true;
      BBtnCancelar.Enabled:= true;
    end;
  end;
end;

procedure TFrmCompra.EdtValor_UnitarioEnter(Sender: TObject);
begin
  RGDesconto_Item.Visible:= false;
end;

procedure TFrmCompra.EdtValor_UnitarioExit(Sender: TObject);
begin
  EdtValor_Unitario.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor_Unitario.Text));
  EdtValor_Unitario.Text:= StringReplace(EdtValor_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmCompra.Escreve_Texto;
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
  EdtDesconto_Item.Text:= '0,00';
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

procedure TFrmCompra.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCompra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCompra.Free;
        FrmCompra:= Nil;
      end;
end;

procedure TFrmCompra.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCompra);
  Util.Limpa_Campos(FrmCompra);
  Escreve_Texto;
  qtde_itens:= 0;
  Util.Desabilita_Campos(FrmCompra);
  PageControl2.TabIndex:= 0;
  qryitens_compra.Close;
  iniciado:= false;
  //Centraliza_Form(FrmCompra);
end;

procedure TFrmCompra.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCompra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      if (iniciado = false) then
      begin
        Util.Habilita_Campos(FrmCompra);
        Util.Limpa_Campos(FrmCompra);
        Escreve_Texto;
        BBtnSalvar.Enabled:= false;
        BBtnExcluir.Enabled:= false;
        BBtnCancelar.Enabled:= true;
        BBtnImportar.Enabled:= true;
        achei:= false;
        PageControl2.TabIndex:= 0;
        Gera_N_Pedido;
        EdtN_Pedido.SetFocus;
        BBtnImportar.Enabled:= true;
        qryitens_compra.Close;
        iniciado:= true;
      end;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCompra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCompra.Gera_N_Pedido;
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
      add('select max(Codigo) as Codigo from Compra ');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);

    with qAux2, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(N_Pedido) as Pedido from Compra ');
      open;
    end;
    n_pedido:= qAux2.FieldByName('Pedido').AsInteger + 1;
    LblPedido.Caption:= IntToStr(n_pedido);
    EdtN_Pedido.Text:= StringOfChar('0', 12 - Length(IntToStr(n_pedido))) + IntToStr(n_pedido);

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCompra.Limpa_Menor;
begin
  EdtCodigo_Produto.Clear;
  EdtProduto.Clear;
  EdtUnidade.Clear;
  EdtQuantidade.Clear;
  EdtValor_Unitario.Clear;
  EdtValor_Total.Clear;
  EdtCodigo_Produto.SetFocus;
end;

procedure TFrmCompra.MEdtPrevisao_EntregaEnter(Sender: TObject);
begin
  MEdtPrevisao_Entrega.Text:= DateToStr(date);
end;

procedure TFrmCompra.MEdtPrevisao_EntregaExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtPrevisao_Entrega);
end;

procedure TFrmCompra.RGDesconto_ItemClick(Sender: TObject);
begin
  RGDesconto_Item.Visible:= true;
end;

procedure TFrmCompra.RGDesconto_ItemEnter(Sender: TObject);
begin
  RGDesconto_Item.Visible:= true;
end;

procedure TFrmCompra.RGDesconto_ItemExit(Sender: TObject);
begin
  RGDesconto_Item.Visible:= false;
end;

procedure TFrmCompra.MEdtData_PedidoEnter(Sender: TObject);
begin
  MEdtData_Pedido.Text:= DateToStr(date);
end;

procedure TFrmCompra.MEdtData_PedidoExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Pedido);
end;

procedure TFrmCompra.MEdtHora_PedidoEnter(Sender: TObject);
begin
  MEdtHora_Pedido.Text:= TimeToStr(Now);
end;

procedure TFrmCompra.Ver_Pedido;
begin
  EdtCodigo.Text:= qAux.FieldByName('Codigo').AsString;
  LblPedido.Caption:= qAux.FieldByName('N_Pedido').AsString;
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

  MEdtData_Pedido.Text:= qAux.FieldByName('Data_Pedido').AsString;
  MEdtPrevisao_Entrega.Text:= qAux.FieldByName('Data_Previsao_Entrega').AsString;
  MEdtHora_Pedido.Text:= qAux.FieldByName('Hora_Pedido').AsString;

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

  with qAux2, sql do
  begin
    close;
    clear;
    add('select Forn.*, Ci.Descricao, Ci.UF, Se.Descricao, L.Descricao, L.Tipo_Logradouro from Fornecedor Forn');
    add('left join Cidade Ci on (Forn.Codigo_Cidade = Ci.Codigo)');
    add('left join Setor Se on (Forn.Codigo_Setor = Se.Codigo)');
    add('left join Logradouro L on (Forn.Codigo_Logradouro = L.Codigo)');
    add('where Forn.Codigo = :Fornecedor');
    Parameters.ParamByName('Fornecedor').Value:= StrToInt(EdtCodigo_Fornecedor.Text);
    open;
  end;

  if (qAux2.FieldByName('CPF').AsString <> '') then
    FrmCompra.LblCPF.Caption:= qAux2.FieldByName('CPF').AsString
  else if (qAux2.FieldByName('CNPJ').AsString <> '') then
    FrmCompra.LblCPF.Caption:= qAux2.FieldByName('CNPJ').AsString
  else
    FrmCompra.LblCPF.Caption:= '';

  FrmCompra.LblCidade.Caption:= qAux2.FieldByName('Descricao').AsString;
  FrmCompra.LblSetor.Caption:= qAux2.FieldByName('Descricao_1').AsString;
  FrmCompra.LblEndereco.Caption:= qAux2.FieldByName('Descricao_2').AsString;
  FrmCompra.LblTipo_Logradouro.Caption:= qAux2.FieldByName('Tipo_Logradouro').AsString;
  FrmCompra.LblUF.Caption:= qAux2.FieldByName('UF').AsString;
  FrmCompra.LblTelefone.Caption:= qAux2.FieldByName('Telefone').AsString;
  FrmCompra.LblNumero.Caption:= qAux2.FieldByName('Numero').AsString;

  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnCancelar.Enabled:= false;
end;

end.
