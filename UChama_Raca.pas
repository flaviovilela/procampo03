unit UChama_Raca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Raca = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TAutoIncField;
    qrychamaDescricao: TStringField;
    qrychamaData_Cadastro: TDateTimeField;
    qrychamaSigla: TStringField;
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
  FrmChama_Raca: TFrmChama_Raca;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Animal, UCadastro_Raca;

{$R *.dfm}

procedure TFrmChama_Raca.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Raca.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Raca <> NIl) and (FrmCadastro_Raca.ativo = true) then
  begin
    FrmCadastro_Raca.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Raca.EdtSigla.Text:= qrychamaSigla.AsString;
    FrmCadastro_Raca.EdtDescricao.Text:= qrychamaDescricao.AsString;
    FrmCadastro_Raca.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;

    FrmCadastro_Raca.BBtnSalvar.Enabled:= true;
    FrmCadastro_Raca.BBtnExcluir.Enabled:= true;
    FrmCadastro_Raca.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Raca.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Raca);
    FrmCadastro_Raca.achei:= true;
  end
  else if (FrmCadastro_Animal <> nil) and (FrmCadastro_Animal.ativo) and (FrmCadastro_Animal.sigla = 1) then
  begin
    FrmCadastro_Animal.EdtCodigo_Raca1.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Animal.EdtRaca1.Text:= qrychamaSigla.AsString
  end
  else if (FrmCadastro_Animal <> nil) and (FrmCadastro_Animal.ativo) and (FrmCadastro_Animal.sigla = 2) then
  begin
    FrmCadastro_Animal.EdtCodigo_Raca2.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Animal.EdtRaca2.Text:= qrychamaSigla.AsString
  end
  else if (FrmCadastro_Animal <> nil) and (FrmCadastro_Animal.ativo) and (FrmCadastro_Animal.sigla = 3) then
  begin
    FrmCadastro_Animal.EdtCodigo_Raca3.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Animal.EdtRaca3.Text:= qrychamaSigla.AsString
  end
  else if (FrmCadastro_Animal <> nil) and (FrmCadastro_Animal.ativo) and (FrmCadastro_Animal.sigla = 4) then
  begin
    FrmCadastro_Animal.EdtCodigo_Raca4.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Animal.EdtRaca4.Text:= qrychamaSigla.AsString;
  end;

  FrmChama_Raca.Close;
end;

procedure TFrmChama_Raca.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Raca.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Raca.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Raca;
end;

procedure TFrmChama_Raca.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Raca.Release;
end;

procedure TFrmChama_Raca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Raca.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Open;
end;

end.
