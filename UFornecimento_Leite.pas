unit UFornecimento_Leite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmFornecimento_Leite = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Entrega: TMaskEdit;
    LblData_Cadastro: TLabel;
    BBtnPesquisar: TToolButton;
    Label11: TLabel;
    MMOObservacao: TMemo;
    Label5: TLabel;
    EdtCodigo_Cliente: TEdit;
    EdtCliente: TEdit;
    Label3: TLabel;
    EdtQtde: TEdit;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_EntregaEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure MEdtData_EntregaExit(Sender: TObject);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtTotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTotal_AnimaisKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTotal_OrdenhasKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTemperaturaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Util: TUtil;
    Leite: TFornecimento_Leite;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Calcula_Total_Animal;
  public
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmFornecimento_Leite: TFrmFornecimento_Leite;
implementation

uses UDM, UChama_Cliente, UChama_Fornecimento_Leite;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmFornecimento_Leite.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmFornecimento_Leite);
  Util.Desabilita_Campos(FrmFornecimento_Leite);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmFornecimento_Leite.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Leite.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU FORNECIMENTO DE LEITE DO DIA ' + MEdtData_Entrega.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmFornecimento_Leite);
  end;
end;

procedure TFrmFornecimento_Leite.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmFornecimento_Leite.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Fornecimento_Leite, FrmChama_Fornecimento_Leite);
  FrmChama_Fornecimento_Leite.ShowModal;
  FrmChama_Fornecimento_Leite.Free;
end;

procedure TFrmFornecimento_Leite.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Leite.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'LANÇOU FORNECIMENTO DE LEITE DO DIA ' + MEdtData_Entrega.Text + '.', TimeToStr(time), insercao, date);
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
        Leite.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU FORNECIMENTO DE LEITE DO DIA ' + MEdtData_Entrega.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmFornecimento_Leite);
end;

procedure TFrmFornecimento_Leite.Calcula_Total_Animal;
begin
end;

function TFrmFornecimento_Leite.Confira: boolean;
begin
  Confira:= false;

  if EdtCodigo_Cliente.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtCodigo_Cliente.SetFocus;
      abort;
    end;

  if EdtQtde.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtQtde.SetFocus;
      abort;
    end;

  Confira:= true;
end;

procedure TFrmFornecimento_Leite.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFornecimento_Leite.EdtClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFornecimento_Leite.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFornecimento_Leite.EdtCodigo_ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmFornecimento_Leite.EdtCodigo_ClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFornecimento_Leite.EdtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmFornecimento_Leite.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFornecimento_Leite.EdtTemperaturaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmFornecimento_Leite.EdtTotalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmFornecimento_Leite.EdtTotal_AnimaisKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmFornecimento_Leite.EdtTotal_OrdenhasKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmFornecimento_Leite.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmFornecimento_Leite.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmFornecimento_Leite.Free;
        FrmFornecimento_Leite:= Nil;
      end;
end;

procedure TFrmFornecimento_Leite.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmFornecimento_Leite);
  Util.Limpa_Campos(FrmFornecimento_Leite);
  Util.Desabilita_Campos(FrmFornecimento_Leite);
end;

procedure TFrmFornecimento_Leite.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmFornecimento_Leite.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmFornecimento_Leite);
      Util.Limpa_Campos(FrmFornecimento_Leite);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;

      MEdtData_Entrega.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmFornecimento_Leite.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmFornecimento_Leite.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Fornecimento_Leite');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmFornecimento_Leite.MEdtData_EntregaEnter(Sender: TObject);
begin
  MEdtData_Entrega.Text:= DateToStr(date);
end;

procedure TFrmFornecimento_Leite.MEdtData_EntregaExit(Sender: TObject);
begin
  if (MEdtData_Entrega.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Entrega);
end;

end.
