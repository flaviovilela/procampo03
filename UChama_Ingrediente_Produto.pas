unit UChama_Ingrediente_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Ingrediente_Produto = class(TForm)
    DBGrid1: TDBGrid;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_ingrediente: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_ingredienteCodigo: TAutoIncField;
    qrychama_ingredienteCodigo_Produto: TIntegerField;
    qrychama_ingredienteCodigo_Ingrediente: TIntegerField;
    qrychama_ingredientePermissao: TStringField;
    qrychama_ingredienteProduto: TStringField;
    qrychama_ingredienteIngrediente: TStringField;
    RGConsulta_Por: TRadioGroup;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Ingrediente_Produto: TFrmChama_Ingrediente_Produto;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM;

{$R *.dfm}

procedure TFrmChama_Ingrediente_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Ingrediente_Produto.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Setor;
end;

procedure TFrmChama_Ingrediente_Produto.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Ingrediente_Produto.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Ingrediente_Produto;
end;

procedure TFrmChama_Ingrediente_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Ingrediente_Produto.Release;
end;

procedure TFrmChama_Ingrediente_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f4) then
  begin
    if (RGConsulta_Por.ItemIndex = 0) then
      RGConsulta_Por.ItemIndex:= 1
    else if (RGConsulta_Por.ItemIndex = 1) then
      RGConsulta_Por.ItemIndex:= 0;
  end;
end;

procedure TFrmChama_Ingrediente_Produto.FormShow(Sender: TObject);
begin
  qrychama_ingrediente.Close;
  qrychama_ingrediente.Open;
end;

end.
