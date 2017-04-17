unit UChama_Cultura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Cultura = class(TForm)
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
  FrmChama_Cultura: TFrmChama_Cultura;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Cultura, UCadastro_Safra;

{$R *.dfm}

procedure TFrmChama_Cultura.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Cultura.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Cultura <> NIl) and (FrmCadastro_Cultura.ativo = true) then
  begin
    FrmCadastro_Cultura.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Cultura.EdtDescricao.Text:= qrychamaDescricao.AsString;
    FrmCadastro_Cultura.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;

    FrmChama_Cultura.Close;

    FrmCadastro_Cultura.BBtnSalvar.Enabled:= true;
    FrmCadastro_Cultura.BBtnExcluir.Enabled:= true;
    FrmCadastro_Cultura.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Cultura.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Cultura);
    FrmCadastro_Cultura.achei:= true;
  end
  else if (FrmCadastro_Safra <> NIl) and (FrmCadastro_Safra.ativo = true) then
  begin
    FrmCadastro_Safra.EdtCodigo_Cultura.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Safra.EdtCultura.Text:= qrychamaDescricao.AsString;
    FrmChama_Cultura.Close;
  end;
end;

procedure TFrmChama_Cultura.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Cultura.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Cultura.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Cultura;
end;

procedure TFrmChama_Cultura.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Cultura.Release;
end;

procedure TFrmChama_Cultura.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Cultura.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Open;
end;

end.
