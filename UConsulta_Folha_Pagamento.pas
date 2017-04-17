unit UConsulta_Folha_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Folha_Pagamento = class(TForm)
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
    Edit2: TEdit;
    EdtEntradas: TEdit;
    EdtSaidas: TEdit;
    Edit4: TEdit;
    EdtDesconto: TEdit;
    Edit8: TEdit;
    Edit5: TEdit;
    EdtSalario: TEdit;
    Edit1: TEdit;
    EdtComissao: TEdit;
    Label1: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtMes_Ano: TMaskEdit;
    LblData_Cadastro: TLabel;
    Label3: TLabel;
    MEdtData_Final: TMaskEdit;
    qryconsulta_folha: TADOQuery;
    ds_consulta_folha: TDataSource;
    qryitens_folha: TADOQuery;
    qryitens_folhaCodigo: TIntegerField;
    qryitens_folhaCodigo_Item: TIntegerField;
    qryitens_folhaValor: TFloatField;
    qryitens_folhaDescricao: TStringField;
    qryitens_folhaNatureza: TStringField;
    ds_consulta_itens_folha: TDataSource;
    qryconsulta_folhaCodigo: TIntegerField;
    qryconsulta_folhaCodigo_Funcionario: TIntegerField;
    qryconsulta_folhaCodigo_Propriedade: TIntegerField;
    qryconsulta_folhaMes_Ano: TStringField;
    qryconsulta_folhaData_Fechamento: TDateTimeField;
    qryconsulta_folhaEntradas: TFloatField;
    qryconsulta_folhaSaidas: TFloatField;
    qryconsulta_folhaDesconto: TFloatField;
    qryconsulta_folhaSalario: TFloatField;
    qryconsulta_folhaQuantidade_Itens: TIntegerField;
    qryconsulta_folhaObservacao: TStringField;
    qryconsulta_folhaNome: TStringField;
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
    procedure MEdtData_FinalExit(Sender: TObject);
    procedure MEdtData_InicialExit(Sender: TObject);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Folha_Pagamento: TFrmConsulta_Folha_Pagamento;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UChama_Cliente, URel_Consulta_Folha_Pagamento, UDM;

{$R *.dfm}

procedure TFrmConsulta_Folha_Pagamento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Folha_Pagamento.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Folha_Pagamento;
  if (qryconsulta_folha.IsEmpty = false) then
  begin
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Folha_Pagamento.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Folha_Pagamento:= TFrmRel_Consulta_Folha_Pagamento.create(self);
  FrmRel_Consulta_Folha_Pagamento.Release;
  FrmRel_Consulta_Folha_Pagamento:= Nil;
end;

procedure TFrmConsulta_Folha_Pagamento.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_folha.close;
  qryitens_folha.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
end;

procedure TFrmConsulta_Folha_Pagamento.DBGrid1CellClick(Column: TColumn);
begin
  Consulta.Consulta_Itens_Folha_Pagamento;
end;

procedure TFrmConsulta_Folha_Pagamento.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Folha_Pagamento.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Folha_Pagamento.EdtCodigo_FuncionarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
      FrmChama_Cliente.ShowModal;
      FrmChama_Cliente.Free;
    end;
end;

procedure TFrmConsulta_Folha_Pagamento.EdtCodigo_FuncionarioKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Folha_Pagamento.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Folha_Pagamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Folha_Pagamento.Free;
  FrmConsulta_Folha_Pagamento:= NIl;
end;

procedure TFrmConsulta_Folha_Pagamento.FormCreate(Sender: TObject);
begin
  qryconsulta_folha.close;
  qryitens_folha.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Folha_Pagamento.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Folha_Pagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Folha_Pagamento.MEdtData_FinalExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Final);
end;

procedure TFrmConsulta_Folha_Pagamento.MEdtData_InicialExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Inicial);
end;

end.
