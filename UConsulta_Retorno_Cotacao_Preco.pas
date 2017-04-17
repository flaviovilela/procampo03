unit UConsulta_Retorno_Cotacao_Preco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Retorno_Cotacao_Preco = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtFuncionario: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    EdtCodigo_Funcionario: TEdit;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    MEdtData_Inicial: TMaskEdit;
    Label3: TLabel;
    MEdtData_Final: TMaskEdit;
    qryconsulta_cotacao: TADOQuery;
    ds_consulta_folha: TDataSource;
    qryitens_cotacao: TADOQuery;
    Label4: TLabel;
    EdtCotacao: TEdit;
    DataSource1: TDataSource;
    qryconsulta_cotacaoCodigo: TIntegerField;
    qryconsulta_cotacaoN_Cotacao: TIntegerField;
    qryconsulta_cotacaoData_Cotacao: TDateTimeField;
    qryconsulta_cotacaoData_Retorno: TDateTimeField;
    qryconsulta_cotacaoPrazo_Entrega: TIntegerField;
    qryconsulta_cotacaoCodigo_Fornecedor: TIntegerField;
    qryconsulta_cotacaoCodigo_Condicao_Pagamento: TIntegerField;
    qryconsulta_cotacaoResponsavel: TStringField;
    qryconsulta_cotacaoCodigo_Empresa: TIntegerField;
    qryconsulta_cotacaoTipo_Frete: TStringField;
    qryconsulta_cotacaoValor_Frete: TFloatField;
    qryconsulta_cotacaoOutras_Despesas: TFloatField;
    qryconsulta_cotacaoQtde_Itens: TIntegerField;
    qryconsulta_cotacaoTotal_Produtos: TFloatField;
    qryconsulta_cotacaoPeso_Total: TFloatField;
    qryconsulta_cotacaoDesconto: TFloatField;
    qryconsulta_cotacaoTipo_Desconto: TStringField;
    qryconsulta_cotacaoTotal_Pedido: TFloatField;
    qryconsulta_cotacaoObservacoes: TStringField;
    qryconsulta_cotacaoNome: TStringField;
    qryconsulta_cotacaoCond_Pag: TStringField;
    qryitens_cotacaoCodigo: TIntegerField;
    qryitens_cotacaoN_Cotacao: TIntegerField;
    qryitens_cotacaoCodigo_Produto: TIntegerField;
    qryitens_cotacaoQtde: TFloatField;
    qryitens_cotacaoValor_Unitario: TFloatField;
    qryitens_cotacaoDesconto: TFloatField;
    qryitens_cotacaoTipo_Desconto: TStringField;
    qryitens_cotacaoSub_Total: TFloatField;
    qryitens_cotacaoStatus: TStringField;
    qryitens_cotacaoDescricao: TStringField;
    qryitens_cotacaoSigla: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtCodigo_FuncionarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_FuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_FinalExit(Sender: TObject);
    procedure MEdtData_InicialExit(Sender: TObject);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Retorno_Cotacao_Preco: TFrmConsulta_Retorno_Cotacao_Preco;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Cliente, URel_Consulta_Retorno_Cotacao_Preco;

{$R *.dfm}

procedure TFrmConsulta_Retorno_Cotacao_Preco.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Retorno_Cotacao_Preco.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Retorno_Cotacao;
  if (qryconsulta_cotacao.IsEmpty = false) then
  begin
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Retorno_Cotacao_Preco.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Retorno_Cotacao_Preco:= TFrmRel_Consulta_Retorno_Cotacao_Preco.create(self);
  FrmRel_Consulta_Retorno_Cotacao_Preco.Release;
  FrmRel_Consulta_Retorno_Cotacao_Preco:= Nil;
end;

procedure TFrmConsulta_Retorno_Cotacao_Preco.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_cotacao.close;
  qryitens_cotacao.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
end;

procedure TFrmConsulta_Retorno_Cotacao_Preco.DBGrid1CellClick(Column: TColumn);
begin
  Consulta.Consulta_Itens_Retorno_Cotacao;
end;

procedure TFrmConsulta_Retorno_Cotacao_Preco.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Retorno_Cotacao_Preco.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_FuncionarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
      FrmChama_Cliente.RGTipo.ItemIndex:= 1;
      FrmChama_Cliente.ShowModal;
      FrmChama_Cliente.Free;
    end;
end;

procedure TFrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_FuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Retorno_Cotacao_Preco.EdtFuncionarioKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Retorno_Cotacao_Preco.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Retorno_Cotacao_Preco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Retorno_Cotacao_Preco.Free;
  FrmConsulta_Retorno_Cotacao_Preco:= NIl;
end;

procedure TFrmConsulta_Retorno_Cotacao_Preco.FormCreate(Sender: TObject);
begin
  qryconsulta_cotacao.close;
  qryitens_cotacao.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Retorno_Cotacao_Preco.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Retorno_Cotacao_Preco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Retorno_Cotacao_Preco.MEdtData_FinalExit(
  Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Final);
end;

procedure TFrmConsulta_Retorno_Cotacao_Preco.MEdtData_InicialExit(
  Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Inicial);
end;

end.
