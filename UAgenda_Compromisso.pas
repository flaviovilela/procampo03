unit UAgenda_Compromisso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmAgenda_Compromisso = class(TForm)
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
    MMOCompromisso: TMemo;
    Label1: TLabel;
    MEdtData_Compromisso: TMaskEdit;
    Label12: TLabel;
    MEdtHora: TMaskEdit;
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
    procedure MEdtData_CompromissoEnter(Sender: TObject);
    procedure MEdtData_CompromissoExit(Sender: TObject);
    procedure MEdtHoraEnter(Sender: TObject);
  private
    Util: TUtil;
    Agenda: TAgenda_Compromisso;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
  public
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmAgenda_Compromisso: TFrmAgenda_Compromisso;
implementation

uses UDM, UChama_Agenda_Compromisso;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmAgenda_Compromisso.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmAgenda_Compromisso);
  Util.Desabilita_Campos(FrmAgenda_Compromisso);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmAgenda_Compromisso.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Agenda.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU COMPROMISSO DA DATA ' + MEdtData_Compromisso.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmAgenda_Compromisso);
  end;
end;

procedure TFrmAgenda_Compromisso.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmAgenda_Compromisso.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Agenda_Compromisso, FrmChama_Agenda_Compromisso);
  FrmChama_Agenda_Compromisso.ShowModal;
  FrmChama_Agenda_Compromisso.Free;
end;

procedure TFrmAgenda_Compromisso.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Agenda.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU COMPROMISSO DA DATA' + MEdtData_Compromisso.Text + '.', TimeToStr(time), insercao, date);
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
        Agenda.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU COMPROMISSO DA DATA ' + MEdtData_Compromisso.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmAgenda_Compromisso);
end;

function TFrmAgenda_Compromisso.Confira: boolean;
begin
  Confira:= false;

  if MMOCompromisso.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MMOCompromisso.SetFocus;
    abort;
  end;

  if MEdtData_Compromisso.Text = '  /  /    ' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtData_Compromisso.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmAgenda_Compromisso.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAgenda_Compromisso.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAgenda_Compromisso.EdtSetorKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmAgenda_Compromisso.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmAgenda_Compromisso.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmAgenda_Compromisso.Free;
        FrmAgenda_Compromisso:= Nil;
      end;
end;

procedure TFrmAgenda_Compromisso.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmAgenda_Compromisso);
  Util.Limpa_Campos(FrmAgenda_Compromisso);
  Util.Desabilita_Campos(FrmAgenda_Compromisso);
end;

procedure TFrmAgenda_Compromisso.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmAgenda_Compromisso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmAgenda_Compromisso);
      Util.Limpa_Campos(FrmAgenda_Compromisso);
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

procedure TFrmAgenda_Compromisso.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmAgenda_Compromisso.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Agenda_Compromisso');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmAgenda_Compromisso.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmAgenda_Compromisso.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmAgenda_Compromisso.MEdtData_CompromissoEnter(Sender: TObject);
begin
  MEdtData_Compromisso.Text:= DateToStr(date);
end;

procedure TFrmAgenda_Compromisso.MEdtData_CompromissoExit(Sender: TObject);
begin
  if (MEdtData_Compromisso.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Compromisso);
end;

procedure TFrmAgenda_Compromisso.MEdtHoraEnter(Sender: TObject);
begin
  MEdtHora.Text:= TimeToStr(Time);
end;

end.
