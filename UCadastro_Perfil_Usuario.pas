unit UCadastro_Perfil_Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmCadastro_Perfil_Usuario = class(TForm)
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
    EdtPerfil: TEdit;
    BBtnPesquisar: TToolButton;
    TreeView1: TTreeView;
    ImageList1: TImageList;
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
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Util: TUtil;
    Perfil: TCadastro_Perfil_Usuario;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure ToggleTreeViewCheckBoxes(Node: TTreeNode; cUnChecked,
      cChecked: integer);
  public
    ativo, enderec, achei: boolean;
  protected
  end;

const
  cFlatChecked = 1;
  cFlatUnCheck = 2;

var
  FrmCadastro_Perfil_Usuario: TFrmCadastro_Perfil_Usuario;
implementation

uses UDM, UChama_Perfil;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Perfil_Usuario.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Perfil_Usuario);
  Util.Desabilita_Campos(FrmCadastro_Perfil_Usuario);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Perfil_Usuario.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Perfil.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU PERFIL DE USUÁRIO ' + EdtPerfil.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Perfil_Usuario);
  end;
end;

procedure TFrmCadastro_Perfil_Usuario.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCadastro_Perfil_Usuario.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Perfil, FrmChama_Perfil);
  FrmChama_Perfil.ShowModal;
  FrmChama_Perfil.Free;
end;

procedure TFrmCadastro_Perfil_Usuario.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Perfil.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU PERFIL DE USUÁRIO ' + EdtPerfil.Text + '.', TimeToStr(time), insercao, date);
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
        Perfil.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU PERFIL DE USUÁRIO ' + EdtPerfil.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Perfil_Usuario);
end;

function TFrmCadastro_Perfil_Usuario.Confira: boolean;
begin
  Confira:= false;

  if EdtPerfil.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtPerfil.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmCadastro_Perfil_Usuario.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Perfil_Usuario.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Perfil_Usuario.EdtSetorKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmCadastro_Perfil_Usuario.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Perfil_Usuario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Perfil_Usuario.Free;
        FrmCadastro_Perfil_Usuario:= Nil;
      end;
end;

procedure TFrmCadastro_Perfil_Usuario.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Perfil_Usuario);
  Util.Limpa_Campos(FrmCadastro_Perfil_Usuario);
  Util.Desabilita_Campos(FrmCadastro_Perfil_Usuario);
end;

procedure TFrmCadastro_Perfil_Usuario.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Perfil_Usuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Perfil_Usuario);
      Util.Limpa_Campos(FrmCadastro_Perfil_Usuario);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      MEdtData_Cadastro.SetFocus;
      TreeView1.FullExpand;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Perfil_Usuario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Perfil_Usuario.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cadastro_Perfil_Usuario');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Perfil_Usuario.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Perfil_Usuario.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Perfil_Usuario.TreeView1Click(Sender: TObject);
var
  P:TPoint;
begin
  GetCursorPos(P);
  P := TreeView1.ScreenToClient(P);
  if (htOnStateIcon in TreeView1.GetHitTestInfoAt(P.X,P.Y)) then
    ToggleTreeViewCheckBoxes(TreeView1.Selected, cFlatUnCheck, cFlatChecked);
end;

procedure TFrmCadastro_Perfil_Usuario.TreeView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_SPACE) and Assigned(TreeView1.Selected) then
    ToggleTreeViewCheckBoxes(TreeView1.Selected, cFlatUnCheck, cFlatChecked);
end;

procedure TFrmCadastro_Perfil_Usuario.ToggleTreeViewCheckBoxes(Node :TTreeNode; cUnChecked, cChecked :integer);
begin
  if Assigned(Node) then
  begin
    if Node.StateIndex = cUnChecked then
      Node.StateIndex := cChecked
    else if Node.StateIndex = cChecked then
      Node.StateIndex := cUnChecked
  end;
end;


end.
