unit UConsulta_Compra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Compra = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtFornecedor: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    EdtCodigo_Fornecedor: TEdit;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    MEdtData_Inicial: TMaskEdit;
    Label3: TLabel;
    MEdtData_Final: TMaskEdit;
    qryconsulta_compra: TADOQuery;
    ds_consulta_folha: TDataSource;
    qryitens_compra: TADOQuery;
    RGStatus: TRadioGroup;
    Label4: TLabel;
    EdtPedido: TEdit;
    DataSource1: TDataSource;
    qryconsulta_compraCodigo: TAutoIncField;
    qryconsulta_compraN_Pedido: TIntegerField;
    qryconsulta_compraData_Pedido: TDateTimeField;
    qryconsulta_compraHora_Pedido: TStringField;
    qryconsulta_compraData_Previsao_Entrega: TDateTimeField;
    qryconsulta_compraCodigo_Fornecedor: TIntegerField;
    qryconsulta_compraCodigo_Condicao_Pagamento: TIntegerField;
    qryconsulta_compraResponsavel: TStringField;
    qryconsulta_compraCodigo_Empresa: TIntegerField;
    qryconsulta_compraTipo_Frete: TStringField;
    qryconsulta_compraValor_Frete: TFloatField;
    qryconsulta_compraOutras_Despesas: TFloatField;
    qryconsulta_compraQtde_Itens: TIntegerField;
    qryconsulta_compraTotal_Produtos: TFloatField;
    qryconsulta_compraPeso_Total: TFloatField;
    qryconsulta_compraDesconto: TFloatField;
    qryconsulta_compraTipo_Desconto: TStringField;
    qryconsulta_compraTotal_Pedido: TFloatField;
    qryconsulta_compraStatus: TStringField;
    qryconsulta_compraObservacoes: TStringField;
    qryconsulta_compraData_Baixa: TDateTimeField;
    qryconsulta_compraNome: TStringField;
    qryconsulta_compraDescricao: TStringField;
    qryitens_compraCodigo: TIntegerField;
    qryitens_compraN_Pedido: TIntegerField;
    qryitens_compraCodigo_Produto: TIntegerField;
    qryitens_compraQtde: TFloatField;
    qryitens_compraQtde_Recebida: TFloatField;
    qryitens_compraQtde_Restante: TFloatField;
    qryitens_compraValor_Unitario: TFloatField;
    qryitens_compraDesconto: TFloatField;
    qryitens_compraTipo_Desconto: TStringField;
    qryitens_compraSub_Total: TFloatField;
    qryitens_compraStatus: TStringField;
    qryitens_compraData_Entrega: TDateTimeField;
    qryitens_compraDescricao: TStringField;
    qryitens_compraSigla: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtCodigo_FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_FornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure MEdtData_FinalExit(Sender: TObject);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Compra: TFrmConsulta_Compra;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Cliente, URel_Consulta_Compra;

{$R *.dfm}

procedure TFrmConsulta_Compra.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Compra.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Compra;
  if (qryconsulta_compra.IsEmpty = false) then
  begin
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Compra.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Compra:= TFrmRel_Consulta_Compra.create(self);
  FrmRel_Consulta_Compra.Release;
  FrmRel_Consulta_Compra:= Nil;
end;

procedure TFrmConsulta_Compra.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_compra.close;
  qryitens_compra.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
end;

procedure TFrmConsulta_Compra.DBGrid1CellClick(Column: TColumn);
begin
  Consulta.Consulta_Itens_Compra;
end;

procedure TFrmConsulta_Compra.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Compra.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Compra.EdtCodigo_FornecedorKeyDown(Sender: TObject;
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

procedure TFrmConsulta_Compra.EdtCodigo_FornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Compra.EdtFornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Compra.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Compra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Compra.Free;
  FrmConsulta_Compra:= NIl;
end;

procedure TFrmConsulta_Compra.FormCreate(Sender: TObject);
begin
  qryconsulta_compra.close;
  qryitens_compra.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Compra.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Compra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Compra.MEdtData_FinalExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Final);
end;

procedure TFrmConsulta_Compra.MEdtData_InicialExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Inicial);
end;

end.
