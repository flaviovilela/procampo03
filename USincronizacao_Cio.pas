unit USincronizacao_Cio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios, DateUtils;

type
  TFrmSincronizacao_Cio = class(TForm)
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
    LblAnimal: TLabel;
    EdtAnimal: TEdit;
    DBGrid2: TDBGrid;
    EdtCodigo_Animal: TEdit;
    Panel1: TPanel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    LblData_Cadastro: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    MEdtData_Sincronizacao: TMaskEdit;
    MEdtData_Cobertura: TMaskEdit;
    MEdtHora: TMaskEdit;
    MEdtHora_Cobertura: TMaskEdit;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Codigo_Animal: TIntegerField;
    ADOQuery1Animal: TStringField;
    Label4: TLabel;
    EdtTotal_Animais: TEdit;
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
    procedure EdtCodigo_AnimalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAnimalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_AnimalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_SincronizacaoEnter(Sender: TObject);
    procedure MEdtData_CoberturaEnter(Sender: TObject);
    procedure MEdtData_SincronizacaoExit(Sender: TObject);
    procedure MEdtData_CoberturaExit(Sender: TObject);
    procedure EdtAnimalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Util: TUtil;
    Padrao: TSincronizacao_Cio;
    IA: TAnimal_Sincronizacao_Cio;
    Mensagem: TMensagem;
    qtde: integer;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Limpa_Menor;
  public
    ativo, enderec, achei: boolean;
    procedure Atualiza_Dados;
  protected
  end;

var
  FrmSincronizacao_Cio: TFrmSincronizacao_Cio;
implementation

uses UDM, UChama_Animal, UChama_Sincronizacao_Cio;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmSincronizacao_Cio.Atualiza_Dados;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select ASS.*, CA.Brinco + ' + QuotedStr(' - ') + ' + CA.Nome as Animal from Animais_Sincronizacao_Cio ASS');
    add('left join Cadastro_Animal CA on (ASS.Codigo_Animal = CA.Codigo)');
    add('where ASS.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmSincronizacao_Cio.BBtnCancelarClick(Sender: TObject);
begin
  if (achei = false) then
    IA.Excluir;
  Util.Limpa_Campos(FrmSincronizacao_Cio);
  Util.Desabilita_Campos(FrmSincronizacao_Cio);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmSincronizacao_Cio.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Padrao.Excluir;
      IA.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU SINCRONIZAÇÃO DE CIO ' + MEdtData_Sincronizacao.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmSincronizacao_Cio);
  end;
end;

procedure TFrmSincronizacao_Cio.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmSincronizacao_Cio.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Sincronizacao_Cio, FrmChama_Sincronizacao_Cio);
  FrmChama_Sincronizacao_Cio.ShowModal;
  FrmChama_Sincronizacao_Cio.Free;
end;

procedure TFrmSincronizacao_Cio.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      try
        Padrao.Inserir;
        Mensagem.Confirma_Insercao;
        Util.Insere_Historico(usuario, 'REGISTROU SINCRONIZAÇÃO DE CIO ' + MEdtData_Sincronizacao.Text + '.', TimeToStr(time), insercao, date);
      except
        Mensagem.Impossivel_Executar;
      end;
    end
    else
    begin
      try
        Padrao.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU SINCRONIZAÇÃO DE CIO ' + MEdtData_Sincronizacao.Text + '.', TimeToStr(time), alteracao, date);
      except
        Mensagem.Impossivel_Executar;
      end;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmSincronizacao_Cio);
end;

function TFrmSincronizacao_Cio.Confira: boolean;
begin
  Confira:= false;

  if (EdtCodigo_Animal.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Animal.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmSincronizacao_Cio.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_DELETE) then
  begin
    if (Mensagem.Confirma_Exclusao) then
    begin
      IA.Excluir_Selecionado;
      Atualiza_Dados;
      qtde:= StrToInt(EdtTotal_Animais.Text);
      EdtTotal_Animais.Text:= IntToStr(qtde - 1);
      Limpa_Menor;
      EdtCodigo_Animal.SetFocus;
    end;

  end;
end;

procedure TFrmSincronizacao_Cio.EdtCodigo_AnimalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
    FrmChama_Animal.ShowModal;
    FrmChama_Animal.Free;
  end;
end;

procedure TFrmSincronizacao_Cio.EdtCodigo_AnimalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmSincronizacao_Cio.EdtAnimalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) then
  begin
    if Confira then
    begin
      IA.Inserir;
      Atualiza_Dados;
      qtde:= StrToInt(EdtTotal_Animais.Text);
      EdtTotal_Animais.Text:= IntToStr(qtde + 1);
      Mensagem.Confirma_Insercao;
      Limpa_Menor;
      EdtCodigo_Animal.SetFocus;
    end;
  end;
end;

procedure TFrmSincronizacao_Cio.EdtAnimalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmSincronizacao_Cio.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmSincronizacao_Cio.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmSincronizacao_Cio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmSincronizacao_Cio.Free;
        FrmSincronizacao_Cio:= Nil;
      end;
end;

procedure TFrmSincronizacao_Cio.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmSincronizacao_Cio);
  Util.Limpa_Campos(FrmSincronizacao_Cio);
  Util.Desabilita_Campos(FrmSincronizacao_Cio);
end;

procedure TFrmSincronizacao_Cio.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmSincronizacao_Cio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmSincronizacao_Cio);
      Util.Limpa_Campos(FrmSincronizacao_Cio);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      Gera_Codigo;
      EdtTotal_Animais.Text:= '0';
      MEdtData_Sincronizacao.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmSincronizacao_Cio.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmSincronizacao_Cio.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Sincronizacao_Cio');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmSincronizacao_Cio.Limpa_Menor;
begin
  EdtCodigo_Animal.Clear;
  EdtAnimal.Clear;
end;

procedure TFrmSincronizacao_Cio.MEdtData_CoberturaEnter(Sender: TObject);
var
  data: TDate;
begin
  data:= incday(StrToDateTime(MEdtData_Sincronizacao.Text), dias_cobertura_sincronizacao);
  MEdtData_Cobertura.Text:= DateToStr(data);
end;

procedure TFrmSincronizacao_Cio.MEdtData_CoberturaExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cobertura);
end;

procedure TFrmSincronizacao_Cio.MEdtData_SincronizacaoEnter(Sender: TObject);
begin
  MEdtData_Sincronizacao.Text:= DateToStr(date);
end;

procedure TFrmSincronizacao_Cio.MEdtData_SincronizacaoExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Sincronizacao);
end;

end.
