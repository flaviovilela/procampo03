unit UConciliacao_Compra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, URegistro,
  ExtCtrls, Provider, DBClient, RSPrint, Buttons, StrUtils, UUtilitarios;

type
  TFrmConciliacao_Compra = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
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
    EdtUnidade: TEdit;
    Label7: TLabel;
    EdtQtde_Solicitada: TEdit;
    Label8: TLabel;
    EdtValor_Unitario: TEdit;
    Label9: TLabel;
    EdtValor_Total_Recebido: TEdit;
    Label11: TLabel;
    EdtN_Pedido: TEdit;
    MEdtHora_Pedido: TMaskEdit;
    Label12: TLabel;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
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
    EdtFuncionario: TEdit;
    qryitens_compra: TADOQuery;
    ds_qry_itens_compra: TDataSource;
    Label15: TLabel;
    MEdtData_Entrega: TMaskEdit;
    Label6: TLabel;
    Label16: TLabel;
    Edtvalor_Total_Restante: TEdit;
    EdtQtde_Recebida: TEdit;
    Label17: TLabel;
    EdtQtde_Restante: TEdit;
    Label18: TLabel;
    qryitens_compraN_Pedido: TIntegerField;
    qryitens_compraCodigo_Produto: TIntegerField;
    qryitens_compraQtde_Solicitada: TFloatField;
    qryitens_compraQtde_Recebida: TFloatField;
    qryitens_compraQtde_Restante: TFloatField;
    qryitens_compraValor_Unitario: TFloatField;
    qryitens_compraValor_Total_Recebido: TFloatField;
    qryitens_compraValor_Total_Restante: TFloatField;
    qryitens_compraDescricao: TStringField;
    qryitens_compraSigla: TStringField;
    CBBaixa: TCheckBox;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limpa_Menor;
    procedure EdtValor_UnitarioExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Atualiza_Dados;
    function Chama_Compra: boolean;
    procedure Ver_Pedido;
    procedure EdtN_PedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edtvalor_Total_RestanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_EntregaEnter(Sender: TObject);
    procedure EdtQtde_RestanteEnter(Sender: TObject);
    procedure EdtQtde_RecebidaExit(Sender: TObject);
    procedure Atualiza_Pedido;
    procedure EdtValor_Total_RecebidoEnter(Sender: TObject);
    procedure Edtvalor_Total_RestanteEnter(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
  private
    Conciliacao_Compra: URegistro.TConciliacao;
    Util: TUtil;
    qtde_itens: integer;
    iniciado: boolean;
  public
    ativo, achei: boolean;
    tipo: string;
  protected
    function Confira_Pedido: boolean;
    function Confira_Itens_Pedido: boolean;
  end;

var
  FrmConciliacao_Compra: TFrmConciliacao_Compra;
implementation

uses UDM, UChama_Produto, UChama_Cliente, UChama_Condicao_Pagamento,
  UChama_Produto_Compra;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmConciliacao_Compra.Atualiza_Dados;
begin
  with qryitens_compra, sql do
  begin
    close;
    clear;
    add('select CC.*, P.Descricao, UM.Sigla from Conciliacao_Compra CC');
    add('inner join Cadastro_Produtos P on (CC.Codigo_Produto = P.Codigo)');
    add('inner join Unidade_Medida UM on (P.Codigo_Unidade = UM.Codigo)');
    add('where CC.N_Pedido = :Pedido');
    Parameters.ParamByName('Pedido').Value:= StrToInt(EdtN_Pedido.Text);
    open;
  end;
end;

procedure TFrmConciliacao_Compra.Atualiza_Pedido;
var
  qAux5, qAux6: TADOQuery;
begin
  qryitens_compra.First;

  dm.ADOConnection1.BeginTrans;
  qAux5:= TADOQuery.Create(self);
  qAux6:= TADOQuery.Create(self);
  try
  while not qryitens_compra.Eof do
  begin
    with qAux5, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Itens_Compra set Qtde_Recebida = :Qtde_Recebida, Qtde_Restante = :Qtde_Restante, Status = :S,');
      add('Data_Entrega = :Data where N_Pedido = :Pedido and Codigo_Produto = :Produto');
      Parameters.ParamByName('Qtde_Recebida').Value:= qryitens_compraQtde_Recebida.AsFloat;
      Parameters.ParamByName('Qtde_Restante').Value:= qryitens_compraQtde_Restante.AsFloat;
      if (qryitens_compraQtde_Restante.AsString <> '0') then
        Parameters.ParamByName('S').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('S').Value:= 'BAIXADO';
      Parameters.ParamByName('Pedido').Value:= StrToInt(EdtN_Pedido.Text);
      Parameters.ParamByName('Produto').Value:= qryitens_compraCodigo_Produto.AsInteger;
      Parameters.ParamByName('Data').Value:= StrToDateTime(MEdtData_Entrega.Text);
      ExecSQL;
    end;
    qryitens_compra.Next;
  end;

  if (CBBaixa.Checked = true) then
  begin
    with qAux6, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Compra set Data_Baixa = :Data_Baixa, Status = :Status');
      add('where N_Pedido = :Pedido');
      Parameters.ParamByName('Data_Baixa').Value:= StrToDateTime(MEdtData_Entrega.Text);
      Parameters.ParamByName('Pedido').Value:= StrToInt(EdtN_Pedido.Text);
      Parameters.ParamByName('Status').Value:= 'BAIXADO';
      ExecSQL;
    end;
  end;
  finally
    dm.ADOConnection1.CommitTrans;
    Mensagem.Processo_Concluido;
    FreeAndNil(qAux5);
    FreeAndNil(qAux6);
  end;

end;

procedure TFrmConciliacao_Compra.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmConciliacao_Compra);
  Util.Desabilita_Campos(FrmConciliacao_Compra);
  BBtnSalvar.Enabled:= false;
  BBtnCancelar.Enabled:= false;
  iniciado:= false;
