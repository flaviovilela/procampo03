unit UChama_Piquete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Piquete = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaDescricao: TStringField;
    qrychamaCodigo_Tipo_Pastagem: TIntegerField;
    qrychamaDimensao: TStringField;
    qrychamaLimite_Animais: TIntegerField;
    qrychamaData_Cadastro: TDateTimeField;
    qrychamaTipo_Pastagem: TStringField;
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
    procedure Atualiza_Dados;
  public
    { Public declarations }
  end;

var
  FrmChama_Piquete: TFrmChama_Piquete;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Piquete, UCadastro_Animal, UDesmama;

{$R *.dfm}

procedure TFrmChama_Piquete.Atualiza_Dados;
begin
  with qrychama, sql do
  begin
    close;
    clear;
    add('select CP.*, CTP.Descricao as Tipo_Pastagem from Cadastro_Piquete CP');
    add('left join Cadastro_Tipo_Pastagem CTP on (CP.Codigo_Tipo_Pastagem = CTP.Codigo)');
    add('where CP.Codigo_Propriedade = :Propriedade order by CP.Descricao');
    Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
    open;
  end;
end;

procedure TFrmChama_Piquete.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Piquete.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Piquete <> NIl) and (FrmCadastro_Piquete.ativo = true) then
  begin
    FrmCadastro_Piquete.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Piquete.EdtDescricao.Text:= qrychamaDescricao.AsString;
    FrmCadastro_Piquete.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;
    FrmCadastro_Piquete.EdtCodigo_Tipo_Pastagem.Text:= qrychamaCodigo_Tipo_Pastagem.AsString;
    FrmCadastro_Piquete.EdtTipo_Pastagem.Text:= qrychamaTipo_Pastagem.AsString;
    FrmCadastro_Piquete.EdtDimensao.Text:= qrychamaDimensao.AsString;
    FrmCadastro_Piquete.EdtLimite.Text:= qrychamaLimite_Animais.AsString;

    FrmChama_Piquete.Close;

    FrmCadastro_Piquete.BBtnSalvar.Enabled:= true;
    FrmCadastro_Piquete.BBtnExcluir.Enabled:= true;
    FrmCadastro_Piquete.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Piquete.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Piquete);
    FrmCadastro_Piquete.achei:= true;
  end
  else if (FrmCadastro_Animal <> nil) and (FrmCadastro_Animal.ativo) then
  begin
    FrmCadastro_Animal.EdtCodigo_Piquete.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Animal.EdtPiquete.Text:= qrychamaDescricao.AsString;
    FrmChama_Piquete.Close;
  end
  else if (FrmDesmama <> nil) and (FrmDesmama.ativo) then
  begin
    FrmDesmama.EdtCodigo_Piquete.Text:= qrychamaCodigo.AsString;
    FrmDesmama.EdtPiquete.Text:= qrychamaDescricao.AsString;
    FrmChama_Piquete.Close;
  end;
end;

procedure TFrmChama_Piquete.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Piquete.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Piquete.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Piquete;
end;

procedure TFrmChama_Piquete.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Piquete.Release;
end;

procedure TFrmChama_Piquete.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Piquete.FormShow(Sender: TObject);
begin
  Atualiza_Dados;
end;

end.
