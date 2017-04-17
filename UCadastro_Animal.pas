unit UCadastro_Animal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmCadastro_Animal = class(TForm)
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
    BBtnPesquisar: TToolButton;
    RGLocalizacao: TRadioGroup;
    LblNome: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label50: TLabel;
    EdtNome: TEdit;
    CmbSexo: TComboBox;
    EdtBrinco: TEdit;
    CmbCategoria: TComboBox;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Label34: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    LblComposicao: TLabel;
    Label11: TLabel;
    Label53: TLabel;
    EdtPai: TEdit;
    GroupBox4: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label44: TLabel;
    Label10: TLabel;
    EdtPeso: TEdit;
    MEdtData_Entrada: TMaskEdit;
    EdtPreco: TEdit;
    EdtAltura: TEdit;
    CMBOrigem: TComboBox;
    EdtUltimo_Peso: TEdit;
    EdtUltima_Altura: TEdit;
    EdtCodigo_Pai: TEdit;
    GroupBox6: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label54: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    EdtRaca1: TEdit;
    EdtSangue1: TEdit;
    EdtRaca2: TEdit;
    EdtSangue2: TEdit;
    EdtRaca3: TEdit;
    EdtSangue3: TEdit;
    EdtRaca4: TEdit;
    EdtSangue4: TEdit;
    EdtSangue11: TEdit;
    EdtSangue22: TEdit;
    EdtSangue33: TEdit;
    EdtSangue44: TEdit;
    CBRaca1: TCheckBox;
    CBRaca2: TCheckBox;
    CBRaca3: TCheckBox;
    CBRaca4: TCheckBox;
    EdtIEP: TEdit;
    TabSheet3: TTabSheet;
    TabSheet9: TTabSheet;
    LblNumero_Aborto: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label18: TLabel;
    Label13: TLabel;
    Label52: TLabel;
    EdtN_Abortos: TEdit;
    EdtN_Partos: TEdit;
    EdtCrias_Vivas: TEdit;
    EdtCrias_Mortas: TEdit;
    Panel1: TPanel;
    RichEdit1: TRichEdit;
    Panel4: TPanel;
    CBDiagnosticada: TCheckBox;
    CBCoberta: TCheckBox;
    CBParida: TCheckBox;
    CBSeca: TCheckBox;
    CBAbortada: TCheckBox;
    CBBaixada: TCheckBox;
    CBVendida: TCheckBox;
    Panel5: TPanel;
    RichEdit3: TRichEdit;
    EdtIdade_Primeiro_Parto: TEdit;
    EdtMedia_Atual: TEdit;
    EdtPenultima_Pesagem_Leite: TEdit;
    EdtUltima_Pesagem_Leite: TEdit;
    EdtCodigo_Ultimo_Reprodutor: TEdit;
    EdtUltimo_Reprodutor: TEdit;
    TabSheet8: TTabSheet;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label12: TLabel;
    Label39: TLabel;
    Label48: TLabel;
    MEdtData_Nascimento: TMaskEdit;
    MaskEdit1: TMaskEdit;
    MEdtData_Desmama: TMaskEdit;
    MEdtNovilha_Apta: TMaskEdit;
    GroupBox2: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label6: TLabel;
    Label22: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    MedtData_Aborto: TMaskEdit;
    MEdtData_Paricao: TMaskEdit;
    MEdtData_Enxerto: TMaskEdit;
    MedtData_Cobertura: TMaskEdit;
    MEdtData_Ultimo_Secamento: TMaskEdit;
    MEdtData_Baixa: TMaskEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label25: TLabel;
    MEdtData_Secamento: TMaskEdit;
    MEdtData_Previsao_Paricao: TMaskEdit;
    MEdtData_Previsao_Cobertura: TMaskEdit;
    Panel3: TPanel;
    RichEdit2: TRichEdit;
    GroupBox5: TGroupBox;
    Label33: TLabel;
    Label42: TLabel;
    MEdtData_Ultima_Pesagem: TMaskEdit;
    MEdtData_Ultima_Medicao: TMaskEdit;
    TabSheet7: TTabSheet;
    Label47: TLabel;
    MmoObservacoes: TMemo;
    Label1: TLabel;
    EdtMae: TEdit;
    EdtCodigo_Mae: TEdit;
    Label2: TLabel;
    EdtCor: TEdit;
    EdtCodigo_Cor: TEdit;
    Label5: TLabel;
    EdtPelagem: TEdit;
    EdtCodigo_Pelagem: TEdit;
    Label14: TLabel;
    EdtPiquete: TEdit;
    EdtCodigo_Piquete: TEdit;
    Label15: TLabel;
    EdtLote_Anterior: TEdit;
    EdtCodigo_Lote_Anterior: TEdit;
    Label16: TLabel;
    EdtLote: TEdit;
    EdtCodigo_Lote: TEdit;
    Label17: TLabel;
    EdtPiquete_Anterior: TEdit;
    EdtCodigo_Piquete_Anterior: TEdit;
    EdtCodigo_Raca1: TEdit;
    EdtCodigo_Raca2: TEdit;
    EdtCodigo_Raca3: TEdit;
    EdtCodigo_Raca4: TEdit;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Data_Cadastro: TDateTimeField;
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
    procedure EdtCodigo_CorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PelagemKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPelagemKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PiqueteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPiqueteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_PelagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_PiqueteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Lote_AnteriorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLote_AnteriorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_LoteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLoteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_LoteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtRaca1KeyPress(Sender: TObject; var Key: Char);
    procedure EdtRaca2KeyPress(Sender: TObject; var Key: Char);
    procedure EdtRaca3KeyPress(Sender: TObject; var Key: Char);
    procedure EdtRaca4KeyPress(Sender: TObject; var Key: Char);
    procedure EdtUltimo_PesoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUltima_AlturaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtIEPKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPesoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAlturaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Piquete_AnteriorKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtPiquete_AnteriorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtN_PartosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtN_AbortosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCrias_VivasKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCrias_MortasKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUltima_Pesagem_LeiteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPenultima_Pesagem_LeiteKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtMedia_AtualKeyPress(Sender: TObject; var Key: Char);
    procedure EdtIdade_Primeiro_PartoKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_NascimentoExit(Sender: TObject);
    procedure MEdtData_DesmamaExit(Sender: TObject);
    procedure MEdtNovilha_AptaExit(Sender: TObject);
    procedure MedtData_CoberturaExit(Sender: TObject);
    procedure MEdtData_EnxertoExit(Sender: TObject);
    procedure MedtData_AbortoExit(Sender: TObject);
    procedure MEdtData_Ultimo_SecamentoExit(Sender: TObject);
    procedure MEdtData_ParicaoExit(Sender: TObject);
    procedure MEdtData_BaixaExit(Sender: TObject);
    procedure MEdtData_SecamentoExit(Sender: TObject);
    procedure MEdtData_Previsao_ParicaoExit(Sender: TObject);
    procedure MEdtData_Previsao_CoberturaExit(Sender: TObject);
    procedure MEdtData_Ultima_PesagemExit(Sender: TObject);
    procedure MEdtData_Ultima_MedicaoExit(Sender: TObject);
    procedure EdtSangue1KeyPress(Sender: TObject; var Key: Char);
    procedure EdtSangue11KeyPress(Sender: TObject; var Key: Char);
    procedure EdtSangue2KeyPress(Sender: TObject; var Key: Char);
    procedure EdtSangue22KeyPress(Sender: TObject; var Key: Char);
    procedure EdtSangue3KeyPress(Sender: TObject; var Key: Char);
    procedure EdtSangue33KeyPress(Sender: TObject; var Key: Char);
    procedure EdtSangue4KeyPress(Sender: TObject; var Key: Char);
    procedure EdtSangue44KeyPress(Sender: TObject; var Key: Char);
    procedure CBRaca1Click(Sender: TObject);
    procedure CBRaca2Click(Sender: TObject);
    procedure CBRaca3Click(Sender: TObject);
    procedure CBRaca4Click(Sender: TObject);
    procedure EdtSangue1Exit(Sender: TObject);
    procedure EdtSangue2Exit(Sender: TObject);
    procedure EdtSangue3Exit(Sender: TObject);
    procedure EdtSangue4Exit(Sender: TObject);
    procedure EdtSangue11Exit(Sender: TObject);
    procedure EdtSangue22Exit(Sender: TObject);
    procedure EdtSangue33Exit(Sender: TObject);
    procedure EdtSangue44Exit(Sender: TObject);
    procedure EdtCodigo_Raca2KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Raca3KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Raca4KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Raca1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Raca1KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Raca2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Raca3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Raca4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CmbSexoExit(Sender: TObject);
    procedure CmbCategoriaExit(Sender: TObject);
    procedure EdtCodigo_PaiKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPaiKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_MaeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMaeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PaiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_MaeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Util: TUtil;
    Animal: TAnimal;
    Mensagem: TMensagem;

    san1, san11, san2, san22, san3, san33, san4, san44: integer;
    res1, res2, res3, res4: double;

    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Escreve_Texto;
    procedure Pega_Categoria;

  public
    ativo, enderec, achei: boolean;
    sigla, categoria_inicial, categoria, Cod_Rep, pai: integer;
    caminho_foto: AnsiString;
  protected
  end;

