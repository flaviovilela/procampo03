unit UChama_Safra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Safra = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaDescricao: TStringField;
    qrychamaData_Cadastro: TDateTimeField;
    qrychamaCodigo_Tipo_Cultura: TIntegerField;
    qrychamaCultura: TStringField;
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
  FrmChama_Safra: TFrmChama_Safra;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Safra, ULancamento_Financeiro,
  UConsulta_Lancamentos_Financeiros;

{$R *.dfm}

procedure TFrmChama_Safra.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Safra.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Safra <> NIl) and (FrmCadastro_Safra.ativo = true) then
  begin
    FrmCadastro_Safra.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Safra.EdtDescricao.Text:= qrychamaDescricao.AsString;
    FrmCadastro_Safra.EdtCodigo_Cultura.Text:= qrychamaCodigo_Tipo_Cultura.AsString;
    FrmCadastro_Safra.EdtCultura.Text:= qrychamaCultura.AsString;
    FrmCadastro_Safra.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;

    FrmChama_Safra.Close;

    FrmCadastro_Safra.BBtnSalvar.Enabled:= true;
    FrmCadastro_Safra.BBtnExcluir.Enabled:= true;
    FrmCadastro_Safra.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Safra.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Safra);
    FrmCadastro_Safra.achei:= true;
  end
  else if (FrmLancamento_Financeiro <> NIl) and (FrmLancamento_Financeiro.ativo = true) then
  begin
    FrmLancamento_Financeiro.EdtCodigo_Safra.Text:= qrychamaCodigo.AsString;
    FrmLancamento_Financeiro.EdtSafra.Text:= qrychamaDescricao.AsString + ' ' + qrychamaCultura.AsString;
    FrmChama_Safra.Close;
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> NIl) and (FrmConsulta_Lancamentos_Financeiros.ativo = true) then
  begin
    FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text:= qrychamaCodigo.AsString;
    FrmConsulta_Lancamentos_Financeiros.EdtSafra.Text:= qrychamaDescricao.AsString + ' ' + qrychamaCultura.AsString;
    FrmChama_Safra.Close;
  end
end;

procedure TFrmChama_Safra.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Safra.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Safra.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Safra;
end;

procedure TFrmChama_Safra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Safra.Release;
end;

procedure TFrmChama_Safra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Safra.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Open;
end;

end.
