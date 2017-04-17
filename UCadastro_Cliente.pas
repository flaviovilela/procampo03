unit UCadastro_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  UUtilitarios, URegistro;

type
  TFrmCadastro_Cliente = class(TForm)
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
    EdtNome: TEdit;
    BBtnPesquisar: TToolButton;
    CBTipo: TCheckBox;
    Label1: TLabel;
    EdtRazao_Social: TEdit;
    GroupBox1: TGroupBox;
    LblRG: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    EdtRG: TEdit;
    EdtOrgao_Expedidor: TEdit;
    EdtData_Emissao: TMaskEdit;
    EdtCPF: TMaskEdit;
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
    Label23: TLabel;
    EdtEndereco: TEdit;
    EdtNumero: TEdit;
    EdtTipo_Logradouro: TEdit;
    EdtCEP: TEdit;
    EdtCidade: TEdit;
    EdtUF: TEdit;
    EdtReferencia: TEdit;
    EdtCodigo_Endereco: TEdit;
    Label2: TLabel;
    EdtCodigo_Cidade: TEdit;
    Label4: TLabel;
    LblEmail: TLabel;
    EdtEmail: TEdit;
    LblProfissao: TLabel;
    EdtProfissao: TEdit;
    Label6: TLabel;
    LblData_Nasc: TLabel;
    CmbEstado_Civil: TComboBox;
    MEdtData_Nascimento: TMaskEdit;
    Label7: TLabel;
    MEdtTelefone: TMaskEdit;
    Label8: TLabel;
    MEdtCelular: TMaskEdit;
    Label9: TLabel;
    EdtContato: TEdit;
    Label10: TLabel;
    MEdtTelefone_Contato: TMaskEdit;
    Label11: TLabel;
    EdtSite: TEdit;
    Label24: TLabel;
    EdtComplemento: TEdit;
    Label34: TLabel;
    EdtInsc_Municipal: TEdit;
    RGTipo: TRadioGroup;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Nome: TStringField;
    ADOQuery1CPF: TStringField;
    ADOQuery1RG: TStringField;
    ADOQuery1Data_Nascimento: TDateTimeField;
    ADOQuery1Sexo: TStringField;
    ADOQuery1Grau_Parentesco: TStringField;
    ADOQuery1Codigo_Cliente: TIntegerField;
    Label3: TLabel;
    EdtSetor: TEdit;
    EdtCodigo_Setor: TEdit;
    EdtCodigo_Grupo: TEdit;
    Label5: TLabel;
    EdtGrupo: TEdit;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure MmoObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtRGKeyPress(Sender: TObject; var Key: Char);
    procedure EdtInsc_EstadualKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtData_EmissaoExit(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure MEdtData_NascimentoExit(Sender: TObject);
    procedure EdtCodigo_EnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_LogradouroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCEPKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_SetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_SetorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtCodigo_EnderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_CidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtInsc_MunicipalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_GrupoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEnderecoExit(Sender: TObject);
    procedure EdtEnderecoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtSetorExit(Sender: TObject);
    procedure EdtSetorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtCidadeExit(Sender: TObject);
    procedure EdtCidadeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtRazao_SocialEnter(Sender: TObject);
  private
    Util: TUtil;
    Cliente: TCliente;
    Mensagem: TMensagem;
    iniciado: boolean;

    codigo_endereco, codigo_setor, codigo_cidade: integer;

    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Atualiza_RadioGroup;
  public
    ativo, enderec, achei, achou_endereco, achou_setor, achou_cidade: boolean;
  protected
  end;

var
  FrmCadastro_Cliente: TFrmCadastro_Cliente;
implementation

uses UDM, UChama_Setor, UChama_Cliente, UChama_Logradouro, UChama_Cidade;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Cliente.Atualiza_RadioGroup;
begin
  RGTipo.ItemIndex:= 0;
end;

procedure TFrmCadastro_Cliente.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Cliente);
  Util.Desabilita_Campos(FrmCadastro_Cliente);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  iniciado:= false;
end;

procedure TFrmCadastro_Cliente.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Cliente.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU CLI./FORN./FUNC. ' + EdtNome.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    iniciado:= false;
    Util.Desabilita_Campos(FrmCadastro_Cliente);
  end;
