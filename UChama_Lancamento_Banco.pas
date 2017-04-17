unit UChama_Lancamento_Banco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, uUtilitarios,
  ADODB, UConsulta;

type
  TFrmChama_Lancamento_Banco = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_lancamento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_lancamentoCodigo: TAutoIncField;
    qrychama_lancamentoCodigo_Empresa: TIntegerField;
    qrychama_lancamentoN_Documento: TIntegerField;
    qrychama_lancamentoData_Lancamento: TDateTimeField;
    qrychama_lancamentoCodigo_Conta: TIntegerField;
    qrychama_lancamentoCodigo_Operacao: TIntegerField;
    qrychama_lancamentoCodigo_Plano: TIntegerField;
    qrychama_lancamentoDescricao: TStringField;
    qrychama_lancamentoValor: TFloatField;
    qrychama_lancamentoStatus: TStringField;
    qrychama_lancamentoConta_Corrente: TStringField;
    qrychama_lancamentoOperacao: TStringField;
    qrychama_lancamentoTipo: TStringField;
    qrychama_lancamentoCodigo_Cheque: TIntegerField;
    qrychama_lancamentoSaldo_Anterior: TFloatField;
    qrychama_lancamentoSaldo_Atual: TFloatField;
    qrychama_lancamentoDescricao_1: TStringField;
    qrychama_lancamentoCodigo_Conta_Transferencia: TIntegerField;
    qrychama_lancamentoSaldo_Anterior_Transferencia: TFloatField;
    qrychama_lancamentoSaldo_Atual_Transferencia: TFloatField;
    qrychama_lancamentoConta_Corrente_Transferencia: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Lancamento_Banco: TFrmChama_Lancamento_Banco;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, ULancamento_Banco, ULancamento_Financeiro, UBaixar_Titulo,
  UConsulta_Lancamentos_Financeiros;

{$R *.dfm}

