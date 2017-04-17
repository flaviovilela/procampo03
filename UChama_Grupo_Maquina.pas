unit UChama_Grupo_Maquina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Grupo_Maquina = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_grupo_maquina: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_grupo_maquinaCodigo: TIntegerField;
    qrychama_grupo_maquinaDescricao: TStringField;
    qrychama_grupo_maquinaData_Cadastro: TDateTimeField;
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
  FrmChama_Grupo_Maquina: TFrmChama_Grupo_Maquina;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Grupo_Maquina, UCadastro_Maquina;

{$R *.dfm}

procedure TFrmChama_Grupo_Maquina.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Grupo_Maquina.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Grupo_Maquina <> NIl) and (FrmCadastro_Grupo_Maquina.ativo = true) then
  begin
    FrmCadastro_Grupo_Maquina.EdtCodigo.Text:= qrychama_grupo_maquinaCodigo.AsString;
    FrmCadastro_Grupo_Maquina.EdtDescricao.Text:= qrychama_grupo_maquinaDescricao.AsString;
    FrmCadastro_Grupo_Maquina.MEdtData_Cadastro.Text:= qrychama_grupo_maquinaData_Cadastro.AsString;

    FrmChama_Grupo_Maquina.Close;

    FrmCadastro_Grupo_Maquina.BBtnSalvar.Enabled:= true;
    FrmCadastro_Grupo_Maquina.BBtnExcluir.Enabled:= true;
    FrmCadastro_Grupo_Maquina.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Grupo_Maquina.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Grupo_Maquina);
    FrmCadastro_Grupo_Maquina.achei:= true;
  end
  else if (FrmCadastro_Maquina <> nil) and (FrmCadastro_Maquina.ativo = true) then
  begin
    FrmCadastro_Maquina.EdtCodigo_Grupo_Maquina.Text:= qrychama_grupo_maquinaCodigo.AsString;
    FrmCadastro_Maquina.EdtGrupo_Maquina.Text:= qrychama_grupo_maquinaDescricao.AsString;
    FrmChama_Grupo_Maquina.Close;
  end;
end;

procedure TFrmChama_Grupo_Maquina.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Grupo_Maquina.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Grupo_Maquina.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Grupo_Maquina;
end;

procedure TFrmChama_Grupo_Maquina.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Grupo_Maquina.Release;
end;

procedure TFrmChama_Grupo_Maquina.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Grupo_Maquina.FormShow(Sender: TObject);
begin
  qrychama_grupo_maquina.Close;
  qrychama_grupo_maquina.Open;
end;

end.
