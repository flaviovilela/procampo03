unit UConsulta_Agenda_Compromisso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Agenda_Compromisso = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_agenda: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label3: TLabel;
    Label4: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    qryconsulta_agendaCodigo: TIntegerField;
    qryconsulta_agendaData_Cadastro: TDateTimeField;
    qryconsulta_agendaData_Compromisso: TDateTimeField;
    qryconsulta_agendaCompromisso: TStringField;
    qryconsulta_agendaHora_Compromisso: TStringField;
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
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure MEdtData_FinalExit(Sender: TObject);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Agenda_Compromisso: TFrmConsulta_Agenda_Compromisso;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, URel_Consulta_Agenda_Compromisso;

{$R *.dfm}

procedure TFrmConsulta_Agenda_Compromisso.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Agenda_Compromisso.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Agenda_Compromisso;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Agenda_Compromisso.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Agenda_Compromisso:= TFrmRel_Consulta_Agenda_Compromisso.create(self);
  FrmRel_Consulta_Agenda_Compromisso.Release;
  FrmRel_Consulta_Agenda_Compromisso:= Nil;
end;

procedure TFrmConsulta_Agenda_Compromisso.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_agenda.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Agenda_Compromisso.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Agenda_Compromisso.EdtCodigo_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Agenda_Compromisso.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Agenda_Compromisso.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Agenda_Compromisso.Free;
  FrmConsulta_Agenda_Compromisso:= nil;
end;

procedure TFrmConsulta_Agenda_Compromisso.FormCreate(Sender: TObject);
begin
  qryconsulta_agenda.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Agenda_Compromisso.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Agenda_Compromisso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Agenda_Compromisso.MEdtData_FinalExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Final);
end;

procedure TFrmConsulta_Agenda_Compromisso.MEdtData_InicialExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Inicial);
end;

end.
