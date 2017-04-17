unit UChama_Fechamento_Fornecimento_Leite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Fechamento_Fornecimento_Leite = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaData_Inicial: TDateTimeField;
    qrychamaData_Final: TDateTimeField;
    qrychamaData_Fechamento: TDateTimeField;
    qrychamaQuantidade: TFloatField;
    qrychamaValor_Unitario: TFloatField;
    qrychamaValor_Total: TFloatField;
    qrychamaDesconto: TFloatField;
    qrychamaAcrecimo: TFloatField;
    qrychamaValor_Final: TFloatField;
    qrychamaObservacao: TStringField;
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
  FrmChama_Fechamento_Fornecimento_Leite: TFrmChama_Fechamento_Fornecimento_Leite;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UFechamento_Fornecimento_Leite;

{$R *.dfm}

procedure TFrmChama_Fechamento_Fornecimento_Leite.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Fechamento_Fornecimento_Leite.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmFechamento_Fornecimento_Leite <> NIl) and (FrmFechamento_Fornecimento_Leite.ativo = true) then
  begin
    FrmFechamento_Fornecimento_Leite.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmFechamento_Fornecimento_Leite.MEdtData_Inicial.Text:= qrychamaData_Inicial.AsString;
    FrmFechamento_Fornecimento_Leite.MEdtData_Final.Text:= qrychamaData_Final.AsString;
    FrmFechamento_Fornecimento_Leite.MEdtData_Fechamento.Text:= qrychamaData_Fechamento.AsString;

    FrmFechamento_Fornecimento_Leite.EdtQtde.Text:= FormatFloat('#0.0,0', qrychamaQuantidade.AsFloat);
    FrmFechamento_Fornecimento_Leite.EdtQtde.Text:= StringReplace(FrmFechamento_Fornecimento_Leite.EdtQtde.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmFechamento_Fornecimento_Leite.EdtPreco.Text:= FormatFloat('#0.0,0', qrychamaValor_Unitario.AsFloat);
    FrmFechamento_Fornecimento_Leite.EdtPreco.Text:= StringReplace(FrmFechamento_Fornecimento_Leite.EdtPreco.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmFechamento_Fornecimento_Leite.EdtValor_Total.Text:= FormatFloat('#0.0,0', qrychamaValor_Total.AsFloat);
    FrmFechamento_Fornecimento_Leite.EdtValor_Total.Text:= StringReplace(FrmFechamento_Fornecimento_Leite.EdtValor_Total.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmFechamento_Fornecimento_Leite.EdtDesconto.Text:= FormatFloat('#0.0,0', qrychamaDesconto.AsFloat);
    FrmFechamento_Fornecimento_Leite.EdtDesconto.Text:= StringReplace(FrmFechamento_Fornecimento_Leite.EdtDesconto.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmFechamento_Fornecimento_Leite.EdtAcrecimo.Text:= FormatFloat('#0.0,0', qrychamaAcrecimo.AsFloat);
    FrmFechamento_Fornecimento_Leite.EdtAcrecimo.Text:= StringReplace(FrmFechamento_Fornecimento_Leite.EdtAcrecimo.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmFechamento_Fornecimento_Leite.EdtValor_Final.Text:= FormatFloat('#0.0,0', qrychamaValor_Final.AsFloat);
    FrmFechamento_Fornecimento_Leite.EdtValor_Final.Text:= StringReplace(FrmFechamento_Fornecimento_Leite.EdtValor_Final.Text, ThousandSeparator, '', [rfReplaceAll]);


    FrmFechamento_Fornecimento_Leite.MMOObservacao.Text:= qrychamaObservacao.AsString;

    FrmFechamento_Fornecimento_Leite.BBtnSalvar.Enabled:= true;
    FrmFechamento_Fornecimento_Leite.BBtnExcluir.Enabled:= true;
    FrmFechamento_Fornecimento_Leite.BBtnPesquisar.Enabled:= true;
    FrmFechamento_Fornecimento_Leite.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmFechamento_Fornecimento_Leite);
    FrmFechamento_Fornecimento_Leite.achei:= true;
  end;

  FrmChama_Fechamento_Fornecimento_Leite.Close;

end;

procedure TFrmChama_Fechamento_Fornecimento_Leite.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Fechamento_Fornecimento_Leite.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Fechamento_Fornecimento_Leite.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Fechamento_Fornecimento_Leite;
end;

procedure TFrmChama_Fechamento_Fornecimento_Leite.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Fechamento_Fornecimento_Leite.Release;
end;

procedure TFrmChama_Fechamento_Fornecimento_Leite.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Fechamento_Fornecimento_Leite.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
  qrychama.Open;
end;

end.
