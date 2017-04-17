unit UChama_Visita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Visita = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_visita: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_visitaCodigo: TIntegerField;
    qrychama_visitaCodigo_Tema: TIntegerField;
    qrychama_visitaData_Cadastro: TDateTimeField;
    qrychama_visitaDescricao: TStringField;
    qrychama_visitaCodigo_Cliente: TIntegerField;
    qrychama_visitaNome: TStringField;
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
  FrmChama_Visita: TFrmChama_Visita;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UVisita;

{$R *.dfm}

procedure TFrmChama_Visita.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Visita.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmVisita <> NIl) and (FrmVisita.ativo = true) then
  begin
    FrmVisita.EdtCodigo.Text:= qrychama_visitaCodigo.AsString;
    FrmVisita.EdtCodigo_Tema.Text:= qrychama_visitaCodigo_Tema.AsString;
    FrmVisita.EdtTema.Text:= qrychama_visitaDescricao.AsString;

    FrmVisita.EdtCodigo_Cliente.Text:= qrychama_visitaCodigo_Cliente.AsString;
    FrmVisita.EdtCliente.Text:= qrychama_visitaNome.AsString;
    FrmVisita.MEdtData_Cadastro.Text:= qrychama_visitaData_Cadastro.AsString;

    FrmChama_Visita.Close;

    FrmVisita.BBtnSalvar.Enabled:= true;
    FrmVisita.BBtnExcluir.Enabled:= true;
    FrmVisita.BBtnPesquisar.Enabled:= true;
    FrmVisita.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmVisita);
    FrmVisita.Atualiza_Dados;
    FrmVisita.achei:= true;
  end;
end;

procedure TFrmChama_Visita.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Visita.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Visita.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Visita;
end;

procedure TFrmChama_Visita.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Visita.Release;
end;

procedure TFrmChama_Visita.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Visita.FormShow(Sender: TObject);
begin
  qrychama_visita.Close;
  qrychama_visita.Open;
end;

end.
