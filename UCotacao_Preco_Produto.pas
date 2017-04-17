unit UCotacao_Preco_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, URegistro,
  ExtCtrls, Provider, DBClient, RSPrint, Buttons, StrUtils, UUtilitarios;

type
  TFrmCotacao_Preco_Produto = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    MEdtData_Cotacao: TMaskEdit;
    LblData_Cadastro: TLabel;
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
    Label11: TLabel;
    EdtN_Cotacao: TEdit;
    MEdtHora_Pedido: TMaskEdit;
    Label12: TLabel;
    Edit2: TEdit;
    EdtQuantidade_Itens: TEdit;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    BalloonHint1: TBalloonHint;
    LblProduto: TLabel;
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
    BBtnImprimir: TToolButton;
    LblPedido: TLabel;
    qryitens_cotacao: TADOQuery;
    ds_qry_itens_compra: TDataSource;
    Label16: TLabel;
    MEdtData_Vencimento: TMaskEdit;
    Label14: TLabel;
    EdtResponsavel: TEdit;
    qryitens_cotacaoN_Cotacao: TIntegerField;
    qryitens_cotacaoCodigo_Produto: TIntegerField;
    qryitens_cotacaoQtde: TFloatField;
    qryitens_cotacaoDescricao: TStringField;
    qryitens_cotacaoSigla: TStringField;
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
    procedure MEdtHora_PedidoEnter(Sender: TObject);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Gera_N_Pedido;
    procedure Limpa_Menor;
    procedure Calcula_Total;
    procedure Calcula_Total_Deletado;
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Atualiza_Dados;
    function Chama_Compra: boolean;
    procedure Ver_Pedido;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_FuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_VencimentoEnter(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtN_CotacaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtN_CotacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_CotacaoExit(Sender: TObject);
    procedure MEdtData_VencimentoExit(Sender: TObject);
  private
    Cotacao: URegistro.TCotacao_Preco_Produto;
    Mensagem: UUtilitarios.TMensagem;
    Itens_Cotacao: URegistro.TItens_Cotacao_Preco_Produto;
    Util: TUtil;
    codigo, qtde_itens: integer;
    iniciado: boolean;
  public
    ativo, achei: boolean;
    tipo: string;
  protected
    function Confira_Pedido: boolean;
    function Confira_Itens_Pedido: boolean;
  end;

var
  FrmCotacao_Preco_Produto: TFrmCotacao_Preco_Produto;
implementation

uses UDM, UChama_Produto, URel_Cotacao_Preco_Produto;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCotacao_Preco_Produto.Atualiza_Dados;
begin
  with qryitens_cotacao, sql do
  begin
    close;
    clear;
    add('select IC.*, P.Descricao, UM.Sigla from Itens_Cotacao_Preco_Produto IC');
    add('left join Cadastro_Produtos P on (P.Codigo = IC.Codigo_Produto)');
    add('left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade)');
    add('where IC.N_Cotacao = :N_Cotacao');
    Parameters.ParamByName('N_Cotacao').Value:= StrToInt(EdtN_Cotacao.Text);
    open;
  end;
end;

procedure TFrmCotacao_Preco_Produto.BBtnCancelarClick(Sender: TObject);
begin
  if (qryitens_cotacao.IsEmpty = false) then
    Itens_Cotacao.Excluir;

  Util.Limpa_Campos(FrmCotacao_Preco_Produto);
  Escreve_Texto;
  Util.Desabilita_Campos(FrmCotacao_Preco_Produto);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  iniciado:= false;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCotacao_Preco_Produto.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao) then
  begin
    Cotacao.Excluir;
    Itens_Cotacao.Excluir;
    Util.Insere_Historico(usuario, 'EXCLUIU COTAÇÃO DE PREÇO DE PRODUTOS ' + EdtN_Cotacao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnImprimir.Enabled:= false;
    BBtnCancelar.Enabled:= false;
    iniciado:= false;
    Util.Desabilita_Campos(FrmCotacao_Preco_Produto);
  end;
end;

procedure TFrmCotacao_Preco_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCotacao_Preco_Produto.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Cotacao_Preco_Produto:= TFrmRel_Cotacao_Preco_Produto.create(self);
  FrmRel_Cotacao_Preco_Produto.Release;
  FrmRel_Cotacao_Preco_Produto:= Nil;
end;

procedure TFrmCotacao_Preco_Produto.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira_Pedido = true) then
      BEGIN
        Cotacao.Inserir;
        Mensagem.Confirma_Insercao;
        Util.Insere_Historico(usuario, 'CADASTROU COTAÇÃO DE PREÇO DE PRODUTOS ' + EdtN_Cotacao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira_Pedido = true) then
      BEGIN
        Cotacao.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU COTAÇÃO DE PREÇO DE PRODUTOS ' + EdtN_Cotacao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnImprimir.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    iniciado:= false;
    Util.Desabilita_Campos(FrmCotacao_Preco_Produto);
end;

procedure TFrmCotacao_Preco_Produto.Calcula_Total;
begin
  Inc(qtde_itens);
  EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);
end;

procedure TFrmCotacao_Preco_Produto.Calcula_Total_Deletado;
begin
  Dec(qtde_itens);
  EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);
end;

function TFrmCotacao_Preco_Produto.Chama_Compra: boolean;
begin
  with qAux, sql do
  begin
    close;
    clear;
    add('Select CP.* from Cotacao_Preco_Produto CP');
    add('where CP.N_Cotacao = :Pedido');
    Parameters.ParamByName('Pedido').Value:= EdtN_Cotacao.Text;
    open;
  end;

  if (qAux.IsEmpty = false) then
    Result:= true
  else
    Result:= false;
end;

