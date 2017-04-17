unit UChama_OS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_OS = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_os: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_osCodigo: TIntegerField;
    qrychama_osN_Pedido: TStringField;
    qrychama_osData_Cadastro: TDateTimeField;
    qrychama_osData_Previsao_Entrega: TDateTimeField;
    qrychama_osHora_Previsao_Entrega: TStringField;
    qrychama_osDescricao_PC: TStringField;
    qrychama_osObservacao: TStringField;
    qrychama_osCodigo_Cliente: TIntegerField;
    qrychama_osCliente: TStringField;
    qrychama_osTelefone: TStringField;
    qrychama_osNumero: TStringField;
    qrychama_osComplemento: TStringField;
    qrychama_osLogradouro: TStringField;
    qrychama_osSetor: TStringField;
    qrychama_osCidade: TStringField;
    qrychama_osQtde_Itens: TIntegerField;
    qrychama_osTotal_Pedido: TFloatField;
    qrychama_osDesconto: TFloatField;
    qrychama_osAcrescimo: TFloatField;
    qrychama_osValor_Pagar: TFloatField;
    qrychama_osCelular: TStringField;
    qrychama_osStatus: TStringField;
    qrychama_osCodigo_Condicao_Pagamento: TIntegerField;
    qrychama_osCondicao_Pagamento: TStringField;
    qrychama_osParcela: TIntegerField;
    qrychama_osPrazo: TIntegerField;
    qrychama_osTipo_Pagamento: TStringField;
    qrychama_osValor_Recebido: TFloatField;
    qrychama_osTroco: TFloatField;
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
  FrmChama_OS: TFrmChama_OS;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UOS;

{$R *.dfm}

procedure TFrmChama_OS.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_OS.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmOS <> NIl) and (FrmOS.ativo = true) then
  begin
    FrmOS.EdtCodigo.Text:= qrychama_osCodigo.AsString;
    FrmOS.EdtN_Pedido.Text:= qrychama_osN_Pedido.AsString;
    FrmOS.MEdtData_Cadastro.Text:= qrychama_osData_Cadastro.AsString;
    FrmOS.MEdtData_Previsao_Entrega.Text:= qrychama_osData_Previsao_Entrega.AsString;
    FrmOS.MEdtHora.Text:= qrychama_osHora_Previsao_Entrega.AsString;

    FrmOS.MMODescricao_PC.Text:= qrychama_osDescricao_PC.AsString;
    FrmOS.MMOObservacao.Text:= qrychama_osObservacao.AsString;
    FrmOS.EdtCodigo_Cliente.Text:= qrychama_osCodigo_Cliente.AsString;
    FrmOS.EdtCliente.Text:= qrychama_osCliente.AsString;

    FrmOS.EdtCodigo_Condicao_Pagamento.Text:= qrychama_osCodigo_Condicao_Pagamento.AsString;
    FrmOS.EdtCondicao_Pagamento.Text:= qrychama_osCondicao_Pagamento.AsString;

    FrmOS.EdtQuantidade_Itens.Text:= qrychama_osQtde_Itens.AsString;

    FrmOS.EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', qrychama_osTotal_Pedido.AsFloat);
    FrmOS.EdtTotal_Pedido.Text:= StringReplace(FrmOS.EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmOS.EdtDesconto_Total.Text:= FormatFloat('#0.0,0', qrychama_osDesconto.AsFloat);
    FrmOS.EdtDesconto_Total.Text:= StringReplace(FrmOS.EdtDesconto_Total.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmOS.EdtAcrescimo.Text:= FormatFloat('#0.0,0', qrychama_osAcrescimo.AsFloat);
    FrmOS.EdtAcrescimo.Text:= StringReplace(FrmOS.EdtAcrescimo.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmOS.EdtValor_Pagar.Text:= FormatFloat('#0.0,0', qrychama_osValor_Pagar.AsFloat);
    FrmOS.EdtValor_Pagar.Text:= StringReplace(FrmOS.EdtValor_Pagar.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmOS.EdtValor_Recebido.Text:= FormatFloat('#0.0,0', qrychama_osValor_Recebido.AsFloat);
    FrmOS.EdtValor_Recebido.Text:= StringReplace(FrmOS.EdtValor_Recebido.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmOS.EdtTroco.Text:= FormatFloat('#0.0,0', qrychama_osTroco.AsFloat);
    FrmOS.EdtTroco.Text:= StringReplace(FrmOS.EdtTroco.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmOS.EdtDinheiro.Text:= '0,00';
    FrmOS.EdtCheque_a_Vista.Text:= '0,00';
    FrmOS.EdtCheque_a_Prazo.Text:= '0,00';

    FrmOS.endereco:= qrychama_osLogradouro.AsString;
    FrmOS.numero:= qrychama_osNumero.AsString;
    FrmOS.complemento:= qrychama_osComplemento.AsString;
    FrmOS.setor:= qrychama_osSetor.AsString;
    FrmOS.cidade:= qrychama_osCidade.AsString;
    FrmOS.telefone:= qrychama_osTelefone.AsString;
    FrmOS.celular:= qrychama_osCelular.AsString;
    FrmOS.status:= qrychama_osStatus.AsString;

    FrmOS.parcela:= qrychama_osParcela.AsInteger;
    FrmOS.prazo:= qrychama_osPrazo.AsInteger;
    FrmOS.tipo_pagamento:= qrychama_osTipo_Pagamento.AsString;

    if (qrychama_osStatus.AsString = 'PAGO') then
      FrmOS.CBFechar_Caixa.Checked:= true
    else
      FrmOS.CBFechar_Caixa.Checked:= false;

    FrmChama_OS.Close;

    FrmOS.BBtnSalvar.Enabled:= true;
    FrmOS.BBtnExcluir.Enabled:= true;
    FrmOS.BBtnPesquisar.Enabled:= true;
    FrmOS.BBtnCancelar.Enabled:= true;
    FrmOS.BBtnImprimir.Enabled:= true;
    Util.Habilita_Campos(FrmOS);
    FrmOS.Atualiza_Dados;
    FrmOS.achei:= true;
  end;
end;

procedure TFrmChama_OS.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_OS.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_OS.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_OS;
end;

procedure TFrmChama_OS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_OS.Release;
end;

procedure TFrmChama_OS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f4) then
  begin
    if (RGConsulta_Por.ItemIndex = 0) then
      RGConsulta_Por.ItemIndex:= 1
    else if (RGConsulta_Por.ItemIndex = 1) then
      RGConsulta_Por.ItemIndex:= 0;
  end;
end;

procedure TFrmChama_OS.FormShow(Sender: TObject);
begin
  qrychama_os.Close;
  qrychama_os.Open;
end;

end.
