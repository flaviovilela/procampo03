unit UProtocolo_Sincronizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmProtocolo_Sincronizacao = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    BBtnPesquisar: TToolButton;
    EdtCodigo_Produto: TEdit;
    EdtProduto: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    MMObservacoes: TMemo;
    Label5: TLabel;
    EdtResponsavel: TEdit;
    Label7: TLabel;
    EdtQtde: TEdit;
    Label8: TLabel;
    EdtCodigo_Unidade: TEdit;
    EdtUnidade: TEdit;
    LblData_Cadastro: TLabel;
    Label3: TLabel;
    MEdtData_Protocolo: TMaskEdit;
    MEdtHora_Protocolo: TMaskEdit;
    CheckBox1: TCheckBox;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_UnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_UnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_ProtocoloEnter(Sender: TObject);
    procedure MEdtData_ProtocoloExit(Sender: TObject);
  private
    Util: TUtil;
    Padrao: TProtocolo_Sincronizacao;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
  public
    ativo, enderec, achei: boolean;
    estoque, volume: double;
  protected
  end;

var
  FrmProtocolo_Sincronizacao: TFrmProtocolo_Sincronizacao;
implementation

uses UDM, UChama_Produto, UChama_Unidade_Medida,
  UChama_Protocolo_Sincronizacao_Cio;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmProtocolo_Sincronizacao.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmProtocolo_Sincronizacao);
  Util.Desabilita_Campos(FrmProtocolo_Sincronizacao);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmProtocolo_Sincronizacao.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Padrao.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU PROTOCOLO DE SINCRONIZAÇÃO DO DIA ' + MEdtData_Protocolo.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmProtocolo_Sincronizacao);
  end;
end;

procedure TFrmProtocolo_Sincronizacao.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmProtocolo_Sincronizacao.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Protocolo_Sincronizacao_Cio, FrmChama_Protocolo_Sincronizacao_Cio);
  FrmChama_Protocolo_Sincronizacao_Cio.ShowModal;
  FrmChama_Protocolo_Sincronizacao_Cio.Free;
end;

procedure TFrmProtocolo_Sincronizacao.BBtnSalvarClick(Sender: TObject);
var
  volume, qtde_estoque: double;
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Padrao.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'REGISTROU PROTOCOLO DE SINCRONIZAÇÃO DO DIA' + MEdtData_Protocolo.Text + '.', TimeToStr(time), insercao, date);
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
        Padrao.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU PROTOCOLO DE SINCRONIZAÇÃO DO DIA ' + MEdtData_Protocolo.Text + '.', TimeToStr(time), alteracao, date);
      except
        Mensagem.Impossivel_Executar;
      end;
      end
      else
        exit;
    end;

    if (CheckBox1.Checked) then
    begin
      qtde_estoque:= estoque - StrToFloat(EdtQtde.Text);
      Util.Atualiza_Estoque_Volume(StrToInt(EdtCodigo_Produto.Text), qtde_estoque, qtde_estoque * volume);
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmProtocolo_Sincronizacao);
end;

function TFrmProtocolo_Sincronizacao.Confira: boolean;
begin
  Confira:= false;

  if EdtCodigo_Produto.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Produto.SetFocus;
    abort;
  end;

  if EdtQtde.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtQtde.SetFocus;
    abort;
  end;

  if EdtCodigo_Unidade.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Unidade.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmProtocolo_Sincronizacao.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmProtocolo_Sincronizacao.EdtCodigo_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmProtocolo_Sincronizacao.EdtCodigo_UnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Unidade_Medida, FrmChama_Unidade_Medida);
    FrmChama_Unidade_Medida.ShowModal;
    FrmChama_Unidade_Medida.Free;
  end;
end;

procedure TFrmProtocolo_Sincronizacao.EdtCodigo_UnidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmProtocolo_Sincronizacao.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmProtocolo_Sincronizacao.EdtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmProtocolo_Sincronizacao.EdtUnidadeKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TFrmProtocolo_Sincronizacao.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmProtocolo_Sincronizacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmProtocolo_Sincronizacao.Free;
        FrmProtocolo_Sincronizacao:= Nil;
      end;
end;

procedure TFrmProtocolo_Sincronizacao.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmProtocolo_Sincronizacao);
  Util.Limpa_Campos(FrmProtocolo_Sincronizacao);
  Util.Desabilita_Campos(FrmProtocolo_Sincronizacao);
end;

procedure TFrmProtocolo_Sincronizacao.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmProtocolo_Sincronizacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmProtocolo_Sincronizacao);
      Util.Limpa_Campos(FrmProtocolo_Sincronizacao);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      CheckBox1.Checked:= true;
      CheckBox1.Enabled:= true;
      MEdtData_Protocolo.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmProtocolo_Sincronizacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmProtocolo_Sincronizacao.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Protocolo_Sincronizacao');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmProtocolo_Sincronizacao.MEdtData_ProtocoloEnter(Sender: TObject);
begin
  MEdtData_Protocolo.Text:= DateToStr(date);
end;

procedure TFrmProtocolo_Sincronizacao.MEdtData_ProtocoloExit(Sender: TObject);
begin
  if (MEdtData_Protocolo.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Protocolo);
end;

end.
