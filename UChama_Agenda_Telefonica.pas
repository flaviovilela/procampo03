unit UChama_Agenda_Telefonica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Agenda_Telefonica = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_agenda: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_agendaCodigo: TIntegerField;
    qrychama_agendaNome: TStringField;
    qrychama_agendaTelefone1: TStringField;
    qrychama_agendaTelefone2: TStringField;
    qrychama_agendaTelefone3: TStringField;
    qrychama_agendaData_Cadastro: TDateTimeField;
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
  FrmChama_Agenda_Telefonica: TFrmChama_Agenda_Telefonica;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UAgenda_Telefonica;

{$R *.dfm}

procedure TFrmChama_Agenda_Telefonica.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Agenda_Telefonica.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmAgenda_Telefonica <> NIl) and (FrmAgenda_Telefonica.ativo = true) then
  begin
    FrmAgenda_Telefonica.EdtCodigo.Text:= qrychama_agendaCodigo.AsString;
    FrmAgenda_Telefonica.EdtNome.Text:= qrychama_agendaNome.AsString;
    FrmAgenda_Telefonica.MEdtTelefone1.Text:= qrychama_agendaTelefone1.AsString;
    FrmAgenda_Telefonica.MEdtTelefone2.Text:= qrychama_agendaTelefone2.AsString;
    FrmAgenda_Telefonica.MEdtTelefone3.Text:= qrychama_agendaTelefone3.AsString;
    FrmAgenda_Telefonica.MEdtData_Cadastro.Text:= qrychama_agendaData_Cadastro.AsString;
    FrmChama_Agenda_Telefonica.Close;

    FrmAgenda_Telefonica.BBtnSalvar.Enabled:= true;
    FrmAgenda_Telefonica.BBtnExcluir.Enabled:= true;
    FrmAgenda_Telefonica.BBtnPesquisar.Enabled:= true;
    FrmAgenda_Telefonica.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmAgenda_Telefonica);
    FrmAgenda_Telefonica.achei:= true;
  end;
end;

procedure TFrmChama_Agenda_Telefonica.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Agenda_Telefonica.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Agenda_Telefonica.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Agenda_Telefonica;
end;

procedure TFrmChama_Agenda_Telefonica.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Agenda_Telefonica.Release;
end;

procedure TFrmChama_Agenda_Telefonica.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Agenda_Telefonica.FormShow(Sender: TObject);
begin
  qrychama_agenda.Open;
end;

end.
