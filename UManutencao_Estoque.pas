unit UManutencao_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmManutencao_Estoque = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    Label1: TLabel;
    EdtProduto: TEdit;
    EdtCodigo_Produto: TEdit;
    Label6: TLabel;
    EdtQtde: TEdit;
    RGEstoque: TRadioGroup;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Util: TUtil;
    Padrao: TCadastro_Padrao;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
  public
    ativo, enderec, achei: boolean;
    estoque, volume: double;
  protected
  end;

var
  FrmManutencao_Estoque: TFrmManutencao_Estoque;
implementation

uses UDM, UChama_Produto;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmManutencao_Estoque.BBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmManutencao_Estoque.BBtnSalvarClick(Sender: TObject);
var
  qtde_estoque: double;
begin
  if (Confira = true) then
  begin
    case RGEstoque.ItemIndex of
      0: qtde_estoque:= estoque + StrToFloat(EdtQtde.Text);
      1: qtde_estoque:= estoque - StrToFloat(EdtQtde.Text);
    end;
    Util.Atualiza_Estoque_Volume(StrToInt(EdtCodigo_Produto.Text), qtde_estoque, qtde_estoque * volume);
  end;
  Mensagem.Processo_Concluido;
  BBtnSalvar.Enabled:= false;
  Util.Desabilita_Campos(FrmManutencao_Estoque);
end;

function TFrmManutencao_Estoque.Confira: boolean;
begin
  Confira:= false;

  if EdtCodigo_Produto.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Produto.SetFocus;
    abort;
  end;

  if EdtQtde.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtQtde.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmManutencao_Estoque.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmManutencao_Estoque.EdtCodigo_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmManutencao_Estoque.EdtProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmManutencao_Estoque.EdtQtdeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmManutencao_Estoque.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmManutencao_Estoque.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmManutencao_Estoque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmManutencao_Estoque.Free;
  FrmManutencao_Estoque:= nil;
end;

procedure TFrmManutencao_Estoque.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmManutencao_Estoque);
  Util.Limpa_Campos(FrmManutencao_Estoque);
  Util.Desabilita_Campos(FrmManutencao_Estoque);
end;

procedure TFrmManutencao_Estoque.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmManutencao_Estoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmManutencao_Estoque);
      Util.Limpa_Campos(FrmManutencao_Estoque);
      BBtnSalvar.Enabled:= true;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmManutencao_Estoque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