end;

procedure TFrmCadastro_Cliente.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCadastro_Cliente.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
  FrmChama_Cliente.ShowModal;
  FrmChama_Cliente.Free;
end;

procedure TFrmCadastro_Cliente.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        try
          Cliente.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU CLI./FORN./FUNC. ' + EdtNome.Text + '.', TimeToStr(time), insercao, date);
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
        Cliente.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU CLI./FORN./FUNC. ' + EdtNome.Text + '.', TimeToStr(time), alteracao, date);
      except
        Mensagem.Impossivel_Executar;
      end;
      end
      else
        exit;
    end;

    if (achou_cidade = false) and (EdtCidade.Text <> '') then
    begin
      Util.Cadastra_Cidade(EdtCidade.Text, EdtUF.Text, '', date);
    end;

    if (achou_setor = false) and (EdtSetor.Text <> '') then
    begin
      Util.Cadastra_Setor(EdtSetor.Text, date);
    end;

    if (achou_endereco = false) and (EdtEndereco.Text <> '') then
    begin
      Util.Cadastra_Logradouro(EdtEndereco.Text, EdtTipo_Logradouro.Text, EdtCEP.Text, date);
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    iniciado:= false;
    Util.Desabilita_Campos(FrmCadastro_Cliente);
end;

function TFrmCadastro_Cliente.Confira: boolean;
begin
    Confira:= false;

    if EdtNome.Text = '' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtNome.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmCadastro_Cliente.EdtCEPKeyPress(Sender: TObject; var Key: Char);
begin
  //Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cliente.EdtCidadeExit(Sender: TObject);
begin
  if (qAux_Cidade <> Nil) and (qAux_Cidade.IsEmpty = false) and (EdtCidade.Text <> '') then
  begin
    codigo_cidade:= qAux_Cidade.FieldByName('Codigo').AsInteger;
    EdtCodigo_Cidade.Text:= qAux_Cidade.FieldByName('Codigo').AsString;
    EdtCidade.Text:= qAux_Cidade.FieldByName('Cidade').AsString;
    EdtUF.Text:= qAux_Cidade.FieldByName('UF').AsString;
    achou_cidade:= true;
  end
  else
  begin
    achou_cidade:= false;
    codigo_cidade:= 0;

    if (EdtCidade.Text <> '') then
    begin
      EdtCodigo_Cidade.Text:= IntToStr(Util.Gera_Codigo_Cadastro('Cadastro_Cidade'));
    end
    else
    begin
      EdtCodigo_Cidade.Text:= '';
      EdtCidade.Text:= '';
      EdtUF.Text:= '';
    end;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  //Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cliente.EdtCidadeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not ( (key = 08) or (key = 46) ) and (EdtCidade.Text <> '')then
    Util.Pega_Cidade(EdtCidade);
end;

procedure TFrmCadastro_Cliente.EdtCodigo_CidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_F3 then
   begin
     Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
     FrmChama_Cidade.ShowModal;
     FrmChama_Cidade.Free;
   end;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cliente.EdtCodigo_EnderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F3 then
  begin
    Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
    FrmChama_Logradouro.ShowModal;
    FrmChama_Logradouro.Free;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_EnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cliente.EdtCodigo_GrupoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cliente.EdtCodigo_SetorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_F3 then
  begin
    Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
    FrmChama_Setor.ShowModal;
    FrmChama_Setor.Free;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_SetorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cliente.EdtData_EmissaoExit(Sender: TObject);
