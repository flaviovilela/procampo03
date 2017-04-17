unit UChama_Sincronizacao_Cio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Sincronizacao_Cio = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaData_Sincronizacao: TDateTimeField;
    qrychamaHora: TStringField;
    qrychamaHora_Cobertura: TStringField;
    qrychamaData_Cobertura: TDateTimeField;
    qrychamaTotal_Animais: TIntegerField;
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
  FrmChama_Sincronizacao_Cio: TFrmChama_Sincronizacao_Cio;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, USincronizacao_Cio;

{$R *.dfm}

procedure TFrmChama_Sincronizacao_Cio.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Sincronizacao_Cio.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmSincronizacao_Cio <> NIl) and (FrmSincronizacao_Cio.ativo = true) then
  begin
    FrmSincronizacao_Cio.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmSincronizacao_Cio.MEdtData_Sincronizacao.Text:= qrychamaData_Sincronizacao.AsString;
    FrmSincronizacao_Cio.MEdtData_Cobertura.Text:= qrychamaData_Cobertura.AsString;
    FrmSincronizacao_Cio.MEdtHora.Text:= qrychamaHora.AsString;
    FrmSincronizacao_Cio.MEdtHora_Cobertura.Text:= qrychamaHora_Cobertura.AsString;
    FrmSincronizacao_Cio.EdtTotal_Animais.Text:= qrychamaTotal_Animais.AsString;

    FrmSincronizacao_Cio.BBtnSalvar.Enabled:= true;
    FrmSincronizacao_Cio.BBtnExcluir.Enabled:= true;
    FrmSincronizacao_Cio.BBtnPesquisar.Enabled:= true;
    FrmSincronizacao_Cio.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmSincronizacao_Cio);
    FrmSincronizacao_Cio.achei:= true;
    FrmSincronizacao_Cio.Atualiza_Dados;
  end;
    FrmChama_Sincronizacao_Cio.Close;

end;

procedure TFrmChama_Sincronizacao_Cio.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Sincronizacao_Cio.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Sincronizacao_Cio.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Sincronizacao_Cio;
end;

procedure TFrmChama_Sincronizacao_Cio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Sincronizacao_Cio.Release;
end;

procedure TFrmChama_Sincronizacao_Cio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Sincronizacao_Cio.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
  qrychama.Open;
end;

end.
