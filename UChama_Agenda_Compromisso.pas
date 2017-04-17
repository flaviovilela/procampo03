unit UChama_Agenda_Compromisso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Agenda_Compromisso = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_agenda: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_agendaCodigo: TIntegerField;
    qrychama_agendaData_Cadastro: TDateTimeField;
    qrychama_agendaData_Compromisso: TDateTimeField;
    qrychama_agendaCompromisso: TStringField;
    qrychama_agendaHora_Compromisso: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Agenda_Compromisso: TFrmChama_Agenda_Compromisso;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UAgenda_Compromisso;

{$R *.dfm}

procedure TFrmChama_Agenda_Compromisso.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Agenda_Compromisso.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmAgenda_Compromisso <> NIl) and (FrmAgenda_Compromisso.ativo = true) then
  begin
    FrmAgenda_Compromisso.EdtCodigo.Text:= qrychama_agendaCodigo.AsString;
    FrmAgenda_Compromisso.MEdtData_Cadastro.Text:= qrychama_agendaData_Cadastro.AsString;
    FrmAgenda_Compromisso.MEdtData_Compromisso.Text:= qrychama_agendaData_Compromisso.AsString;
    FrmAgenda_Compromisso.MEdtHora.Text:= qrychama_agendaHora_Compromisso.AsString;
    FrmAgenda_Compromisso.MMOCompromisso.Text:= qrychama_agendaCompromisso.AsString;
    FrmChama_Agenda_Compromisso.Close;

    FrmAgenda_Compromisso.BBtnSalvar.Enabled:= true;
    FrmAgenda_Compromisso.BBtnExcluir.Enabled:= true;
    FrmAgenda_Compromisso.BBtnPesquisar.Enabled:= true;
    FrmAgenda_Compromisso.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmAgenda_Compromisso);
    FrmAgenda_Compromisso.achei:= true;
  end;
end;

procedure TFrmChama_Agenda_Compromisso.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Agenda_Compromisso.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Agenda_Compromisso.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Agenda_Compromisso;
end;

procedure TFrmChama_Agenda_Compromisso.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Agenda_Compromisso.Release;
end;

procedure TFrmChama_Agenda_Compromisso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Agenda_Compromisso.FormShow(Sender: TObject);
begin
  qrychama_agenda.close;
  qrychama_agenda.Open;
end;

end.
