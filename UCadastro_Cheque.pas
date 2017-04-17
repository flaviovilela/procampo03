unit UCadastro_Cheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios, DateUtils;

type
  TFrmCadastro_Cheque = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    BBtnPesquisar: TToolButton;
    LblCodigo: TLabel;
    LblEmitente: TLabel;
    LblDono: TLabel;
    Label3: TLabel;
    LblN_Cheque: TLabel;
    LblData_Entrada: TLabel;
    LblData_Vencimento: TLabel;
    Label2: TLabel;
    LblValor: TLabel;
    LblData_Saida: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EdtEmitente: TEdit;
    EdtCodigo: TEdit;
    EdtRecebido_De: TEdit;
    EdtEnviado_A: TEdit;
    EdtN_Cheque: TEdit;
    MEdtData_Cadastro: TMaskEdit;
    MEdtData_Vencimento: TMaskEdit;
    EdtValor: TEdit;
    MEdtData_Saida: TMaskEdit;
    MmoObservacoes: TMemo;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    EdtJuro: TEdit;
    EdtValor_Final: TEdit;
    RGStatus: TRadioGroup;
    Label6: TLabel;
    EdtCodigo_Conta: TEdit;
    EdtConta: TEdit;
    Label7: TLabel;
    EdtCodigo_Agencia: TEdit;
    EdtAgencia: TEdit;
    RGTipo: TRadioGroup;
    EdtBanco: TEdit;
    BBtnProrrogar: TToolButton;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBancoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_BancoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_AgenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_FinalEnter(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtJuroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorExit(Sender: TObject);
    procedure EdtJuroExit(Sender: TObject);
    procedure EdtValor_FinalExit(Sender: TObject);
    procedure MEdtData_VencimentoExit(Sender: TObject);
    procedure BBtnProrrogarClick(Sender: TObject);
    procedure EdtEmitenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtRecebido_DeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtEnviado_AKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_VencimentoEnter(Sender: TObject);
  private
    Util: TUtil;
    Cheque: TCheque;
    Mensagem: TMensagem;
    function Confira: boolean;
    function Confira_Prorroga: boolean;
    procedure Gera_Codigo;
    procedure Escreve_Texto;
    procedure Verifica_Cheque;
    procedure Atualiza_Saldo;
  public
    ativo, enderec, achei, pror: boolean;
    data_venc: TDate;
    cli: integer;
  protected
  end;

var
  FrmCadastro_Cheque: TFrmCadastro_Cheque;
implementation

uses UDM, UChama_Agencia, UChama_Conta_Corrente, UChama_Cheque, UChama_Cliente;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Cheque.Atualiza_Saldo;
begin

end;

procedure TFrmCadastro_Cheque.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Cheque);
  Util.Desabilita_Campos(FrmCadastro_Cheque);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnProrrogar.Enabled:= false;
end;

procedure TFrmCadastro_Cheque.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Cheque.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU CHEQUE N ' + EdtN_Cheque.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnProrrogar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Cheque);
  end;
end;

procedure TFrmCadastro_Cheque.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCadastro_Cheque.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cheque, FrmChama_Cheque);
  FrmChama_Cheque.ShowModal;
  FrmChama_Cheque.Free;
end;

procedure TFrmCadastro_Cheque.BBtnProrrogarClick(Sender: TObject);
begin
  if (Confira_Prorroga = true) then
  begin
    Gera_Codigo;
    try
      Cheque.Inserir;
      Mensagem.Confirma_Insercao;
      Util.Insere_Historico(usuario, 'PRORROGOU CHEQUE N ' + EdtN_Cheque.Text + '.', TimeToStr(time), insercao, date);
    except
      Mensagem.Impossivel_Executar;
    end;
  end
  else
    exit;

  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnProrrogar.Enabled:= false;
  Util.Desabilita_Campos(FrmCadastro_Cheque);
end;

procedure TFrmCadastro_Cheque.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Cheque.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU CHEQUE N ' + EdtN_Cheque.Text + '.', TimeToStr(time), insercao, date);
        except
          Mensagem.Impossivel_Executar;
        end;
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
      try
        Cheque.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU CHEQUE N ' + EdtN_Cheque.Text + '.', TimeToStr(time), alteracao, date);
      except
        Mensagem.Impossivel_Executar;
      end;
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnProrrogar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Cheque);
end;

