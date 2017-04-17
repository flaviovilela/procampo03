unit UCadastro_Departamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, URegistro,
  UUtilitarios;

type
  TFrmCadastro_Departamento = class(TForm)
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
    LblCargo: TLabel;
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
    Departamento: URegistro.TDepartamento;
    Util: UUtilitarios.TUtil;
    Mensagem: UUtilitarios.TMensagem;
    procedure Gera_Codigo;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Departamento: TFrmCadastro_Departamento;
implementation

uses UDM, UChama_Departamento;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Departamento.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Departamento);
  Util.Desabilita_Campos(FrmCadastro_Departamento);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Departamento.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao) then
  BEGIN
    try
      Departamento.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU DEPARTAMENTO ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Departamento);
  END;
end;

procedure TFrmCadastro_Departamento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Departamento.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Gera_Codigo;
        try
          Departamento.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU DEPARTAMENTO ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
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
          Departamento.Alterar;
          Mensagem.Alteracao_Realizada;
          Util.Insere_Historico(usuario, 'ALTEROU DEPARTAMENTO ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Departamento);
end;

procedure TFrmCadastro_Departamento.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cadastro_Departamento');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

function TFrmCadastro_Departamento.Confira: boolean;
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

procedure TFrmCadastro_Departamento.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Departamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Departamento.Free;
        FrmCadastro_Departamento:= Nil;
      end;
end;

procedure TFrmCadastro_Departamento.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Departamento);
  Util.Limpa_Campos(FrmCadastro_Departamento);
  Util.Desabilita_Campos(FrmCadastro_Departamento);
end;

procedure TFrmCadastro_Departamento.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Departamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Departamento);
      Util.Limpa_Campos(FrmCadastro_Departamento);
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

procedure TFrmCadastro_Departamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Departamento.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Departamento.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Departamento, FrmChama_Departamento);
  FrmChama_Departamento.ShowModal;
  FrmChama_Departamento.Release;
end;

end.
