unit UChama_Marca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Marca = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_marca: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_marcaCodigo: TIntegerField;
    qrychama_marcaDescricao: TStringField;
    qrychama_marcaData_Cadastro: TDateTimeField;
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
  FrmChama_Marca: TFrmChama_Marca;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Marca, UCadastro_Maquina;

{$R *.dfm}

procedure TFrmChama_Marca.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Marca.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Marca <> NIl) and (FrmCadastro_Marca.ativo = true) then
  begin
    FrmCadastro_Marca.EdtCodigo.Text:= qrychama_marcaCodigo.AsString;
    FrmCadastro_Marca.EdtDescricao.Text:= qrychama_marcaDescricao.AsString;
    FrmCadastro_Marca.MEdtData_Cadastro.Text:= qrychama_marcaData_Cadastro.AsString;

    FrmChama_Marca.Close;

    FrmCadastro_Marca.BBtnSalvar.Enabled:= true;
    FrmCadastro_Marca.BBtnExcluir.Enabled:= true;
    FrmCadastro_Marca.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Marca.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Marca);
    FrmCadastro_Marca.achei:= true;
  end
  else if (FrmCadastro_Maquina <> nil) and (FrmCadastro_Maquina.ativo = true) then
  begin
    FrmCadastro_Maquina.EdtCodigo_Marca.Text:= qrychama_marcaCodigo.AsString;
    FrmCadastro_Maquina.EdtMarca.Text:= qrychama_marcaDescricao.AsString;
    FrmChama_Marca.Close;
  end
end;

procedure TFrmChama_Marca.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Marca.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Marca.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Marca;
end;

procedure TFrmChama_Marca.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Marca.Release;
end;

procedure TFrmChama_Marca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Marca.FormShow(Sender: TObject);
begin
  qrychama_marca.Close;
  qrychama_marca.Open;
end;

end.
