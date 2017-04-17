unit UCadastro_Itens_Folha_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, URegistro,
  UUtilitarios, ExtCtrls;

type
  TFrmCadastro_Itens_Folha_Pagamento = class(TForm)
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
    RGNatureza: TRadioGroup;
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
  private
    Item: URegistro.TItens_Folha_Pagamento;
    Util: UUtilitarios.TUtil;
    Mensagem: UUtilitarios.TMensagem;
    procedure Gera_Codigo;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Itens_Folha_Pagamento: TFrmCadastro_Itens_Folha_Pagamento;
implementation

uses UDM, UChama_Item_Folha_Pagamento;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Itens_Folha_Pagamento.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Itens_Folha_Pagamento);
  Util.Desabilita_Campos(FrmCadastro_Itens_Folha_Pagamento);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao) then
  BEGIN
    try
      Item.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU ITEM PARA FOLHA DE PAGAMENTO ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Itens_Folha_Pagamento);
  END;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Gera_Codigo;
        try
          Item.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU ITEM PARA FOLHA DE PAGAMENTO ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
        except
          Mensagem.Impossivel_Executar;
        end;
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        try
          Item.Alterar;
          Mensagem.Alteracao_Realizada;
          Util.Insere_Historico(usuario, 'ALTEROU ITEM PARA FOLHA DE PAGAMENTO ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
        except
          Mensagem.Impossivel_Executar;
        end;
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Itens_Folha_Pagamento);
end;

function TFrmCadastro_Itens_Folha_Pagamento.Confira: boolean;
begin
    Confira:= false;
    if EdtDescricao.Text = '' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtDescricao.SetFocus;
        abort;
      end;

      Confira:= true;
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Itens_Folha_Pagamento.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Itens_Folha_Pagamento.Free;
        FrmCadastro_Itens_Folha_Pagamento:= Nil;
      end;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Itens_Folha_Pagamento);
  Util.Limpa_Campos(FrmCadastro_Itens_Folha_Pagamento);
  Util.Desabilita_Campos(FrmCadastro_Itens_Folha_Pagamento);
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Itens_Folha_Pagamento);
      Util.Limpa_Campos(FrmCadastro_Itens_Folha_Pagamento);
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

procedure TFrmCadastro_Itens_Folha_Pagamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cadastro_Itens_Folha_Pagamento');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Item_Folha_Pagamento, FrmChama_Item_Folha_Pagamento);
  FrmChama_Item_Folha_Pagamento.ShowModal;
  FrmChama_Item_Folha_Pagamento.Release;
end;

end.