begin
  if (EdtData_Emissao.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(EdtData_Emissao);
end;

procedure TFrmCadastro_Cliente.EdtEnderecoExit(Sender: TObject);
begin
  if (qAux_Endereco <> Nil) and (qAux_Endereco.IsEmpty = false) and (EdtEndereco.Text <> '') then
  begin
    codigo_endereco:= qAux_Endereco.FieldByName('Codigo').AsInteger;
    EdtCodigo_Endereco.Text:= qAux_Endereco.FieldByName('Codigo').AsString;
    EdtEndereco.Text:= qAux_Endereco.FieldByName('Logradouro').AsString;
    EdtTipo_Logradouro.Text:= qAux_Endereco.FieldByName('Tipo_Logradouro').AsString;
    EdtCEP.Text:= qAux_Endereco.FieldByName('CEP').AsString;
    achou_endereco:= true;
  end
  else
  begin
    achou_endereco:= false;
    codigo_endereco:= 0;

    if (EdtEndereco.Text <> '') then
    begin
      EdtCodigo_Endereco.Text:= IntToStr(Util.Gera_Codigo_Cadastro('Cadastro_Logradouro'));
    end
    else
    begin
      EdtCodigo_Endereco.Text:= '';
      EdtEndereco.Text:= '';
      EdtTipo_Logradouro.Text:= '';
      EdtCEP.Text:= '';
      EdtNumero.Text:= '';
    end;
  end;
end;

procedure TFrmCadastro_Cliente.EdtEnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  //Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cliente.EdtEnderecoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not ( (key = 08) or (key = 46) ) and (EdtEndereco.Text <> '')then
    Util.Pega_Endereco(EdtEndereco);
end;

procedure TFrmCadastro_Cliente.EdtInsc_EstadualKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Cliente.EdtInsc_MunicipalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Cliente.EdtRazao_SocialEnter(Sender: TObject);
begin
  EdtRazao_Social.Text:= EdtNome.Text;
end;

procedure TFrmCadastro_Cliente.EdtRGKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Cliente.EdtSetorExit(Sender: TObject);
begin
  if (qAux_Setor <> Nil) and (qAux_Setor.IsEmpty = false) and (EdtSetor.Text <> '') then
  begin
    codigo_setor:= qAux_Setor.FieldByName('Codigo').AsInteger;
    EdtCodigo_Setor.Text:= qAux_Setor.FieldByName('Codigo').AsString;
    EdtSetor.Text:= qAux_Setor.FieldByName('Descricao').AsString;
    achou_setor:= true;
  end
  else
  begin
    achou_setor:= false;
    codigo_setor:= 0;

    if (EdtSetor.Text <> '') then
    begin
      EdtCodigo_Setor.Text:= IntToStr(Util.Gera_Codigo_Cadastro('Cadastro_Setor'));
    end
    else
    begin
      EdtCodigo_Setor.Text:= '';
      EdtSetor.Text:= '';
    end;
  end;
end;

procedure TFrmCadastro_Cliente.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  //Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cliente.EdtSetorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not ( (key = 08) or (key = 46) ) and (EdtSetor.Text <> '')then
    Util.Pega_Setor(EdtSetor);
end;

procedure TFrmCadastro_Cliente.EdtTipo_LogradouroKeyPress(Sender: TObject;
  var Key: Char);
begin
  //Util.Somente_Apaga(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Cliente.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Cliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Cliente.Free;
        FrmCadastro_Cliente:= Nil;
      end;
end;

procedure TFrmCadastro_Cliente.FormCreate(Sender: TObject);
begin
  PageControl2.TabIndex:= 0;
  Util.Habilita_Campos(FrmCadastro_Cliente);
  Util.Limpa_Campos(FrmCadastro_Cliente);
  Util.Desabilita_Campos(FrmCadastro_Cliente);
  iniciado:= false;
end;

procedure TFrmCadastro_Cliente.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Cliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      if (iniciado = false) then
      begin
        PageControl2.TabIndex:= 0;
        Util.Habilita_Campos(FrmCadastro_Cliente);
        Util.Limpa_Campos(FrmCadastro_Cliente);
        Gera_Codigo;
        BBtnSalvar.Enabled:= true;
        BBtnExcluir.Enabled:= false;
        BBtnPesquisar.Enabled:= false;
        BBtnCancelar.Enabled:= true;
        achei:= false;
        Atualiza_RadioGroup;
        iniciado:= true;
        MEdtData_Cadastro.SetFocus;
      end;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Cliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Cliente.Gera_Codigo;
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
      add('select max(Codigo) as Codigo from Cadastro_Cliente');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Cliente.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Cliente.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Cliente.MEdtData_NascimentoExit(Sender: TObject);
begin
  if (MEdtData_Nascimento.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtData_Nascimento);
end;

procedure TFrmCadastro_Cliente.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

end.
