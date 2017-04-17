unit UChama_Aborto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Aborto = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaCodigo_Animal: TIntegerField;
    qrychamaAbrir_Lactacao: TStringField;
    qrychamaNatimortos: TIntegerField;
    qrychamaData_Cadastro: TDateTimeField;
    qrychamaData_Aborto: TDateTimeField;
    qrychamaObservacao: TStringField;
    qrychamaAnimal: TStringField;
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
  FrmChama_Aborto: TFrmChama_Aborto;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UAborto;

{$R *.dfm}

procedure TFrmChama_Aborto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Aborto.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmAborto <> NIl) and (FrmAborto.ativo = true) then
  begin
    FrmAborto.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmAborto.EdtCodigo_Animal.Text:= qrychamaCodigo_Animal.AsString;
    FrmAborto.EdtAnimal.Text:= qrychamaAnimal.AsString;

    if (qrychamaAbrir_Lactacao.AsString = 'Sim') then
      FrmAborto.CBLactacao.Checked:= true
    else
      FrmAborto.CBLactacao.Checked:= false;

    FrmAborto.EdtNatimortos.Text:= qrychamaNatimortos.AsString;
    FrmAborto.MEdtData_Aborto.Text:= qrychamaData_Aborto.AsString;
    FrmAborto.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;
    FrmAborto.MMObservacao.Text:= qrychamaObservacao.AsString;

    FrmChama_Aborto.Close;

    FrmAborto.BBtnSalvar.Enabled:= true;
    FrmAborto.BBtnExcluir.Enabled:= true;
    FrmAborto.BBtnPesquisar.Enabled:= true;
    FrmAborto.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmAborto);
    FrmAborto.achei:= true;
  end
end;

procedure TFrmChama_Aborto.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Aborto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Aborto.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Aborto;
end;

procedure TFrmChama_Aborto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Aborto.Release;
end;

procedure TFrmChama_Aborto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Aborto.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
  qrychama.Open;
end;

end.