var
  FrmCadastro_Animal: TFrmCadastro_Animal;
implementation

uses UDM, UChama_Cor, UChama_Pelagem, UChama_Piquete, UChama_Lote,
  UChama_Raca, UChama_Animal;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Animal.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Animal);
  Util.Desabilita_Campos(FrmCadastro_Animal);
  LblComposicao.Caption:= '';
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Animal.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Animal.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU ANIMAL ' + EdtBrinco.Text + ' - ' + EdtNome.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Animal);
  end;
end;

procedure TFrmCadastro_Animal.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCadastro_Animal.BBtnPesquisarClick(Sender: TObject);
begin
  pai:= 0;
  Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
  FrmChama_Animal.ShowModal;
  FrmChama_Animal.Free;
end;

procedure TFrmCadastro_Animal.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Animal.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU ANIMAL ' + EdtBrinco.Text + ' - ' + EdtNome.Text + '.', TimeToStr(time), insercao, date);
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
        Animal.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU ANIMAL ' + EdtBrinco.Text + ' - ' + EdtNome.Text + '.', TimeToStr(time), alteracao, date);
      except
        Mensagem.Impossivel_Executar;
      end;
      end
      else
        exit;
    end;
    Animal.Atualiza_Categoria;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Animal);
end;

procedure TFrmCadastro_Animal.CBRaca1Click(Sender: TObject);
begin
  if CBRaca1.Checked = true then
    begin
      EdtCodigo_Raca1.Enabled:= true;
      EdtRaca1.Enabled:= true;
      EdtSangue1.Enabled:= true;
      EdtSangue11.Enabled:= true;
    end
    else
    begin
      EdtCodigo_Raca1.Enabled:= false;
      EdtRaca1.Enabled:= false;
      EdtSangue1.Enabled:= false;
      EdtSangue11.Enabled:= false;
    end;
