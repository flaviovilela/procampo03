unit UCadastro_Maquina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmCadastro_Maquina = class(TForm)
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
    Label8: TLabel;
    EdtDescricao: TEdit;
    CBStatus: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MMObservacoes: TMemo;
    EdtValor: TEdit;
    MEdtData_Entrada: TMaskEdit;
    MEdtData_Saida: TMaskEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtPlaca: TEdit;
    EdtN_Chassi: TEdit;
    EdtN_Motor: TEdit;
    Label1: TLabel;
    EdtMarca: TEdit;
    EdtCodigo_Marca: TEdit;
    Label7: TLabel;
    EdtGrupo_Maquina: TEdit;
    EdtCodigo_Grupo_Maquina: TEdit;
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
    procedure EdtCodigo_MarcaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMarcaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Grupo_MaquinaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtGrupo_MaquinaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_MarcaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Grupo_MaquinaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_EntradaExit(Sender: TObject);
    procedure MEdtData_SaidaExit(Sender: TObject);
  private
    Util: TUtil;
    Maquina: TMaquina;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
  public
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmCadastro_Maquina: TFrmCadastro_Maquina;
implementation

uses UDM, UChama_Marca, UChama_Grupo_Maquina, UChama_Maquina;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Maquina.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Maquina);
  Util.Desabilita_Campos(FrmCadastro_Maquina);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Maquina.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Maquina.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU MÁQUINA ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Maquina);
  end;
end;

procedure TFrmCadastro_Maquina.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCadastro_Maquina.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Maquina, FrmChama_Maquina);
  FrmChama_Maquina.ShowModal;
  FrmChama_Maquina.Free;
end;

procedure TFrmCadastro_Maquina.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Maquina.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU MÁQUINA ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
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
        Maquina.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU MÁQUINA ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Maquina);
end;

function TFrmCadastro_Maquina.Confira: boolean;
begin
  Confira:= false;

  if EdtDescricao.Text = '' then
   begin
     Mensagem.Mensagem_Falta_Dados;
     EdtDescricao.SetFocus;
     abort;
    end;

  if EdtValor.Text = '' then
   begin
     Mensagem.Mensagem_Falta_Dados;
     EdtValor.SetFocus;
     abort;
    end;

  Confira:= true;
end;

procedure TFrmCadastro_Maquina.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Maquina.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Maquina.EdtCodigo_Grupo_MaquinaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Grupo_Maquina, FrmChama_Grupo_Maquina);
    FrmChama_Grupo_Maquina.ShowModal;
    FrmChama_Grupo_Maquina.Free;
  end;
end;

procedure TFrmCadastro_Maquina.EdtCodigo_Grupo_MaquinaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Maquina.EdtCodigo_MarcaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Marca, FrmChama_Marca);
    FrmChama_Marca.ShowModal;
    FrmChama_Marca.Free;
  end;
end;

procedure TFrmCadastro_Maquina.EdtCodigo_MarcaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Maquina.EdtGrupo_MaquinaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Maquina.EdtMarcaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Maquina.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Maquina.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Maquina.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Maquina.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Maquina.Free;
        FrmCadastro_Maquina:= Nil;
      end;
end;

procedure TFrmCadastro_Maquina.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Maquina);
  Util.Limpa_Campos(FrmCadastro_Maquina);
  Util.Desabilita_Campos(FrmCadastro_Maquina);
  EdtValor.Text:= '0,00';
end;

procedure TFrmCadastro_Maquina.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Maquina.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Maquina);
      Util.Limpa_Campos(FrmCadastro_Maquina);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      EdtValor.Text:= '0,00';
      MEdtData_Cadastro.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Maquina.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Maquina.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cadastro_Maquina');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Maquina.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Maquina.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Maquina.MEdtData_EntradaExit(Sender: TObject);
begin
  if (MEdtData_Entrada.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtData_Entrada);

end;

procedure TFrmCadastro_Maquina.MEdtData_SaidaExit(Sender: TObject);
begin
  if (MEdtData_Saida.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtData_Saida);

end;

end.
