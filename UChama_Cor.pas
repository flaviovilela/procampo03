unit UChama_Cor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Cor = class(TForm)
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
  FrmChama_Cor: TFrmChama_Cor;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Cor, UCadastro_Animal;

{$R *.dfm}

procedure TFrmChama_Cor.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Cor.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Cor <> NIl) and (FrmCadastro_Cor.ativo = true) then
  begin
    FrmCadastro_Cor.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Cor.EdtDescricao.Text:= qrychamaDescricao.AsString;
    FrmCadastro_Cor.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;

    FrmChama_Cor.Close;

    FrmCadastro_Cor.BBtnSalvar.Enabled:= true;
    FrmCadastro_Cor.BBtnExcluir.Enabled:= true;
    FrmCadastro_Cor.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Cor.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Cor);
    FrmCadastro_Cor.achei:= true;
  end
  else if (FrmCadastro_Animal <> nil) and (FrmCadastro_Animal.ativo) then
  begin
    FrmCadastro_Animal.EdtCodigo_Cor.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Animal.EdtCor.Text:= qrychamaDescricao.AsString;
    FrmChama_Cor.Close;
  end;
end;

procedure TFrmChama_Cor.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Cor.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Cor.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Cor;
end;

procedure TFrmChama_Cor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Cor.Release;
end;

procedure TFrmChama_Cor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Cor.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Open;
end;

end.
