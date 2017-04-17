unit UCadastro_Servico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmCadastro_Servico = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Cadastro: TMaskEdit;
    LblData_Cadastro: TLabel;
    LblMarca: TLabel;
    EdtDescricao: TEdit;
    BBtnPesquisar: TToolButton;
    Label13: TLabel;
    EdtValor: TEdit;
    Label1: TLabel;
    MMODetalhe: TMemo;
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
    procedure EdtValorExit(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
  private
    Util: TUtil;
    Servico: TServico;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
  public
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmCadastro_Servico: TFrmCadastro_Servico;
implementation

uses UDM, UChama_Servico;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Servico.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Servico);
  Util.Desabilita_Campos(FrmCadastro_Servico);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Servico.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Servico.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU SERVIÇO ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Servico);
  end;
end;

procedure TFrmCadastro_Servico.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCadastro_Servico.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Servico, FrmChama_Servico);
  FrmChama_Servico.ShowModal;
  FrmChama_Servico.Free;
end;

procedure TFrmCadastro_Servico.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Servico.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU SERVIÇO ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
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
        Servico.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU SERVIÇO ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Servico);
end;

function TFrmCadastro_Servico.Confira: boolean;
begin
  Confira:= false;

  if EdtDescricao.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtDescricao.SetFocus;
    abort;
   end;

  if EdtValor.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor.SetFocus;
    abort;
   end;

  Confira:= true;
end;

procedure TFrmCadastro_Servico.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Servico.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Servico.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Servico.EdtValorExit(Sender: TObject);
begin
  if (EdtValor.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor.SetFocus;
    abort;
  end;

  EdtValor.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor.Text));
  EdtValor.Text:= StringReplace(EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmCadastro_Servico.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Servico.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Servico.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Servico.Free;
        FrmCadastro_Servico:= Nil;
      end;
end;

procedure TFrmCadastro_Servico.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Servico);
  Util.Limpa_Campos(FrmCadastro_Servico);
  Util.Desabilita_Campos(FrmCadastro_Servico);
end;

procedure TFrmCadastro_Servico.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Servico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Servico);
      Util.Limpa_Campos(FrmCadastro_Servico);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      MEdtData_Cadastro.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Servico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Servico.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cadastro_Servico');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Servico.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Servico.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

end.
