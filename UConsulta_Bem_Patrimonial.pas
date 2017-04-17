unit UConsulta_Bem_Patrimonial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, ComCtrls, DBCtrls,
  ImgList, ToolWin, Data.DB, Data.Win.ADODB, UUtilitarios;

type
  TFrmConsulta_Bem_Patrimonial = class(TForm)
    ImgImagens: TImageList;
    DBGrid1: TDBGrid;
    RGTipo: TRadioGroup;
    Label2: TLabel;
    EdtTipo_Bem: TEdit;
    EdtCodigo_Tipo_Bem: TEdit;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_bem: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qryconsulta_bemCodigo: TIntegerField;
    qryconsulta_bemCodigo_Propriedade: TIntegerField;
    qryconsulta_bemIdentificacao: TStringField;
    qryconsulta_bemCodigo_Centro_Custo: TIntegerField;
    qryconsulta_bemCodigo_Funcionario: TStringField;
    qryconsulta_bemDescricao: TStringField;
    qryconsulta_bemCodigo_Tipo_Bem_Patrimonial: TIntegerField;
    qryconsulta_bemCodigo_Unidade: TIntegerField;
    qryconsulta_bemPreco_RS: TFloatField;
    qryconsulta_bemPreco_S: TFloatField;
    qryconsulta_bemQuantidade: TFloatField;
    qryconsulta_bemTipo_Bem: TStringField;
    qryconsulta_bemData_Cadastro: TDateTimeField;
    qryconsulta_bemData_Compra: TDateTimeField;
    qryconsulta_bemObservacao: TStringField;
    qryconsulta_bemDescricao_Detalhada: TStringField;
    qryconsulta_bemTipo_Bem_1: TStringField;
    qryconsulta_bemSigla: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Tipo_BemKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Tipo_BemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtTipo_BemKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    Util: TUtil;
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Bem_Patrimonial: TFrmConsulta_Bem_Patrimonial;
  pecas, servicos, total: double;
implementation

uses UDM, UChama_Bem_Patrimonio, UChama_Tipo_Bem_Patrimonio,
  URel_Consulta_Patrimonio;

{$R *.dfm}

procedure TFrmConsulta_Bem_Patrimonial.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Bem_Patrimonial.BBtnFiltrarClick(Sender: TObject);
var
  res: double;
begin
  Consulta.Consulta_Bem_Patrimonio;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Bem_Patrimonial.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Patrimonio:= TFrmRel_Consulta_Patrimonio.Create(self);
  FrmRel_Consulta_Patrimonio.Release;
  FrmRel_Consulta_Patrimonio:= Nil;
  {Application.CreateForm(TFrmRel_Consulta_Bem_Patrimonial, FrmRel_Consulta_Bem_Patrimonial);
  FrmRel_Consulta_Bem_Patrimonial.QuickRep1.Preview;
  FrmRel_Consulta_Bem_Patrimonial.Free;}
end;

procedure TFrmConsulta_Bem_Patrimonial.BBtnLimparClick(Sender: TObject);
begin
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  qryconsulta_bem.Close;
end;

procedure TFrmConsulta_Bem_Patrimonial.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Bem_Patrimonial.EdtCodigo_Tipo_BemKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    if (RGTipo.ItemIndex = 1) then
    begin
      Application.CreateForm(TFrmChama_Tipo_Bem_Patrimonio, FrmChama_Tipo_Bem_Patrimonio);
      FrmChama_Tipo_Bem_Patrimonio.ShowModal;
      FrmChama_Tipo_Bem_Patrimonio.Free;
    end;
  end;
end;

procedure TFrmConsulta_Bem_Patrimonial.EdtCodigo_Tipo_BemKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Bem_Patrimonial.EdtTipo_BemKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Bem_Patrimonial.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Bem_Patrimonial.FormCreate(Sender: TObject);
begin
  qryconsulta_bem.Close;
end;

procedure TFrmConsulta_Bem_Patrimonial.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Bem_Patrimonial.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