end;

procedure TFrmCadastro_Animal.CBRaca2Click(Sender: TObject);
begin
  if CBRaca2.Checked = true then
    begin
      EdtCodigo_Raca2.Enabled:= true;
      EdtRaca2.Enabled:= true;
      EdtSangue2.Enabled:= true;
      EdtSangue22.Enabled:= true;
    end
    else
    begin
      EdtCodigo_Raca2.Enabled:= false;
      EdtRaca2.Enabled:= false;
      EdtSangue2.Enabled:= false;
      EdtSangue22.Enabled:= false;
    end;

end;

procedure TFrmCadastro_Animal.CBRaca3Click(Sender: TObject);
begin
  if CBRaca3.Checked = true then
    begin
      EdtCodigo_Raca3.Enabled:= true;
      EdtRaca3.Enabled:= true;
      EdtSangue3.Enabled:= true;
      EdtSangue33.Enabled:= true;
    end
    else
    begin
      EdtCodigo_Raca3.Enabled:= false;
      EdtRaca3.Enabled:= false;
      EdtSangue3.Enabled:= false;
      EdtSangue33.Enabled:= false;
    end;
end;

procedure TFrmCadastro_Animal.CBRaca4Click(Sender: TObject);
begin
  if CBRaca4.Checked = true then
    begin
      EdtCodigo_Raca4.Enabled:= true;
      EdtRaca4.Enabled:= true;
      EdtSangue4.Enabled:= true;
      EdtSangue44.Enabled:= true;
    end
    else
    begin
      EdtCodigo_Raca4.Enabled:= false;
      EdtRaca4.Enabled:= false;
      EdtSangue4.Enabled:= false;
      EdtSangue44.Enabled:= false;
    end;
end;

procedure TFrmCadastro_Animal.CmbCategoriaExit(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.add('select * from Cadastro_Categoria CC');
    sql.add('where CC.Descricao = :Descricao');
    Parameters.ParamByName('Descricao').Value:= CmbCategoria.Text;
    open;
  end;
  categoria_inicial:= ADOQuery1Codigo.AsInteger;
end;

procedure TFrmCadastro_Animal.CmbSexoExit(Sender: TObject);
begin
  Pega_Categoria;
end;

function TFrmCadastro_Animal.Confira: boolean;
begin
  Confira:= false;

  if (trim(CmbSexo.Text)= '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    CmbSexo.SetFocus;
    abort;
  end;

  if (trim(CmbCategoria.Text)= '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    CmbCategoria.SetFocus;
    abort;
  end;

  if (LblComposicao.Visible = false) then
  begin
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;

  if (categoria_inicial = situacao_ini_em_crescimento) or
   (categoria_inicial = situacao_ini_em_crescimento_macho) or
   (categoria_inicial = situacao_ini_lactante) or
   (categoria_inicial = situacao_ini_lactante_macho) or
   (categoria_inicial = situacao_ini_novilha) then
  begin
    if (MEdtData_Nascimento.Text = '  /  /    ') then
    begin
      Mensagem.Mensagem_Falta_Dados;
      PageControl2.TabIndex:= 3;
      MEdtData_Nascimento.SetFocus;
      abort;
    end;
  end;

  Confira:= true;
end;

procedure TFrmCadastro_Animal.EdtAlturaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Animal.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCodigo_CorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cor, FrmChama_Cor);
    FrmChama_Cor.ShowModal;
    FrmChama_Cor.Free;
  end;
end;

procedure TFrmCadastro_Animal.EdtCodigo_CorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCodigo_LoteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Lote, FrmChama_Lote);
    FrmChama_Lote.ShowModal;
    FrmChama_Lote.Free;
  end;
end;

procedure TFrmCadastro_Animal.EdtCodigo_LoteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCodigo_Lote_AnteriorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCodigo_MaeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    pai:= 2;
    Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
    FrmChama_Animal.ShowModal;
    FrmChama_Animal.Free;
  end;
end;

procedure TFrmCadastro_Animal.EdtCodigo_MaeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCodigo_PaiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    pai:= 1;
    Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
    FrmChama_Animal.ShowModal;
    FrmChama_Animal.Free;
  end;
end;

procedure TFrmCadastro_Animal.EdtCodigo_PaiKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCodigo_PelagemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Pelagem, FrmChama_Pelagem);
    FrmChama_Pelagem.ShowModal;
    FrmChama_Pelagem.Free;
  end;
