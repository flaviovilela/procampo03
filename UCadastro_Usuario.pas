unit UCadastro_Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmCadastro_Usuario = class(TForm)
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
    Label1: TLabel;
    EdtLogin: TEdit;
    Label2: TLabel;
    EdtSenha: TEdit;
    Label3: TLabel;
    EdtPerfil: TEdit;
    EdtCodigo_Perfil: TEdit;
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
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtCodigo_PerfilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Util: TUtil;
    Usuario: TUsuario;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
  public
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmCadastro_Usuario: TFrmCadastro_Usuario;
implementation

uses UDM, UChama_Usuario, UChama_Perfil;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Usuario.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Usuario);
  Util.Desabilita_Campos(FrmCadastro_Usuario);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Usuario.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Usuario.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(UUtilitarios.usuario, 'EXCLUIU USUÁRIO ' + EdtNome.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Usuario);
  end;
end;

procedure TFrmCadastro_Usuario.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCadastro_Usuario.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Usuario, FrmChama_Usuario);
  FrmChama_Usuario.ShowModal;
  FrmChama_Usuario.Free;
end;

procedure TFrmCadastro_Usuario.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Usuario.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(UUtilitarios.usuario, 'CADASTROU USUÁRIO ' + EdtNome.Text + '.', TimeToStr(time), insercao, date);
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
        Usuario.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(UUtilitarios.usuario, 'ALTEROU USUÁRIO ' + EdtNome.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Usuario);
end;

function TFrmCadastro_Usuario.Confira: boolean;
begin
  Confira:= false;

  if EdtNome.Text = '' then
     begin
       Mensagem.Mensagem_Falta_Dados;
       EdtNome.SetFocus;
       abort;
      end;

  if EdtLogin.Text = '' then
     begin
       Mensagem.Mensagem_Falta_Dados;
       EdtLogin.SetFocus;
       abort;
      end;

  if EdtSenha.Text = '' then
     begin
       Mensagem.Mensagem_Falta_Dados;
       EdtSenha.SetFocus;
       abort;
      end;

  {if EdtCodigo_Perfil.Text = '' then
     begin
       Mensagem.Mensagem_Falta_Dados;
       EdtCodigo_Perfil.SetFocus;
       abort;
      end;}
      Confira:= true;
end;

procedure TFrmCadastro_Usuario.EdtCodigo_PerfilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Perfil, FrmChama_Perfil);
    FrmChama_Perfil.ShowModal;
    FrmChama_Perfil.Free;
  end;
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Usuario.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Usuario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Usuario.Free;
        FrmCadastro_Usuario:= Nil;
      end;
end;

procedure TFrmCadastro_Usuario.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Usuario);
  Util.Limpa_Campos(FrmCadastro_Usuario);
  Util.Desabilita_Campos(FrmCadastro_Usuario);
end;

procedure TFrmCadastro_Usuario.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Usuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Usuario);
      Util.Limpa_Campos(FrmCadastro_Usuario);
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

procedure TFrmCadastro_Usuario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Usuario.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cadastro_Usuario');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Usuario.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Usuario.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

end.
