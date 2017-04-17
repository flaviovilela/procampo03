unit UChama_Grupo_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, ADODB, UConsulta,
  UUtilitarios;

type
  TFrmChama_Grupo_Produto = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_grupo: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_grupoCodigo: TAutoIncField;
    qrychama_grupoDescricao: TStringField;
    qrychama_grupoData_Cadastro: TDateTimeField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtConsultaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Util: UUtilitarios.TUtil;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Grupo_Produto: TFrmChama_Grupo_Produto;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Grupo_Produto;

{$R *.dfm}

procedure TFrmChama_Grupo_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Grupo_Produto.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Grupo_Produto <> Nil) and (FrmCadastro_Grupo_Produto.ativo = true) then
  begin
    FrmCadastro_Grupo_Produto.EdtCodigo.Text:= qrychama_grupoCodigo.AsString;
    FrmCadastro_Grupo_Produto.EdtDescricao.Text:= qrychama_grupoDescricao.AsString;
    FrmCadastro_Grupo_Produto.MEdtData_Cadastro.Text:= qrychama_grupoData_Cadastro.AsString;
    FrmChama_Grupo_Produto.Close;
    FrmCadastro_Grupo_Produto.BBtnSalvar.Enabled:= true;
    FrmCadastro_Grupo_Produto.BBtnExcluir.Enabled:= true;
    FrmCadastro_Grupo_Produto.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Grupo_Produto.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Grupo_Produto);
    FrmCadastro_Grupo_Produto.achei:= true;
  end;
end;

procedure TFrmChama_Grupo_Produto.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Grupo_Produto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Grupo_Produto.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Grupo_Produto;
end;

procedure TFrmChama_Grupo_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Grupo_Produto.Release;
end;

procedure TFrmChama_Grupo_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Grupo_Produto.FormShow(Sender: TObject);
begin
  qrychama_grupo.Open;
end;

end.