end;

procedure TFrmCadastro_Animal.EdtCodigo_PelagemKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCodigo_PiqueteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Piquete, FrmChama_Piquete);
    FrmChama_Piquete.ShowModal;
    FrmChama_Piquete.Free;
  end;
end;

procedure TFrmCadastro_Animal.EdtCodigo_PiqueteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCodigo_Piquete_AnteriorKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCodigo_Raca1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    sigla:= 1;
    Application.CreateForm(TFrmChama_Raca, FrmChama_Raca);
    FrmChama_Raca.ShowModal;
    FrmChama_Raca.Free;
  end;
end;

procedure TFrmCadastro_Animal.EdtCodigo_Raca1KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCodigo_Raca2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    sigla:= 2;
    Application.CreateForm(TFrmChama_Raca, FrmChama_Raca);
    FrmChama_Raca.ShowModal;
    FrmChama_Raca.Free;
  end;
end;

procedure TFrmCadastro_Animal.EdtCodigo_Raca2KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCodigo_Raca3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    sigla:= 3;
    Application.CreateForm(TFrmChama_Raca, FrmChama_Raca);
    FrmChama_Raca.ShowModal;
    FrmChama_Raca.Free;
  end;
end;

procedure TFrmCadastro_Animal.EdtCodigo_Raca3KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCodigo_Raca4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    sigla:= 4;
    Application.CreateForm(TFrmChama_Raca, FrmChama_Raca);
    FrmChama_Raca.ShowModal;
    FrmChama_Raca.Free;
  end;
end;

