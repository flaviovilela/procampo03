unit UChama_Leite_Geral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Leite_Geral = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaTotal_Animais: TIntegerField;
    qrychamaTemperatura: TFloatField;
    qrychamaTotal_Litro: TFloatField;
    qrychamaMedia: TFloatField;
    qrychamaTotal_Ordenhas: TIntegerField;
    qrychamaData_Pesagem: TDateTimeField;
    qrychamaObservacao: TStringField;
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
  FrmChama_Leite_Geral: TFrmChama_Leite_Geral;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, ULeite_Geral;

{$R *.dfm}

procedure TFrmChama_Leite_Geral.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Leite_Geral.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmLeite_Geral <> NIl) and (FrmLeite_Geral.ativo = true) then
  begin
    FrmLeite_Geral.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmLeite_Geral.MEdtData_Pesagem.Text:= qrychamaData_Pesagem.AsString;
    FrmLeite_Geral.EdtTotal_Animais.Text:= qrychamaTotal_Animais.AsString;
    FrmLeite_Geral.EdtTotal.Text:= qrychamaTotal_Litro.AsString;

    FrmLeite_Geral.EdtMedia.Text:= FormatFloat('#0.0,0', qrychamaMedia.AsFloat);
    FrmLeite_Geral.EdtMedia.Text:= StringReplace(FrmLeite_Geral.EdtMedia.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmLeite_Geral.EdtTotal_Ordenhas.Text:= qrychamaTotal_Ordenhas.AsString;
    FrmLeite_Geral.EdtTemperatura.Text:= qrychamaTemperatura.AsString;
    FrmLeite_Geral.MMOObservacoes.Text:= qrychamaObservacao.AsString;

    FrmLeite_Geral.BBtnSalvar.Enabled:= true;
    FrmLeite_Geral.BBtnExcluir.Enabled:= true;
    FrmLeite_Geral.BBtnPesquisar.Enabled:= true;
    FrmLeite_Geral.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmLeite_Geral);
    FrmLeite_Geral.achei:= true;
  end;

  FrmChama_Leite_Geral.Close;

end;

procedure TFrmChama_Leite_Geral.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Leite_Geral.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Leite_Geral.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Leite_Geral;
end;

procedure TFrmChama_Leite_Geral.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Leite_Geral.Release;
end;

procedure TFrmChama_Leite_Geral.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Leite_Geral.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
  qrychama.Open;
end;

end.
