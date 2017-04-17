unit UDesmama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmDesmama = class(TForm)
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
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    MEdtData_Desmama: TMaskEdit;
    EdtPiquete: TEdit;
    MMObservacoes: TMemo;
    EdtLote: TEdit;
    EdtAnimal: TEdit;
    EdtMae: TEdit;
    EdtCodigo_Mae: TEdit;
    EdtPeso_Desmama: TEdit;
    CBSecar: TCheckBox;
    Label11: TLabel;
    EdtCodigo_Animal: TEdit;
    MMOObservacoes: TLabel;
    Label1: TLabel;
    EdtCodigo_Piquete: TEdit;
    EdtCodigo_Lote: TEdit;
    EdtDestinacao: TEdit;
    Label4: TLabel;
    EdtCodigo_Destinacao: TEdit;
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
    procedure MEdtData_DesmamaEnter(Sender: TObject);
    procedure MEdtData_DesmamaExit(Sender: TObject);
    procedure EdtCodigo_AnimalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAnimalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMaeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_MaeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_DestinacaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDestinacaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PiqueteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPiqueteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_LoteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLoteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPeso_DesmamaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_AnimalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_DestinacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_PiqueteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_LoteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Util: TUtil;
    Desmama: TDesmama;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
  public
    ativo, enderec, achei: boolean;
    sexo: AnsiString;
  protected
  end;

var
  FrmDesmama: TFrmDesmama;
implementation

uses UDM, UChama_Animal, UChama_Destinacao, UChama_Piquete,
  UChama_Lote, UChama_Desmama;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmDesmama.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmDesmama);
  Util.Desabilita_Campos(FrmDesmama);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmDesmama.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Desmama.Excluir;
      Util.Atualiza_Desmama_Delete;
      Util.Atualiza_Secamento_Desmama;

      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU DESMAMA DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmDesmama);
  end;
end;

procedure TFrmDesmama.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmDesmama.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Desmama, FrmChama_Desmama);
  FrmChama_Desmama.ShowModal;
  FrmChama_Desmama.Free;
end;

procedure TFrmDesmama.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Desmama.Inserir;
          Util.Atualiza_Desmama;

          if (sexo = 'FÊMEA') then
          begin
            Util.Atualiza_Categoria(StrToInt(EdtCodigo_Animal.Text), situacao_crescimento1);
            Util.Atualiza_Categoria_Inicial(StrToInt(EdtCodigo_Animal.Text), situacao_ini_em_crescimento);
          end
          else
          begin
            Util.Atualiza_Categoria(StrToInt(EdtCodigo_Animal.Text), situacao_crescimento1_macho);
            Util.Atualiza_Categoria_Inicial(StrToInt(EdtCodigo_Animal.Text), situacao_ini_em_crescimento_macho);
          end;

          if (CBSecar.Checked) then
          begin
            if (EdtCodigo_Mae.Text <> '') then
            begin
              Util.Atualiza_Secamento_Desmama;
              Util.Atualiza_Categoria(StrToInt(EdtCodigo_Mae.Text), situacao_vaca_seca_gestante);
            end;
          end;

          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'LANÇOU DESMAMA DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), insercao, date);
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
        Desmama.Alterar;
        Util.Atualiza_Desmama;

        if (sexo = 'FÊMEA') then
        begin
          Util.Atualiza_Categoria(StrToInt(EdtCodigo_Animal.Text), situacao_crescimento1);
          Util.Atualiza_Categoria_Inicial(StrToInt(EdtCodigo_Animal.Text), situacao_ini_em_crescimento);
        end
        else
        begin
          Util.Atualiza_Categoria(StrToInt(EdtCodigo_Animal.Text), situacao_crescimento1_macho);
          Util.Atualiza_Categoria_Inicial(StrToInt(EdtCodigo_Animal.Text), situacao_ini_em_crescimento_macho);
        end;

        if (CBSecar.Checked) then
        begin
          if (EdtCodigo_Mae.Text <> '') then
          begin
            Util.Atualiza_Secamento_Desmama;
            Util.Atualiza_Categoria(StrToInt(EdtCodigo_Mae.Text), situacao_vaca_seca_gestante);
          end;
        end;

        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU DESMAMA DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmDesmama);
end;

function TFrmDesmama.Confira: boolean;
begin
  Confira:= false;

  if (EdtCodigo_Animal.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Animal.SetFocus;
    abort;
  end;

  if (EdtPeso_Desmama.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtPeso_Desmama.SetFocus;
    abort;
  end;

  if (MEdtData_Desmama.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtData_Desmama.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmDesmama.EdtAnimalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDesmama.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDesmama.EdtCodigo_AnimalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
    FrmChama_Animal.ShowModal;
    FrmChama_Animal.Free;
  end;
end;

procedure TFrmDesmama.EdtCodigo_AnimalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDesmama.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDesmama.EdtCodigo_DestinacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Destinacao, FrmChama_Destinacao);
    FrmChama_Destinacao.ShowModal;
    FrmChama_Destinacao.Free;
  end;
end;

procedure TFrmDesmama.EdtCodigo_DestinacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDesmama.EdtCodigo_LoteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Lote, FrmChama_Lote);
    FrmChama_Lote.ShowModal;
    FrmChama_Lote.Free;
  end;
end;

procedure TFrmDesmama.EdtCodigo_LoteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDesmama.EdtCodigo_MaeKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDesmama.EdtCodigo_PiqueteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Piquete, FrmChama_Piquete);
    FrmChama_Piquete.ShowModal;
    FrmChama_Piquete.Free;
  end;
end;

procedure TFrmDesmama.EdtCodigo_PiqueteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDesmama.EdtDestinacaoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDesmama.EdtLoteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDesmama.EdtMaeKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDesmama.EdtPeso_DesmamaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmDesmama.EdtPiqueteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDesmama.EdtSetorKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmDesmama.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmDesmama.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmDesmama.Free;
        FrmDesmama:= Nil;
      end;
end;

procedure TFrmDesmama.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmDesmama);
  Util.Limpa_Campos(FrmDesmama);
  Util.Desabilita_Campos(FrmDesmama);
end;

procedure TFrmDesmama.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmDesmama.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmDesmama);
      Util.Limpa_Campos(FrmDesmama);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      EdtPeso_Desmama.Text:= '0';
      MEdtData_Cadastro.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmDesmama.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmDesmama.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Desmama');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmDesmama.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmDesmama.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmDesmama.MEdtData_DesmamaEnter(Sender: TObject);
begin
  MEdtData_Desmama.Text:= DateToStr(date);
end;

procedure TFrmDesmama.MEdtData_DesmamaExit(Sender: TObject);
begin
  if (MEdtData_Desmama.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Desmama);
end;

end.