end;

procedure TFrmConciliacao_Compra.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConciliacao_Compra.BBtnSalvarClick(Sender: TObject);
begin
  Atualiza_Pedido;
  BBtnSalvar.Enabled:= false;
  BBtnCancelar.Enabled:= false;
  Util.Insere_Historico(usuario, 'REALIZOU CONCILIAÇÃO DE COMPRAS ' + EdtN_Pedido.Text + '.', TimeToStr(time), alteracao, date);
  Util.Desabilita_Campos(FrmConciliacao_Compra);
  iniciado:= false;
end;

function TFrmConciliacao_Compra.Chama_Compra: boolean;
begin
  with qAux, sql do
  begin
    close;
    clear;
    add('Select C.*, CC.Nome, CP.Descricao from Compra C');
    add('inner join Cadastro_Cliente CC on (CC.Codigo = C.Codigo_Fornecedor)');
    add('inner join Condicao_Pagamento CP on (CP.Codigo = C.Codigo_Condicao_Pagamento)');
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

function TFrmConciliacao_Compra.Confira_Itens_Pedido: boolean;
begin
  Confira_Itens_Pedido:= false;

  if (EdtCodigo_Produto.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Produto.SetFocus;
    abort;
  end;

  if (EdtQtde_Solicitada.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtQtde_Solicitada.SetFocus;
    abort;
  end;

  if (EdtQtde_Recebida.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtQtde_Recebida.SetFocus;
    abort;
  end;

  if (EdtQtde_Restante.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtQtde_Restante.SetFocus;
    abort;
  end;

  Confira_Itens_Pedido:= true;
end;

function TFrmConciliacao_Compra.Confira_Pedido: boolean;
begin
  Confira_Pedido:= false;

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

  if (MEdtData_Pedido.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtData_Pedido.SetFocus;
    abort;
  end;

  if (MEdtPrevisao_Entrega.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtPrevisao_Entrega.SetFocus;
    abort;
  end;

  Confira_Pedido:= true;
end;

procedure TFrmConciliacao_Compra.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TFrmConciliacao_Compra.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_delete) then
  begin
    if (Mensagem.Confirma_Exclusao = true) then
      begin
        Conciliacao_Compra.Excluir;
      end;
  end;
end;

procedure TFrmConciliacao_Compra.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Produto_Compra, FrmChama_Produto_Compra);
    FrmChama_Produto_Compra.ShowModal;
    FrmChama_Produto_Compra.Free;
  end;
end;

procedure TFrmConciliacao_Compra.EdtCodigo_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConciliacao_Compra.EdtN_PedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (Chama_Compra = true) then
    begin
      Ver_Pedido;
      //Atualiza_Dados;
      achei:= true;
    end
    else
    begin
      EdtN_Pedido.SetFocus;
      achei:= false;
    end;
  end;
end;

procedure TFrmConciliacao_Compra.EdtProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConciliacao_Compra.EdtQtde_RecebidaExit(Sender: TObject);
begin
  if (EdtQtde_Recebida.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtQtde_Recebida.SetFocus;
    abort;
  end
  else
  begin
    EdtQtde_Recebida.Text:= FormatFloat('#0.0,0', StrToFloat(EdtQtde_Recebida.Text));
    EdtQtde_Recebida.Text:= StringReplace(EdtQtde_Recebida.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmConciliacao_Compra.EdtQtde_RestanteEnter(Sender: TObject);
var
  qtde_sol, qtde_rec, qtde_res, qtde_pen: double;
begin
  qtde_sol:= StrToFloat(EdtQtde_Solicitada.Text);
  qtde_rec:= StrToFloat(EdtQtde_Recebida.Text);
  qtde_res:= StrToFloat(EdtQtde_Restante.Text);

  if (qtde_rec > qtde_res) then
    qtde_pen:= (qtde_rec - qtde_res)
  else
    qtde_pen:= (qtde_res - qtde_rec);
  EdtQtde_Restante.Text:= FloatToStr(qtde_pen);
end;

procedure TFrmConciliacao_Compra.EdtValor_Total_RecebidoEnter(Sender: TObject);
  var
    qrec, vc, resul: double;
begin
  qrec:= strtofloat(EdtQtde_Recebida.Text);
  vc:= strtofloat(EdtValor_Unitario.Text);
  resul:= qrec * vc;
  EdtValor_Total_Recebido.Text:= FormatFloat('#0.0,0', resul);
  EdtValor_Total_Recebido.Text:= StringReplace(EdtValor_Total_Recebido.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmConciliacao_Compra.Edtvalor_Total_RestanteEnter(Sender: TObject);
  var
    qres, vc, resul: double;
begin
  qres:= strtofloat(EdtQtde_Restante.Text);
  vc:= strtofloat(EdtValor_Unitario.Text);
  resul:= qres * vc;
  Edtvalor_Total_Restante.Text:= FormatFloat('#0.0,0', resul);
  Edtvalor_Total_Restante.Text:= StringReplace(Edtvalor_Total_Restante.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmConciliacao_Compra.Edtvalor_Total_RestanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (Confira_Itens_Pedido = true) then
    begin
      Conciliacao_Compra.Inserir;
      Atualiza_Dados;
      Mensagem.Confirma_Insercao;
      Limpa_Menor;
      BBtnSalvar.Enabled:= true;
      BBtnCancelar.Enabled:= true;
    end;
  end;
end;

procedure TFrmConciliacao_Compra.EdtValor_UnitarioExit(Sender: TObject);
begin
  EdtValor_Unitario.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor_Unitario.Text));
  EdtValor_Unitario.Text:= StringReplace(EdtValor_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmConciliacao_Compra.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConciliacao_Compra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmConciliacao_Compra.Free;
        FrmConciliacao_Compra:= Nil;
      end;
end;

procedure TFrmConciliacao_Compra.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmConciliacao_Compra);
  Util.Limpa_Campos(FrmConciliacao_Compra);
  qtde_itens:= 0;
  Util.Desabilita_Campos(FrmConciliacao_Compra);
  PageControl2.TabIndex:= 0;
  CBBaixa.Checked:= false;
  iniciado:= false;
  //Centraliza_Form(FrmCompra);
end;

procedure TFrmConciliacao_Compra.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConciliacao_Compra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      if (iniciado = false) then
      begin
        Util.Habilita_Campos(FrmConciliacao_Compra);
        Util.Limpa_Campos(FrmConciliacao_Compra);
        BBtnSalvar.Enabled:= false;
        BBtnCancelar.Enabled:= true;
        achei:= false;
        PageControl2.TabIndex:= 0;
        EdtN_Pedido.SetFocus;
        CBBaixa.Checked:= false;
        iniciado:= true;
      end;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmConciliacao_Compra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmConciliacao_Compra.Limpa_Menor;
begin
  EdtCodigo_Produto.Clear;
  EdtProduto.Clear;
  EdtUnidade.Clear;
  EdtQtde_Solicitada.Clear;
  EdtQtde_Recebida.Clear;
  EdtQtde_Restante.Clear;
  EdtValor_Unitario.Clear;
  EdtValor_Total_Recebido.Clear;
  Edtvalor_Total_Restante.Clear;
  EdtCodigo_Produto.SetFocus;
end;

procedure TFrmConciliacao_Compra.MEdtData_EntregaEnter(Sender: TObject);
begin
  MEdtData_Entrega.Text:= DateToStr(date);
end;

procedure TFrmConciliacao_Compra.Ver_Pedido;
begin
  EdtCodigo_Fornecedor.Text:= qAux.FieldByName('Codigo_Fornecedor').AsString;
  EdtFornecedor.Text:= qAux.FieldByName('Nome').AsString;

  EdtCodigo_Condicao_Pagamento.Text:= qAux.FieldByName('Codigo_Condicao_Pagamento').AsString;
  EdtCondicao_Pagamento.Text:= qAux.FieldByName('Descricao').AsString;

  EdtFuncionario.Text:= qAux.FieldByName('Responsavel').AsString;

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

  MmoObservacao.Text:= qAux.FieldByName('Observacoes').AsString;

  BBtnSalvar.Enabled:= true;
  BBtnCancelar.Enabled:= true;
end;

end.
