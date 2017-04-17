unit UConsulta_Tempo_Producao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Tempo_Producao = class(TForm)
    DBGrid1: TDBGrid;
    EdtN_Pedido: TEdit;
    RGConsulta_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_tempo: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    RGOrdena_Por: TRadioGroup;
    qryconsulta_tempoN_Pedido: TStringField;
    qryconsulta_tempoNome: TStringField;
    qryconsulta_tempoValor_Pagar: TFloatField;
    qryconsulta_tempoData_Movimento: TDateTimeField;
    qryconsulta_tempoTempo_Pedido: TStringField;
    qryconsulta_tempoTempo_Fabricacao: TStringField;
    qryconsulta_tempoTempo_Entrega: TStringField;
    qryconsulta_tempoTempo_Fechamento: TStringField;
    qryconsulta_tempoTempo_Total: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtCodigo_UsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  FrmConsulta_Tempo_Producao: TFrmConsulta_Tempo_Producao;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Usuario, URel_Consulta_Tempo_Producao;

{$R *.dfm}

procedure TFrmConsulta_Tempo_Producao.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Tempo_Producao.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Tempo_Producao;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Tempo_Producao.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Tempo_Producao:= TFrmRel_Consulta_Tempo_Producao.create(self);
  FrmRel_Consulta_Tempo_Producao.Release;
  FrmRel_Consulta_Tempo_Producao:= Nil;
end;

procedure TFrmConsulta_Tempo_Producao.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_tempo.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Tempo_Producao.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Tempo_Producao.EdtCodigo_UsuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Usuario, FrmChama_Usuario);
      FrmChama_Usuario.ShowModal;
      FrmChama_Usuario.Free;
    end;
end;

procedure TFrmConsulta_Tempo_Producao.EdtCodigo_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Tempo_Producao.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Tempo_Producao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Tempo_Producao.Release;
end;

procedure TFrmConsulta_Tempo_Producao.FormCreate(Sender: TObject);
begin
  qryconsulta_tempo.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  MEdtData_Inicial.Text:= DateToStr(date);
  MEdtData_Final.Text:= DateToStr(date);
end;

procedure TFrmConsulta_Tempo_Producao.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Tempo_Producao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
