unit UCadastro_Bem_Patrimonio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmCadastro_Bem_Patrimonio = class(TForm)
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
    EdtIdentificacao: TEdit;
    EdtResponsavel: TEdit;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    EdtQuantidade: TEdit;
    EdtPreco_S: TEdit;
    EdtPreco_RS: TEdit;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label1: TLabel;
    MEdtData_Compra: TMaskEdit;
    MEdtData_Cadastro: TMaskEdit;
    RGTipo_Bem: TRadioGroup;
    MMODescricao_Detalhada: TMemo;
    MMObservacoes: TMemo;
    EdtDescricao: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    LblMarca: TLabel;
    Label7: TLabel;
    EdtTipo_Bem: TEdit;
    EdtCodigo_Tipo_Bem: TEdit;
    Label2: TLabel;
    EdtUnidade: TEdit;
    EdtCodigo_Unidade: TEdit;
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
    procedure EdtTipo_BemKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Tipo_BemKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_UnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_UnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Tipo_BemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtPreco_RSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPreco_SKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPreco_RSExit(Sender: TObject);
    procedure EdtPreco_SExit(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure MEdtData_CompraExit(Sender: TObject);
  private
    Util: TUtil;
    Bem: TBem_Patrimonial;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Escreve_Texto;
  public
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmCadastro_Bem_Patrimonio: TFrmCadastro_Bem_Patrimonio;
implementation

uses UDM, UChama_Bem_Patrimonio, UChama_Unidade_Medida,
  UChama_Tipo_Bem_Patrimonio;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Bem_Patrimonio.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Bem_Patrimonio);
  Util.Desabilita_Campos(FrmCadastro_Bem_Patrimonio);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Bem_Patrimonio.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Bem.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU BEM PATRIMONIAL ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Bem_Patrimonio);
  end;
end;

procedure TFrmCadastro_Bem_Patrimonio.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCadastro_Bem_Patrimonio.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Bem_Patrimonio, FrmChama_Bem_Patrimonio);
  FrmChama_Bem_Patrimonio.ShowModal;
  FrmChama_Bem_Patrimonio.Free;
end;

procedure TFrmCadastro_Bem_Patrimonio.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Bem.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU BEM PATRIMONIAL ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
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
        Bem.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU BEM PATRIMONIAL ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Bem_Patrimonio);
end;

function TFrmCadastro_Bem_Patrimonio.Confira: boolean;
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

procedure TFrmCadastro_Bem_Patrimonio.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Bem_Patrimonio.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Bem_Patrimonio.EdtCodigo_Tipo_BemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Tipo_bem_Patrimonio, FrmChama_Tipo_bem_Patrimonio);
    FrmChama_Tipo_bem_Patrimonio.ShowModal;
    FrmChama_Tipo_bem_Patrimonio.Free;
  end;
end;

procedure TFrmCadastro_Bem_Patrimonio.EdtCodigo_Tipo_BemKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Bem_Patrimonio.EdtCodigo_UnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Unidade_Medida, FrmChama_Unidade_Medida);
    FrmChama_Unidade_Medida.ShowModal;
    FrmChama_Unidade_Medida.Free;
  end;
end;

procedure TFrmCadastro_Bem_Patrimonio.EdtCodigo_UnidadeKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Bem_Patrimonio.EdtPreco_RSExit(Sender: TObject);
begin
  if (EdtPreco_RS.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtPreco_RS.SetFocus;
    abort;
  end;
end;

procedure TFrmCadastro_Bem_Patrimonio.EdtPreco_RSKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Bem_Patrimonio.EdtPreco_SExit(Sender: TObject);
begin
  if (EdtPreco_S.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtPreco_S.SetFocus;
    abort;
  end;
end;

procedure TFrmCadastro_Bem_Patrimonio.EdtPreco_SKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Bem_Patrimonio.EdtQuantidadeExit(Sender: TObject);
begin
  if (EdtQuantidade.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtQuantidade.SetFocus;
    abort;
  end;
end;

procedure TFrmCadastro_Bem_Patrimonio.EdtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Bem_Patrimonio.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Bem_Patrimonio.EdtTipo_BemKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Bem_Patrimonio.EdtUnidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Bem_Patrimonio.Escreve_Texto;
begin
  EdtPreco_S.Text:= '0,00';
  EdtPreco_RS.Text:= '0,00';
  EdtQuantidade.Text:= '0,00';
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Bem_Patrimonio.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Bem_Patrimonio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Bem_Patrimonio.Free;
        FrmCadastro_Bem_Patrimonio:= Nil;
      end;
end;

procedure TFrmCadastro_Bem_Patrimonio.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Bem_Patrimonio);
  Util.Limpa_Campos(FrmCadastro_Bem_Patrimonio);
  Util.Desabilita_Campos(FrmCadastro_Bem_Patrimonio);
  Escreve_Texto;
end;

procedure TFrmCadastro_Bem_Patrimonio.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Bem_Patrimonio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Bem_Patrimonio);
      Util.Limpa_Campos(FrmCadastro_Bem_Patrimonio);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      Escreve_Texto;
      EdtIdentificacao.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Bem_Patrimonio.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Bem_Patrimonio.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cadastro_Bem_Patrimonial');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Bem_Patrimonio.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Bem_Patrimonio.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Bem_Patrimonio.MEdtData_CompraExit(Sender: TObject);
begin
  if (MEdtData_Compra.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtData_Compra);
end;

end.
