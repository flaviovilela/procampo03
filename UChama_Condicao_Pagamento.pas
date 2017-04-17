unit UChama_Condicao_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, DBClient, Provider, UUtilitarios;

type
  TFrmChama_Condicao_Pagamento = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ImgImagens: TImageList;
    LblMarca: TLabel;
    qrychama_condicao: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_condicaoCodigo: TIntegerField;
    qrychama_condicaoStatus: TStringField;
    qrychama_condicaoDescricao: TStringField;
    qrychama_condicaoParcela: TIntegerField;
    qrychama_condicaoPrazo: TIntegerField;
    qrychama_condicaoTaxa: TFloatField;
    qrychama_condicaoTipo_Pagamento: TStringField;
    qrychama_condicaoData_Cadastro: TDateTimeField;
    qrychama_condicaoTipo_Juro: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtConsultaChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Condicao_Pagamento: TFrmChama_Condicao_Pagamento;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Condicao_Pagamento, URetorno_Cotacao, UCompra,
  ULancamento_Financeiro, UConsulta_Lancamentos_Financeiros, UAbertura,
  UAbertura_Caixa;

{$R *.dfm}

procedure TFrmChama_Condicao_Pagamento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Condicao_Pagamento.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Condicao_Pagamento <> Nil) and (FrmCadastro_Condicao_Pagamento.ativo = true) then
  begin
    FrmCadastro_Condicao_Pagamento.EdtCodigo.Text:= qrychama_condicaoCodigo.AsString;
    FrmCadastro_Condicao_Pagamento.EdtDescricao.Text:= qrychama_condicaoDescricao.AsString;
    FrmCadastro_Condicao_Pagamento.EdtParcela.Text:= qrychama_condicaoParcela.AsString;
    FrmCadastro_Condicao_Pagamento.EdtPrazo.Text:= qrychama_condicaoPrazo.AsString;
    FrmCadastro_Condicao_Pagamento.EdtTaxa_Juros.Text:= qrychama_condicaoTaxa.AsString;

    if (qrychama_condicaoStatus.AsString = 'ATIVO') then
      FrmCadastro_Condicao_Pagamento.CBStatus.Checked:= true
    else if (qrychama_condicaoStatus.AsString = 'INATIVO') then
      FrmCadastro_Condicao_Pagamento.CBStatus.Checked:= true;

    if (qrychama_condicaoTipo_Pagamento.AsString = 'A VISTA') then
      FrmCadastro_Condicao_Pagamento.RBA_Vista.Checked:= true
    else if (qrychama_condicaoTipo_Pagamento.AsString = 'A PRAZO') then
      FrmCadastro_Condicao_Pagamento.RBA_PRazo.Checked:= true;

    if (qrychama_condicaoTipo_Juro.AsString = 'S') then
      FrmCadastro_Condicao_Pagamento.RGTipo_Juro.ItemIndex := 0
    else if (qrychama_condicaoTipo_Juro.AsString = 'C') then
      FrmCadastro_Condicao_Pagamento.RGTipo_Juro.ItemIndex:= 1;

    FrmCadastro_Condicao_Pagamento.MEdtData_Cadastro.Text:= qrychama_condicaoData_Cadastro.AsString;
    FrmChama_Condicao_Pagamento.Close;
    FrmCadastro_Condicao_Pagamento.BBtnSalvar.Enabled:= true;
    FrmCadastro_Condicao_Pagamento.BBtnExcluir.Enabled:= true;
    FrmCadastro_Condicao_Pagamento.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Condicao_Pagamento.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Condicao_Pagamento);
    FrmCadastro_Condicao_Pagamento.achei:= true;
  end
  else if (FrmRetorno_Cotacao <> nIl) and (FrmRetorno_Cotacao.ativo) then
  begin
    FrmRetorno_Cotacao.EdtCodigo_Condicao_Pagamento.Text:= qrychama_condicaoCodigo.AsString;
    FrmRetorno_Cotacao.EdtCondicao_Pagamento.Text:= qrychama_condicaoDescricao.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end
  else if (FrmCompra <> nIl) and (FrmCompra.ativo) then
  begin
    FrmCompra.EdtCodigo_Condicao_Pagamento.Text:= qrychama_condicaoCodigo.AsString;
    FrmCompra.EdtCondicao_Pagamento.Text:= qrychama_condicaoDescricao.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end
  else if (FrmLancamento_Financeiro <> nIl) and (frmLancamento_Financeiro.ativo) then
  begin
    FrmLancamento_Financeiro.EdtCodigo_Condicao_Pagamento.Text:= qrychama_condicaoCodigo.AsString;
    FrmLancamento_Financeiro.EdtCondicao_Pagamento.Text:= qrychama_condicaoDescricao.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> nIl) and (FrmConsulta_Lancamentos_Financeiros.ativo) then
  begin
    FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text:= qrychama_condicaoCodigo.AsString;
    FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text:= qrychama_condicaoDescricao.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end
  else if (FrmAbertura_Caixa <> nIl) and (FrmAbertura_Caixa.ativo) then
  begin
    FrmAbertura_Caixa.EdtCodigo_Forma_Pagamento.Text:= qrychama_condicaoCodigo.AsString;
    FrmAbertura_Caixa.EdtForma_Pagamento.Text:= qrychama_condicaoDescricao.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end
  {else if (FrmOS <> nIl) and (FrmOS.ativo) then
  begin
    FrmOS.EdtCodigo_Condicao_Pagamento.Text:= qrychama_condicaoCodigo.AsString;
    FrmOS.EdtCondicao_Pagamento.Text:= qrychama_condicaoDescricao.AsString;
    FrmOS.parcela:= qrychama_condicaoParcela.AsInteger;
    FrmOS.prazo:= qrychama_condicaoPrazo.AsInteger;
    FrmOS.tipo_pagamento:= qrychama_condicaoTipo_Pagamento.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end; }
end;

procedure TFrmChama_Condicao_Pagamento.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Condicao_Pagamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Condicao_Pagamento.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Condicao_Pagamento;
end;

procedure TFrmChama_Condicao_Pagamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Condicao_Pagamento.Release;
end;

procedure TFrmChama_Condicao_Pagamento.FormCreate(Sender: TObject);
begin
  qrychama_condicao.Close;
  qrychama_condicao.Open;
end;

procedure TFrmChama_Condicao_Pagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
