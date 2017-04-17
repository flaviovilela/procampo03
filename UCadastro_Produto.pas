unit UCadastro_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmCadastro_Produto = class(TForm)
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
    Label2: TLabel;
    EdtGrupo: TEdit;
    EdtCodigo_Grupo: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LblNumero: TLabel;
    EdtValor_Mini: TEdit;
    EdtValor_Pequena: TEdit;
    EdtValor_Media: TEdit;
    EdtValor_Grande: TEdit;
    EdtValor_Gigante: TEdit;
    EdtValor_Familia: TEdit;
    Label8: TLabel;
    EdtBorda_Mini: TEdit;
    EdtBorda_Pequena: TEdit;
    EdtBorda_Media: TEdit;
    EdtBorda_Grande: TEdit;
    EdtBorda_Gigante: TEdit;
    EdtBorda_Familia: TEdit;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    CBCozinha: TCheckBox;
    CBFracionado: TCheckBox;
    EdtValor_Compra: TEdit;
    Label9: TLabel;
    EdtCusto_Medio: TEdit;
    Label10: TLabel;
    EdtEstoque: TEdit;
    Label11: TLabel;
    CBAtivo: TCheckBox;
    Label12: TLabel;
    MEdtData_Ultima_Compra: TMaskEdit;
    Label13: TLabel;
    MEdtData_Ultima_Venda: TMaskEdit;
    Shape1: TShape;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label14: TLabel;
    EdtSaldo_Estoque: TEdit;
    ADOQuery1Codigo_Produto: TIntegerField;
    ADOQuery1Codigo_Ingrediente: TIntegerField;
    ADOQuery1Permissao: TStringField;
    ADOQuery1Ingrediente: TStringField;
    ADOQuery1Codigo: TAutoIncField;
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
    procedure EdtCodigo_GrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_GrupoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_MiniKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_PequenaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_MediaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_GrandeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_GiganteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_FamiliaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBorda_MiniKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBorda_PequenaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBorda_MediaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBorda_GrandeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBorda_GiganteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBorda_FamiliaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_CompraKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCusto_MedioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEstoqueKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSaldo_EstoqueKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSaldo_EstoqueEnter(Sender: TObject);
    procedure EdtValor_CompraExit(Sender: TObject);
    procedure EdtCusto_MedioExit(Sender: TObject);
    procedure EdtEstoqueExit(Sender: TObject);
    procedure EdtSaldo_EstoqueExit(Sender: TObject);
    procedure EdtValor_MiniExit(Sender: TObject);
    procedure EdtValor_PequenaExit(Sender: TObject);
    procedure EdtValor_MediaExit(Sender: TObject);
    procedure EdtValor_GrandeExit(Sender: TObject);
    procedure EdtValor_GiganteExit(Sender: TObject);
    procedure EdtValor_FamiliaExit(Sender: TObject);
    procedure EdtBorda_MiniExit(Sender: TObject);
    procedure EdtBorda_PequenaExit(Sender: TObject);
    procedure EdtBorda_MediaExit(Sender: TObject);
    procedure EdtBorda_GrandeExit(Sender: TObject);
    procedure EdtBorda_GiganteExit(Sender: TObject);
    procedure EdtBorda_FamiliaExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    Util: TUtil;
    Produto: TProduto;
    IP: TIngrediente_Produto;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Escreve_Texto;
  public
    ativo, enderec, achei: boolean;
    procedure Atualiza_Ingrediente;
    procedure Grava_Ingredientes;
    procedure Atualiza_Ingredientes_Novos;
  protected
  end;

var
  FrmCadastro_Produto: TFrmCadastro_Produto;
implementation

uses UDM, UChama_Grupo_Produto, UChama_Produto;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Produto.Atualiza_Ingrediente;
begin
  with ADOQuery1, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select IP.*, CI.Descricao as Ingrediente from Ingrediente_Produto IP');
    add('left join Cadastro_Ingrediente CI on (IP.Codigo_Ingrediente = CI.Codigo)');
    add('where IP.Codigo_Produto = :Produto');
    Parameters.ParamByName('Produto').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Produto.Atualiza_Ingredientes_Novos;
var
  qAux, qAux2: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  qAux2:= TADOQuery.Create(self);

  with qAux2, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select IP.Codigo_Ingrediente from Ingrediente_Produto IP');
    add('where IP.Codigo_Produto = :Produto');
    Parameters.ParamByName('Produto').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;

  with qAux, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select CI.* from Cadastro_Ingrediente CI');
    open;
  end;

  qAux.First;
  while not qAux.Eof do
  begin
    if (qAux2.Locate('Codigo_Ingrediente', qAux.FieldByName('Codigo').AsInteger, [])) then
      qAux.Next
    else
    begin
      IP.Inserir(StrToInt(EdtCodigo.Text), qAux.FieldByName('Codigo').AsInteger, 'SIM');
      qAux.Next;
    end;
  end;

  Atualiza_Ingrediente;
end;

