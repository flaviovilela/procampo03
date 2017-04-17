unit UConsulta_Rancking_Venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Rancking_Venda = class(TForm)
    DBGrid1: TDBGrid;
    EdtUsuario: TEdit;
    RGConsulta_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_rancking: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    EdtCodigo_Usuario: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
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
  FrmConsulta_Rancking_Venda: TFrmConsulta_Rancking_Venda;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Usuario, URel_Consulta_Historico_Log;

{$R *.dfm}

procedure TFrmConsulta_Rancking_Venda.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Rancking_Venda.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Historico_Log;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Rancking_Venda.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Historico_Log:= TFrmRel_Consulta_Historico_Log.create(self);
  FrmRel_Consulta_Historico_Log.Release;
  FrmRel_Consulta_Historico_Log:= Nil;
end;

procedure TFrmConsulta_Rancking_Venda.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_historico.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Rancking_Venda.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Rancking_Venda.EdtCodigo_UsuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Usuario, FrmChama_Usuario);
      FrmChama_Usuario.ShowModal;
      FrmChama_Usuario.Free;
    end;
end;

procedure TFrmConsulta_Rancking_Venda.EdtCodigo_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Rancking_Venda.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Rancking_Venda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Historico_Log.Free;
  FrmConsulta_Historico_Log:= NIl;
end;

procedure TFrmConsulta_Rancking_Venda.FormCreate(Sender: TObject);
begin
  qryconsulta_historico.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtCodigo_Usuario.Clear;
  EdtUsuario.Clear;
  MEdtData_Inicial.Text:= DateToStr(date);
  MEdtData_Final.Text:= DateToStr(date);
end;

procedure TFrmConsulta_Rancking_Venda.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Rancking_Venda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
