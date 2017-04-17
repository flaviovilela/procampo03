unit UCadastro_Agencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmCadastro_Agencia = class(TForm)
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
    BBtnPesquisar: TToolButton;
    LblNome: TLabel;
    Label1: TLabel;
    LblContato: TLabel;
    EdtNumero: TEdit;
    MEdtTelefone: TMaskEdit;
    EdtContato: TEdit;
    LblN_Banco: TLabel;
    EdtCodigo_Banco: TEdit;
    EdtBanco: TEdit;
    LblNumero: TLabel;
    Label2: TLabel;
    EdtEndereco: TEdit;
    EdtN: TEdit;
    EdtCodigo_Endereco: TEdit;
    Label3: TLabel;
    EdtCodigo_Cidade: TEdit;
    EdtCidade: TEdit;
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
    procedure EdtCodigo_BancoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBancoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_EnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_BancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_EnderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_CidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Util: TUtil;
    Agencia: TAgencia;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
  public
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmCadastro_Agencia: TFrmCadastro_Agencia;
implementation

uses UDM, UChama_Banco, UChama_Logradouro, UChama_Cidade, UChama_Agencia;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Agencia.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Agencia);
  Util.Desabilita_Campos(FrmCadastro_Agencia);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Agencia.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Agencia.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU AGÊNCIA ' + EdtBanco.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Agencia);
  end;
end;

procedure TFrmCadastro_Agencia.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCadastro_Agencia.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Agencia, FrmChama_Agencia);
  FrmChama_Agencia.ShowModal;
  FrmChama_Agencia.Free;
end;

procedure TFrmCadastro_Agencia.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Agencia.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU AGÊNCIA ' + EdtBanco.Text + '.', TimeToStr(time), insercao, date);
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
        Agencia.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU AGÊNCIA ' + EdtBanco.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Agencia);
end;

function TFrmCadastro_Agencia.Confira: boolean;
begin
  Confira:= false;

  if EdtNumero.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtNumero.SetFocus;
    abort;
  end;

  if EdtCodigo_Banco.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Banco.SetFocus;
    abort;
  end;

  if EdtCodigo_Endereco.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Endereco.SetFocus;
    abort;
  end;

  if EdtCodigo_Cidade.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Cidade.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmCadastro_Agencia.EdtBancoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Agencia.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Agencia.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Agencia.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Agencia.EdtCodigo_BancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Banco, FrmChama_Banco);
    FrmChama_Banco.ShowModal;
    FrmChama_Banco.Free;
  end;
end;

procedure TFrmCadastro_Agencia.EdtCodigo_BancoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Agencia.EdtCodigo_CidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
    FrmChama_Cidade.ShowModal;
    FrmChama_Cidade.Free;
  end;
end;

procedure TFrmCadastro_Agencia.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Agencia.EdtCodigo_EnderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
    FrmChama_Logradouro.ShowModal;
    FrmChama_Logradouro.Free;
  end;
end;

procedure TFrmCadastro_Agencia.EdtCodigo_EnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Agencia.EdtEnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Agencia.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Agencia.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Agencia.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Agencia.Free;
        FrmCadastro_Agencia:= Nil;
      end;
end;

procedure TFrmCadastro_Agencia.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Agencia);
  Util.Limpa_Campos(FrmCadastro_Agencia);
  Util.Desabilita_Campos(FrmCadastro_Agencia);
end;

procedure TFrmCadastro_Agencia.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Agencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Agencia);
      Util.Limpa_Campos(FrmCadastro_Agencia);
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

procedure TFrmCadastro_Agencia.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Agencia.Gera_Codigo;
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
      add('select max(Codigo_Agencia) as codigo from Cadastro_Agencia');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Agencia.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Agencia.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

end.
