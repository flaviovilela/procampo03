unit UChama_Protocolo_Sincronizacao_Cio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Protocolo_Sincronizacao_Cio = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaData_Protocolo: TDateTimeField;
    qrychamaHora_Protocolo: TStringField;
    qrychamaCodigo_Produto: TIntegerField;
    qrychamaQuantidade: TFloatField;
    qrychamaCodigo_Unidade: TIntegerField;
    qrychamaResponsavel: TStringField;
    qrychamaObservacao: TStringField;
    qrychamaUnidade: TStringField;
    qrychamaProduto: TStringField;
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
  FrmChama_Protocolo_Sincronizacao_Cio: TFrmChama_Protocolo_Sincronizacao_Cio;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UProtocolo_Sincronizacao;

{$R *.dfm}

procedure TFrmChama_Protocolo_Sincronizacao_Cio.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Protocolo_Sincronizacao_Cio.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmProtocolo_Sincronizacao <> NIl) and (FrmProtocolo_Sincronizacao.ativo = true) then
  begin
    FrmProtocolo_Sincronizacao.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmProtocolo_Sincronizacao.MEdtData_Protocolo.Text:= qrychamaData_Protocolo.AsString;
    FrmProtocolo_Sincronizacao.MEdtHora_Protocolo.Text:= qrychamaHora_Protocolo.AsString;
    FrmProtocolo_Sincronizacao.EdtCodigo_Produto.Text:= qrychamaCodigo_Produto.AsString;
    FrmProtocolo_Sincronizacao.EdtProduto.Text:= qrychamaProduto.AsString;
    FrmProtocolo_Sincronizacao.EdtQtde.Text:= qrychamaQuantidade.AsString;
    FrmProtocolo_Sincronizacao.EdtCodigo_Unidade.Text:= qrychamaCodigo_Unidade.AsString;
    FrmProtocolo_Sincronizacao.EdtUnidade.Text:= qrychamaUnidade.AsString;
    FrmProtocolo_Sincronizacao.EdtResponsavel.Text:= qrychamaResponsavel.AsString;
    FrmProtocolo_Sincronizacao.MMObservacoes.Text:= qrychamaObservacao.AsString;

    FrmProtocolo_Sincronizacao.BBtnSalvar.Enabled:= true;
    FrmProtocolo_Sincronizacao.BBtnExcluir.Enabled:= true;
    FrmProtocolo_Sincronizacao.BBtnPesquisar.Enabled:= true;
    FrmProtocolo_Sincronizacao.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmProtocolo_Sincronizacao);
    FrmProtocolo_Sincronizacao.achei:= true;
    FrmProtocolo_Sincronizacao.CheckBox1.Checked:= false;
    FrmProtocolo_Sincronizacao.CheckBox1.Enabled:= false;
  end;
    FrmChama_Protocolo_Sincronizacao_Cio.Close;

end;

procedure TFrmChama_Protocolo_Sincronizacao_Cio.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Protocolo_Sincronizacao_Cio.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Protocolo_Sincronizacao_Cio.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Protocolo_Sincronizacao_Cio
end;

procedure TFrmChama_Protocolo_Sincronizacao_Cio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Protocolo_Sincronizacao_Cio.Release;
end;

procedure TFrmChama_Protocolo_Sincronizacao_Cio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Protocolo_Sincronizacao_Cio.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
  qrychama.Open;
end;

end.
