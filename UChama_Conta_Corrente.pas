unit UChama_Conta_Corrente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Conta_Corrente = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_conta: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_contaCodigo_Conta_Corrente: TIntegerField;
    qrychama_contaConta_Corrente: TStringField;
    qrychama_contaCodigo_Agencia: TIntegerField;
    qrychama_contaNome_Correntista: TStringField;
    qrychama_contaSaldo_Inicial: TFloatField;
    qrychama_contaLimite: TFloatField;
    qrychama_contaSaldo_Atual: TFloatField;
    qrychama_contaData_Cadastro: TDateTimeField;
    qrychama_contaAgencia: TStringField;
    qrychama_contaBanco: TStringField;
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
  FrmChama_Conta_Corrente: TFrmChama_Conta_Corrente;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Cheque, UCadastro_Conta_Corrente, UConsulta_Cheque,
  ULancamento_Banco, UConsulta_Saldo_Bancario, UBaixar_Titulo,
  UConsulta_Extrato_Bancario;

{$R *.dfm}

procedure TFrmChama_Conta_Corrente.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Conta_Corrente.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Conta_Corrente <> NIl) and (FrmCadastro_Conta_Corrente.ativo = true) then
  begin
    FrmCadastro_Conta_Corrente.EdtCodigo.Text:= qrychama_contaCodigo_Conta_Corrente.AsString;
    FrmCadastro_Conta_Corrente.MEdtData_Cadastro.Text:= qrychama_contaData_Cadastro.AsString;
    FrmCadastro_Conta_Corrente.EdtConta_Corrente.Text:= qrychama_contaConta_Corrente.AsString;
    FrmCadastro_Conta_Corrente.EdtNome_Correntista.Text:= qrychama_contaNome_Correntista.AsString;
    FrmCadastro_Conta_Corrente.EdtCodigo_Agencia.Text:= qrychama_contaCodigo_Agencia.AsString;
    FrmCadastro_Conta_Corrente.EdtAgencia.Text:= qrychama_contaAgencia.AsString;
    FrmCadastro_Conta_Corrente.EdtBanco.Text:= qrychama_contaBanco.AsString;

    FrmCadastro_Conta_Corrente.EdtSaldo_Inicial.Text:= FormatFloat('#0.0,0', qrychama_contaSaldo_Inicial.AsFloat);
    FrmCadastro_Conta_Corrente.EdtSaldo_Inicial.Text:= StringReplace(FrmCadastro_Conta_Corrente.EdtSaldo_Inicial.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Conta_Corrente.EdtSaldo_Atual.Text:= FormatFloat('#0.0,0', qrychama_contaSaldo_Atual.AsFloat);
    FrmCadastro_Conta_Corrente.EdtSaldo_Atual.Text:= StringReplace(FrmCadastro_Conta_Corrente.EdtSaldo_Atual.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Conta_Corrente.EdtLimite.Text:= FormatFloat('#0.0,0', qrychama_contaLimite.AsFloat);
    FrmCadastro_Conta_Corrente.EdtLimite.Text:= StringReplace(FrmCadastro_Conta_Corrente.EdtLimite.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmChama_Conta_Corrente.Close;

    FrmCadastro_Conta_Corrente.BBtnSalvar.Enabled:= true;
    FrmCadastro_Conta_Corrente.BBtnExcluir.Enabled:= true;
    FrmCadastro_Conta_Corrente.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Conta_Corrente.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Conta_Corrente);
    FrmCadastro_Conta_Corrente.achei:= true;
  end
  else if (FrmCadastro_Cheque <> NIl) and (FrmCadastro_Cheque.ativo = true) then
  begin
    FrmCadastro_Cheque.EdtCodigo_Conta.Text:= qrychama_contaCodigo_Conta_Corrente.AsString;
    FrmCadastro_Cheque.EdtConta.Text:= qrychama_contaConta_Corrente.AsString;
    FrmChama_Conta_Corrente.Close;
  end
  else if (FrmConsulta_Cheque <> NIl) and (FrmConsulta_Cheque.ativo = true) then
  begin
    FrmConsulta_Cheque.EdtCodigo_Conta.Text:= qrychama_contaCodigo_Conta_Corrente.AsString;
    FrmConsulta_Cheque.EdtConta.Text:= qrychama_contaConta_Corrente.AsString;
    FrmChama_Conta_Corrente.Close;
  end
  else if (FrmLancamento_Banco <> NIl) and (FrmLancamento_Banco.ativo = true) and (FrmLancamento_Banco.transferencia = 0) then
  begin
    FrmLancamento_Banco.EdtCodigo_Conta.Text:= qrychama_contaCodigo_Conta_Corrente.AsString;
    FrmLancamento_Banco.EdtConta.Text:= qrychama_contaConta_Corrente.AsString;
    FrmLancamento_Banco.EdtSaldo_Atual.Text:= qrychama_contaSaldo_Atual.AsString;
    FrmChama_Conta_Corrente.Close;
  end
  else if (FrmLancamento_Banco <> NIl) and (FrmLancamento_Banco.ativo = true) and (FrmLancamento_Banco.transferencia = 1) then
  begin
    FrmLancamento_Banco.EdtCodigo_Conta_Destino.Text:= qrychama_contaCodigo_Conta_Corrente.AsString;
    FrmLancamento_Banco.EdtConta_Destino.Text:= qrychama_contaConta_Corrente.AsString;
    FrmLancamento_Banco.EdtSaldo_Atual_Destino.Text:= qrychama_contaSaldo_Atual.AsString;
    FrmChama_Conta_Corrente.Close;
  end
  else if (FrmConsulta_Saldo_Bancario <> NIl) and (FrmConsulta_Saldo_Bancario.ativo = true) then
  begin
    FrmConsulta_Saldo_Bancario.EdtCodigo_Conta.Text:= qrychama_contaCodigo_Conta_Corrente.AsString;
    FrmConsulta_Saldo_Bancario.EdtConsulta.Text:= qrychama_contaConta_Corrente.AsString;
    FrmChama_Conta_Corrente.Close;
  end
  else if (FrmBaixar_Titulo <> NIl) and (FrmBaixar_Titulo.ativo = true) then
  begin
    FrmBaixar_Titulo.EdtCodigo_Conta.Text:= qrychama_contaCodigo_Conta_Corrente.AsString;
    FrmBaixar_Titulo.EdtConta.Text:= qrychama_contaConta_Corrente.AsString;
    Util.FormataFloat(2, FrmBaixar_Titulo.EdtSaldo_Atual, qrychama_contaSaldo_Atual.AsFloat);
    FrmChama_Conta_Corrente.Close;
  end
  else if (FrmConsulta_Extrato_Bancario <> NIl) and (FrmConsulta_Extrato_Bancario.ativo = true) then
  begin
    FrmConsulta_Extrato_Bancario.EdtCodigo_Conta.Text:= qrychama_contaCodigo_Conta_Corrente.AsString;
    FrmConsulta_Extrato_Bancario.EdtConsulta.Text:= qrychama_contaConta_Corrente.AsString;
    FrmChama_Conta_Corrente.Close;
  end
end;

procedure TFrmChama_Conta_Corrente.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Conta_Corrente.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Conta_Corrente.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Conta_Corrente;
end;

procedure TFrmChama_Conta_Corrente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Conta_Corrente.Release;
end;

procedure TFrmChama_Conta_Corrente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Conta_Corrente.FormShow(Sender: TObject);
begin
  qrychama_conta.Close;
  qrychama_conta.Open;
end;

end.
