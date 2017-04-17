unit UConsulta_Agenda_Telefonica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Agenda_Telefonica = class(TForm)
    DBGrid1: TDBGrid;
    EdtContato: TEdit;
    RGConsulta_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_agenda: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    qryconsulta_agendaCodigo: TIntegerField;
    qryconsulta_agendaNome: TStringField;
    qryconsulta_agendaTelefone1: TStringField;
    qryconsulta_agendaTelefone2: TStringField;
    qryconsulta_agendaTelefone3: TStringField;
    qryconsulta_agendaData_Cadastro: TDateTimeField;
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
  FrmConsulta_Agenda_Telefonica: TFrmConsulta_Agenda_Telefonica;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, URel_Consulta_Agenda_Telefonica;

{$R *.dfm}

procedure TFrmConsulta_Agenda_Telefonica.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Agenda_Telefonica.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Agenda_Telefonica;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Agenda_Telefonica.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Agenda_Telefonica:= TFrmRel_Consulta_Agenda_Telefonica.create(self);
  FrmRel_Consulta_Agenda_Telefonica.Release;
  FrmRel_Consulta_Agenda_Telefonica:= Nil;
end;

procedure TFrmConsulta_Agenda_Telefonica.BBtnLimparClick(Sender: TObject);
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

procedure TFrmConsulta_Agenda_Telefonica.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Agenda_Telefonica.EdtCodigo_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Agenda_Telefonica.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Agenda_Telefonica.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Agenda_Telefonica.Free;
  FrmConsulta_Agenda_Telefonica:= nil;
end;

procedure TFrmConsulta_Agenda_Telefonica.FormCreate(Sender: TObject);
begin
  qryconsulta_agenda.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
end;

procedure TFrmConsulta_Agenda_Telefonica.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Agenda_Telefonica.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
