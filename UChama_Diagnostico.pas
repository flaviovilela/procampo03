unit UChama_Diagnostico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Diagnostico = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaCodigo_Animal: TIntegerField;
    qrychamaData_Cobertura: TDateTimeField;
    qrychamaData_Diagnostico: TDateTimeField;
    qrychamaResultado: TStringField;
    qrychamaObservacao: TStringField;
    qrychamaAnimal: TStringField;
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
  FrmChama_Diagnostico: TFrmChama_Diagnostico;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, Diagnostico;

{$R *.dfm}

procedure TFrmChama_Diagnostico.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Diagnostico.DBGrid1DblClick(Sender: TObject);
begin
  FrmDiagnostico.Atualiza_Dados_Chama(qrychamaCodigo.AsInteger);
  FrmDiagnostico.BBtnSalvar.Enabled:= true;
  FrmDiagnostico.BBtnExcluir.Enabled:= true;
  FrmDiagnostico.BBtnPesquisar.Enabled:= true;
  FrmDiagnostico.BBtnCancelar.Enabled:= true;
  Util.Habilita_Campos(FrmDiagnostico);
  FrmDiagnostico.achei:= true;

  FrmChama_Diagnostico.Close;
end;

procedure TFrmChama_Diagnostico.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Diagnostico.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Diagnostico.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Diagnostico;
end;

procedure TFrmChama_Diagnostico.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Diagnostico.Release;
end;

procedure TFrmChama_Diagnostico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Diagnostico.FormShow(Sender: TObject);
begin
  with qrychama do
  begin
    close;
    Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
    open;
  end;
end;

end.
