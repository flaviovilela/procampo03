unit UChama_Tema_Visita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Tema_Visita = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_tema: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_temaCodigo: TIntegerField;
    qrychama_temaDescricao: TStringField;
    qrychama_temaData_Cadastro: TDateTimeField;
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
  FrmChama_Tema_Visita: TFrmChama_Tema_Visita;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Tema_Visita, UVisita;

{$R *.dfm}

procedure TFrmChama_Tema_Visita.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Tema_Visita.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Setor;
end;

procedure TFrmChama_Tema_Visita.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Tema_Visita <> NIl) and (FrmCadastro_Tema_Visita.ativo = true) then
  begin
    FrmCadastro_Tema_Visita.EdtCodigo.Text:= qrychama_temaCodigo.AsString;
    FrmCadastro_Tema_Visita.EdtDescricao.Text:= qrychama_temaDescricao.AsString;
    FrmCadastro_Tema_Visita.MEdtData_Cadastro.Text:= qrychama_temaData_Cadastro.AsString;

    FrmChama_Tema_Visita.Close;

    FrmCadastro_Tema_Visita.BBtnSalvar.Enabled:= true;
    FrmCadastro_Tema_Visita.BBtnExcluir.Enabled:= true;
    FrmCadastro_Tema_Visita.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Tema_Visita.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Tema_Visita);
    FrmCadastro_Tema_Visita.achei:= true;
  end
  else if (FrmVisita <> NIl) and (FrmVisita.ativo = true) then
  begin
    FrmVisita.EdtCodigo_Tema.Text:= qrychama_temaCodigo.AsString;
    FrmVisita.EdtTema.Text:= qrychama_temaDescricao.AsString;
    FrmChama_Tema_Visita.Close;
  {end
  else if (FrmCadastro_Empresa <> NIl) and (FrmCadastro_Empresa.ativo = true) then
  begin
    FrmCadastro_Empresa.EdtCodigo_Setor.Text:= qrychama_setorCodigo.AsString;
    FrmCadastro_Empresa.EdtSetor.Text:= qrychama_setorDescricao.AsString;
    FrmChama_Setor.Close; }
  end
end;

procedure TFrmChama_Tema_Visita.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Tema_Visita.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Tema_Visita.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Tema_Visita;
end;

procedure TFrmChama_Tema_Visita.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Tema_Visita.Release;
end;

procedure TFrmChama_Tema_Visita.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Tema_Visita.FormShow(Sender: TObject);
begin
  qrychama_tema.Close;
  qrychama_tema.Open;
end;

end.
