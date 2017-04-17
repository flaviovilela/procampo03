unit UChama_Tipo_Pastagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Tipo_Pastagem = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaDescricao: TStringField;
    qrychamaData_Cadastro: TDateTimeField;
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
  FrmChama_Tipo_Pastagem: TFrmChama_Tipo_Pastagem;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Tipo_Pastagem, UCadastro_Piquete;

{$R *.dfm}

procedure TFrmChama_Tipo_Pastagem.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Tipo_Pastagem.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Tipo_Pastagem <> NIl) and (FrmCadastro_Tipo_Pastagem.ativo = true) then
  begin
    FrmCadastro_Tipo_Pastagem.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Tipo_Pastagem.EdtDescricao.Text:= qrychamaDescricao.AsString;
    FrmCadastro_Tipo_Pastagem.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;

    FrmChama_Tipo_Pastagem.Close;

    FrmCadastro_Tipo_Pastagem.BBtnSalvar.Enabled:= true;
    FrmCadastro_Tipo_Pastagem.BBtnExcluir.Enabled:= true;
    FrmCadastro_Tipo_Pastagem.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Tipo_Pastagem.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Tipo_Pastagem);
    FrmCadastro_Tipo_Pastagem.achei:= true;
  end
  else if (FrmCadastro_Piquete <> nil) and (FrmCadastro_Piquete.ativo) then
  begin
    FrmCadastro_Piquete.EdtCodigo_Tipo_Pastagem.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Piquete.EdtTipo_Pastagem.Text:= qrychamaDescricao.AsString;
    FrmChama_Tipo_Pastagem.Close;
  end;
end;

procedure TFrmChama_Tipo_Pastagem.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Tipo_Pastagem.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Tipo_Pastagem.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Tipo_Pastagem;
end;

procedure TFrmChama_Tipo_Pastagem.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Tipo_Pastagem.Release;
end;

procedure TFrmChama_Tipo_Pastagem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Tipo_Pastagem.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Open;
end;

end.
