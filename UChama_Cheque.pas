unit UChama_Cheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Cheque = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_cheque: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_chequeCodigo_Cheque: TIntegerField;
    qrychama_chequeCodigo_Empresa: TIntegerField;
    qrychama_chequeEmitente: TStringField;
    qrychama_chequeRecebido_De: TStringField;
    qrychama_chequeEnviado_A: TStringField;
    qrychama_chequeCodigo_Agencia: TIntegerField;
    qrychama_chequeCodigo_Conta: TIntegerField;
    qrychama_chequeTipo_Cheque: TStringField;
    qrychama_chequeSituacao_Cheque: TStringField;
    qrychama_chequeNumero_Cheque: TStringField;
    qrychama_chequeValor: TFloatField;
    qrychama_chequeJuro: TFloatField;
    qrychama_chequeValor_Final: TFloatField;
    qrychama_chequeData_Entrada: TDateTimeField;
    qrychama_chequeData_Vencimento: TDateTimeField;
    qrychama_chequeData_Saida: TDateTimeField;
    qrychama_chequeObservacoes: TStringField;
    qrychama_chequeStatus: TStringField;
    qrychama_chequeNumero: TStringField;
    qrychama_chequeBanco: TStringField;
    qrychama_chequeConta_Corrente: TStringField;
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
  FrmChama_Cheque: TFrmChama_Cheque;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Cheque, UBaixar_Cheque, UBaixar_Titulo, ULancamento_Banco;

{$R *.dfm}

