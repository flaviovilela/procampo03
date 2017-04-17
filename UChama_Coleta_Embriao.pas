unit UChama_Coleta_Embriao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Coleta_Embriao = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaData_Coleta: TDateTimeField;
    qrychamaCodigo_Animal_Doadora: TIntegerField;
    qrychamaCodigo_Animal_Macho: TIntegerField;
    qrychamaEstrutura_Viavel: TIntegerField;
    qrychamaEstrutura_Inviavel: TIntegerField;
    qrychamaObservacao: TStringField;
    qrychamaAnimal: TStringField;
    qrychamaPai: TStringField;
    qrychamaResponsavel: TStringField;
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
  FrmChama_Coleta_Embriao: TFrmChama_Coleta_Embriao;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UColeta_Embriao;

{$R *.dfm}

procedure TFrmChama_Coleta_Embriao.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Coleta_Embriao.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmColega_Embriao <> NIl) and (FrmColega_Embriao.ativo = true) then
  begin
    FrmColega_Embriao.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmColega_Embriao.MEdtData_Coleta.Text:= qrychamaData_Coleta.AsString;
    FrmColega_Embriao.EdtCodigo_Animal.Text:= qrychamaCodigo_Animal_Doadora.AsString;
    FrmColega_Embriao.EdtAnimal.Text:= qrychamaAnimal.AsString;
    FrmColega_Embriao.EdtCodigo_Pai.Text:= qrychamaCodigo_Animal_Macho.AsString;
    FrmColega_Embriao.EdtPai.Text:= qrychamaPai.AsString;
    FrmColega_Embriao.EdtResponsavel.Text:= qrychamaResponsavel.AsString;
    FrmColega_Embriao.EdtEstrutura_Viavel.Text:= qrychamaEstrutura_Viavel.AsString;
    FrmColega_Embriao.EdtEstrutura_Inviavel.Text:= qrychamaEstrutura_Inviavel.AsString;
    FrmColega_Embriao.MMOObservacoes.Text:= qrychamaObservacao.AsString;

    FrmColega_Embriao.BBtnSalvar.Enabled:= true;
    FrmColega_Embriao.BBtnExcluir.Enabled:= true;
    FrmColega_Embriao.BBtnPesquisar.Enabled:= true;
    FrmColega_Embriao.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmColega_Embriao);
    FrmColega_Embriao.achei:= true;
    FrmColega_Embriao.CheckBox1.Checked:= false;
    FrmColega_Embriao.CheckBox1.Enabled:= false;
  end;
    FrmChama_Coleta_Embriao.Close;

end;

procedure TFrmChama_Coleta_Embriao.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Coleta_Embriao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Coleta_Embriao.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Coleta_Embriao;
end;

procedure TFrmChama_Coleta_Embriao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Coleta_Embriao.Release;
end;

procedure TFrmChama_Coleta_Embriao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Coleta_Embriao.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
  qrychama.Open;
end;

end.
