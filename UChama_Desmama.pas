unit UChama_Desmama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Desmama = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaCodigo_Destinacao: TIntegerField;
    qrychamaCodigo_Localidade: TIntegerField;
    qrychamaCodigo_Lote: TIntegerField;
    qrychamaCodigo_Animal: TIntegerField;
    qrychamaPeso_Desmama: TIntegerField;
    qrychamaData_Desmama: TDateTimeField;
    qrychamaObservacoes: TStringField;
    qrychamaData_Cadastro: TDateTimeField;
    qrychamaDestinacao: TStringField;
    qrychamaPiquete: TStringField;
    qrychamaLote: TStringField;
    qrychamaAnimal: TStringField;
    qrychamaCodigo_Mae: TIntegerField;
    qrychamaCodigo_Mae_1: TIntegerField;
    qrychamaMae: TStringField;
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
  FrmChama_Desmama: TFrmChama_Desmama;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UDesmama;

{$R *.dfm}

procedure TFrmChama_Desmama.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Desmama.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmDesmama <> NIl) and (FrmDesmama.ativo = true) then
  begin
    FrmDesmama.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmDesmama.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;
    FrmDesmama.MEdtData_Desmama.Text:= qrychamaData_Desmama.AsString;

    FrmDesmama.EdtCodigo_Animal.Text:= qrychamaCodigo_Animal.AsString;
    FrmDesmama.EdtAnimal.Text:= qrychamaAnimal.AsString;
    FrmDesmama.EdtCodigo_Mae.Text:= qrychamaCodigo_Mae_1.AsString;
    FrmDesmama.EdtMae.Text:= qrychamaMae.AsString;
    FrmDesmama.EdtCodigo_Destinacao.Text:= qrychamaCodigo_Destinacao.AsString;
    FrmDesmama.EdtDestinacao.Text:= qrychamaDestinacao.AsString;
    FrmDesmama.EdtCodigo_Piquete.Text:= qrychamaCodigo_Localidade.AsString;
    FrmDesmama.EdtPiquete.Text:= qrychamaPiquete.AsString;
    FrmDesmama.EdtCodigo_Lote.Text:= qrychamaCodigo_Lote.AsString;
    FrmDesmama.EdtLote.Text:= qrychamaLote.AsString;
    FrmDesmama.EdtPeso_Desmama.Text:= qrychamaPeso_Desmama.AsString;
    FrmDesmama.MMObservacoes.Text:= qrychamaObservacoes.AsString;

    FrmDesmama.BBtnSalvar.Enabled:= true;
    FrmDesmama.BBtnExcluir.Enabled:= true;
    FrmDesmama.BBtnPesquisar.Enabled:= true;
    FrmDesmama.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmDesmama);
    FrmDesmama.achei:= true;
  end;
  FrmChama_Desmama.Close;
end;

procedure TFrmChama_Desmama.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Desmama.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Desmama.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Desmama;
end;

procedure TFrmChama_Desmama.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Desmama.Release;
end;

procedure TFrmChama_Desmama.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Desmama.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
  qrychama.Open;
end;

end.
