unit UChama_Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Pedido = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_pedido: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_pedidoCodigo: TIntegerField;
    qrychama_pedidoN_Pedido: TStringField;
    qrychama_pedidoData_Movimento: TDateTimeField;
    qrychama_pedidoTipo: TStringField;
    qrychama_pedidoCodigo_Mesa: TIntegerField;
    qrychama_pedidoCodigo_Atendente: TIntegerField;
    qrychama_pedidoCodigo_Cliente: TIntegerField;
    qrychama_pedidoCodigo_Condicao_Pagamento: TIntegerField;
    qrychama_pedidoObservacao: TStringField;
    qrychama_pedidoQuantidade_Itens: TIntegerField;
    qrychama_pedidoTotal_Pedido: TFloatField;
    qrychama_pedidoTaxa_Entrega: TFloatField;
    qrychama_pedidoDesconto: TFloatField;
    qrychama_pedidoAcrescimo: TFloatField;
    qrychama_pedidoValor_Pagar: TFloatField;
    qrychama_pedidoValor_Recebido: TFloatField;
    qrychama_pedidoTroco: TFloatField;
    qrychama_pedidoCondicao_Pagamento: TStringField;
    qrychama_pedidoMesa: TStringField;
    qrychama_pedidoCliente: TStringField;
    qrychama_pedidoAtendente: TStringField;
    qrychama_pedidoTelefone: TStringField;
    qrychama_pedidoCelular: TStringField;
    qrychama_pedidoLogradouro: TStringField;
    qrychama_pedidoSetor: TStringField;
    qrychama_pedidoNumero: TStringField;
    qrychama_pedidoPrazo: TIntegerField;
    qrychama_pedidoParcela: TIntegerField;
    qrychama_pedidoTipo_Pagamento: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtConsultaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Pedido: TFrmChama_Pedido;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM;

{$R *.dfm}

procedure TFrmChama_Pedido.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Pedido.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmPedido <> NIl) and (FrmPedido.ativo = true) then
  begin
    FrmPedido.EdtCodigo.Text:= qrychama_pedidoCodigo.AsString;
    FrmPedido.EdtN_Pedido.Text:= qrychama_pedidoN_Pedido.AsString;
    FrmPedido.MEdtData_Movimento.Text:= qrychama_pedidoData_Movimento.AsString;
    FrmPedido.CmbTipo.Text:= qrychama_pedidoTipo.AsString;

    if (qrychama_pedidoCodigo_Mesa.AsString = '0') then
    begin
      FrmPedido.EdtCodigo_Mesa.Text:= '';
      FrmPedido.EdtMesa.Text:= '';
    end
    else
    begin
      FrmPedido.EdtCodigo_Mesa.Text:= qrychama_pedidoCodigo_Mesa.AsString;
      FrmPedido.EdtMesa.Text:= qrychama_pedidoMesa.AsString;
    end;

    if (qrychama_pedidoCodigo_Atendente.AsString = '0') then
    begin
      FrmPedido.EdtCodigo_Atendente.Text:= '';
      FrmPedido.EdtAtendente.Text:= '';
    end
    else
    begin
      FrmPedido.EdtCodigo_Atendente.Text:= qrychama_pedidoCodigo_Atendente.AsString;
      FrmPedido.EdtAtendente.Text:= qrychama_pedidoAtendente.AsString;
    end;

    if (qrychama_pedidoCodigo_Condicao_Pagamento.AsString = '0') then
    begin
      FrmPedido.EdtCodigo_Condicao_Pagamento.Text:= '';
      FrmPedido.EdtCondicao_Pagamento.Text:= '';
    end
    else
    begin
      FrmPedido.EdtCodigo_Condicao_Pagamento.Text:= qrychama_pedidoCodigo_Condicao_Pagamento.AsString;
      FrmPedido.EdtCondicao_Pagamento.Text:= qrychama_pedidoCondicao_Pagamento.AsString;
    end;

    FrmPedido.EdtCodigo_Cliente.Text:= qrychama_pedidoCodigo_Cliente.AsString;
    FrmPedido.EdtCliente.Text:= qrychama_pedidoCliente.AsString;
    FrmPedido.EdtEndereco.Text:= qrychama_pedidoLogradouro.AsString;
    FrmPedido.EdtNumero.Text:= qrychama_pedidoNumero.AsString;
    FrmPedido.EdtSetor.Text:= qrychama_pedidoSetor.AsString;
    FrmPedido.MEdtTelefone.Text:= qrychama_pedidoTelefone.AsString;
    FrmPedido.MEdtCelular.Text:= qrychama_pedidoCelular.AsString;

    FrmPedido.MMOObservacao.Text:= qrychama_pedidoObservacao.AsString;

    FrmPedido.EdtQuantidade_Itens.Text:= qrychama_pedidoQuantidade_Itens.AsString;

    FrmPedido.EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', qrychama_pedidoTotal_Pedido.AsFloat);
    FrmPedido.EdtTotal_Pedido.Text:= StringReplace(FrmPedido.EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmPedido.EdtTaxa_Entrega.Text:= FormatFloat('#0.0,0', qrychama_pedidoTaxa_Entrega.AsFloat);
    FrmPedido.EdtTaxa_Entrega.Text:= StringReplace(FrmPedido.EdtTaxa_Entrega.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmPedido.EdtDesconto_Total.Text:= FormatFloat('#0.0,0', qrychama_pedidoDesconto.AsFloat);
    FrmPedido.EdtDesconto_Total.Text:= StringReplace(FrmPedido.EdtDesconto_Total.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmPedido.EdtAcrescimo.Text:= FormatFloat('#0.0,0', qrychama_pedidoAcrescimo.AsFloat);
    FrmPedido.EdtAcrescimo.Text:= StringReplace(FrmPedido.EdtAcrescimo.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmPedido.EdtValor_Pagar.Text:= FormatFloat('#0.0,0', qrychama_pedidoValor_Pagar.AsFloat);
    FrmPedido.EdtValor_Pagar.Text:= StringReplace(FrmPedido.EdtValor_Pagar.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmPedido.EdtValor_Recebido.Text:= FormatFloat('#0.0,0', qrychama_pedidoValor_Recebido.AsFloat);
    FrmPedido.EdtValor_Recebido.Text:= StringReplace(FrmPedido.EdtValor_Recebido.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmPedido.EdtTroco.Text:= FormatFloat('#0.0,0', qrychama_pedidoTroco.AsFloat);
    FrmPedido.EdtTroco.Text:= StringReplace(FrmPedido.EdtTroco.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmPedido.prazo:= qrychama_pedidoPrazo.AsInteger;
    FrmPedido.parcela:= qrychama_pedidoParcela.AsInteger;
    FrmPedido.tipo_pagamento:= qrychama_pedidoTipo_Pagamento.AsString;

    FrmPedido.Atualiza_Dados;
    FrmChama_Pedido.Close;

    FrmPedido.BBtnSalvar.Enabled:= true;
    FrmPedido.BBtnExcluir.Enabled:= true;
    FrmPedido.BBtnPesquisar.Enabled:= true;
    FrmPedido.BBtnCancelar.Enabled:= true;
    FrmPedido.BBtnImprimir.Enabled:= true;
    Util.Habilita_Campos(FrmPedido);
    FrmPedido.achei:= true;
  end
end;

procedure TFrmChama_Pedido.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Pedido.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Pedido.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Pedido;
end;

procedure TFrmChama_Pedido.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Pedido.Release;
end;

procedure TFrmChama_Pedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
