unit UAborto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmAborto = class(TForm)
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
    LblMarca: TLabel;
    EdtAnimal: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    MEdtData_Aborto: TMaskEdit;
    EdtNatimortos: TEdit;
    MMObservacao: TMemo;
    EdtVivo: TEdit;
    EdtCodigo_Animal: TEdit;
    CBLactacao: TCheckBox;
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
    procedure EdtCodigo_AnimalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAnimalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_AnimalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_AbortoEnter(Sender: TObject);
    procedure MEdtData_AbortoExit(Sender: TObject);
  private
    Util: TUtil;
    Aborto: TAborto;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
  public
    ativo, enderec, achei: boolean;
    codigo_categoria_animal, crias_vivas, crias_mortas, n_abortos: integer;
  protected
  end;

var
  FrmAborto: TFrmAborto;
implementation

uses UDM, UChama_Animal, UChama_Aborto;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmAborto.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmAborto);
  Util.Desabilita_Campos(FrmAborto);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmAborto.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Aborto.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU ABORTO DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmAborto);
  end;
end;

procedure TFrmAborto.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmAborto.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Aborto, FrmChama_Aborto);
  FrmChama_Aborto.ShowModal;
  FrmChama_Aborto.Free;
end;

procedure TFrmAborto.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Aborto.Inserir;
          Util.Atualiza_Aborto;
          if (CBLactacao.Checked) then
            Util.Atualiza_Categoria(StrToInt(EdtCodigo_Animal.Text), situacao_vaca_lac_vazia_normal)
          else
            Util.Atualiza_Categoria(StrToInt(EdtCodigo_Animal.Text), situacao_vaca_seca_vazia);

          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'LANÇOU ABORTO DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), insercao, date);
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
        Aborto.Alterar;
        Util.Atualiza_Aborto;
        if (CBLactacao.Checked) then
          Util.Atualiza_Categoria(StrToInt(EdtCodigo_Animal.Text), situacao_vaca_lac_vazia_normal)
        else
          Util.Atualiza_Categoria(StrToInt(EdtCodigo_Animal.Text), situacao_vaca_seca_vazia);

        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU ABORTO DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmAborto);
end;

function TFrmAborto.Confira: boolean;
begin
  Confira:= false;

  if (EdtCodigo_Animal.Text = '') then
   begin
     Mensagem.Mensagem_Falta_Dados;
     EdtCodigo_Animal.SetFocus;
     abort;
    end;

  if (EdtNatimortos.Text = '') then
   begin
     Mensagem.Mensagem_Falta_Dados;
     EdtNatimortos.SetFocus;
     abort;
    end;

  if (EdtVivo.Text = '') then
   begin
     Mensagem.Mensagem_Falta_Dados;
     EdtVivo.SetFocus;
     abort;
    end;

  if (MEdtData_Aborto.Text = '  /  /    ') then
   begin
     Mensagem.Mensagem_Falta_Dados;
     MEdtData_Aborto.SetFocus;
     abort;
    end;

   Confira:= true;
end;

procedure TFrmAborto.EdtAnimalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAborto.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAborto.EdtCodigo_AnimalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
    FrmChama_Animal.ShowModal;
    FrmChama_Animal.Free;
  end;
end;

procedure TFrmAborto.EdtCodigo_AnimalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAborto.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAborto.EdtSetorKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmAborto.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmAborto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmAborto.Free;
        FrmAborto:= Nil;
      end;
end;

procedure TFrmAborto.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmAborto);
  Util.Limpa_Campos(FrmAborto);
  Util.Desabilita_Campos(FrmAborto);
end;

procedure TFrmAborto.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmAborto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmAborto);
      Util.Limpa_Campos(FrmAborto);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      EdtVivo.Text:= '0';
      EdtNatimortos.Text:= '0';
      MEdtData_Cadastro.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmAborto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmAborto.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Aborto');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmAborto.MEdtData_AbortoEnter(Sender: TObject);
begin
  MEdtData_Aborto.Text:= DateToStr(date);
end;

procedure TFrmAborto.MEdtData_AbortoExit(Sender: TObject);
begin
  if (MEdtData_Aborto.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Aborto);
end;

procedure TFrmAborto.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmAborto.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

end.
