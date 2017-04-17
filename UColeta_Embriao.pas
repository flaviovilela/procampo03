unit UColeta_Embriao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmColega_Embriao = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Coleta: TMaskEdit;
    LblData_Cadastro: TLabel;
    BBtnPesquisar: TToolButton;
    LblMarca: TLabel;
    EdtAnimal: TEdit;
    EdtCodigo_Animal: TEdit;
    Label1: TLabel;
    EdtPai: TEdit;
    EdtCodigo_Pai: TEdit;
    Label2: TLabel;
    EdtResponsavel: TEdit;
    Label11: TLabel;
    MMOObservacoes: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    EdtEstrutura_Viavel: TEdit;
    EdtEstrutura_Inviavel: TEdit;
    CheckBox1: TCheckBox;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_ColetaEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure MEdtData_ColetaExit(Sender: TObject);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtCodigo_AnimalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_AnimalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_PaiKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PaiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtPaiKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAnimalKeyPress(Sender: TObject; var Key: Char);
  private
    Util: TUtil;
    Padrao: TColeta_Embriao;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Atualiza_Estoque;
  public
    ativo, enderec, achei: boolean;
    codigo_categoria_animal, crias_vivas, crias_mortas, n_abortos, mae: integer;
  protected
  end;

var
  FrmColega_Embriao: TFrmColega_Embriao;
implementation

uses UDM, UChama_Animal, UChama_Coleta_Embriao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmColega_Embriao.Atualiza_Estoque;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select CP.Codigo, CP.Quantidade_Estoque, CP.Codigo_Animal_Reprodutor from Cadastro_Produtos CP');
      add('where CP.Codigo_Animal_Reprodutor = :Codigo_Animal_Reprodutor');
      Parameters.ParamByName('Codigo_Animal_Reprodutor').Value:= StrToInt(EdtCodigo_Animal.Text);
      open;

      if (IsEmpty = false) then
      begin
        Util.Atualiza_Estoque(qAux.FieldByName('Codigo').AsInteger, qAux.FieldByName('Quantidade_Estoque').AsFloat + StrToInt(EdtEstrutura_Viavel.Text));
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmColega_Embriao.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmColega_Embriao);
  Util.Desabilita_Campos(FrmColega_Embriao);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmColega_Embriao.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Padrao.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU COLETA DE EMBRIÃO DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmColega_Embriao);
  end;
end;

procedure TFrmColega_Embriao.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmColega_Embriao.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Coleta_Embriao, FrmChama_Coleta_Embriao);
  FrmChama_Coleta_Embriao.ShowModal;
  FrmChama_Coleta_Embriao.Free;
end;

procedure TFrmColega_Embriao.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Padrao.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'LANÇOU COLETA DE EMBRIÃO DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), insercao, date);
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
        Padrao.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU COLETA DE EMBRIÃO DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), alteracao, date);
      except
        Mensagem.Impossivel_Executar;
      end;
      end
      else
        exit;
    end;

    if (CheckBox1.Checked) then
      Atualiza_Estoque;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmColega_Embriao);
end;

function TFrmColega_Embriao.Confira: boolean;
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

procedure TFrmColega_Embriao.EdtAnimalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmColega_Embriao.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmColega_Embriao.EdtCodigo_AnimalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    mae:= 1;
    Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
    FrmChama_Animal.ShowModal;
    FrmChama_Animal.Free;
  end;
end;

procedure TFrmColega_Embriao.EdtCodigo_AnimalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmColega_Embriao.EdtCodigo_PaiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    mae:= 2;
    Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
    FrmChama_Animal.ShowModal;
    FrmChama_Animal.Free;
  end;
end;

procedure TFrmColega_Embriao.EdtCodigo_PaiKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmColega_Embriao.EdtPaiKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmColega_Embriao.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmColega_Embriao.EdtSetorKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmColega_Embriao.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmColega_Embriao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmColega_Embriao.Free;
        FrmColega_Embriao:= Nil;
      end;
end;

procedure TFrmColega_Embriao.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmColega_Embriao);
  Util.Limpa_Campos(FrmColega_Embriao);
  Util.Desabilita_Campos(FrmColega_Embriao);
end;

procedure TFrmColega_Embriao.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmColega_Embriao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmColega_Embriao);
      Util.Limpa_Campos(FrmColega_Embriao);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      CheckBox1.Enabled:= true;
      CheckBox1.Checked:= true;
      MEdtData_Coleta.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmColega_Embriao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmColega_Embriao.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Coleta_Embriao');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmColega_Embriao.MEdtData_ColetaEnter(Sender: TObject);
begin
  MEdtData_Coleta.Text:= DateToStr(date);
end;

procedure TFrmColega_Embriao.MEdtData_ColetaExit(Sender: TObject);
begin
  if (MEdtData_Coleta.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Coleta);
end;

end.
