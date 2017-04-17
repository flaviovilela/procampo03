unit UCadastro_Etiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmCadastro_Etiqueta = class(TForm)
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
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    LblNumero: TLabel;
    EdtMargem_Superior: TEdit;
    Label1: TLabel;
    EdtMargem_Inferior: TEdit;
    Label2: TLabel;
    EdtMargem_Esquerda: TEdit;
    Label3: TLabel;
    EdtMargem_Direita: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    EdtDistancia_Horizontal: TEdit;
    EdtDistancia_Vertical: TEdit;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    EdtAltura_Etiqueta: TEdit;
    EdtLargura_Etiqueta: TEdit;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    EdtAltura_Pagina: TEdit;
    EdtLargura_Pagina: TEdit;
    GroupBox6: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    EdtEtiqueta_Linha: TEdit;
    EdtLinha_Pagina: TEdit;
    Label12: TLabel;
    EdtTamanho_Fonte: TEdit;
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
    procedure EdtMargem_SuperiorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMargem_EsquerdaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMargem_InferiorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMargem_DireitaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDistancia_HorizontalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDistancia_VerticalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAltura_EtiquetaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLargura_EtiquetaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAltura_PaginaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLargura_PaginaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEtiqueta_LinhaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLinha_PaginaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTamanho_FonteKeyPress(Sender: TObject; var Key: Char);
  private
    Util: TUtil;
    Etiqueta: TEtiqueta;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Escreve_Texto;
  public
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmCadastro_Etiqueta: TFrmCadastro_Etiqueta;
implementation

uses UDM, UChama_Etiqueta;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Etiqueta.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Etiqueta);
  Util.Desabilita_Campos(FrmCadastro_Etiqueta);
  Escreve_Texto;
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Etiqueta.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Etiqueta.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU ETIQUETA ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Etiqueta);
  end;
end;

procedure TFrmCadastro_Etiqueta.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCadastro_Etiqueta.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Etiqueta, FrmChama_Etiqueta);
  FrmChama_Etiqueta.ShowModal;
  FrmChama_Etiqueta.Free;
end;

procedure TFrmCadastro_Etiqueta.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Etiqueta.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU ETIQUETA ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
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
        Etiqueta.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU ETIQUETA ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Etiqueta);
end;

function TFrmCadastro_Etiqueta.Confira: boolean;
begin
  Confira:= false;

  if EdtDescricao.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtDescricao.SetFocus;
    abort;
  end;

  if EdtMargem_Superior.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtMargem_Superior.SetFocus;
    abort;
  end;

  if EdtMargem_Inferior.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtMargem_Inferior.SetFocus;
    abort;
  end;

  if EdtMargem_Esquerda.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtMargem_Esquerda.SetFocus;
    abort;
  end;

  if EdtMargem_Direita.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtMargem_Direita.SetFocus;
    abort;
  end;

  if EdtDistancia_Horizontal.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtDistancia_Horizontal.SetFocus;
    abort;
  end;

  if EdtDistancia_Vertical.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtDistancia_Vertical.SetFocus;
    abort;
  end;

  if EdtAltura_Etiqueta.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtAltura_Etiqueta.SetFocus;
    abort;
  end;

  if EdtLargura_Etiqueta.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtLargura_Etiqueta.SetFocus;
    abort;
  end;

  if EdtAltura_Pagina.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtAltura_Pagina.SetFocus;
    abort;
  end;

  if EdtLargura_Pagina.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtLargura_Pagina.SetFocus;
    abort;
  end;

  if EdtEtiqueta_Linha.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtEtiqueta_Linha.SetFocus;
    abort;
  end;

  if EdtLinha_Pagina.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtLinha_Pagina.SetFocus;
    abort;
  end;

  if EdtTamanho_Fonte.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtTamanho_Fonte.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmCadastro_Etiqueta.EdtAltura_EtiquetaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Etiqueta.EdtAltura_PaginaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Etiqueta.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Etiqueta.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Etiqueta.EdtDistancia_HorizontalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Etiqueta.EdtDistancia_VerticalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Etiqueta.EdtEtiqueta_LinhaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Etiqueta.EdtLargura_EtiquetaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Etiqueta.EdtLargura_PaginaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Etiqueta.EdtLinha_PaginaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Etiqueta.EdtMargem_DireitaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Etiqueta.EdtMargem_EsquerdaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Etiqueta.EdtMargem_InferiorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Etiqueta.EdtMargem_SuperiorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Etiqueta.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Etiqueta.EdtTamanho_FonteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Etiqueta.Escreve_Texto;
begin
  EdtMargem_Superior.Text:= '0,00';
  EdtMargem_Inferior.Text:= '0,00';
  EdtMargem_Esquerda.Text:= '0,00';
  EdtMargem_Direita.Text:= '0,00';
  EdtDistancia_Horizontal.Text:= '0,00';
  EdtDistancia_Vertical.Text:= '0,00';
  EdtAltura_Etiqueta.Text:= '0,00';
  EdtLargura_Etiqueta.Text:= '0,00';
  EdtAltura_Pagina.Text:= '0,00';
  EdtLargura_Pagina.Text:= '0,00';
  EdtEtiqueta_Linha.Text:= '0,00';
  EdtLinha_Pagina.Text:= '0,00';
  EdtTamanho_Fonte.Text:= '0,00';
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Etiqueta.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Etiqueta.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Etiqueta.Free;
        FrmCadastro_Etiqueta:= Nil;
      end;
end;

procedure TFrmCadastro_Etiqueta.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Etiqueta);
  Util.Limpa_Campos(FrmCadastro_Etiqueta);
  Util.Desabilita_Campos(FrmCadastro_Etiqueta);
  Escreve_Texto;
end;

procedure TFrmCadastro_Etiqueta.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Etiqueta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Etiqueta);
      Util.Limpa_Campos(FrmCadastro_Etiqueta);
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

procedure TFrmCadastro_Etiqueta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Etiqueta.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cadastro_Etiqueta');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Etiqueta.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Etiqueta.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

end.
