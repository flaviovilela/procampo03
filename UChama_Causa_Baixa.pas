unit UChama_Causa_Baixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Causa_Baixa = class(TForm)
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
  FrmChama_Causa_Baixa: TFrmChama_Causa_Baixa;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UBaixa_Animal, UCadastro_Causa_Baixa;

{$R *.dfm}

procedure TFrmChama_Causa_Baixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Causa_Baixa.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Causa_Baixa <> NIl) and (FrmCadastro_Causa_Baixa.ativo = true) then
  begin
    FrmCadastro_Causa_Baixa.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Causa_Baixa.EdtDescricao.Text:= qrychamaDescricao.AsString;
    FrmCadastro_Causa_Baixa.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;

    FrmCadastro_Causa_Baixa.BBtnSalvar.Enabled:= true;
    FrmCadastro_Causa_Baixa.BBtnExcluir.Enabled:= true;
    FrmCadastro_Causa_Baixa.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Causa_Baixa.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Causa_Baixa);
    FrmCadastro_Causa_Baixa.achei:= true;
  end
  else if (FrmBaixa_Animal <> nil) and (FrmBaixa_Animal.ativo) then
  begin
    FrmBaixa_Animal.EdtCodigo_Causa.Text:= qrychamaCodigo.AsString;
    FrmBaixa_Animal.EdtCausa.Text:= qrychamaDescricao.AsString;
  end;

  FrmChama_Causa_Baixa.Close;

end;

procedure TFrmChama_Causa_Baixa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Causa_Baixa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Causa_Baixa.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Causa_Baixa;
end;

procedure TFrmChama_Causa_Baixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Causa_Baixa.Release;
end;

procedure TFrmChama_Causa_Baixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Causa_Baixa.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Open;
end;

end.
