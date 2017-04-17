unit UChama_Secamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Secamento = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaCodigo_Animal: TIntegerField;
    qrychamaCodigo_Lote: TIntegerField;
    qrychamaMotivo: TStringField;
    qrychamaData_Secamento: TDateTimeField;
    qrychamaObservacao: TStringField;
    qrychamaAnimal: TStringField;
    qrychamaCodigo_Categoria: TIntegerField;
    qrychamaLote: TStringField;
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
  FrmChama_Secamento: TFrmChama_Secamento;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, Secamento;

{$R *.dfm}

procedure TFrmChama_Secamento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Secamento.DBGrid1DblClick(Sender: TObject);
begin
  FrmSecamento.Atualiza_Dados_Chama(qrychamaCodigo.AsInteger);
  FrmSecamento.BBtnSalvar.Enabled:= true;
  FrmSecamento.BBtnExcluir.Enabled:= true;
  FrmSecamento.BBtnPesquisar.Enabled:= true;
  FrmSecamento.BBtnCancelar.Enabled:= true;
  Util.Habilita_Campos(FrmSecamento);
  FrmSecamento.achei:= true;

  FrmChama_Secamento.Close;
end;

procedure TFrmChama_Secamento.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Secamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Secamento.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Secamento;
end;

procedure TFrmChama_Secamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Secamento.Release;
end;

procedure TFrmChama_Secamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Secamento.FormShow(Sender: TObject);
begin
  with qrychama do
  begin
    close;
    Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
    open;
  end;
end;

end.
