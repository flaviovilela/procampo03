unit UChama_Fornecimento_Leite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Fornecimento_Leite = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaData_Entrega: TDateTimeField;
    qrychamaCodigo_Cliente: TIntegerField;
    qrychamaQuantidade: TFloatField;
    qrychamaObservacao: TStringField;
    qrychamaNome: TStringField;
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
  FrmChama_Fornecimento_Leite: TFrmChama_Fornecimento_Leite;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UFornecimento_Leite;

{$R *.dfm}

procedure TFrmChama_Fornecimento_Leite.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Fornecimento_Leite.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmFornecimento_Leite <> NIl) and (FrmFornecimento_Leite.ativo = true) then
  begin
    FrmFornecimento_Leite.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmFornecimento_Leite.MEdtData_Entrega.Text:= qrychamaData_Entrega.AsString;
    FrmFornecimento_Leite.EdtQtde.Text:= qrychamaQuantidade.AsString;

    FrmFornecimento_Leite.EdtCodigo_Cliente.Text:= qrychamaCodigo_Cliente.AsString;
    FrmFornecimento_Leite.EdtCliente.Text:= qrychamaNome.AsString;
    FrmFornecimento_Leite.MMOObservacao.Text:= qrychamaObservacao.AsString;

    FrmFornecimento_Leite.BBtnSalvar.Enabled:= true;
    FrmFornecimento_Leite.BBtnExcluir.Enabled:= true;
    FrmFornecimento_Leite.BBtnPesquisar.Enabled:= true;
    FrmFornecimento_Leite.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmFornecimento_Leite);
    FrmFornecimento_Leite.achei:= true;
  end;

  FrmChama_Fornecimento_Leite.Close;

end;

procedure TFrmChama_Fornecimento_Leite.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Fornecimento_Leite.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Fornecimento_Leite.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Fornecimento_Leite;
end;

procedure TFrmChama_Fornecimento_Leite.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Fornecimento_Leite.Release;
end;

procedure TFrmChama_Fornecimento_Leite.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Fornecimento_Leite.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
  qrychama.Open;
end;

end.
