unit UBaixar_Cheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, ComCtrls, ToolWin, ImgList, URegistro,
  DB, ADODB, UUtilitarios;

type
  TFrmBaixar_Cheque = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    RGDados: TGroupBox;
    LblNumero_Cheque: TLabel;
    LblValor: TLabel;
    LblData_Saida: TLabel;
    LblData_Entrada: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    EdtCodigo_Cheque: TEdit;
    EdtValor: TEdit;
    MEdtData_Saida: TMaskEdit;
    MEdtData_Entrada: TMaskEdit;
    EdtEnviado_A: TEdit;
    MmoObservacoes: TMemo;
    EdtCheque: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure MmoObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_ChequeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ChequeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_SaidaEnter(Sender: TObject);
    procedure EdtChequeKeyPress(Sender: TObject; var Key: Char);
  private
    Util: UUtilitarios.TUtil;
    Movimento_Caixa: URegistro.TMovimento_Caixa;
    Fechamento: URegistro.TFechamento_Caixa;
    procedure Atualiza_Cheque;
    { Private declarations }
  public
    ativo: boolean;
  protected
    function Confira: boolean;
    { Public declarations }
  end;

var
  FrmBaixar_Cheque: TFrmBaixar_Cheque;

implementation

uses UDM, UChama_Cheque;

{$R *.dfm}

procedure TFrmBaixar_Cheque.Atualiza_Cheque;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Cadastro_Cheque set Enviado_A = :Enviado, Data_Saida = :Data_Saida, Status = :Status');
      add('where Codigo_Cheque = :Numero');
      Parameters.ParamByName('Enviado').Value:= EdtEnviado_A.Text;
      Parameters.ParamByName('Data_Saida').Value:= StrToDateTime(MEdtData_Saida.Text);
      Parameters.ParamByName('Status').Value:= 'BAIXADO';
      Parameters.ParamByName('Numero').Value:= StrToInt(EdtCodigo_Cheque.Text);
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmBaixar_Cheque.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmBaixar_Cheque.BBtnSalvarClick(Sender: TObject);
begin
  if (Confira = true) then
    begin
      Atualiza_Cheque;
      Mensagem.Confirma_Insercao;
      BBtnSalvar.Enabled:= false;
      RGDados.Enabled:= false;
    end;
end;

function TFrmBaixar_Cheque.Confira: boolean;
begin
  Confira:= false;
  if EdtCodigo_Cheque.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtCodigo_Cheque.SetFocus;
      abort;
    end;

  if (MEdtData_Saida.Text = '  /  /    ') then
    begin
      Mensagem.Mensagem_Falta_Dados;
      MEdtData_Saida.SetFocus;
      abort;
    end;

    Confira:= true;
end;

procedure TFrmBaixar_Cheque.EdtChequeKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Cheque.EdtCodigo_ChequeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cheque, FrmChama_Cheque);
    FrmChama_Cheque.ShowModal;
    FrmChama_Cheque.Free;
  end;
end;

procedure TFrmBaixar_Cheque.EdtCodigo_ChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Cheque.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Cheque.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmBaixar_Cheque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmBaixar_Cheque.Free;
  FrmBaixar_Cheque:= nil;
end;

procedure TFrmBaixar_Cheque.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmBaixar_Cheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    RGDados.Enabled:= true;
    BBtnSalvar.Enabled:= true;
  end;
end;

procedure TFrmBaixar_Cheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmBaixar_Cheque.MEdtData_SaidaEnter(Sender: TObject);
begin
  MEdtData_Saida.Text:= DateToStr(date);
end;

procedure TFrmBaixar_Cheque.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

end.
