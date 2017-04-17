unit UConsulta_Cotacao_Preco_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Cotacao_Preco_Produto = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
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
    qryitens_cotacaoN_Cotacao: TIntegerField;
    qryitens_cotacaoCodigo_Produto: TIntegerField;
    qryitens_cotacaoQtde: TFloatField;
    qryitens_cotacaoDescricao: TStringField;
    qryitens_cotacaoSigla: TStringField;
    DataSource1: TDataSource;
    qryconsulta_cotacaoN_Cotacao: TIntegerField;
    qryconsulta_cotacaoCodigo_Empresa: TIntegerField;
    qryconsulta_cotacaoResponsavel: TStringField;
    qryconsulta_cotacaoData_Cotacao: TDateTimeField;
    qryconsulta_cotacaoHora_Cotacao: TStringField;
    qryconsulta_cotacaoData_Vencimento: TDateTimeField;
    qryconsulta_cotacaoQtde_Itens: TFloatField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_FuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_FinalExit(Sender: TObject);
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure EdtCotacaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Cotacao_Preco_Produto: TFrmConsulta_Cotacao_Preco_Produto;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Cliente, URel_Consulta_Cotacao_Preco_Produto;

{$R *.dfm}

procedure TFrmConsulta_Cotacao_Preco_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Cotacao_Preco_Produto.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Cotacao;
  if (qryconsulta_cotacao.IsEmpty = false) then
  begin
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Cotacao_Preco_Produto.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Cotacao_Preco_Produto:= TFrmRel_Consulta_Cotacao_Preco_Produto.create(self);
  FrmRel_Consulta_Cotacao_Preco_Produto.Release;
  FrmRel_Consulta_Cotacao_Preco_Produto:= Nil;
end;

procedure TFrmConsulta_Cotacao_Preco_Produto.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_cotacao.close;
  qryitens_cotacao.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
end;

procedure TFrmConsulta_Cotacao_Preco_Produto.DBGrid1CellClick(Column: TColumn);
begin
  Consulta.Consulta_Itens_Cotacao;
end;

procedure TFrmConsulta_Cotacao_Preco_Produto.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Cotacao_Preco_Produto.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Cotacao_Preco_Produto.EdtCodigo_FuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Cotacao_Preco_Produto.EdtCotacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmConsulta_Cotacao_Preco_Produto.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Cotacao_Preco_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Cotacao_Preco_Produto.Free;
  FrmConsulta_Cotacao_Preco_Produto:= NIl;
end;

procedure TFrmConsulta_Cotacao_Preco_Produto.FormCreate(Sender: TObject);
begin
  qryconsulta_cotacao.close;
  qryitens_cotacao.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Cotacao_Preco_Produto.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Cotacao_Preco_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Cotacao_Preco_Produto.MEdtData_FinalExit(
  Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Final);
end;

procedure TFrmConsulta_Cotacao_Preco_Produto.MEdtData_InicialExit(
  Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Inicial);
end;

end.
