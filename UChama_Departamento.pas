unit UChama_Departamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, ADODB, UConsulta,
  UUtilitarios;

type
  TFrmChama_Departamento = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_departamento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_departamentoCodigo: TAutoIncField;
    qrychama_departamentoDescricao: TStringField;
    qrychama_departamentoData_Cadastro: TDateTimeField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Departamento: TFrmChama_Departamento;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Departamento, ULancamento_Financeiro,
  UConsulta_Lancamentos_Financeiros;

{$R *.dfm}

procedure TFrmChama_Departamento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Departamento.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Departamento <> NIl) and (FrmCadastro_Departamento.ativo = true) then
  begin
    FrmCadastro_Departamento.EdtCodigo.Text:= qrychama_departamentoCodigo.AsString;
    FrmCadastro_Departamento.EdtDescricao.Text:= qrychama_departamentoDescricao.AsString;
    FrmCadastro_Departamento.MEdtData_Cadastro.Text:= qrychama_departamentoData_Cadastro.AsString;
    FrmChama_Departamento.Close;
    FrmCadastro_Departamento.BBtnSalvar.Enabled:= true;
    FrmCadastro_Departamento.BBtnExcluir.Enabled:= true;
    FrmCadastro_Departamento.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Departamento.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Departamento);
    FrmCadastro_Departamento.achei:= true;
  end
  else if (FrmLancamento_Financeiro <> NIl) and (FrmLancamento_Financeiro.ativo = true) then
  begin
    FrmLancamento_Financeiro.EdtCodigo_Departamento.Text:= qrychama_departamentoCodigo.AsString;
    FrmLancamento_Financeiro.EdtDepartamento.Text:= qrychama_departamentoDescricao.AsString;
    FrmChama_Departamento.Close;
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> NIl) and (FrmConsulta_Lancamentos_Financeiros.ativo = true) then
  begin
    FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text:= qrychama_departamentoCodigo.AsString;
    FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text:= qrychama_departamentoDescricao.AsString;
    FrmChama_Departamento.Close;
  end;
end;

procedure TFrmChama_Departamento.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Departamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Departamento.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Departamento;
end;

procedure TFrmChama_Departamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Departamento.Release;
end;

procedure TFrmChama_Departamento.FormCreate(Sender: TObject);
begin
  qrychama_departamento.Close;
  qrychama_departamento.Open;
end;

procedure TFrmChama_Departamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
