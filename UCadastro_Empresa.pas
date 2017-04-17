unit UCadastro_Empresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  UUtilitarios, URegistro;

type
  TFrmCadastro_Empresa = class(TForm)
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
    EdtNome_Fantasia: TEdit;
    BBtnPesquisar: TToolButton;
    Label1: TLabel;
    EdtRazao_Social: TEdit;
    GroupBox2: TGroupBox;
    Label22: TLabel;
    Label16: TLabel;
    EdtInsc_Estadual: TEdit;
    EdtCNPJ: TMaskEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    LblNumero: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    LblUF: TLabel;
    EdtEndereco: TEdit;
    EdtNumero: TEdit;
    EdtTipo_Logradouro: TEdit;
    EdtCEP: TEdit;
    EdtSetor: TEdit;
    EdtCidade: TEdit;
    EdtUF: TEdit;
    EdtCodigo_Endereco: TEdit;
    Label2: TLabel;
    EdtCodigo_Setor: TEdit;
    Label3: TLabel;
    EdtCodigo_Cidade: TEdit;
    Label4: TLabel;
    LblEmail: TLabel;
    EdtEmail: TEdit;
    Label7: TLabel;
    MEdtTelefone: TMaskEdit;
    Label8: TLabel;
    MEdtCelular: TMaskEdit;
    Label11: TLabel;
    EdtSite: TEdit;
    Label34: TLabel;
    EdtInsc_Municipal: TEdit;
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
    procedure EdtRGKeyPress(Sender: TObject; var Key: Char);
    procedure EdtInsc_EstadualKeyPress(Sender: TObject;
      var Key: Char);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure EdtTipo_Logradouro_OutrosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCEP_OutrosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_EnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_LogradouroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCEPKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_SetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtCodigo_SetorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_CidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_EnderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtInsc_MunicipalKeyPress(Sender: TObject; var Key: Char);
  private
    Util: TUtil;
    Empresa: TEmpresa;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
  public
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmCadastro_Empresa: TFrmCadastro_Empresa;
implementation

uses UDM, UChama_Empresa, UChama_Cidade, UChama_Logradouro, UChama_Setor;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Empresa.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Empresa);
  Util.Desabilita_Campos(FrmCadastro_Empresa);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Empresa.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Empresa.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU EMPRESA ' + EdtNome_Fantasia.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Empresa);
  end;
end;

procedure TFrmCadastro_Empresa.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCadastro_Empresa.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Empresa, FrmChama_Empresa);
  FrmChama_Empresa.ShowModal;
  FrmChama_Empresa.Free;
end;

procedure TFrmCadastro_Empresa.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Empresa.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU EMPRESA ' + EdtNome_Fantasia.Text + '.', TimeToStr(time), insercao, date);
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
        Empresa.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU EMPRESA ' + EdtNome_Fantasia.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Empresa);
end;

function TFrmCadastro_Empresa.Confira: boolean;
begin
  Confira:= false;

  if EdtNome_Fantasia.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtNome_Fantasia.SetFocus;
      abort;
    end;

    Confira:= true;
end;

procedure TFrmCadastro_Empresa.EdtCEPKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtCEP_OutrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtCodigo_CidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_F3 then
   begin
     Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
     FrmChama_Cidade.ShowModal;
     FrmChama_Cidade.Free;
   end;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtCodigo_EnderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F3 then
  begin
    Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
    FrmChama_Logradouro.ShowModal;
    FrmChama_Logradouro.Free;
  end;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_EnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtCodigo_SetorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F3 then
  begin
    Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
    FrmChama_Setor.ShowModal;
    FrmChama_Setor.Free;
  end;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_SetorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtEnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtInsc_EstadualKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Empresa.EdtInsc_MunicipalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Empresa.EdtRGKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Empresa.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtTipo_LogradouroKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtTipo_Logradouro_OutrosKeyPress(
  Sender: TObject; var Key: Char);
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

procedure TFrmCadastro_Empresa.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Empresa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Empresa.Free;
        FrmCadastro_Empresa:= Nil;
      end;
end;

procedure TFrmCadastro_Empresa.FormCreate(Sender: TObject);
begin
  PageControl2.TabIndex:= 0;
  Util.Habilita_Campos(FrmCadastro_Empresa);
  Util.Limpa_Campos(FrmCadastro_Empresa);
  Util.Desabilita_Campos(FrmCadastro_Empresa);
end;

procedure TFrmCadastro_Empresa.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Empresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      PageControl2.TabIndex:= 0;
      Util.Habilita_Campos(FrmCadastro_Empresa);
      Util.Limpa_Campos(FrmCadastro_Empresa);
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

procedure TFrmCadastro_Empresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Empresa.Gera_Codigo;
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
      add('select max(Codigo) as Codigo from Cadastro_Empresa');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Empresa.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Empresa.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

end.
