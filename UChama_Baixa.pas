unit UChama_Baixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Baixa = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaCodigo_Animal: TIntegerField;
    qrychamaCodigo_Causa: TIntegerField;
    qrychamaResponsavel: TStringField;
    qrychamaData_Cadastro: TDateTimeField;
    qrychamaObservacao: TStringField;
    qrychamaAnimal: TStringField;
    qrychamaCausa_Baixa: TStringField;
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
  FrmChama_Baixa: TFrmChama_Baixa;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UBaixa_Animal;

{$R *.dfm}

procedure TFrmChama_Baixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Baixa.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmBaixa_Animal <> NIl) and (FrmBaixa_Animal.ativo = true) then
  begin
    FrmBaixa_Animal.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmBaixa_Animal.EdtCodigo_Animal.Text:= qrychamaCodigo_Animal.AsString;
    FrmBaixa_Animal.EdtAnimal.Text:= qrychamaAnimal.AsString;

    FrmBaixa_Animal.EdtCodigo_Causa.Text:= qrychamaCodigo_Causa.AsString;
    FrmBaixa_Animal.EdtCausa.Text:= qrychamaCausa_Baixa.AsString;
    FrmBaixa_Animal.EdtResponsavel.Text:= qrychamaResponsavel.AsString;
    FrmBaixa_Animal.MEdtData_Baixa.Text:= qrychamaData_Cadastro.AsString;
    FrmBaixa_Animal.MMOObservacoes.Text:= qrychamaObservacao.AsString;

    FrmChama_Baixa.Close;

    FrmBaixa_Animal.BBtnSalvar.Enabled:= true;
    FrmBaixa_Animal.BBtnExcluir.Enabled:= true;
    FrmBaixa_Animal.BBtnPesquisar.Enabled:= true;
    FrmBaixa_Animal.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmBaixa_Animal);
    FrmBaixa_Animal.achei:= true;
  end
end;

procedure TFrmChama_Baixa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Baixa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Baixa.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Baixa;
end;

procedure TFrmChama_Baixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Baixa.Release;
end;

procedure TFrmChama_Baixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Baixa.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
  qrychama.Open;
end;

end.
