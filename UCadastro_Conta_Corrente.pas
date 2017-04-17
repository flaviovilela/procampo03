unit UCadastro_Conta_Corrente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmCadastro_Conta_Corrente = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    BBtnPesquisar: TToolButton;
    LblCodigo: TLabel;
    LblCC: TLabel;
    LblData_Cadastro: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdtCodigo: TEdit;
    EdtConta_Corrente: TEdit;
    MEdtData_Cadastro: TMaskEdit;
    EdtNome_Correntista: TEdit;
    EdtSaldo_Inicial: TEdit;
    EdtSaldo_Atual: TEdit;
    EdtLimite: TEdit;
    LblN_Banco: TLabel;
    EdtCodigo_Agencia: TEdit;
    EdtAgencia: TEdit;
    EdtBanco: TEdit;
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
    procedure EdtCodigo_AgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBancoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_AgenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Util: TUtil;
    Conta: TConta;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Escreve_Texto;
  public
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmCadastro_Conta_Corrente: TFrmCadastro_Conta_Corrente;
implementation

uses UDM, UChama_Banco, UChama_Conta_Corrente, UChama_Agencia;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Conta_Corrente.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Conta_Corrente);
  Util.Desabilita_Campos(FrmCadastro_Conta_Corrente);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Conta_Corrente.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Conta.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU CONTA CORRENTE ' + EdtBanco.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Conta_Corrente);
  end;
end;

procedure TFrmCadastro_Conta_Corrente.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCadastro_Conta_Corrente.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
  FrmChama_Conta_Corrente.ShowModal;
  FrmChama_Conta_Corrente.Free;
end;

procedure TFrmCadastro_Conta_Corrente.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Conta.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU CONTA CORRENTE ' + EdtBanco.Text + '.', TimeToStr(time), insercao, date);
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
        Conta.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU CONTA CORRENTE ' + EdtBanco.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Conta_Corrente);
end;

function TFrmCadastro_Conta_Corrente.Confira: boolean;
begin
  Confira:= false;

  if EdtConta_Corrente.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtConta_Corrente.SetFocus;
    abort;
  end;

  if EdtCodigo_Agencia.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Agencia.SetFocus;
    abort;
  end;

  if EdtSaldo_Inicial.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtSaldo_Inicial.SetFocus;
    abort;
  end;

  if EdtSaldo_Atual.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtSaldo_Atual.SetFocus;
    abort;
  end;

  if EdtLimite.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtLimite.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmCadastro_Conta_Corrente.EdtAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Conta_Corrente.EdtBancoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Conta_Corrente.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Conta_Corrente.EdtCodigo_AgenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Agencia, FrmChama_Agencia);
    FrmChama_Agencia.ShowModal;
    FrmChama_Agencia.Free;
  end;
end;

procedure TFrmCadastro_Conta_Corrente.EdtCodigo_AgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Conta_Corrente.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Conta_Corrente.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Conta_Corrente.Escreve_Texto;
begin
  EdtLimite.Text:= '0,00';
  EdtSaldo_Inicial.Text:= '0,00';
  EdtSaldo_Atual.Text:= '0,00';
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Conta_Corrente.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Conta_Corrente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Conta_Corrente.Free;
        FrmCadastro_Conta_Corrente:= Nil;
      end;
end;

procedure TFrmCadastro_Conta_Corrente.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Conta_Corrente);
  Util.Limpa_Campos(FrmCadastro_Conta_Corrente);
  Util.Desabilita_Campos(FrmCadastro_Conta_Corrente);
  Escreve_Texto;
end;

procedure TFrmCadastro_Conta_Corrente.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Conta_Corrente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Conta_Corrente);
      Util.Limpa_Campos(FrmCadastro_Conta_Corrente);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      Escreve_Texto;
      MEdtData_Cadastro.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Conta_Corrente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Conta_Corrente.Gera_Codigo;
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
      add('select max(Codigo_Conta_Corrente) as codigo from Cadastro_Conta_Corrente');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Conta_Corrente.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Conta_Corrente.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

end.