procedure TFrmCadastro_Produto.BBtnCancelarClick(Sender: TObject);
begin
  if (achei = false) then
    IP.Excluir;

  Util.Limpa_Campos(FrmCadastro_Produto);
  Util.Desabilita_Campos(FrmCadastro_Produto);
  Escreve_Texto;
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Produto.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Produto.Excluir;
      IP.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU PRODUTO ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Produto);
  end;
end;

procedure TFrmCadastro_Produto.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCadastro_Produto.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
  FrmChama_Produto.ShowModal;
  FrmChama_Produto.Free;
end;

procedure TFrmCadastro_Produto.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        try
          Produto.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU PRODUTO ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
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
        Produto.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU PRODUTO ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Produto);
end;

function TFrmCadastro_Produto.Confira: boolean;
begin
  Confira:= false;

  if EdtDescricao.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtDescricao.SetFocus;
    abort;
  end;

  if EdtValor_Mini.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Mini.SetFocus;
    abort;
  end;

  if EdtBorda_Mini.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtBorda_Mini.SetFocus;
    abort;
  end;

  if EdtValor_Pequena.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Pequena.SetFocus;
    abort;
  end;

  if EdtBorda_Pequena.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtBorda_Pequena.SetFocus;
    abort;
  end;

  if EdtValor_Media.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Media.SetFocus;
    abort;
  end;

  if EdtBorda_Media.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtBorda_Media.SetFocus;
    abort;
  end;

  if EdtValor_Grande.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Grande.SetFocus;
    abort;
  end;

  if EdtBorda_Grande.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtBorda_Grande.SetFocus;
    abort;
  end;

  if EdtValor_Gigante.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Gigante.SetFocus;
    abort;
  end;

  if EdtBorda_Gigante.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtBorda_Gigante.SetFocus;
    abort;
  end;

  if EdtValor_Familia.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Familia.SetFocus;
    abort;
  end;

  if EdtBorda_Familia.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtBorda_Familia.SetFocus;
    abort;
  end;

  if EdtValor_Compra.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Compra.SetFocus;
    abort;
  end;

  if EdtCusto_Medio.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCusto_Medio.SetFocus;
    abort;
  end;

  if EdtEstoque.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtEstoque.SetFocus;
    abort;
  end;

  if EdtSaldo_Estoque.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtSaldo_Estoque.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmCadastro_Produto.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if ADOQuery1Permissao.AsString = 'NÃO' then
    DBGrid1.Canvas.Font.Color:= clRed
  else
    DBGrid1.Canvas.Font.Color:= clGreen;
  dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

procedure TFrmCadastro_Produto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_SPACE) then
  begin
    ADOQuery1.Edit;
    if (ADOQuery1Permissao.AsString = 'SIM') then
      ADOQuery1Permissao.AsString:= 'NÃO'
    else
      ADOQuery1Permissao.AsString:= 'SIM';

    ADOQuery1.Post;
  end;
end;

procedure TFrmCadastro_Produto.EdtBorda_FamiliaExit(Sender: TObject);
begin
  if (EdtBorda_Familia.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtBorda_Familia.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtBorda_Familia, StrToFloat(EdtBorda_Familia.Text));
end;

procedure TFrmCadastro_Produto.EdtBorda_FamiliaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtBorda_GiganteExit(Sender: TObject);
begin
  if (EdtBorda_Gigante.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtBorda_Gigante.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtBorda_Gigante, StrToFloat(EdtBorda_Gigante.Text));
end;

procedure TFrmCadastro_Produto.EdtBorda_GiganteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtBorda_GrandeExit(Sender: TObject);
begin
  if (EdtBorda_Grande.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtBorda_Grande.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtBorda_Grande, StrToFloat(EdtBorda_Grande.Text));
end;

procedure TFrmCadastro_Produto.EdtBorda_GrandeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtBorda_MediaExit(Sender: TObject);
begin
  if (EdtBorda_Media.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtBorda_Media.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtBorda_Media, StrToFloat(EdtBorda_Media.Text));
end;

procedure TFrmCadastro_Produto.EdtBorda_MediaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtBorda_MiniExit(Sender: TObject);
begin
  if (EdtBorda_Mini.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtBorda_Mini.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtBorda_Mini, StrToFloat(EdtBorda_Mini.Text));
end;

procedure TFrmCadastro_Produto.EdtBorda_MiniKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtBorda_PequenaExit(Sender: TObject);
begin
  if (EdtBorda_Pequena.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtBorda_Pequena.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtBorda_Pequena, StrToFloat(EdtBorda_Pequena.Text));
end;

procedure TFrmCadastro_Produto.EdtBorda_PequenaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Produto.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Produto.EdtCodigo_GrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F3 then
  begin
    Application.CreateForm(TFrmChama_Grupo_Produto, FrmChama_Grupo_Produto);
    FrmChama_Grupo_Produto.ShowModal;
    FrmChama_Grupo_Produto.Free;
  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_GrupoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Produto.EdtCusto_MedioExit(Sender: TObject);
begin
  if (EdtCusto_Medio.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtCusto_Medio.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtCusto_Medio, StrToFloat(EdtCusto_Medio.Text));
end;

