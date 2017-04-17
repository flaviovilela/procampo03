unit UChama_Tipo_Bem_Patrimonio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Tipo_bem_Patrimonio = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_tipo_bem: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_tipo_bemCodigo: TIntegerField;
    qrychama_tipo_bemTipo_Bem: TStringField;
    qrychama_tipo_bemData_Cadastro: TDateTimeField;
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
  FrmChama_Tipo_bem_Patrimonio: TFrmChama_Tipo_bem_Patrimonio;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Tipo_Bem_Patrimonio, UCadastro_Bem_Patrimonio,
  UConsulta_Bem_Patrimonial;

{$R *.dfm}

procedure TFrmChama_Tipo_bem_Patrimonio.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Tipo_bem_Patrimonio.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Tipo_Bem_Patrimonio <> NIl) and (FrmCadastro_Tipo_Bem_Patrimonio.ativo = true) then
  begin
    FrmCadastro_Tipo_Bem_Patrimonio.EdtCodigo.Text:= qrychama_tipo_bemCodigo.AsString;
    FrmCadastro_Tipo_Bem_Patrimonio.EdtDescricao.Text:= qrychama_tipo_bemTipo_Bem.AsString;
    FrmCadastro_Tipo_Bem_Patrimonio.MEdtData_Cadastro.Text:= qrychama_tipo_bemData_Cadastro.AsString;

    FrmChama_Tipo_bem_Patrimonio.Close;

    FrmCadastro_Tipo_Bem_Patrimonio.BBtnSalvar.Enabled:= true;
    FrmCadastro_Tipo_Bem_Patrimonio.BBtnExcluir.Enabled:= true;
    FrmCadastro_Tipo_Bem_Patrimonio.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Tipo_Bem_Patrimonio.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Tipo_Bem_Patrimonio);
    FrmCadastro_Tipo_Bem_Patrimonio.achei:= true;
  end
  else if (FrmCadastro_Bem_Patrimonio <> NIl) and (FrmCadastro_Bem_Patrimonio.ativo = true) then
  begin
    FrmCadastro_Bem_Patrimonio.EdtCodigo_Tipo_Bem.Text:= qrychama_tipo_bemCodigo.AsString;
    FrmCadastro_Bem_Patrimonio.EdtTipo_Bem.Text:= qrychama_tipo_bemTipo_Bem.AsString;
    FrmChama_Tipo_bem_Patrimonio.Close;
  end
  else if (FrmConsulta_Bem_Patrimonial <> NIl) and (FrmConsulta_Bem_Patrimonial.ativo = true) then
  begin
    FrmConsulta_Bem_Patrimonial.EdtCodigo_Tipo_Bem.Text:= qrychama_tipo_bemCodigo.AsString;
    FrmConsulta_Bem_Patrimonial.EdtTipo_Bem.Text:= qrychama_tipo_bemTipo_Bem.AsString;
    FrmChama_Tipo_bem_Patrimonio.Close;
  end
end;

procedure TFrmChama_Tipo_bem_Patrimonio.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Tipo_bem_Patrimonio.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Tipo_bem_Patrimonio.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Tipo_Bem_Patrimonial;
end;

procedure TFrmChama_Tipo_bem_Patrimonio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Tipo_bem_Patrimonio.Release;
end;

procedure TFrmChama_Tipo_bem_Patrimonio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Tipo_bem_Patrimonio.FormShow(Sender: TObject);
begin
  qrychama_tipo_bem.Close;
  qrychama_tipo_bem.Open;
end;

end.
