unit UEscolha_Cotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, Grids, DBGrids, DB,
  ADODB, UUtilitarios;

type
  TFrmEscolha_Cotacao = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnOK: TToolButton;
    ImgImagens_Comandos: TImageList;
    BBtnSair: TToolButton;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1N_Cotacao: TIntegerField;
    ADOQuery1Codigo_Fornecedor: TIntegerField;
    EdtN_Cotacao: TEdit;
    Label11: TLabel;
    ADOQuery1Nome: TStringField;
    procedure BBtnSairClick(Sender: TObject);
    procedure BBtnOKClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtN_CotacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    qAux2: TADOQuery;
    Mensagem: UUtilitarios.TMensagem;

    procedure Pega_Dados;
    procedure Insere_Dados;
    procedure Calcula_Total;

  public
    { Public declarations }
    var
      preview: boolean;
  end;

var
  FrmEscolha_Cotacao: TFrmEscolha_Cotacao;

implementation

uses UDM, UCompra;

{$R *.dfm}

procedure TFrmEscolha_Cotacao.BBtnOKClick(Sender: TObject);
begin
  if (EdtN_Cotacao.Text = '') or (ADOQuery1.IsEmpty) then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtN_Cotacao.SetFocus;
    abort;
  end;
  Insere_Dados;
end;

procedure TFrmEscolha_Cotacao.BBtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmEscolha_Cotacao.DBGrid1DblClick(Sender: TObject);
begin
  BBtnOKClick(self);
end;

procedure TFrmEscolha_Cotacao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TFrmEscolha_Cotacao.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) then
    BBtnOKClick(self);
end;

procedure TFrmEscolha_Cotacao.EdtN_CotacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (EdtN_Cotacao.Text = '') then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtN_Cotacao.SetFocus;
      abort;
    end;
    Pega_Dados;
  end;
end;

procedure TFrmEscolha_Cotacao.Calcula_Total;
var
  sub_total, total_produtos, peso_total, desconto, total_pedido, outras_despesas, valor_frete: double;
begin
  sub_total:= qAux2.FieldByName('Sub_Total').AsFloat;
  outras_despesas:= StrToFloat(FrmCompra.EdtOutras_Despesas.Text);
  valor_frete:= StrToFloat(FrmCompra.EdtValor_Frete.Text);

  FrmCompra.qtde_itens:= StrToInt(FrmCompra.EdtQuantidade_Itens.Text);
  Inc(FrmCompra.qtde_itens);
  FrmCompra.EdtQuantidade_Itens.Text:= IntToStr(FrmCompra.qtde_itens);

  total_produtos:= sub_total + StrToFloat(FrmCompra.EdtTotal_Produtos.Text);
  FrmCompra.EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
  FrmCompra.EdtTotal_Produtos.Text:= StringReplace(FrmCompra.EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

  total_pedido:= total_produtos + outras_despesas + valor_frete;
  FrmCompra.EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
  FrmCompra.EdtTotal_Pedido.Text:= StringReplace(FrmCompra.EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

end;

procedure TFrmEscolha_Cotacao.Insere_Dados;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    qAux2:= TADOQuery.Create(self);
    with qAux2, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select IRC.* from Itens_Retorno_Cotacao_Preco IRC');
      add('inner join Retorno_Cotacao_Preco RC on (IRC.Codigo = RC.Codigo)');
      add('where IRC.N_Cotacao = :N_Cotacao and RC.Codigo_Fornecedor = :Fornecedor and IRC.Status = :Status');
      Parameters.ParamByName('N_Cotacao').Value:= ADOQuery1N_Cotacao.AsInteger;
      Parameters.ParamByName('Fornecedor').Value:= ADOQuery1Codigo_Fornecedor.AsInteger;
      Parameters.ParamByName('Status').Value:= 'APROVADO';
      open;
    end;

    qAux2.First;
    while not qAux2.Eof do
    begin
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('insert into Itens_Compra (Codigo, N_Pedido, Codigo_Produto, Qtde, Qtde_Recebida, Qtde_Restante, ');
        add('Valor_Unitario, Desconto, Tipo_Desconto, Sub_Total, Status) values ');
        add('(:Codigo, :N_Pedido, :Codigo_Produto, :Qtde, :Qtde_Recebida, :Qtde_Restante,');
        add(':Valor_Unitario, :Desconto, :Tipo_Desconto, :Sub_Total, :Status)');
        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCompra.EdtCodigo.Text);
        Parameters.ParamByName('N_Pedido').Value:= StrToInt(FrmCompra.EdtN_Pedido.Text);
        Parameters.ParamByName('Codigo_Produto').Value:= qAux2.FieldByName('Codigo_Produto').AsInteger;
        Parameters.ParamByName('Qtde').Value:= qAux2.FieldByName('Qtde').AsFloat;
        Parameters.ParamByName('Qtde_Recebida').Value:= 0;
        Parameters.ParamByName('Qtde_Restante').Value:= qAux2.FieldByName('Qtde').AsFloat;
        Parameters.ParamByName('Valor_Unitario').Value:= qAux2.FieldByName('Valor_Unitario').AsFloat;
        Parameters.ParamByName('Desconto').Value:= qAux2.FieldByName('Desconto').AsFloat;
        Parameters.ParamByName('Tipo_Desconto').Value:= qAux2.FieldByName('Tipo_Desconto').AsString;
        Parameters.ParamByName('Sub_Total').Value:= qAux2.FieldByName('Sub_Total').AsFloat;
        Parameters.ParamByName('Status').Value:= 'PENDENTE';
        ExecSQL;
      end;

      Calcula_Total;

      qAux2.Next;
    end;



    FrmCompra.EdtCodigo_Fornecedor.Text:= ADOQuery1Codigo_Fornecedor.AsString;
    FrmCompra.EdtFornecedor.Text:= ADOQuery1Nome.AsString;
    FrmCompra.Atualiza_Dados;
    FrmCompra.BBtnSalvar.Enabled:= true;
    FrmEscolha_Cotacao.Close;
  finally
    FreeAndNil(qAux);
    FreeAndNil(qAux2);
  end;
end;

procedure TFrmEscolha_Cotacao.Pega_Dados;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select RC.N_Cotacao, RC.Codigo_Fornecedor, CC.Nome from Retorno_Cotacao_Preco RC');
    add('inner join Cadastro_Cliente CC on (RC.Codigo_Fornecedor = CC.Codigo)');
    add('where RC.N_Cotacao = :N_Cotacao');
    Parameters.ParamByName('N_Cotacao').Value:= StrToInt(EdtN_Cotacao.Text);
    open;
  end;
end;

end.
