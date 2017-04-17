unit UCadastro_Grupo_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, URegistro,
  UUtilitarios;

type
  TFrmCadastro_Grupo_Cliente = class(TForm)
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
    EdtDescricao: TEdit;
    BBtnPesquisar: TToolButton;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
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
  private
    Grupo_Cliente: URegistro.TGrupo_Cliente;
    Mensagem: UUtilitarios.TMensagem;
    Util: UUtilitarios.TUtil;
    procedure Gera_Codigo;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Grupo_Cliente: TFrmCadastro_Grupo_Cliente;
implementation

uses UDM, UChama_Grupo_Cliente;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Grupo_Cliente.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Grupo_Cliente);
  Util.Desabilita_Campos(FrmCadastro_Grupo_Cliente);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Grupo_Cliente.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao) then
  BEGIN
    try
      Grupo_Cliente.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU GRUPO DE CLIENTE ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Grupo_Cliente);
  END;
end;

procedure TFrmCadastro_Grupo_Cliente.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Grupo_Cliente.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Gera_Codigo;
        try
          Grupo_Cliente.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU GRUPO DE CLIENTE ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
        except
          Mensagem.Impossivel_Executar;
        end;
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        try
          Grupo_Cliente.Alterar;
          Mensagem.Alteracao_Realizada;
          Util.Insere_Historico(usuario, 'ALTEROU GRUPO DE CLIENTE ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
        except
          Mensagem.Impossivel_Executar;
        end;
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Grupo_Cliente);
end;

function TFrmCadastro_Grupo_Cliente.Confira: boolean;
begin
    Confira:= false;
    if EdtDescricao.Text = '' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtDescricao.SetFocus;
        abort;
      end;

      Confira:= true;
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Grupo_Cliente.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Grupo_Cliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Grupo_Cliente.Free;
        FrmCadastro_Grupo_Cliente:= Nil;
      end;
end;

procedure TFrmCadastro_Grupo_Cliente.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Grupo_Cliente);
  Util.Limpa_Campos(FrmCadastro_Grupo_Cliente);
  Util.Desabilita_Campos(FrmCadastro_Grupo_Cliente);
end;

procedure TFrmCadastro_Grupo_Cliente.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Grupo_Cliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Grupo_Cliente);
      Util.Limpa_Campos(FrmCadastro_Grupo_Cliente);
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

procedure TFrmCadastro_Grupo_Cliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Grupo_Cliente.Gera_Codigo;
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
      add('select max(Codigo) as Codigo from Cadastro_Grupo_Cliente');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Grupo_Cliente.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Grupo_Cliente.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Grupo_Cliente, FrmChama_Grupo_Cliente);
  FrmChama_Grupo_Cliente.ShowModal;
  FrmChama_Grupo_Cliente.Release;
end;

end.
