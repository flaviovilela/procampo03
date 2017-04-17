unit UChama_Destinacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Destinacao = class(TForm)
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
  FrmChama_Destinacao: TFrmChama_Destinacao;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Destinacao, UDesmama;

{$R *.dfm}

procedure TFrmChama_Destinacao.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Destinacao.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Destinacao <> NIl) and (FrmCadastro_Destinacao.ativo = true) then
  begin
    FrmCadastro_Destinacao.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Destinacao.EdtDescricao.Text:= qrychamaDescricao.AsString;
    FrmCadastro_Destinacao.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;

    FrmCadastro_Destinacao.BBtnSalvar.Enabled:= true;
    FrmCadastro_Destinacao.BBtnExcluir.Enabled:= true;
    FrmCadastro_Destinacao.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Destinacao.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Destinacao);
    FrmCadastro_Destinacao.achei:= true;
  end
  else if (FrmDesmama <> nil) and (FrmDesmama.ativo) then
  begin
    FrmDesmama.EdtCodigo_Destinacao.Text:= qrychamaCodigo.AsString;
    FrmDesmama.EdtDestinacao.Text:= qrychamaDescricao.AsString;
  end;
  FrmChama_Destinacao.Close;
end;

procedure TFrmChama_Destinacao.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Destinacao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Destinacao.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Destinacao;
end;

procedure TFrmChama_Destinacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Destinacao.Release;
end;

procedure TFrmChama_Destinacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Destinacao.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Open;
end;

end.
