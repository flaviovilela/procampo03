unit UChama_Unidade_Medida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Unidade_Medida = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TAutoIncField;
    qrychamaDescricao: TStringField;
    qrychamaData_Cadastro: TDateTimeField;
    qrychamaSigla: TStringField;
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
  FrmChama_Unidade_Medida: TFrmChama_Unidade_Medida;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Unidade_Medida, UCadastro_Bem_Patrimonio;

{$R *.dfm}

procedure TFrmChama_Unidade_Medida.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Unidade_Medida.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Unidade_Medida <> NIl) and (FrmCadastro_Unidade_Medida.ativo = true) then
  begin
    FrmCadastro_Unidade_Medida.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Unidade_Medida.EdtSigla.Text:= qrychamaSigla.AsString;
    FrmCadastro_Unidade_Medida.EdtDescricao.Text:= qrychamaDescricao.AsString;
    FrmCadastro_Unidade_Medida.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;

    FrmCadastro_Unidade_Medida.BBtnSalvar.Enabled:= true;
    FrmCadastro_Unidade_Medida.BBtnExcluir.Enabled:= true;
    FrmCadastro_Unidade_Medida.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Unidade_Medida.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Unidade_Medida);
    FrmCadastro_Unidade_Medida.achei:= true;
  end
  else if (FrmCadastro_Bem_Patrimonio <> nil) and (FrmCadastro_Bem_Patrimonio.ativo = true) then
  begin
    FrmCadastro_Bem_Patrimonio.EdtCodigo_Unidade.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Bem_Patrimonio.EdtUnidade.Text:= qrychamaSigla.AsString;
  end;
    FrmChama_Unidade_Medida.Close;
end;

procedure TFrmChama_Unidade_Medida.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Unidade_Medida.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Unidade_Medida.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Unidade_Medida;
end;

procedure TFrmChama_Unidade_Medida.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Unidade_Medida.Release;
end;

procedure TFrmChama_Unidade_Medida.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Unidade_Medida.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Open;
end;

end.
