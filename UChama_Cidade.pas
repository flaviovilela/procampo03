unit UChama_Cidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Cidade = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_cidade: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_cidadeCodigo: TIntegerField;
    qrychama_cidadeCidade: TStringField;
    qrychama_cidadeUF: TStringField;
    qrychama_cidadeDDD: TStringField;
    qrychama_cidadeData_Cadastro: TDateTimeField;
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
  FrmChama_Cidade: TFrmChama_Cidade;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Cidade, UCadastro_Empresa, UCadastro_Cliente,
  UCadastro_Agencia;

{$R *.dfm}

procedure TFrmChama_Cidade.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Cidade.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Cidade;
end;

procedure TFrmChama_Cidade.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Cidade <> NIl) and (FrmCadastro_Cidade.ativo = true) then
  begin
    FrmCadastro_Cidade.EdtCodigo.Text:= qrychama_cidadeCodigo.AsString;
    FrmCadastro_Cidade.EdtCidade.Text:= qrychama_cidadeCidade.AsString;
    FrmCadastro_Cidade.CmbUF.Text:= qrychama_cidadeUF.AsString;
    FrmCadastro_Cidade.EdtDDD.Text:= qrychama_cidadeDDD.AsString;
    FrmCadastro_Cidade.MEdtData_Cadastro.Text:= qrychama_cidadeData_Cadastro.AsString;
    FrmChama_Cidade.Close;
    FrmCadastro_Cidade.BBtnSalvar.Enabled:= true;
    FrmCadastro_Cidade.BBtnExcluir.Enabled:= true;
    FrmCadastro_Cidade.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Cidade.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Cidade);
    FrmCadastro_Cidade.achei:= true;
  end
  else if (FrmCadastro_Empresa <> NIl) and (FrmCadastro_Empresa.ativo = true) then
  begin
    FrmCadastro_Empresa.EdtCodigo_Cidade.Text:= qrychama_cidadeCodigo.AsString;
    FrmCadastro_Empresa.EdtCidade.Text:= qrychama_cidadeCidade.AsString;
    FrmCadastro_Empresa.EdtUF.Text:= qrychama_cidadeUF.AsString;
    FrmChama_Cidade.Close;
  end
  else if (FrmCadastro_Cliente <> NIl) and (FrmCadastro_Cliente.ativo = true) then
  begin
    FrmCadastro_Cliente.EdtCodigo_Cidade.Text:= qrychama_cidadeCodigo.AsString;
    FrmCadastro_Cliente.EdtCidade.Text:= qrychama_cidadeCidade.AsString;
    FrmCadastro_Cliente.EdtUF.Text:= qrychama_cidadeUF.AsString;
    FrmChama_Cidade.Close;
  end
  else if (FrmCadastro_Agencia <> NIl) and (FrmCadastro_Agencia.ativo = true) then
  begin
    FrmCadastro_Agencia.EdtCodigo_Cidade.Text:= qrychama_cidadeCodigo.AsString;
    FrmCadastro_Agencia.EdtCidade.Text:= qrychama_cidadeCidade.AsString;
    FrmChama_Cidade.Close;
  end
end;

procedure TFrmChama_Cidade.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Cidade.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Cidade.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Cidade;
end;

procedure TFrmChama_Cidade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Cidade.Release;
end;

procedure TFrmChama_Cidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Cidade.FormShow(Sender: TObject);
begin
  qrychama_cidade.Open;
end;

end.