procedure TFrmChama_Cheque.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Cheque.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Cheque <> NIl) and (FrmCadastro_Cheque.ativo = true) then
  begin
    FrmCadastro_Cheque.EdtCodigo.Text:= qrychama_chequeCodigo_Cheque.AsString;
    FrmCadastro_Cheque.EdtEmitente.Text:= qrychama_chequeEmitente.AsString;
    FrmCadastro_Cheque.EdtRecebido_De.Text:= qrychama_chequeRecebido_De.AsString;
    FrmCadastro_Cheque.EdtEnviado_A.Text:= qrychama_chequeEnviado_A.AsString;

    if (qrychama_chequeSituacao_Cheque.AsString = 'EMITIDO') then
      FrmCadastro_Cheque.RadioGroup1.ItemIndex:= 0
    else
      FrmCadastro_Cheque.RadioGroup1.ItemIndex:= 1;

    if (qrychama_chequeStatus.AsString = 'LANÇADO') then
      FrmCadastro_Cheque.RGStatus.ItemIndex:= 0
    else if (qrychama_chequeStatus.AsString = 'PRORROGADO') then
      FrmCadastro_Cheque.RGStatus.ItemIndex:= 1
    else if (qrychama_chequeStatus.AsString = 'DEVOLVIDO') then
      FrmCadastro_Cheque.RGStatus.ItemIndex:= 2;

    FrmCadastro_Cheque.EdtCodigo_Agencia.Text:= qrychama_chequeCodigo_Agencia.AsString;
    FrmCadastro_Cheque.EdtAgencia.Text:= qrychama_chequeNumero.AsString;
    FrmCadastro_Cheque.EdtBanco.Text:= qrychama_chequeBanco.AsString;
    FrmCadastro_Cheque.EdtCodigo_Conta.Text:= qrychama_chequeCodigo_Conta.AsString;
    FrmCadastro_Cheque.EdtConta.Text:= qrychama_chequeConta_Corrente.AsString;

    if (qrychama_chequeTipo_Cheque.AsString = 'A VISTA') then
      FrmCadastro_Cheque.RGTipo.ItemIndex:= 0
    else
      FrmCadastro_Cheque.RGTipo.ItemIndex:= 1;

    FrmCadastro_Cheque.MEdtData_Cadastro.Text:= qrychama_chequeData_Entrada.AsString;
    FrmCadastro_Cheque.MEdtData_Vencimento.Text:= qrychama_chequeData_Vencimento.AsString;
    FrmCadastro_Cheque.MEdtData_Saida.Text:= qrychama_chequeData_Saida.AsString;
    FrmCadastro_Cheque.EdtN_Cheque.Text:= qrychama_chequeNumero_Cheque.AsString;

    FrmCadastro_Cheque.EdtValor.Text:= FormatFloat('#0.0,0', qrychama_chequeValor.AsFloat);
    FrmCadastro_Cheque.EdtValor.Text:= StringReplace(FrmCadastro_Cheque.EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Cheque.EdtValor_Final.Text:= FormatFloat('#0.0,0', qrychama_chequeValor_Final.AsFloat);
    FrmCadastro_Cheque.EdtValor_Final.Text:= StringReplace(FrmCadastro_Cheque.EdtValor_Final.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Cheque.EdtJuro.Text:= FormatFloat('#0.0,0', qrychama_chequeJuro.AsFloat);
    FrmCadastro_Cheque.EdtJuro.Text:= StringReplace(FrmCadastro_Cheque.EdtJuro.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Cheque.MmoObservacoes.Text:= qrychama_chequeObservacoes.AsString;

    FrmChama_Cheque.Close;

    FrmCadastro_Cheque.BBtnSalvar.Enabled:= true;
    FrmCadastro_Cheque.BBtnExcluir.Enabled:= true;
    FrmCadastro_Cheque.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Cheque.BBtnCancelar.Enabled:= true;
    FrmCadastro_Cheque.BBtnProrrogar.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Cheque);
    FrmCadastro_Cheque.achei:= true;
    if (Application.MessageBox('Deseja prorrogar o vencimento desse cheque?', 'FAV Sistemas', MB_YESNO+MB_ICONQUESTION)) =idyes then
    begin
      FrmCadastro_Cheque.pror:= true;
      FrmCadastro_Cheque.data_venc:= qrychama_chequeData_Vencimento.AsDateTime;
      FrmCadastro_Cheque.BBtnSalvar.Enabled:= false;
      FrmCadastro_Cheque.BBtnProrrogar.Enabled:= true;
    end;
  end
  else if (FrmBaixar_Cheque <> nil) and (FrmBaixar_Cheque.ativo) then
  begin
    FrmBaixar_Cheque.EdtCodigo_Cheque.Text:= qrychama_chequeCodigo_Cheque.AsString;
    FrmBaixar_Cheque.EdtCheque.Text:= qrychama_chequeNumero_Cheque.AsString;
    FrmBaixar_Cheque.EdtValor.Text:= FormatFloat('#0.0,0', qrychama_chequeValor.AsFloat);
    FrmBaixar_Cheque.EdtValor.Text:= StringReplace(FrmBaixar_Cheque.EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);
    FrmBaixar_Cheque.EdtEnviado_A.Text:= qrychama_chequeEnviado_A.Asstring;
    FrmBaixar_Cheque.MEdtData_Entrada.Text:= qrychama_chequeData_Entrada.Asstring;
    FrmChama_Cheque.Close;
  end
  else if (FrmBaixar_Titulo <> nil) and (FrmBaixar_Titulo.ativo) then
  begin
    FrmBaixar_Titulo.EdtCodigo_Cheque.Text:= qrychama_chequeCodigo_Cheque.AsString;
    FrmBaixar_Titulo.EdtCheque.Text:= qrychama_chequeNumero_Cheque.AsString;
    FrmChama_Cheque.Close;
  end
  else if (FrmLancamento_Banco <> nil) and (FrmLancamento_Banco.ativo) then
  begin
    FrmLancamento_Banco.EdtCodigo_Cheque.Text:= qrychama_chequeCodigo_Cheque.AsString;
    FrmLancamento_Banco.EdtCheque.Text:= qrychama_chequeNumero_Cheque.AsString;
    FrmLancamento_Banco.EdtValor.Text:= FormatFloat('#0.0,0', qrychama_chequeValor.AsFloat);
    FrmLancamento_Banco.EdtValor.Text:= StringReplace(FrmLancamento_Banco.EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);
    FrmChama_Cheque.Close;
  end;
end;

procedure TFrmChama_Cheque.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Cheque.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Cheque.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Cheque;
end;

procedure TFrmChama_Cheque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Cheque.Release;
end;

procedure TFrmChama_Cheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Cheque.FormShow(Sender: TObject);
begin
  qrychama_cheque.Close;
  qrychama_cheque.Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
  qrychama_cheque.Open;
end;

end.
