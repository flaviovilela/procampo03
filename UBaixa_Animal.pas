unit UBaixa_Animal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmBaixa_Animal = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Baixa: TMaskEdit;
    LblData_Cadastro: TLabel;
    BBtnPesquisar: TToolButton;
    LblMarca: TLabel;
    EdtAnimal: TEdit;
    EdtCodigo_Animal: TEdit;
    Label1: TLabel;
    EdtCausa: TEdit;
    EdtCodigo_Causa: TEdit;
    Label2: TLabel;
    EdtResponsavel: TEdit;
    Label11: TLabel;
    MMOObservacoes: TMemo;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_BaixaEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure MEdtData_BaixaExit(Sender: TObject);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtCodigo_AnimalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAnimalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_AnimalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_CausaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CausaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Util: TUtil;
    Baixa: TBaixa_Animal;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
  public
    ativo, enderec, achei: boolean;
    codigo_categoria_animal, crias_vivas, crias_mortas, n_abortos: integer;
  protected
  end;

var
  FrmBaixa_Animal: TFrmBaixa_Animal;
implementation

uses UDM, UChama_Animal, UChama_Baixa, UChama_Causa_Baixa;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmBaixa_Animal.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmBaixa_Animal);
  Util.Desabilita_Campos(FrmBaixa_Animal);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmBaixa_Animal.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Baixa.Excluir;
      Util.Atualiza_Baixa_Delete;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU BAIXA DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmBaixa_Animal);
  end;
end;

procedure TFrmBaixa_Animal.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmBaixa_Animal.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Baixa, FrmChama_Baixa);
  FrmChama_Baixa.ShowModal;
  FrmChama_Baixa.Free;
end;

procedure TFrmBaixa_Animal.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Baixa.Inserir;
          Util.Atualiza_Baixa;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'LANÇOU BAIXA DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), insercao, date);
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
        Baixa.Alterar;
        Util.Atualiza_Baixa;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU BAIXA DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmBaixa_Animal);
end;

function TFrmBaixa_Animal.Confira: boolean;
begin
  Confira:= false;

  if (EdtCodigo_Animal.Text = '') then
   begin
     Mensagem.Mensagem_Falta_Dados;
     EdtCodigo_Animal.SetFocus;
     abort;
    end;

  if (EdtCodigo_Causa.Text = '') then
   begin
     Mensagem.Mensagem_Falta_Dados;
     EdtCodigo_Causa.SetFocus;
     abort;
    end;

   Confira:= true;
end;

procedure TFrmBaixa_Animal.EdtAnimalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixa_Animal.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixa_Animal.EdtCodigo_AnimalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
    FrmChama_Animal.ShowModal;
    FrmChama_Animal.Free;
  end;
end;

procedure TFrmBaixa_Animal.EdtCodigo_AnimalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixa_Animal.EdtCodigo_CausaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Causa_Baixa, FrmChama_Causa_Baixa);
    FrmChama_Causa_Baixa.ShowModal;
    FrmChama_Causa_Baixa.Free;
  end;
end;

procedure TFrmBaixa_Animal.EdtCodigo_CausaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixa_Animal.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixa_Animal.EdtSetorKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmBaixa_Animal.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmBaixa_Animal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmBaixa_Animal.Free;
        FrmBaixa_Animal:= Nil;
      end;
end;

procedure TFrmBaixa_Animal.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmBaixa_Animal);
  Util.Limpa_Campos(FrmBaixa_Animal);
  Util.Desabilita_Campos(FrmBaixa_Animal);
end;

procedure TFrmBaixa_Animal.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmBaixa_Animal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmBaixa_Animal);
      Util.Limpa_Campos(FrmBaixa_Animal);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      MEdtData_Baixa.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmBaixa_Animal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmBaixa_Animal.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Baixa');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmBaixa_Animal.MEdtData_BaixaEnter(Sender: TObject);
begin
  MEdtData_Baixa.Text:= DateToStr(date);
end;

procedure TFrmBaixa_Animal.MEdtData_BaixaExit(Sender: TObject);
begin
  if (MEdtData_Baixa.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Baixa);
end;

end.
