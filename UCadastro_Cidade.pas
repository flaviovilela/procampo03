unit UCadastro_Cidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmCadastro_Cidade = class(TForm)
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
    EdtCidade: TEdit;
    BBtnPesquisar: TToolButton;
    Label1: TLabel;
    CmbUF: TComboBox;
    Label2: TLabel;
    EdtDDD: TEdit;
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
  private
    Util: TUtil;
    Cidade: TCidade;
    Mensagem: TMensagem;
    function Confira: boolean;
    procedure Gera_Codigo;
  public
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmCadastro_Cidade: TFrmCadastro_Cidade;
implementation

uses UDM, UChama_Cidade;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Cidade.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Cidade);
  Util.Desabilita_Campos(FrmCadastro_Cidade);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Cidade.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin                                      
    try
      Cidade.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU CIDADE ' + EdtCidade.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;
    
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Cidade);
  end;
end;

procedure TFrmCadastro_Cidade.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCadastro_Cidade.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
  FrmChama_Cidade.ShowModal;
  FrmChama_Cidade.Free;
end;

procedure TFrmCadastro_Cidade.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Cidade.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU CIDADE ' + EdtCidade.Text + '.', TimeToStr(time), insercao, date);
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
        Cidade.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU CIDADE ' + EdtCidade.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Cidade);
end;

function TFrmCadastro_Cidade.Confira: boolean;
begin
  Confira:= false;

  if EdtCidade.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCidade.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmCadastro_Cidade.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cidade.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cidade.EdtSetorKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmCadastro_Cidade.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Cidade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Cidade.Free;
        FrmCadastro_Cidade:= Nil;
      end;
end;

procedure TFrmCadastro_Cidade.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Cidade);
  Util.Limpa_Campos(FrmCadastro_Cidade);
  Util.Desabilita_Campos(FrmCadastro_Cidade);
end;

procedure TFrmCadastro_Cidade.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Cidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Cidade);
      Util.Limpa_Campos(FrmCadastro_Cidade);
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

procedure TFrmCadastro_Cidade.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Cidade.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cadastro_Cidade');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Cidade.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Cidade.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

end.
