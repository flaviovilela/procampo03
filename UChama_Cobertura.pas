unit UChama_Cobertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Cobertura = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaCodigo_Animal: TIntegerField;
    qrychamaCodigo_Reprodutor: TIntegerField;
    qrychamaTipo_Inseminacao: TStringField;
    qrychamaDose: TIntegerField;
    qrychamaInseminador: TStringField;
    qrychamaObservacoes: TStringField;
    qrychamaData_Inseminacao: TDateTimeField;
    qrychamaData_Cadastro: TDateTimeField;
    qrychamaHora: TStringField;
    qrychamaData_Cio: TDateTimeField;
    qrychamaHora_Cio: TStringField;
    qrychamaAnimal: TStringField;
    qrychamaReprodutor: TStringField;
    qrychamaCodigo_Categoria: TIntegerField;
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
  FrmChama_Cobertura: TFrmChama_Cobertura;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Empresa, UCobertura;

{$R *.dfm}

procedure TFrmChama_Cobertura.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Cobertura.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCobertura <> NIl) and (FrmCobertura.ativo = true) then
  begin
    FrmCobertura.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmCobertura.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;

    if (qrychamaTipo_Inseminacao.AsString = 'MONTA NATURAL') then
      FrmCobertura.RGForma.ItemIndex:= 0
    else if (qrychamaTipo_Inseminacao.AsString = 'INSEMINAÇÃO ARTIFICIAL') then
      FrmCobertura.RGForma.ItemIndex:= 1
    else if (qrychamaTipo_Inseminacao.AsString = 'TRANSFERÊNCIA DE EMBRIÃO') then
      FrmCobertura.RGForma.ItemIndex:= 2;

    FrmCobertura.MedtData_Inseminacao.Text:= qrychamaData_Inseminacao.AsString;
    FrmCobertura.MEdtHora.Text:= qrychamaHora.AsString;
    FrmCobertura.EdtInseminador.Text:= qrychamaInseminador.AsString;
    FrmCobertura.EdtCodigo_Touro_Doadora.Text:= qrychamaCodigo_Reprodutor.AsString;
    FrmCobertura.EdtTouro.Text:= qrychamaReprodutor.AsString;
    FrmCobertura.EdtDoses.Text:= qrychamaDose.AsString;
    FrmCobertura.EdtCodigo_Animal.Text:= qrychamaCodigo_Animal.AsString;
    FrmCobertura.EdtAnimal.Text:= qrychamaAnimal.AsString;
    FrmCobertura.MMOObservacoes.Text:= qrychamaObservacoes.AsString;
    FrmCobertura.codigo_categoria_animal:= qrychamaCodigo_Categoria.AsInteger;

    FrmCobertura.BBtnSalvar.Enabled:= true;
    FrmCobertura.BBtnExcluir.Enabled:= true;
    FrmCobertura.BBtnPesquisar.Enabled:= true;
    FrmCobertura.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCobertura);
    FrmCobertura.achei:= true;
  end;

  FrmChama_Cobertura.Close;
end;

procedure TFrmChama_Cobertura.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Cobertura.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Cobertura.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Cobertura;
end;

procedure TFrmChama_Cobertura.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Cobertura.Release;
end;

procedure TFrmChama_Cobertura.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Cobertura.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
  qrychama.Open;
end;

end.
