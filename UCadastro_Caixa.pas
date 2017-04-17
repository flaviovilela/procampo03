unit UCadastro_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, URegistro,
  ExtCtrls, UUtilitarios;

type
  TFrmCadastro_Caixa = class(TForm)
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
    Label1: TLabel;
    EdtSubnivel: TEdit;
    Label2: TLabel;
    EdtCaixa: TEdit;
    EdtCodigo_SubNivel: TEdit;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
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
    procedure EdtCodigo_SubNivelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCaixaEnter(Sender: TObject);
    procedure EdtSubnivelKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_SubNivelKeyPress(Sender: TObject; var Key: Char);
  private
    Caixa: URegistro.TCaixa;
    Util: UUtilitarios.TUtil;
    Mensagem: UUtilitarios.TMensagem;
    procedure Gera_Codigo;
  public
    ativo, edit, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Caixa: TFrmCadastro_Caixa;
implementation

uses UDM, UChama_Caixa;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Caixa.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Caixa);
  Util.Desabilita_Campos(FrmCadastro_Caixa);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Caixa.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao) then
  begin
    try
      Caixa.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU CAIXA ' + EdtCaixa.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Caixa);
  end;
end;

procedure TFrmCadastro_Caixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Caixa.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cadastro_Caixa');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Caixa.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Caixa.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU CAIXA ' + EdtCaixa.Text + '.', TimeToStr(time), insercao, date);
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
          Caixa.Alterar;
          Mensagem.Alteracao_Realizada;
          Util.Insere_Historico(usuario, 'ALTEROU CAIXA ' + EdtCaixa.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Caixa);
end;

function TFrmCadastro_Caixa.Confira: boolean;
begin
  Confira:= false;

  if EdtCaixa.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtCaixa.SetFocus;
      abort;
    end;

  Confira:= true;
end;

procedure TFrmCadastro_Caixa.EdtCodigo_SubNivelKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      edit:= true;
      Application.CreateForm(TFrmChama_Caixa, FrmChama_Caixa);
      FrmChama_Caixa.ShowModal;
      FrmChama_Caixa.Free;
    end;
end;

procedure TFrmCadastro_Caixa.EdtCodigo_SubNivelKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Caixa.EdtSubnivelKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Caixa.EdtCaixaEnter(Sender: TObject);
begin
  if (EdtCodigo_SubNivel.Text = '') then
    EdtCaixa.Text:= EdtDescricao.Text
  else
    EdtCaixa.Text:= EdtSubnivel.Text + ' : ' + EdtDescricao.Text;
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Caixa.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Caixa.Free;
        FrmCadastro_Caixa:= Nil;
      end;
end;

procedure TFrmCadastro_Caixa.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Caixa);
  Util.Limpa_Campos(FrmCadastro_Caixa);
  Util.Desabilita_Campos(FrmCadastro_Caixa);
  edit:= false;
end;

procedure TFrmCadastro_Caixa.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Caixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Caixa);
      Util.Limpa_Campos(FrmCadastro_Caixa);
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

procedure TFrmCadastro_Caixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Caixa.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Caixa.BBtnPesquisarClick(Sender: TObject);
begin
  edit:= false;
  Application.CreateForm(TFrmChama_Caixa, FrmChama_Caixa);
  FrmChama_Caixa.ShowModal;
  FrmChama_Caixa.Free;
end;

end.
