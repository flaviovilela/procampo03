unit UVisita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmVisita = class(TForm)
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
    DBGrid1: TDBGrid;
    Label2: TLabel;
    EdtTema: TEdit;
    EdtCodigo_Tema: TEdit;
    LblMarca: TLabel;
    MMOAssunto: TMemo;
    Label1: TLabel;
    MEdtData_Visita: TMaskEdit;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Data_Visita: TDateTimeField;
    ADOQuery1Assunto: TStringField;
    Panel1: TPanel;
    Label3: TLabel;
    EdtCliente: TEdit;
    EdtCodigo_Cliente: TEdit;
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
    procedure EdtCodigo_TemaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_TemaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTemaKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_VisitaEnter(Sender: TObject);
    procedure MMOAssuntoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtClienteKeyPress(Sender: TObject; var Key: Char);
  private
    Util: TUtil;
    Visita: TVisita;
    Itens_Visita: TItens_Visita;
    Mensagem: TMensagem;
    function Confira: boolean;
    function Confira_Itens: boolean;
    procedure Gera_Codigo;

  public
    ativo, enderec, achei: boolean;
    procedure Atualiza_Dados;
  protected
  end;

var
  FrmVisita: TFrmVisita;
implementation

uses UDM, UChama_Tema_Visita, UChama_Cliente, UChama_Visita;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmVisita.Atualiza_Dados;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select IV.* from Itens_Visita IV');
    add('where IV.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmVisita.BBtnCancelarClick(Sender: TObject);
begin
  if (achei = false) then
    Itens_Visita.Excluir_Tudo;

  ADOQuery1.Close;
  Util.Limpa_Campos(FrmVisita);
  Util.Desabilita_Campos(FrmVisita);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmVisita.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Visita.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU VISITA ' + EdtTema.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmVisita);
  end;
end;

procedure TFrmVisita.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmVisita.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Visita, FrmChama_Visita);
  FrmChama_Visita.ShowModal;
  FrmChama_Visita.Free;
end;

procedure TFrmVisita.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        try
          Visita.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'REGISTROU VISITA ' + EdtTema.Text + '.', TimeToStr(time), insercao, date);
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
        Visita.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU VISITA ' + EdtTema.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmVisita);
end;

function TFrmVisita.Confira: boolean;
begin
  Confira:= false;

  if EdtCodigo_Tema.Text = '' then
   begin
     Mensagem.Mensagem_Falta_Dados;
     EdtCodigo_Tema.SetFocus;
     abort;
    end;

  if EdtCodigo_Cliente.Text = '' then
   begin
     Mensagem.Mensagem_Falta_Dados;
     EdtCodigo_Cliente.SetFocus;
     abort;
    end;

  Confira:= true;
end;

function TFrmVisita.Confira_Itens: boolean;
begin
  Confira_Itens:= false;

  if MMOAssunto.Text = '' then
   begin
     Mensagem.Mensagem_Falta_Dados;
     MMOAssunto.SetFocus;
     abort;
    end;

  if MEdtData_Visita.Text = '  /  /    ' then
   begin
     Mensagem.Mensagem_Falta_Dados;
     MEdtData_Visita.SetFocus;
     abort;
    end;

  Confira_Itens:= true;

end;

procedure TFrmVisita.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_DELETE) then
  begin
    if (Mensagem.Confirma_Exclusao) then
    begin
      Itens_Visita.Excluir;
      Atualiza_Dados;
      MMOAssunto.Clear;
      MEdtData_Visita.SetFocus;
    end;
  end;
end;

procedure TFrmVisita.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmVisita.EdtClienteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmVisita.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmVisita.EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F3 then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmVisita.EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmVisita.EdtCodigo_TemaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F3 then
  begin
    Application.CreateForm(TFrmChama_Tema_Visita, FrmChama_Tema_Visita);
    FrmChama_Tema_Visita.ShowModal;
    FrmChama_Tema_Visita.Free;
  end;
end;

procedure TFrmVisita.EdtCodigo_TemaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmVisita.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmVisita.EdtTemaKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmVisita.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmVisita.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmVisita.Free;
        FrmVisita:= Nil;
      end;
end;

procedure TFrmVisita.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmVisita);
  Util.Limpa_Campos(FrmVisita);
  Util.Desabilita_Campos(FrmVisita);
end;

procedure TFrmVisita.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmVisita.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmVisita);
      Util.Limpa_Campos(FrmVisita);
      ADOQuery1.Close;
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      Gera_Codigo;
      MEdtData_Cadastro.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmVisita.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmVisita.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Visita');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmVisita.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmVisita.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmVisita.MEdtData_VisitaEnter(Sender: TObject);
begin
  MEdtData_Visita.Text:= DateToStr(date);
end;

procedure TFrmVisita.MMOAssuntoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (Confira_Itens) then
    begin
      Itens_Visita.Inserir;
      Atualiza_Dados;
      MMOAssunto.Clear;
      MEdtData_Visita.SetFocus;
    end;
  end;
end;

end.
