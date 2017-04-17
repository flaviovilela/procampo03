unit UChama_Setor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Setor = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_setor: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_setorCodigo: TIntegerField;
    qrychama_setorDescricao: TStringField;
    qrychama_setorData_Cadastro: TDateTimeField;
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
  FrmChama_Setor: TFrmChama_Setor;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Empresa, UCadastro_Setor, UCadastro_Cliente;

{$R *.dfm}

procedure TFrmChama_Setor.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Setor.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Setor <> NIl) and (FrmCadastro_Setor.ativo = true) then
  begin
    FrmCadastro_Setor.EdtCodigo.Text:= qrychama_setorCodigo.AsString;
    FrmCadastro_Setor.EdtDescricao.Text:= qrychama_setorDescricao.AsString;
    FrmCadastro_Setor.MEdtData_Cadastro.Text:= qrychama_setorData_Cadastro.AsString;

    FrmChama_Setor.Close;

    FrmCadastro_Setor.BBtnSalvar.Enabled:= true;
    FrmCadastro_Setor.BBtnExcluir.Enabled:= true;
    FrmCadastro_Setor.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Setor.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Setor);
    FrmCadastro_Setor.achei:= true;
  end
  else if (FrmCadastro_Empresa <> NIl) and (FrmCadastro_Empresa.ativo = true) then
  begin
    FrmCadastro_Empresa.EdtCodigo_Setor.Text:= qrychama_setorCodigo.AsString;
    FrmCadastro_Empresa.EdtSetor.Text:= qrychama_setorDescricao.AsString;
    FrmChama_Setor.Close;
  end
  else if (FrmCadastro_Cliente <> NIl) and (FrmCadastro_Cliente.ativo = true) then
  begin
    FrmCadastro_Cliente.EdtCodigo_Setor.Text:= qrychama_setorCodigo.AsString;
    FrmCadastro_Cliente.EdtSetor.Text:= qrychama_setorDescricao.AsString;
    FrmChama_Setor.Close;
  end
end;

procedure TFrmChama_Setor.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Setor.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Setor.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Setor;
end;

procedure TFrmChama_Setor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Setor.Release;
end;

procedure TFrmChama_Setor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Setor.FormShow(Sender: TObject);
begin
  qrychama_setor.Close;
  qrychama_setor.Open;
end;

end.
