unit UCadastro_Plano_Financeiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, URegistro,
  ExtCtrls, UUtilitarios;

type
  TFrmCadastro_Plano_Financeiro = class(TForm)
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
    RGTipo: TRadioGroup;
    Label1: TLabel;
    EdtSubnivel: TEdit;
    EdtCodigo_SubNivel: TEdit;
    Label11: TLabel;
    EdtSub_Grupo: TEdit;
    DBGrid3: TDBGrid;
    qryconsulta_lancamento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qryconsulta_lancamentoN_Documento: TIntegerField;
    qryconsulta_lancamentoHistorico: TStringField;
    qryconsulta_lancamentoData_Lancamento: TDateTimeField;
    qryconsulta_lancamentoValor_Cobrado: TFloatField;
    qryconsulta_lancamentoNome: TStringField;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    EdtPlano_Destino: TEdit;
    EdtCodigo_Plano_Destino: TEdit;
    RGItens: TRadioGroup;
    Button1: TButton;
    qryconsulta_lancamentoCodigo: TIntegerField;
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
    procedure EdtCodigo_SubNivelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtSubnivelKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_SubNivelKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSub_GrupoEnter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EdtCodigo_Plano_DestinoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Plano_Financeiro: URegistro.TPlano_Financeiro;
    Util: UUtilitarios.TUtil;
    Mensagem: UUtilitarios.TMensagem;

    procedure Gera_Codigo;
    procedure Update_Lancamentos;
    function Confira_Transferencia: boolean;
  public
    ativo, achei: boolean;
    codigo_pai, edit: integer;

    procedure Atualiza_Lancamento_Plano;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Plano_Financeiro: TFrmCadastro_Plano_Financeiro;
implementation

uses UDM, UChama_Plano_Financeiro;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Plano_Financeiro.Atualiza_Lancamento_Plano;
begin
  with qryconsulta_lancamento, sql do
  begin
    close;
    clear;
    add('select LF.Codigo, LF.N_Documento, LF.Historico, LF.Data_Lancamento, LF.Valor_Cobrado, Cli.Nome from Lancamento_Financeiro LF');
    add('left join Cadastro_Cliente Cli on (LF.Codigo_Cli_For = Cli.Codigo)');
    add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Plano');
    Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
    Parameters.ParamByName('Plano').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Plano_Financeiro.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Plano_Financeiro);
  Util.Desabilita_Campos(FrmCadastro_Plano_Financeiro);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Plano_Financeiro.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao) then
  BEGIN
    try
      Plano_Financeiro.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU PLANO FINANCEIRO ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Plano_Financeiro);
  END;
end;