function TFrmCotacao_Preco_Produto.Confira_Itens_Pedido: boolean;
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

  Confira_Itens_Pedido:= true;
end;

function TFrmCotacao_Preco_Produto.Confira_Pedido: boolean;
begin
  Confira_Pedido:= false;

  if (EdtN_Cotacao.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtN_Cotacao.SetFocus;
    abort;
  end;

  if (MEdtData_Cotacao.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtData_Cotacao.SetFocus;
    abort;
  end;

  if (MEdtData_Vencimento.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtData_Vencimento.SetFocus;
    abort;
  end;

  Confira_Pedido:= true;
end;

procedure TFrmCotacao_Preco_Produto.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TFrmCotacao_Preco_Produto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_delete) then
  begin
    if (Mensagem.Confirma_Exclusao = true) then
      begin
        Itens_Cotacao.Excluir_Selecionado;
        Calcula_Total_Deletado;
        Atualiza_Dados;
      end;
  end;
end;

procedure TFrmCotacao_Preco_Produto.EdtCodigo_FuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCotacao_Preco_Produto.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmCotacao_Preco_Produto.EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCotacao_Preco_Produto.EdtN_CotacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
    if (Chama_Compra = true) then
    begin
      achei:= true;
      Ver_Pedido;
      Atualiza_Dados;
    end
    else
    begin
      achei:= false;
      Mensagem.Nao_Selecionado;
      EdtN_Cotacao.SetFocus;
    end;
  end;
end;

procedure TFrmCotacao_Preco_Produto.EdtN_CotacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCotacao_Preco_Produto.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCotacao_Preco_Produto.EdtQuantidadeExit(Sender: TObject);
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

procedure TFrmCotacao_Preco_Produto.EdtQuantidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (Confira_Itens_Pedido = true) then
    begin
      Itens_Cotacao.Inserir;
      Mensagem.Confirma_Insercao;
      Atualiza_Dados;
      Calcula_Total;
      Limpa_Menor;
      BBtnSalvar.Enabled:= true;
      BBtnCancelar.Enabled:= true;
    end;
  end;
end;

procedure TFrmCotacao_Preco_Produto.Escreve_Texto;
begin
  Edit2.Text:= 'Qtde Itens';
  EdtQuantidade_Itens.Text:= '0';
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCotacao_Preco_Produto.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCotacao_Preco_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCotacao_Preco_Produto.Free;
        FrmCotacao_Preco_Produto:= Nil;
      end;
end;

procedure TFrmCotacao_Preco_Produto.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCotacao_Preco_Produto);
  Util.Limpa_Campos(FrmCotacao_Preco_Produto);
  Escreve_Texto;
  qtde_itens:= 0;
  Util.Desabilita_Campos(FrmCotacao_Preco_Produto);
  PageControl2.TabIndex:= 0;
  qryitens_cotacao.Close;
  iniciado:= false;
  //Centraliza_Form(FrmCotacao_Preco_Produto);
end;

procedure TFrmCotacao_Preco_Produto.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCotacao_Preco_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      if (iniciado = false) then
      begin
        Util.Habilita_Campos(FrmCotacao_Preco_Produto);
        Util.Limpa_Campos(FrmCotacao_Preco_Produto);
        Escreve_Texto;
        BBtnSalvar.Enabled:= false;
        BBtnExcluir.Enabled:= false;
        BBtnImprimir.Enabled:= false;
        BBtnCancelar.Enabled:= true;
        achei:= false;
        PageControl2.TabIndex:= 0;
        Gera_N_Pedido;
        EdtN_Cotacao.SetFocus;
        qryitens_cotacao.Close;
        iniciado:= true;
      end;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCotacao_Preco_Produto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCotacao_Preco_Produto.Gera_N_Pedido;
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
      add('select max(N_Cotacao) as Cotacao from Cotacao_Preco_Produto ');
      open;
    end;
    codigo:= qAux.FieldByName('Cotacao').AsInteger + 1;
    EdtN_Cotacao.Text:= IntToStr(codigo);

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCotacao_Preco_Produto.Limpa_Menor;
begin
  EdtCodigo_Produto.SetFocus;
  EdtCodigo_Produto.Clear;
  EdtProduto.Clear;
  EdtUnidade.Clear;
  EdtQuantidade.Clear;
  LblProduto.Caption:= '';
end;

procedure TFrmCotacao_Preco_Produto.MEdtData_CotacaoEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cotacao.Text:= DateToStr(date);
end;

procedure TFrmCotacao_Preco_Produto.MEdtData_CotacaoExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cotacao);
end;

procedure TFrmCotacao_Preco_Produto.MEdtData_VencimentoEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Vencimento.Text:= DateToStr(date);
end;

procedure TFrmCotacao_Preco_Produto.MEdtData_VencimentoExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Vencimento);
end;

procedure TFrmCotacao_Preco_Produto.MEdtHora_PedidoEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtHora_Pedido.Text:= TimeToStr(Now);
end;

procedure TFrmCotacao_Preco_Produto.Ver_Pedido;
begin
  EdtN_Cotacao.Text:= qAux.FieldByName('N_Cotacao').AsString;
  EdtResponsavel.Text:= qAux.FieldByName('Responsavel').AsString;

  MEdtData_Cotacao.Text:= qAux.FieldByName('Data_Cotacao').AsString;
  MEdtData_Vencimento.Text:= qAux.FieldByName('Data_Vencimento').AsString;
  MEdtHora_Pedido.Text:= qAux.FieldByName('Hora_Cotacao').AsString;

  EdtQuantidade_Itens.Text:= qAux.FieldByName('Qtde_Itens').AsString;

  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnImprimir.Enabled:= true;
end;

end.
