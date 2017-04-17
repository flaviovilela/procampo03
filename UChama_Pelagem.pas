unit UChama_Pelagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Pelagem = class(TForm)
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
  FrmChama_Pelagem: TFrmChama_Pelagem;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Pelagem, UCadastro_Animal;

{$R *.dfm}

procedure TFrmChama_Pelagem.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Pelagem.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Pelagem <> NIl) and (FrmCadastro_Pelagem.ativo = true) then
  begin
    FrmCadastro_Pelagem.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Pelagem.EdtDescricao.Text:= qrychamaDescricao.AsString;
    FrmCadastro_Pelagem.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;

    FrmChama_Pelagem.Close;

    FrmCadastro_Pelagem.BBtnSalvar.Enabled:= true;
    FrmCadastro_Pelagem.BBtnExcluir.Enabled:= true;
    FrmCadastro_Pelagem.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Pelagem.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Pelagem);
    FrmCadastro_Pelagem.achei:= true;
  end
  else if (FrmCadastro_Animal <> nil) and (FrmCadastro_Animal.ativo) then
  begin
    FrmCadastro_Animal.EdtCodigo_Pelagem.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Animal.EdtPelagem.Text:= qrychamaDescricao.AsString;
    FrmChama_Pelagem.Close;
  end;
end;

procedure TFrmChama_Pelagem.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Pelagem.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Pelagem.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Pelagem;
end;

procedure TFrmChama_Pelagem.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Pelagem.Release;
end;

procedure TFrmChama_Pelagem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Pelagem.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Open;
end;

end.