procedure TFrmCadastro_Produto.EdtCusto_MedioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtEstoqueExit(Sender: TObject);
begin
  if (EdtEstoque.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtEstoque.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtEstoque, StrToFloat(EdtEstoque.Text));
end;

procedure TFrmCadastro_Produto.EdtEstoqueKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtGrupoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Produto.EdtSaldo_EstoqueEnter(Sender: TObject);
var
  valor_compra, estoque, total: double;
begin
  valor_compra:= StrToFloat(EdtValor_Compra.Text);
  estoque:= StrToFloat(EdtEstoque.Text);
  total:= valor_compra * estoque;
  EdtSaldo_Estoque.Text:= FormatFloat('#0.0,0', total);
  EdtSaldo_Estoque.Text:= StringReplace(EdtSaldo_Estoque.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmCadastro_Produto.EdtSaldo_EstoqueExit(Sender: TObject);
begin
  if (EdtSaldo_Estoque.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtSaldo_Estoque.SetFocus;
    abort;
  end;
end;

procedure TFrmCadastro_Produto.EdtSaldo_EstoqueKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Produto.EdtValor_CompraExit(Sender: TObject);
begin
  if (EdtValor_Compra.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor_Compra.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtValor_Compra, StrToFloat(EdtValor_Compra.Text));
end;

procedure TFrmCadastro_Produto.EdtValor_CompraKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtValor_FamiliaExit(Sender: TObject);
begin
  if (EdtValor_Familia.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor_Familia.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtValor_Familia, StrToFloat(EdtValor_Familia.Text));
end;

procedure TFrmCadastro_Produto.EdtValor_FamiliaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtValor_GiganteExit(Sender: TObject);
begin
  if (EdtValor_Gigante.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor_Gigante.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtValor_Gigante, StrToFloat(EdtValor_Gigante.Text));
end;

procedure TFrmCadastro_Produto.EdtValor_GiganteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtValor_GrandeExit(Sender: TObject);
begin
  if (EdtValor_Grande.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor_Grande.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtValor_Grande, StrToFloat(EdtValor_Grande.Text));
end;

procedure TFrmCadastro_Produto.EdtValor_GrandeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtValor_MediaExit(Sender: TObject);
begin
  if (EdtValor_Media.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor_Media.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtValor_Media, StrToFloat(EdtValor_Media.Text));
end;

procedure TFrmCadastro_Produto.EdtValor_MediaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtValor_MiniExit(Sender: TObject);
begin
  if (EdtValor_Mini.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor_Mini.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtValor_Mini, StrToFloat(EdtValor_Mini.Text));
end;

procedure TFrmCadastro_Produto.EdtValor_MiniKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.EdtValor_PequenaExit(Sender: TObject);
begin
  if (EdtValor_Pequena.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor_Pequena.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtValor_Pequena, StrToFloat(EdtValor_Pequena.Text));
end;

procedure TFrmCadastro_Produto.EdtValor_PequenaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Produto.Escreve_Texto;
begin
  EdtValor_Mini.Text:= '0,00';
  EdtBorda_Mini.Text:= '0,00';
  EdtValor_Pequena.Text:= '0,00';
  EdtBorda_Pequena.Text:= '0,00';
  EdtValor_Media.Text:= '0,00';
  EdtBorda_Media.Text:= '0,00';
  EdtValor_Grande.Text:= '0,00';
  EdtBorda_Grande.Text:= '0,00';
  EdtValor_Gigante.Text:= '0,00';
  EdtBorda_Gigante.Text:= '0,00';
  EdtValor_Familia.Text:= '0,00';
  EdtBorda_Familia.Text:= '0,00';
  EdtValor_Compra.Text:= '0,00';
  EdtCusto_Medio.Text:= '0,00';
  EdtEstoque.Text:= '0,00';
  EdtSaldo_Estoque.Text:= '0,00';
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Produto.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Produto.Free;
        FrmCadastro_Produto:= Nil;
      end;
end;

procedure TFrmCadastro_Produto.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Produto);
  Util.Limpa_Campos(FrmCadastro_Produto);
  Util.Desabilita_Campos(FrmCadastro_Produto);
  Escreve_Texto;
end;

procedure TFrmCadastro_Produto.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Produto);
      Util.Limpa_Campos(FrmCadastro_Produto);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      Escreve_Texto;
      Gera_Codigo;
      Grava_Ingredientes;
      MEdtData_Cadastro.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Produto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Produto.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cadastro_Produto');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Produto.Grava_Ingredientes;
var
  qAux, qAux2: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  qAux2:= TADOQuery.Create(self);

  with qAux2, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select IP.Codigo_Produto from Ingrediente_Produto IP');
    add('where IP.Codigo_Produto = :Produto');
    Parameters.ParamByName('Produto').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;

  if (qAux2.IsEmpty) then
  begin
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select CI.* from Cadastro_Ingrediente CI');
      open;
    end;

    while not qAux.Eof do
    begin
      IP.Inserir(StrToInt(EdtCodigo.Text), qAux.FieldByName('Codigo').AsInteger, 'SIM');
        qAux.Next;
    end;

    Atualiza_Ingrediente;
  end;
end;

procedure TFrmCadastro_Produto.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Produto.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

end.
