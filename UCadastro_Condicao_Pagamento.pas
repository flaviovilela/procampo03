unit UCadastro_Condicao_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, URegistro,
  ExtCtrls, UUtilitarios;

type
  TFrmCadastro_Condicao_Pagamento = class(TForm)
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
    LblParcelas: TLabel;
    LblDias: TLabel;
    Label1: TLabel;
    EdtParcela: TEdit;
    EdtPrazo: TEdit;
    EdtTaxa_Juros: TEdit;
    GroupBox4: TGroupBox;
    RBA_Vista: TRadioButton;
    RBA_PRazo: TRadioButton;
    CBStatus: TCheckBox;
    RGTipo_Juro: TRadioGroup;
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
    procedure EdtTaxa_JurosExit(Sender: TObject);
    procedure EdtParcelaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrazoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTaxa_JurosKeyPress(Sender: TObject; var Key: Char);
    procedure Gera_N_Pedido;
    procedure EdtCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    Condicao_Pagamento: URegistro.TCondicao_Pagamento;
    Util: TUtil;
    Mensagem: UUtilitarios.TMensagem;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Condicao_Pagamento: TFrmCadastro_Condicao_Pagamento;
implementation

uses UDM, UChama_Condicao_Pagamento;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Condicao_Pagamento.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Condicao_Pagamento);
  Util.Desabilita_Campos(FrmCadastro_Condicao_Pagamento);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Condicao_Pagamento.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao) then
  BEGIN
    try
      Condicao_Pagamento.Excluir;
      Mensagem.Exclusao_Realizada;
    finally
      Util.Insere_Historico(usuario, 'EXCLUIU COND. DE PAG. ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Condicao_Pagamento);
  END;
end;

procedure TFrmCadastro_Condicao_Pagamento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Condicao_Pagamento.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_N_Pedido;
        try
          Condicao_Pagamento.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU COND. DE PAG. ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
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
          Condicao_Pagamento.Alterar;
          Mensagem.Alteracao_Realizada;
          Util.Insere_Historico(usuario, 'ALTEROU COND. DE PAG. ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Condicao_Pagamento);
end;

function TFrmCadastro_Condicao_Pagamento.Confira: boolean;
begin
    Confira:= false;
    if EdtDescricao.Text = '' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtDescricao.SetFocus;
        abort;
      end;

    if EdtParcela.Text = '' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtParcela.SetFocus;
        abort;
      end;

    if EdtPrazo.Text = '' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtPrazo.SetFocus;
        abort;
      end;

    {if (RGTEF.ItemIndex = 0) and (RGCheque.ItemIndex = 0) then
    begin
      Mensagem_Falta_Dados;
      abort;
    end; }
      Confira:= true;
end;

procedure TFrmCadastro_Condicao_Pagamento.EdtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#08]) then
    key := #0
end;

procedure TFrmCadastro_Condicao_Pagamento.EdtParcelaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#08]) then
    key := #0
end;

procedure TFrmCadastro_Condicao_Pagamento.EdtPrazoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#08]) then
    key := #0
end;

procedure TFrmCadastro_Condicao_Pagamento.EdtTaxa_JurosExit(Sender: TObject);
begin
  //Util.FormataFloat(EdtTaxa_Juros);
end;

procedure TFrmCadastro_Condicao_Pagamento.EdtTaxa_JurosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',',#08]) then
    key := #0
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Condicao_Pagamento.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Condicao_Pagamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Condicao_Pagamento.Free;
        FrmCadastro_Condicao_Pagamento:= Nil;
      end;
end;

procedure TFrmCadastro_Condicao_Pagamento.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Condicao_Pagamento);
  Util.Limpa_Campos(FrmCadastro_Condicao_Pagamento);
  Util.Desabilita_Campos(FrmCadastro_Condicao_Pagamento);
  EdtParcela.Text:= '0';
  EdtPrazo.Text:= '0';
  EdtTaxa_Juros.Text:= '0,00';
end;

procedure TFrmCadastro_Condicao_Pagamento.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Condicao_Pagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Condicao_Pagamento);
      Util.Limpa_Campos(FrmCadastro_Condicao_Pagamento);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      MEdtData_Cadastro.SetFocus;
      EdtParcela.Text:= '0';
      EdtPrazo.Text:= '0';
      EdtTaxa_Juros.Text:= '0,00';
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Condicao_Pagamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Condicao_Pagamento.Gera_N_Pedido;
var
  qAux: TADOQuery;
  codigo: integer;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from Condicao_Pagamento ');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Condicao_Pagamento.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Condicao_Pagamento.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
  FrmChama_Condicao_Pagamento.ShowModal;
  FrmChama_Condicao_Pagamento.Release;
end;

end.
