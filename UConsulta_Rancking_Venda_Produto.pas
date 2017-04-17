unit UConsulta_Rancking_Venda_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Rancking_Venda_Produto = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_rancking: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label3: TLabel;
    Label4: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    RGOrdena_Por: TRadioGroup;
    qryconsulta_ranckingDescricao: TStringField;
    qryconsulta_ranckingQtde: TFloatField;
    qryconsulta_ranckingTotal_vendido: TFloatField;
    qryconsulta_ranckingCusto_total: TFloatField;
    qryconsulta_ranckinglucratividade: TFloatField;
    qryconsulta_ranckingpercentual: TFloatField;
    qryconsulta_ranckinglucratividade_unitaria: TFloatField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_UsuarioKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Rancking_Venda_Produto: TFrmConsulta_Rancking_Venda_Produto;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Usuario, URel_Consulta_Rancking_Venda_Produto;

{$R *.dfm}

procedure TFrmConsulta_Rancking_Venda_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Rancking_Venda_Produto.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Rancking_Venda_Produto;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Rancking_Venda_Produto.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Rancking_Venda_Produto:= TFrmRel_Consulta_Rancking_Venda_Produto.create(self);
  FrmRel_Consulta_Rancking_Venda_Produto.Release;
  FrmRel_Consulta_Rancking_Venda_Produto:= Nil;
end;

procedure TFrmConsulta_Rancking_Venda_Produto.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_rancking.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Rancking_Venda_Produto.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Rancking_Venda_Produto.EdtCodigo_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Rancking_Venda_Produto.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Rancking_Venda_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Rancking_Venda_Produto.Release;
end;

procedure TFrmConsulta_Rancking_Venda_Produto.FormCreate(Sender: TObject);
begin
  qryconsulta_rancking.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  MEdtData_Inicial.Text:= DateToStr(date);
  MEdtData_Final.Text:= DateToStr(date);
end;

procedure TFrmConsulta_Rancking_Venda_Produto.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Rancking_Venda_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
