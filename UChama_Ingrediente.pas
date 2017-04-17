unit UChama_Ingrediente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Ingrediente = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_ingrediente: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_ingredienteCodigo: TIntegerField;
    qrychama_ingredienteDescricao: TStringField;
    qrychama_ingredienteData_Cadastro: TDateTimeField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  FrmChama_Ingrediente: TFrmChama_Ingrediente;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Ingrediente;

{$R *.dfm}

procedure TFrmChama_Ingrediente.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Ingrediente.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Setor;
end;

procedure TFrmChama_Ingrediente.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Ingredientes <> NIl) and (FrmCadastro_Ingredientes.ativo = true) then
  begin
    FrmCadastro_Ingredientes.EdtCodigo.Text:= qrychama_ingredienteCodigo.AsString;
    FrmCadastro_Ingredientes.EdtDescricao.Text:= qrychama_ingredienteDescricao.AsString;
    FrmCadastro_Ingredientes.MEdtData_Cadastro.Text:= qrychama_ingredienteData_Cadastro.AsString;
    FrmChama_Ingrediente.Close;

    FrmCadastro_Ingredientes.BBtnSalvar.Enabled:= true;
    FrmCadastro_Ingredientes.BBtnExcluir.Enabled:= true;
    FrmCadastro_Ingredientes.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Ingredientes.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Ingredientes);
    FrmCadastro_Ingredientes.achei:= true;
  end;
end;

procedure TFrmChama_Ingrediente.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Ingrediente.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Ingrediente.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Ingrediente;
end;

procedure TFrmChama_Ingrediente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Ingrediente.Release;
end;

procedure TFrmChama_Ingrediente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Ingrediente.FormShow(Sender: TObject);
begin
  qrychama_ingrediente.Open;
end;

end.
