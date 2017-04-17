unit UConsulta_Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Pedido = class(TForm)
    DBGrid1: TDBGrid;
    EdtParametro: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_pedido: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    EdtCodigo_Parametro: TEdit;
    RGConsulta_Por: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    RGStatus: TRadioGroup;
    qryconsulta_pedidoCodigo: TIntegerField;
    qryconsulta_pedidoN_Pedido: TStringField;
    qryconsulta_pedidoData_Movimento: TDateTimeField;
    qryconsulta_pedidoHora_Pedido: TDateTimeField;
    qryconsulta_pedidoHora_Fabricacao: TDateTimeField;
    qryconsulta_pedidoHora_Termino: TDateTimeField;
    qryconsulta_pedidoHora_Entrega: TDateTimeField;
    qryconsulta_pedidoTipo: TStringField;
    qryconsulta_pedidoCodigo_Mesa: TIntegerField;
    qryconsulta_pedidoCodigo_Atendente: TIntegerField;
    qryconsulta_pedidoCodigo_Cliente: TIntegerField;
    qryconsulta_pedidoCodigo_Condicao_Pagamento: TIntegerField;
    qryconsulta_pedidoObservacao: TStringField;
    qryconsulta_pedidoQuantidade_Itens: TIntegerField;
    qryconsulta_pedidoTotal_Pedido: TFloatField;
    qryconsulta_pedidoTaxa_Entrega: TFloatField;
    qryconsulta_pedidoDesconto: TFloatField;
    qryconsulta_pedidoAcrescimo: TFloatField;
    qryconsulta_pedidoValor_Pagar: TFloatField;
    qryconsulta_pedidoValor_Recebido: TFloatField;
    qryconsulta_pedidoTroco: TFloatField;
    qryconsulta_pedidoStatus: TStringField;
    qryconsulta_pedidoCodigo_Entregador: TIntegerField;
    qryconsulta_pedidoCondicao_Pagamento: TStringField;
    qryconsulta_pedidoMesa: TStringField;
    qryconsulta_pedidoCliente: TStringField;
    qryconsulta_pedidoAtendente: TStringField;
    qryconsulta_pedidoEntregador: TStringField;
    MEdtHora_Inicial: TMaskEdit;
    Label1: TLabel;
    MEdtHora_Final: TMaskEdit;
    Label5: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    qryitens_pedido: TADOQuery;
    DataSource1: TDataSource;
    qryitens_pedidoCodigo: TIntegerField;
    qryitens_pedidoN_Pedido: TStringField;
    qryitens_pedidoCodigo_Produto: TIntegerField;
    qryitens_pedidoTamanho: TStringField;
    qryitens_pedidoBorda: TStringField;
    qryitens_pedidoValor_Unitario: TFloatField;
    qryitens_pedidoQuantidade: TFloatField;
    qryitens_pedidoSub_Total: TFloatField;
    qryitens_pedidoDesconto: TFloatField;
    qryitens_pedidoValor_Venda: TFloatField;
    qryitens_pedidoObservacao: TStringField;
    qryitens_pedidoDescricao: TStringField;
    qryitens_pedidoCozinha: TStringField;
    qryitens_pedidoSabor_Borda: TStringField;
    qryconsulta_pedidoHora_Fechamento: TDateTimeField;
    qryconsulta_pedidoHora_Ped: TStringField;
    qryconsulta_pedidoHora_Fab: TStringField;
    qryconsulta_pedidoHora_Term: TStringField;
    qryconsulta_pedidoHora_Ent: TStringField;
    qryconsulta_pedidoHora_Fec: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtCodigo_ParametroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_ParametroKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Pedido: TFrmConsulta_Pedido;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Cliente, URel_Consulta_Pedido;

{$R *.dfm}

procedure TFrmConsulta_Pedido.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Pedido.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Pedido;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Pedido.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Pedido:= TFrmRel_Consulta_Pedido.create(self);
  FrmRel_Consulta_Pedido.Release;
  FrmRel_Consulta_Pedido:= Nil;
end;

procedure TFrmConsulta_Pedido.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_pedido.close;
  qryitens_pedido.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Pedido.DBGrid1CellClick(Column: TColumn);
begin
  Consulta.Consulta_Itens_Pedido;
end;

procedure TFrmConsulta_Pedido.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Pedido.EdtCodigo_ParametroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
      FrmChama_Cliente.ShowModal;
      FrmChama_Cliente.Free;
    end;
end;

procedure TFrmConsulta_Pedido.EdtCodigo_ParametroKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Pedido.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Pedido.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Pedido.Release;
end;

procedure TFrmConsulta_Pedido.FormCreate(Sender: TObject);
begin
  qryconsulta_pedido.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  MEdtData_Inicial.Text:= DateToStr(date);
  MEdtData_Final.Text:= DateToStr(date);
end;

procedure TFrmConsulta_Pedido.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Pedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