procedure TFrmCadastro_Animal.EdtCodigo_Raca4KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtCrias_MortasKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Animal.EdtCrias_VivasKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Animal.EdtIdade_Primeiro_PartoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Animal.EdtIEPKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Animal.EdtLoteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtLote_AnteriorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtMaeKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtMedia_AtualKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Animal.EdtN_AbortosKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Animal.EdtN_PartosKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Animal.EdtPaiKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtPelagemKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtPenultima_Pesagem_LeiteKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Animal.EdtPesoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Animal.EdtPiqueteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtPiquete_AnteriorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Animal.EdtRaca1KeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtRaca2KeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtRaca3KeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtRaca4KeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtSangue11Exit(Sender: TObject);
begin
  if (EdtSangue11.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtSangue11.SetFocus;
    abort;
  end;

  san11:= StrToInt(EdtSangue11.Text);
  res1:= san1/san11;

  if (EdtSangue1.Text = '1') and (EdtSangue11.Text = '1') then
    begin
      LblComposicao.Visible:= true;
      LblComposicao.Caption:= EdtRaca1.Text;
    end;
end;

procedure TFrmCadastro_Animal.EdtSangue11KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Animal.EdtSangue1Exit(Sender: TObject);
begin
  if (EdtSangue1.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtSangue1.SetFocus;
    abort;
  end;

  san1:= StrToInt(EdtSangue1.Text);
end;

procedure TFrmCadastro_Animal.EdtSangue1KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Animal.EdtSangue22Exit(Sender: TObject);
begin
  if (EdtSangue22.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtSangue22.SetFocus;
    abort;
  end;

  san22:= StrToInt(EdtSangue22.Text);
  res2:= san2/san22;

  if ((res1 + res2) = 1) then
  begin
    LblComposicao.Visible:= true;
    if (res1 > res2) then
      LblComposicao.Caption:= EdtSangue1.Text + '/' + EdtSangue11.Text + ' ' + EdtRaca1.Text + ', ' + EdtRaca2.Text
    else
      LblComposicao.Caption:= EdtSangue2.Text + '/' + EdtSangue22.Text + ' ' + EdtRaca2.Text + ', ' + EdtRaca1.Text;

    CMBOrigem.SetFocus;
  end
  else if ((res1 + res2) > 1) then
  begin
    Mensagem.Fracao_Invalida;
    CBRaca2.SetFocus;
  end;

end;

procedure TFrmCadastro_Animal.EdtSangue22KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Animal.EdtSangue2Exit(Sender: TObject);
begin
  if (EdtSangue2.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtSangue2.SetFocus;
    abort;
  end
  else
    san2:= StrToInt(EdtSangue2.Text);
end;

procedure TFrmCadastro_Animal.EdtSangue2KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Animal.EdtSangue33Exit(Sender: TObject);
begin
  if (EdtSangue33.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtSangue33.SetFocus;
    abort;
  end;

  san33:= StrToInt(EdtSangue33.Text);
  res3:= san3/san33;

  if ((res1 + res2 + res3) = 1) then
  begin
    LblComposicao.Visible:= true;
    if (res1 > res2) and (res1 > res3) and (res2 > res3) then
      LblComposicao.Caption:= EdtSangue1.Text + '/' + EdtSangue11.Text + ' ' + EdtRaca1.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca3.Text
    else if (res2 > res1) and (res2 > res3) and (res1 > res3) then
      LblComposicao.Caption:= EdtSangue2.Text + '/' + EdtSangue22.Text + ' ' + EdtRaca2.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca3.Text
    else if (res3 > res1) and (res3 > res2) and (res2 > res1) then
      LblComposicao.Caption:= EdtSangue3.Text + '/' + EdtSangue33.Text + ' ' + EdtRaca3.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca1.Text
    else if (res2 > res3) and (res2 > res1) and (res3 > res1) then
      LblComposicao.Caption:= EdtSangue2.Text + '/' + EdtSangue22.Text + ' ' + EdtRaca2.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca1.Text
    else if (res3 > res1) and (res3 > res2) and (res1 > res2) then
      LblComposicao.Caption:= EdtSangue3.Text + '/' + EdtSangue33.Text + ' ' + EdtRaca3.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca2.Text
    else if (res1 > res2) and (res1 > res3) and (res3 > res2) then
      LblComposicao.Caption:= EdtSangue1.Text + '/' + EdtSangue11.Text + ' ' + EdtRaca1.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca2.Text
    else if (res1 = res2) and (res1 <> res3) then
    begin
      if (res1 > res3) then
        LblComposicao.Caption:= EdtSangue1.Text + '/' + EdtSangue11.Text + ' ' + EdtRaca1.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca3.Text
      else
        LblComposicao.Caption:= EdtSangue3.Text + '/' + EdtSangue33.Text + ' ' + EdtRaca3.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca2.Text;
    end
    else if (res1 = res3) and (res1 <> res2) then
    begin
      if (res1 > res2) then
        LblComposicao.Caption:= EdtSangue1.Text + '/' + EdtSangue11.Text + ' ' + EdtRaca1.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca2.Text
      else
        LblComposicao.Caption:= EdtSangue2.Text + '/' + EdtSangue22.Text + ' ' + EdtRaca2.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca3.Text;
    end
    else if (res2 = res3) and (res2 <> res1) then
    begin
      if (res2 > res1) then
        LblComposicao.Caption:= EdtSangue2.Text + '/' + EdtSangue22.Text + ' ' + EdtRaca2.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca1.Text
      else
        LblComposicao.Caption:= EdtSangue1.Text + '/' + EdtSangue11.Text + ' ' + EdtRaca1.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca3.Text;
    end
    else if (res2 = res1) and (res2 <> res3) then
    begin
      if (res2 > res3) then
        LblComposicao.Caption:= EdtSangue2.Text + '/' + EdtSangue22.Text + ' ' + EdtRaca2.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca3.Text
      else
        LblComposicao.Caption:= EdtSangue3.Text + '/' + EdtSangue33.Text + ' ' + EdtRaca3.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca1.Text;
    end
    else if (res3 = res1) and (res3 <> res2) then
    begin
      if (res3 > res2) then
        LblComposicao.Caption:= EdtSangue3.Text + '/' + EdtSangue33.Text + ' ' + EdtRaca3.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca2.Text
      else
        LblComposicao.Caption:= EdtSangue2.Text + '/' + EdtSangue22.Text + ' ' + EdtRaca2.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca1.Text;
    end
    else if (res3 = res2) and (res3 <> res1) then
    begin
      if (res3 > res1) then
        LblComposicao.Caption:= EdtSangue3.Text + '/' + EdtSangue33.Text + ' ' + EdtRaca3.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca1.Text
      else
        LblComposicao.Caption:= EdtSangue1.Text + '/' + EdtSangue11.Text + ' ' + EdtRaca1.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca2.Text;
    end;

    CMBOrigem.SetFocus;
  end
  else if ((res1 + res2 + res3) > 1) then
  begin
    Mensagem.Fracao_Invalida;
    CBRaca2.SetFocus;
  end;
end;

procedure TFrmCadastro_Animal.EdtSangue33KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Animal.EdtSangue3Exit(Sender: TObject);
begin
  if (EdtSangue3.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtSangue3.SetFocus;
    abort;
  end
  else
    san3:= StrToInt(EdtSangue3.Text);
end;

procedure TFrmCadastro_Animal.EdtSangue3KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Animal.EdtSangue44Exit(Sender: TObject);
begin
  if (EdtSangue44.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtSangue44.SetFocus;
    abort;
  end;

  san44:= StrToInt(EdtSangue44.Text);
  res4:= san4/san44;

  if ((res1 + res2 + res3 + res4) = 1) then
  begin
    LblComposicao.Visible:= true;
    if (res1 > res2) and (res1 > res3) and (res1 > res4) and (res2 > res3) and (res2> res4) and (res3 > res4) then
      LblComposicao.Caption:= EdtSangue1.Text + '/' + EdtSangue11.Text + ' ' + EdtRaca1.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca4.Text
    else if (res2 > res3) and (res2 > res4) and (res2 > res1) and (res3 > res4) and (res3 > res1) and (res4 > res1) then
      LblComposicao.Caption:= EdtSangue2.Text + '/' + EdtSangue22.Text + ' ' + EdtRaca2.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca4.Text + ', ' + EdtRaca1.Text
    else if (res3 > res4) and (res3 > res1) and (res3 > res2) and (res4 > res1) and (res4 > res2) and (res1 > res2) then
      LblComposicao.Caption:= EdtSangue3.Text + '/' + EdtSangue33.Text + ' ' + EdtRaca3.Text + ', ' + EdtRaca4.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca2.Text
    else if (res4 > res1) and (res4 > res2) and (res4 > res3) and (res1 > res2) and (res1 > res3) and (res2 > res3) then
      LblComposicao.Caption:= EdtSangue4.Text + '/' + EdtSangue44.Text + ' ' + EdtRaca4.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca3.Text

    else if (res1 > res3) and (res1 > res2) and (res1 > res4) and (res3 > res2) and (res3 > res4) and (res2 > res4) then
      LblComposicao.Caption:= EdtSangue1.Text + '/' + EdtSangue11.Text + ' ' + EdtRaca1.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca4.Text
    else if (res2 > res4) and (res2 > res3) and (res2 > res1) and (res4 > res3) and (res4 > res1) and (res3 > res1) then
      LblComposicao.Caption:= EdtSangue2.Text + '/' + EdtSangue22.Text + ' ' + EdtRaca2.Text + ', ' + EdtRaca4.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca1.Text
    else if (res3 > res1) and (res3 > res4) and (res3 > res2) and (res1 > res4) and (res1 > res2) and (res4 > res2) then
      LblComposicao.Caption:= EdtSangue3.Text + '/' + EdtSangue33.Text + ' ' + EdtRaca3.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca4.Text + ', ' + EdtRaca2.Text
    else if (res4 > res2) and (res4 > res1) and (res4 > res3) and (res2 > res1) and (res2 > res3) and (res1 > res3) then
      LblComposicao.Caption:= EdtSangue4.Text + '/' + EdtSangue44.Text + ' ' + EdtRaca4.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca3.Text

    else if (res3 > res1) and (res3 > res2) and (res3 > res4) and (res1 > res2) and (res1 > res4) and (res2 > res4) then
      LblComposicao.Caption:= EdtSangue3.Text + '/' + EdtSangue33.Text + ' ' + EdtRaca3.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca4.Text
    else if (res4 > res2) and (res4 > res3) and (res4 > res1) and (res2 > res3) and (res2 > res1) and (res3 > res1) then
      LblComposicao.Caption:= EdtSangue4.Text + '/' + EdtSangue44.Text + ' ' + EdtRaca4.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca1.Text
    else if (res1 > res3) and (res1 > res4) and (res1 > res2) and (res3 > res4) and (res3 > res2) and (res4 > res2) then
      LblComposicao.Caption:= EdtSangue1.Text + '/' + EdtSangue11.Text + ' ' + EdtRaca1.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca4.Text + ', ' + EdtRaca2.Text
    else if (res2 > res4) and (res2 > res1) and (res2 > res3) and (res4 > res1) and (res4 > res3) and (res1 > res3) then
      LblComposicao.Caption:= EdtSangue2.Text + '/' + EdtSangue22.Text + ' ' + EdtRaca2.Text + ', ' + EdtRaca4.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca3.Text

    else if (res3 > res4) and (res3 > res2) and (res3 > res1) and (res4 > res2) and (res4 > res1) and (res2 > res1) then
      LblComposicao.Caption:= EdtSangue3.Text + '/' + EdtSangue33.Text + ' ' + EdtRaca3.Text + ', ' + EdtRaca4.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca1.Text
    else if (res4 > res1) and (res4 > res3) and (res4 > res2) and (res1 > res3) and (res1 > res2) and (res3 > res2) then
      LblComposicao.Caption:= EdtSangue4.Text + '/' + EdtSangue44.Text + ' ' + EdtRaca4.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca2.Text
    else if (res1 > res2) and (res1 > res4) and (res1 > res3) and (res2 > res4) and (res2 > res3) and (res4 > res3) then
      LblComposicao.Caption:= EdtSangue1.Text + '/' + EdtSangue11.Text + ' ' + EdtRaca1.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca4.Text + ', ' + EdtRaca3.Text
    else if (res2 > res3) and (res2 > res1) and (res2 > res4) and (res3 > res1) and (res3 > res4) and (res1 > res4) then
      LblComposicao.Caption:= EdtSangue2.Text + '/' + EdtSangue22.Text + ' ' + EdtRaca2.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca4.Text

    else if (res2 > res1) and (res2 > res3) and (res2 > res4) and (res1 > res3) and (res1 > res4) and (res3 > res4) then
      LblComposicao.Caption:= EdtSangue2.Text + '/' + EdtSangue22.Text + ' ' + EdtRaca2.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca4.Text
    else if (res3 > res2) and (res3 > res4) and (res3 > res1) and (res2 > res4) and (res2 > res1) and (res4 > res1) then
      LblComposicao.Caption:= EdtSangue3.Text + '/' + EdtSangue33.Text + ' ' + EdtRaca3.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca4.Text + ', ' + EdtRaca1.Text
    else if (res4 > res3) and (res4 > res1) and (res4 > res2) and (res3 > res1) and (res3 > res2) and (res1 > res2) then
      LblComposicao.Caption:= EdtSangue4.Text + '/' + EdtSangue44.Text + ' ' + EdtRaca4.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca2.Text
    else if (res1 > res4) and (res1 > res2) and (res1 > res3) and (res4 > res2) and (res4 > res3) and (res2 > res3) then
      LblComposicao.Caption:= EdtSangue1.Text + '/' + EdtSangue11.Text + ' ' + EdtRaca1.Text + ', ' + EdtRaca4.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca3.Text

    else if (res4 > res3) and (res4 > res2) and (res4 > res1) and (res3 > res2) and (res3 > res1) and (res2 > res1) then
      LblComposicao.Caption:= EdtSangue4.Text + '/' + EdtSangue44.Text + ' ' + EdtRaca4.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca1.Text
    else if (res1 > res4) and (res1 > res3) and (res1 > res2) and (res4 > res3) and (res4 > res2) and (res3 > res2) then
      LblComposicao.Caption:= EdtSangue1.Text + '/' + EdtSangue11.Text + ' ' + EdtRaca1.Text + ', ' + EdtRaca4.Text + ', ' + EdtRaca3.Text + ', ' + EdtRaca2.Text
    else if (res2 > res1) and (res2 > res4) and (res2 > res3) and (res1 > res4) and (res1 > res3) and (res4 > res3) then
      LblComposicao.Caption:= EdtSangue2.Text + '/' + EdtSangue22.Text + ' ' + EdtRaca2.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca4.Text + ', ' + EdtRaca3.Text
    else if (res3 > res2) and (res3 > res1) and (res3 > res4) and (res2 > res1) and (res2 > res4) and (res1 > res4) then
      LblComposicao.Caption:= EdtSangue3.Text + '/' + EdtSangue33.Text + ' ' + EdtRaca3.Text + ', ' + EdtRaca2.Text + ', ' + EdtRaca1.Text + ', ' + EdtRaca4.Text
  end
  else if ((res1 + res2 + res3 + res4) > 1) then
  begin
    Mensagem.Fracao_Invalida;
    CBRaca4.SetFocus;
  end
  else if ((res1 + res2 + res3 + res4) < 1) then
  begin
    Mensagem.Composicao_Racial_Invalida;
    CBRaca4.SetFocus;
  end;
end;

procedure TFrmCadastro_Animal.EdtSangue44KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Animal.EdtSangue4Exit(Sender: TObject);
begin
  if (EdtSangue4.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtSangue4.SetFocus;
    abort;
  end
  else
    san4:= StrToInt(EdtSangue4.Text);
end;

procedure TFrmCadastro_Animal.EdtSangue4KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Animal.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Animal.EdtUltima_AlturaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Animal.EdtUltima_Pesagem_LeiteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Animal.EdtUltimo_PesoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Animal.Escreve_Texto;
begin
  caminho_foto:= '';
  LblComposicao.Caption:= '';
  LblComposicao.Visible:= false;
  EdtN_Partos.Text:= '0';
  EdtIEP.Text:= '0';
  EdtN_Abortos.Text:= '0';
  EdtCrias_Vivas.Text:= '0';
  EdtCrias_Mortas.Text:= '0';
  EdtIdade_Primeiro_Parto.Text:= '0';
  EdtPeso.Text:= '0';
  EdtAltura.Text:= '0';
  EdtPreco.Text:= '0';
  EdtUltimo_Peso.Text:= '0';
  EdtUltima_Altura.Text:= '0';
  EdtUltima_Pesagem_Leite.Text:= '0';
  EdtPenultima_Pesagem_Leite.Text:= '0';
  EdtMedia_Atual.Text:= '0';
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Animal.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Animal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Animal.Free;
        FrmCadastro_Animal:= Nil;
      end;
end;

procedure TFrmCadastro_Animal.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Animal);
  Util.Limpa_Campos(FrmCadastro_Animal);
  Util.Desabilita_Campos(FrmCadastro_Animal);
  LblComposicao.Caption:= '';
end;

procedure TFrmCadastro_Animal.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Animal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Animal);
      Util.Limpa_Campos(FrmCadastro_Animal);
      TabSheet1.Enabled:= true;
      PageControl1.TabIndex:= 0;
      PageControl2.TabIndex:= 0;
      Escreve_Texto;
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      LblComposicao.Caption:= '';
      MEdtData_Cadastro.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Animal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Animal.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cadastro_Animal');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Animal.MedtData_AbortoExit(Sender: TObject);
begin
  if (MedtData_Aborto.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MedtData_Aborto);
end;

procedure TFrmCadastro_Animal.MEdtData_BaixaExit(Sender: TObject);
begin
  if (MEdtData_Baixa.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Baixa);
end;

procedure TFrmCadastro_Animal.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Animal.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Animal.MedtData_CoberturaExit(Sender: TObject);
begin
  if (MedtData_Cobertura.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MedtData_Cobertura);

end;

procedure TFrmCadastro_Animal.MEdtData_DesmamaExit(Sender: TObject);
begin
  if (MEdtData_Desmama.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Desmama);
end;

procedure TFrmCadastro_Animal.MEdtData_EnxertoExit(Sender: TObject);
begin
  if (MEdtData_Enxerto.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Enxerto);

end;

procedure TFrmCadastro_Animal.MEdtData_NascimentoExit(Sender: TObject);
begin
  if (MEdtData_Nascimento.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Nascimento);
end;

procedure TFrmCadastro_Animal.MEdtData_ParicaoExit(Sender: TObject);
begin
  if (MEdtData_Paricao.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Paricao);
end;

procedure TFrmCadastro_Animal.MEdtData_Previsao_CoberturaExit(Sender: TObject);
begin
  if (MEdtData_Previsao_Cobertura.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Previsao_Cobertura);
end;

procedure TFrmCadastro_Animal.MEdtData_Previsao_ParicaoExit(Sender: TObject);
begin
  if (MEdtData_Previsao_Paricao.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Previsao_Paricao);
end;

procedure TFrmCadastro_Animal.MEdtData_SecamentoExit(Sender: TObject);
begin
  if (MEdtData_Secamento.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Secamento);
end;

procedure TFrmCadastro_Animal.MEdtData_Ultima_MedicaoExit(Sender: TObject);
begin
  if (MEdtData_Ultima_Medicao.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Ultima_Medicao);
end;

procedure TFrmCadastro_Animal.MEdtData_Ultima_PesagemExit(Sender: TObject);
begin
  if (MEdtData_Ultima_Pesagem.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Ultima_Pesagem);
end;

procedure TFrmCadastro_Animal.MEdtData_Ultimo_SecamentoExit(Sender: TObject);
begin
  if (MEdtData_Ultimo_Secamento.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Ultimo_Secamento);
end;

procedure TFrmCadastro_Animal.MEdtNovilha_AptaExit(Sender: TObject);
begin
  if (MEdtNovilha_Apta.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtNovilha_Apta);

end;

procedure TFrmCadastro_Animal.Pega_Categoria;
begin
  if (CmbSexo.Text = 'MACHO') then
    begin
      CmbCategoria.Clear;
      with ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_lactante_macho;
        open;
      end;
      CmbCategoria.Items.Add(ADOQuery1.FieldByName('Descricao').AsString);

      with ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_em_crescimento_macho;
        open;
      end;
      CmbCategoria.Items.Add(ADOQuery1.FieldByName('Descricao').AsString);

      with ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_reprodutor;
        open;
      end;
      CmbCategoria.Items.Add(ADOQuery1.FieldByName('Descricao').AsString);

      with ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_rufiao;
        open;
      end;
      CmbCategoria.Items.Add(ADOQuery1.FieldByName('Descricao').AsString);

      with ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_boi_carreiro;
        open;
      end;
      CmbCategoria.Items.Add(ADOQuery1.FieldByName('Descricao').AsString);
    end
    else
    begin
      CmbCategoria.Clear;
      CmbCategoria.ItemIndex:= -1;
      with ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_lactante;
        open;
      end;
      CmbCategoria.Items.Add(ADOQuery1.FieldByName('Descricao').AsString);

      with ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_em_crescimento;
        open;
      end;
      CmbCategoria.Items.Add(ADOQuery1.FieldByName('Descricao').AsString);

      with ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_novilha;
        open;
      end;
      CmbCategoria.Items.Add(ADOQuery1.FieldByName('Descricao').AsString);

      with ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_matriz;
        open;
      end;
      CmbCategoria.Items.Add(ADOQuery1.FieldByName('Descricao').AsString);
    end;
end;

end.