procedure TFrmCadastro_Plano_Financeiro.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Plano_Financeiro.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        //Gera_Codigo;
        try
          Plano_Financeiro.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU PLANO FINANCEIRO ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
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
          Plano_Financeiro.Alterar;
          Mensagem.Alteracao_Realizada;
          Util.Insere_Historico(usuario, 'ALTEROU PLANO FINANCEIRO ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCadastro_Plano_Financeiro);
end;

procedure TFrmCadastro_Plano_Financeiro.Button1Click(Sender: TObject);
begin
  if (Confira_Transferencia) then
  begin
    if (Application.MessageBox('Confirma a transferência dos lançamentos financeiros para um novo plano financeiro?', 'Confirmação', MB_YESNO+MB_ICONQUESTION)) = IDYES then
    begin
      Update_Lancamentos;
      Mensagem.Processo_Concluido;
      Atualiza_Lancamento_Plano;
    end;
  end;
end;

function TFrmCadastro_Plano_Financeiro.Confira: boolean;
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

function TFrmCadastro_Plano_Financeiro.Confira_Transferencia: boolean;
begin
  Confira_Transferencia:= false;

  if EdtCodigo_Plano_Destino.Text = '' then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Plano_Destino.SetFocus;
    abort;
  end;

  if (RGItens.ItemIndex = 1) then
  begin
    if (DBGrid3.SelectedRows.Count = 0) then
    begin
      Application.MessageBox('É necessário informar pelo menos um item', 'Item não selecionado', MB_OK+MB_ICONHAND);
      abort;
    end;
  end;

  Confira_Transferencia:= true;
end;

procedure TFrmCadastro_Plano_Financeiro.EdtCodigo_Plano_DestinoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    edit:= 2;
    Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
    FrmChama_Plano_Financeiro.ShowModal;
    FrmChama_Plano_Financeiro.Free;
  end;
end;

procedure TFrmCadastro_Plano_Financeiro.EdtCodigo_SubNivelKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      edit:= 1;
      Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
      FrmChama_Plano_Financeiro.ShowModal;
      FrmChama_Plano_Financeiro.Free;
    end;
end;

procedure TFrmCadastro_Plano_Financeiro.EdtCodigo_SubNivelKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Plano_Financeiro.EdtSubnivelKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Plano_Financeiro.EdtSub_GrupoEnter(Sender: TObject);
begin
  if (EdtSub_Grupo.Text = '') then
  begin
    EdtSub_Grupo.Text:= EdtCodigo.Text;
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

procedure TFrmCadastro_Plano_Financeiro.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Plano_Financeiro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Plano_Financeiro.Free;
        FrmCadastro_Plano_Financeiro:= Nil;
      end;
end;

procedure TFrmCadastro_Plano_Financeiro.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Plano_Financeiro);
  Util.Limpa_Campos(FrmCadastro_Plano_Financeiro);
  Util.Desabilita_Campos(FrmCadastro_Plano_Financeiro);
  edit:= 0;
  codigo_pai:= 0;
  RGTipo.ItemIndex:= 1;
end;

procedure TFrmCadastro_Plano_Financeiro.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Plano_Financeiro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Plano_Financeiro);
      Util.Limpa_Campos(FrmCadastro_Plano_Financeiro);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      codigo_pai:= 0;
      MEdtData_Cadastro.SetFocus;
      Gera_Codigo;
      Atualiza_Lancamento_Plano;
      //EdtCodigo.Text:= IntToStr(Gera_Codigo_Indetity('Plano_Financeiro'));
      RGTipo.ItemIndex:= 1;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Plano_Financeiro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Plano_Financeiro.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cadastro_Plano_Financeiro');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Plano_Financeiro.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Plano_Financeiro.Update_Lancamentos;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    qryconsulta_lancamento.First;
    while not qryconsulta_lancamento.Eof do
    begin
      if (RGItens.ItemIndex = 1) then
      begin
        if (DBGrid3.SelectedRows.CurrentRowSelected) then
        begin
          with qAux, sql do
          begin
            close;
            Connection:= dm.ADOConnection1;
            clear;
            add('update Lancamento_Financeiro set Codigo_Plano = :Plano_Destino');
            add('where Codigo_Empresa = :Empresa and Codigo = :Codigo');
            Parameters.ParamByName('Plano_Destino').Value:= StrToInt(EdtCodigo_Plano_Destino.Text);
            Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
            Parameters.ParamByName('Codigo').Value:= qryconsulta_lancamentoCodigo.AsInteger;
            ExecSQL;
          end;
        end;
      end
      else
      begin
        with qAux, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('update Lancamento_Financeiro set Codigo_Plano = :Plano_Destino');
          add('where Codigo_Empresa = :Empresa and Codigo = :Codigo');
          Parameters.ParamByName('Plano_Destino').Value:= StrToInt(EdtCodigo_Plano_Destino.Text);
          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('Codigo').Value:= qryconsulta_lancamentoCodigo.AsInteger;
          ExecSQL;
        end;
      end;
      qryconsulta_lancamento.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Plano_Financeiro.BBtnPesquisarClick(Sender: TObject);
begin
  edit:= 0;
  Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
  FrmChama_Plano_Financeiro.ShowModal;
  FrmChama_Plano_Financeiro.Free;
end;

end.