procedure TFrmChama_Lancamento_Banco.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Lancamento_Banco.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmLancamento_Banco <> Nil) and (FrmLancamento_Banco.ativo = true) then
  begin
    FrmLancamento_Banco.EdtCodigo.Text:= qrychama_lancamentoCodigo.AsString;
    if (qrychama_lancamentoStatus.AsString = 'BLOQUEADO') then
      FrmLancamento_Banco.RGStatus.ItemIndex:= 0
    else
      FrmLancamento_Banco.RGStatus.ItemIndex:= 1;

    FrmLancamento_Banco.EdtDocumento.Text:= qrychama_lancamentoN_Documento.AsString;
    FrmLancamento_Banco.MEdtData_Lancamento.Text:= qrychama_lancamentoData_Lancamento.AsString;
    FrmLancamento_Banco.EdtCodigo_Conta.Text:= qrychama_lancamentoCodigo_Conta.AsString;
    FrmLancamento_Banco.EdtConta.Text:= qrychama_lancamentoConta_Corrente.AsString;
    FrmLancamento_Banco.EdtCodigo_Operacao.Text:= qrychama_lancamentoCodigo_Operacao.AsString;
    FrmLancamento_Banco.EdtOperacao_Bancaria.Text:= qrychama_lancamentoOperacao.AsString;
    FrmLancamento_Banco.EdtTipo_Operacao.Text:= qrychama_lancamentoTipo.AsString;
    FrmLancamento_Banco.EdtDescricao.Text:= qrychama_lancamentoDescricao.AsString;
    FrmLancamento_Banco.EdtValor.Text:= FormatFloat('#0.0,0', qrychama_lancamentoValor.AsFloat);
    FrmLancamento_Banco.EdtValor.Text:= StringReplace(FrmLancamento_Banco.EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);

    Util.FormataFloat(2, FrmLancamento_Banco.EdtSaldo_Atual, qrychama_lancamentoSaldo_Anterior.AsFloat);
    Util.FormataFloat(2, FrmLancamento_Banco.EdtNovo_Saldo, qrychama_lancamentoSaldo_Atual.AsFloat);

    if (qrychama_lancamentoCodigo_Plano.AsString = '0') then
    begin
      FrmLancamento_Banco.EdtCodigo_Plano.Text:= '';
      FrmLancamento_Banco.EdtPlano.Text:= '';
    end
    else
    begin
      FrmLancamento_Banco.EdtCodigo_Plano.Text:= qrychama_lancamentoCodigo_Plano.AsString;
      FrmLancamento_Banco.EdtPlano.Text:= qrychama_lancamentoDescricao_1.AsString;
    end;

    FrmLancamento_Banco.EdtCodigo_Conta_Destino.Text:= qrychama_lancamentoCodigo_Conta_Transferencia.AsString;
    FrmLancamento_Banco.EdtConta_Destino.Text:= qrychama_lancamentoConta_Corrente_Transferencia.AsString;
    Util.FormataFloat(2, FrmLancamento_Banco.EdtSaldo_Atual_Destino, qrychama_lancamentoSaldo_Anterior_Transferencia.AsFloat);
    Util.FormataFloat(2, FrmLancamento_Banco.EdtNovo_Saldo_Destino, qrychama_lancamentoSaldo_Atual_Transferencia.AsFloat);

    if (qrychama_lancamentoCodigo_Conta_Transferencia.AsInteger = 0) then
    begin
      FrmLancamento_Banco.CBTransferencia.Checked:= false;
      FrmLancamento_Banco.Height:= 240;
    end
    else
    begin
      FrmLancamento_Banco.CBTransferencia.Checked:= true;
      FrmLancamento_Banco.Height:= 300;
    end;

    FrmChama_Lancamento_Banco.Close;
    FrmLancamento_Banco.BBtnSalvar.Enabled:= true;
    FrmLancamento_Banco.BBtnExcluir.Enabled:= true;
    FrmLancamento_Banco.BBtnPesquisar.Enabled:= true;
    FrmLancamento_Banco.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmLancamento_Banco);
    FrmLancamento_Banco.achei:= true;
  end
  else if (FrmBaixar_Titulo <> nil) and (FrmBaixar_Titulo.ativo) then
  begin
    FrmBaixar_Titulo.EdtCodigo_Lancamento_Bancario.Text:= qrychama_lancamentoCodigo.AsString;
    FrmBaixar_Titulo.EdtLancamento_Bancario.Text:= qrychama_lancamentoDescricao.AsString;
    Util.FormataFloat(2, FrmBaixar_Titulo.EdtValor_Operacao_Bancaria, qrychama_lancamentoValor.AsFloat);
    FrmChama_Lancamento_Banco.Close;
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) then
  begin
    FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Lancamento_Bancario.Text:= qrychama_lancamentoCodigo.AsString;
    FrmConsulta_Lancamentos_Financeiros.EdtLancamento_Bancario.Text:= 'Nº Doc.: '+qrychama_lancamentoN_Documento.AsString + ' - Histórico: ' + qrychama_lancamentoDescricao.AsString + ' - Valor: '+FormatFloat('#0.0,0', qrychama_lancamentoValor.AsFloat);
    FrmChama_Lancamento_Banco.Close;
  end;
end;

procedure TFrmChama_Lancamento_Banco.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Lancamento_Banco.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Lancamento_Banco.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qrychama_lancamento, Column);
end;

procedure TFrmChama_Lancamento_Banco.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Lancamento_Banco;
end;

procedure TFrmChama_Lancamento_Banco.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Lancamento_Banco;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Lancamento_Banco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Lancamento_Banco.Release;
end;

procedure TFrmChama_Lancamento_Banco.FormCreate(Sender: TObject);
begin
  qrychama_lancamento.Close;
  qrychama_lancamento.Parameters.ParamByName('Empresa').Value:= codigo_empresa;
  qrychama_lancamento.Open;
end;

procedure TFrmChama_Lancamento_Banco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
