unit UChama_Mesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Mesa = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_mesa: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_mesaCodigo: TIntegerField;
    qrychama_mesaDescricao: TStringField;
    qrychama_mesaData_Cadastro: TDateTimeField;
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
  FrmChama_Mesa: TFrmChama_Mesa;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UPedido, UCadastro_Mesa;

{$R *.dfm}

procedure TFrmChama_Mesa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Mesa.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Mesa <> NIl) and (FrmCadastro_Mesa.ativo = true) then
  begin
    FrmCadastro_Mesa.EdtCodigo.Text:= qrychama_mesaCodigo.AsString;
    FrmCadastro_Mesa.EdtDescricao.Text:= qrychama_mesaDescricao.AsString;
    FrmCadastro_Mesa.MEdtData_Cadastro.Text:= qrychama_mesaData_Cadastro.AsString;
    FrmChama_Mesa.Close;

    FrmCadastro_Mesa.BBtnSalvar.Enabled:= true;
    FrmCadastro_Mesa.BBtnExcluir.Enabled:= true;
    FrmCadastro_Mesa.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Mesa.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Mesa);
    FrmCadastro_Mesa.achei:= true;
  end
  else if (FrmPedido <> NIl) and (FrmPedido.ativo = true) then
  begin
    FrmPedido.EdtCodigo_Mesa.Text:= qrychama_mesaCodigo.AsString;
    FrmPedido.EdtMesa.Text:= qrychama_mesaDescricao.AsString;
    FrmChama_Mesa.Close;
  end;
end;

procedure TFrmChama_Mesa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Mesa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Mesa.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Mesa;
end;

procedure TFrmChama_Mesa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Mesa.Release;
end;

procedure TFrmChama_Mesa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Mesa.FormShow(Sender: TObject);
begin
  qrychama_mesa.Open;
end;

end.