function TFrmCadastro_Cheque.Confira: boolean;
begin
  Confira:= false;

  Verifica_Cheque;

  if (EdtCodigo_Conta.Text = '') and (RadioGroup1.ItemIndex = 0) then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Conta.SetFocus;
    abort;
  end;

  if (EdtCodigo_Agencia.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Agencia.SetFocus;
    abort;
  end;

  if (EdtN_Cheque.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtN_Cheque.SetFocus;
    abort;
  end;

  if (EdtValor.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor.SetFocus;
    abort;
  end;

  if (EdtValor_Final.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Final.SetFocus;
    abort;
  end;

  if (EdtJuro.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtJuro.SetFocus;
    abort;
  end;

  Confira:= true;
end;

function TFrmCadastro_Cheque.Confira_Prorroga: boolean;
begin
  Confira_Prorroga:= false;

  if (EdtCodigo_Agencia.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Agencia.SetFocus;
    abort;
  end;

  if (EdtN_Cheque.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtN_Cheque.SetFocus;
    abort;
  end;

  if (EdtValor.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor.SetFocus;
    abort;
  end;

  if (EdtValor_Final.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Final.SetFocus;
    abort;
  end;

  if (EdtJuro.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtJuro.SetFocus;
    abort;
  end;

  Confira_Prorroga:= true;
end;

procedure TFrmCadastro_Cheque.EdtAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cheque.EdtBancoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cheque.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cheque.EdtCodigo_AgenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Agencia, FrmChama_Agencia);
    FrmChama_Agencia.ShowModal;
    FrmChama_Agencia.Free;
  end;
end;

procedure TFrmCadastro_Cheque.EdtCodigo_BancoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cheque.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cheque.EdtCodigo_ContaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
    FrmChama_Conta_Corrente.ShowModal;
    FrmChama_Conta_Corrente.Free;
  end;
end;

procedure TFrmCadastro_Cheque.EdtCodigo_ContaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cheque.EdtContaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cheque.EdtEmitenteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    cli:= 1;
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmCadastro_Cheque.EdtEnviado_AKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    cli:= 3;
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmCadastro_Cheque.EdtJuroExit(Sender: TObject);
begin
  if (EdtJuro.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtJuro.SetFocus;
    abort;
  end;
  EdtJuro.Text:= FormatFloat('#0.0,0', StrToFloat(EdtJuro.Text));
  EdtJuro.Text:= StringReplace(EdtJuro.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmCadastro_Cheque.EdtJuroKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Cheque.EdtRecebido_DeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    cli:= 2;
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmCadastro_Cheque.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cheque.EdtValorExit(Sender: TObject);
begin
  if (EdtValor.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor.SetFocus;
    abort;
  end;
  EdtValor.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor.Text));
  EdtValor.Text:= StringReplace(EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmCadastro_Cheque.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Cheque.EdtValor_FinalEnter(Sender: TObject);
var
  tempo: TDate;
  dt_ini, dt_fim: TDate;
  valor, juro, resultado: double;
begin
  if (pror = false) then
  begin
    dt_ini:= StrToDate(MEdtData_Cadastro.Text);
    dt_fim:= StrToDate(MEdtData_Vencimento.Text);
    valor:= StrToFloat(EdtValor.Text);
    juro:= StrToFloat(EdtJuro.Text);
    tempo:= dt_fim - dt_ini + dias_acrecimo;
    resultado:= (juro * tempo * valor) / 3000;
    EdtValor_Final.Text:= FormatFloat('#0.0,0', resultado);
    EdtValor_Final.Text:= StringReplace(EdtValor_Final.Text, ThousandSeparator, '', [rfReplaceAll]);
  end
  else
  begin
    dt_ini:= data_venc;
    dt_fim:= StrToDate(MEdtData_Vencimento.Text);
    valor:= StrToFloat(EdtValor.Text);
    juro:= StrToFloat(EdtJuro.Text);
    tempo:= dt_fim - dt_ini + dias_acrecimo;
    resultado:= (juro * tempo * valor) / 3000;
    EdtValor_Final.Text:= FormatFloat('#0.0,0', resultado);
    EdtValor_Final.Text:= StringReplace(EdtValor_Final.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmCadastro_Cheque.EdtValor_FinalExit(Sender: TObject);
begin
  if (EdtValor_Final.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Final.SetFocus;
    abort;
  end;
  EdtValor_Final.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor_Final.Text));
  EdtValor_Final.Text:= StringReplace(EdtValor_Final.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmCadastro_Cheque.EdtValor_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Cheque.Escreve_Texto;
begin
  EdtValor.Text:= '0,00';
  EdtJuro.Text:= '0';
  EdtValor_Final.Text:= '0,00';
  RGStatus.ItemIndex:= 0;
  RadioGroup1.ItemIndex:= 1;
  RGTipo.ItemIndex:= 1;
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Cheque.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Cheque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Cheque.Free;
        FrmCadastro_Cheque:= Nil;
      end;
end;

procedure TFrmCadastro_Cheque.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Cheque);
  Util.Limpa_Campos(FrmCadastro_Cheque);
  Util.Desabilita_Campos(FrmCadastro_Cheque);
  Escreve_Texto;
end;

procedure TFrmCadastro_Cheque.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Cheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Cheque);
      Util.Limpa_Campos(FrmCadastro_Cheque);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      BBtnProrrogar.Enabled:= false;
      achei:= false;
      pror:= false;
      Escreve_Texto;
      EdtEmitente.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Cheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Cheque.Gera_Codigo;
var
  qAux: TADOQuery;
  codigo: integer;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(Codigo_Cheque) as codigo from Cadastro_Cheque');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Cheque.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Cheque.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Cheque.MEdtData_VencimentoEnter(Sender: TObject);
begin
  MEdtData_Vencimento.Text:= DateToStr(IncDay(StrToDateTime(MEdtData_Cadastro.Text), 2));
end;

procedure TFrmCadastro_Cheque.MEdtData_VencimentoExit(Sender: TObject);
begin
  if (MEdtData_Vencimento.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtData_Vencimento.SetFocus;
    abort;
  end;
end;

procedure TFrmCadastro_Cheque.Verifica_Cheque;
var
  qAux: TADOQuery;
  int: integer;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select CC.Emitente, CC.Status from Cadastro_Cheque CC');
      open;
    end;

    while not qAux.Eof do
    begin
      if (qAux.FieldByName('Emitente').AsString = EdtEmitente.Text) and ((qAux.FieldByName('Status').AsString = 'LANÇADO') or (qAux.FieldByName('Status').AsString = 'PRORROGADO'))  then
      begin
        inc(int);
        if (int >= limite_cheque) then
        begin
          if Application.MessageBox('Existe um ou mais cheques cadastrados e pendentes com o mesmo emitente. Deseja continuar?', 'Confirmação', MB_YESNO+MB_ICONQUESTION) = idyes then
            qAux.Last
          else
            abort;
        end;
      end;
      qAux.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

end.
