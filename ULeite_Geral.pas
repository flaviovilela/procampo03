unit ULeite_Geral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmLeite_Geral = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Pesagem: TMaskEdit;
    LblData_Cadastro: TLabel;
    BBtnPesquisar: TToolButton;
    LblMarca: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    EdtTotal_Animais: TEdit;
    EdtTemperatura: TEdit;
    EdtTotal: TEdit;
    EdtTotal_Ordenhas: TEdit;
    EdtMedia: TEdit;
    MMOObservacoes: TMemo;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_PesagemEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure MEdtData_PesagemExit(Sender: TObject);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtTotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTotal_AnimaisKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMediaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTotal_OrdenhasKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTemperaturaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMediaEnter(Sender: TObject);
  private
    Util: TUtil;
    Leite: TLeite_Geral;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Calcula_Total_Animal;
  public
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmLeite_Geral: TFrmLeite_Geral;
implementation

uses UDM, UChama_Leite_Geral;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmLeite_Geral.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmLeite_Geral);
  Util.Desabilita_Campos(FrmLeite_Geral);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmLeite_Geral.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Leite.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU PESAGEM DE LEITE GERAL DO DIA ' + MEdtData_Pesagem.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmLeite_Geral);
  end;
end;

procedure TFrmLeite_Geral.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmLeite_Geral.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Leite_Geral, FrmChama_Leite_Geral);
  FrmChama_Leite_Geral.ShowModal;
  FrmChama_Leite_Geral.Free;
end;

procedure TFrmLeite_Geral.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Leite.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'LANÇOU PESAGEM DE LEITE GERAL DO DIA ' + MEdtData_Pesagem.Text + '.', TimeToStr(time), insercao, date);
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
        Leite.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU PESAGEM DE LEITE GERAL DO DIA ' + MEdtData_Pesagem.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmLeite_Geral);
end;

procedure TFrmLeite_Geral.Calcula_Total_Animal;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux do
      begin
        close;
        Connection:= dm.ADOConnection1;
        sql.clear;
        sql.add('select count(Codigo) as Animal from Cadastro_Animal where Parida = :Sim');
        Parameters.ParamByName('Sim').Value:= 'Sim';
        Open;
      end;
  EdtTotal_Animais.Text:= qAux.FieldByName('Animal').AsString;
  finally
    FreeAndNil(qAux);
  end;
end;

function TFrmLeite_Geral.Confira: boolean;
begin
  Confira:= false;

  if EdtTotal.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtTotal.SetFocus;
      abort;
    end;

  if EdtTotal.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtTotal.SetFocus;
      abort;
    end;

  if EdtMedia.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtMedia.SetFocus;
      abort;
    end;

  if EdtTotal_Ordenhas.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtTotal_Ordenhas.SetFocus;
      abort;
    end;

  if EdtTemperatura.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtTemperatura.SetFocus;
      abort;
    end;

  Confira:= true;
end;

procedure TFrmLeite_Geral.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLeite_Geral.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLeite_Geral.EdtMediaEnter(Sender: TObject);
var
  tanimal, tlitro, media: double;
begin
  tanimal:= StrToInt(EdtTotal_Animais.Text);
  tlitro:= StrToFloat(EdtTotal.Text);
  media:= tlitro / tanimal;
  EdtMedia.Text:= FormatFloat('#0.0,0', media);
  EdtMedia.Text:= StringReplace(EdtMedia.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmLeite_Geral.EdtMediaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmLeite_Geral.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLeite_Geral.EdtTemperaturaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmLeite_Geral.EdtTotalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmLeite_Geral.EdtTotal_AnimaisKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmLeite_Geral.EdtTotal_OrdenhasKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmLeite_Geral.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmLeite_Geral.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmLeite_Geral.Free;
        FrmLeite_Geral:= Nil;
      end;
end;

procedure TFrmLeite_Geral.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmLeite_Geral);
  Util.Limpa_Campos(FrmLeite_Geral);
  Util.Desabilita_Campos(FrmLeite_Geral);
end;

procedure TFrmLeite_Geral.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmLeite_Geral.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmLeite_Geral);
      Util.Limpa_Campos(FrmLeite_Geral);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;

      EdtTemperatura.Text:= '0';
      Calcula_Total_Animal;

      MEdtData_Pesagem.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmLeite_Geral.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmLeite_Geral.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Leite_Geral');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmLeite_Geral.MEdtData_PesagemEnter(Sender: TObject);
begin
  MEdtData_Pesagem.Text:= DateToStr(date);
end;

procedure TFrmLeite_Geral.MEdtData_PesagemExit(Sender: TObject);
begin
  if (MEdtData_Pesagem.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Pesagem);
end;

end.
