unit ULancamento_Financeiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, URegistro,
  ExtCtrls, UUtilitarios;

type
  TFrmLancamento_Financeiro = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    BBtnPesquisar: TToolButton;
    Label2: TLabel;
    EdtCondicao_Pagamento: TEdit;
    EdtCodigo_Condicao_Pagamento: TEdit;
    LblMarca: TLabel;
    EdtDocumento: TEdit;
    CBReplicar: TCheckBox;
    RGTipo: TRadioGroup;
    Label1: TLabel;
    EdtCli_Forn: TEdit;
    EdtCodigo_Cli_Forn: TEdit;
    Label3: TLabel;
    EdtTipo_Documento: TEdit;
    EdtCodigo_Tipo_Documento: TEdit;
    EdtHistorico: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    EdtDepartamento: TEdit;
    EdtCodigo_Departamento: TEdit;
    Label6: TLabel;
    EdtPlano: TEdit;
    EdtCodigo_Plano: TEdit;
    Label7: TLabel;
    LblValor_Total: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    MEdtData_Vencimento: TMaskEdit;
    EdtValor_Cobrado: TEdit;
    MEdtData_Lancamento: TMaskEdit;
    EdtValor_Documento: TEdit;
    EdtDesconto: TEdit;
    EdtMulta: TEdit;
    LblObservacoes: TLabel;
    MmoObservacoes: TMemo;
    ADOStoredProc1: TADOStoredProc;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1N_Documento: TIntegerField;
    ADOQuery1Data_Vencimento: TDateTimeField;
    ADOQuery1Data_Pagamento: TDateTimeField;
    ADOQuery1Parcela: TIntegerField;
    ADOQuery1Status: TStringField;
    ADOQuery1Valor: TFloatField;
    Label15: TLabel;
    EdtSafra: TEdit;
    EdtCodigo_Safra: TEdit;
    RGFiscal: TRadioGroup;
    DBGrid1: TDBGrid;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Cli_FornKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Tipo_DocumentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_DepartamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_PlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_LancamentoEnter(Sender: TObject);
    procedure EdtValor_DocumentoExit(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure EdtMultaExit(Sender: TObject);
    procedure EdtValor_CobradoExit(Sender: TObject);
    procedure MEdtData_LancamentoExit(Sender: TObject);
    procedure MEdtData_VencimentoExit(Sender: TObject);
    procedure MmoObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_CobradoEnter(Sender: TObject);
    procedure MEdtData_VencimentoEnter(Sender: TObject);
    procedure EdtCodigo_Condicao_PagamentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCondicao_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Cli_FornKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCli_FornKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Tipo_DocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_DocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_DepartamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDepartamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PlanoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPlanoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_DocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMultaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_CobradoKeyPress(Sender: TObject; var Key: Char);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_SafraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Lancamento_Financeiro: URegistro.TLancamento_Financeiro;
    Parcela: URegistro.TParcela_Lancamentos;
    Util: UUtilitarios.TUtil;
    Mensagem: UUtilitarios.TMensagem;
    iniciado: boolean;
    procedure Gera_Codigo;
    procedure Altera_Data;

  public
    ativo, achei: boolean;
    procedure Chama_Parcelas;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmLancamento_Financeiro: TFrmLancamento_Financeiro;
implementation

uses UDM, UChama_Condicao_Pagamento, UChama_Cliente, UChama_Tipo_Documento,
     UChama_Departamento, UChama_Plano_Financeiro, UChama_Lancamento_Financeiro_Alterar,
  UChama_Safra, UChama_Lancamento_Banco;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmLancamento_Financeiro.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  if (ADOQuery1.Eof) then
  begin
    //Chama_Parcelas;
    abort;
  end;
end;

procedure TFrmLancamento_Financeiro.Altera_Data;
var
  aux1, aux2: AnsiString;
begin
  ADOQuery1.Edit;
  aux1:= ADOQuery1Data_Vencimento.AsString;
  aux2:= copy(aux1, 1,2) + '/';
  aux2:= aux2 + copy(aux1, 3,2) + '/';
  aux2:= aux2 + copy(aux1, 6,4);
  ADOQuery1.Post;
end;

procedure TFrmLancamento_Financeiro.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmLancamento_Financeiro);
  Util.Desabilita_Campos(FrmLancamento_Financeiro);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  iniciado:= false;
end;

procedure TFrmLancamento_Financeiro.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao) then
  BEGIN
    Lancamento_Financeiro.Excluir;
    Parcela.Excluir;



    Util.Insere_Historico(usuario, 'EXCLUIU LANÇAMENTO FINANCEIRO ' + EdtDocumento.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    iniciado:= false;
    Util.Desabilita_Campos(FrmLancamento_Financeiro);
  END;
end;

procedure TFrmLancamento_Financeiro.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmLancamento_Financeiro.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Lancamento_Financeiro.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'EFETUOU LANÇAMENTO FINANCEIRO ' + EdtDocumento.Text + '.', TimeToStr(time), insercao, date);
        except
          Mensagem.Impossivel_Executar;
        end;
        //Parcela.Inserir(Parcela);
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        if (Application.MessageBox('Para alterar dados de uma conta já lançada, será excluido esse lançamento e todas as parcelas geradas. Deseja continuar?', 'Aviso', MB_YESNO+MB_ICONQUESTION)) = IDYES then
        begin
          try
            Lancamento_Financeiro.Excluir;
            Parcela.Excluir;

            Gera_Codigo;
            Lancamento_Financeiro.Inserir;
            Mensagem.Confirma_Insercao;
          except
            Mensagem.Impossivel_Executar;
          end;
          Util.Insere_Historico(usuario, 'ALTEROU/EXCLUIU LANÇAMENTO FINANCEIRO ' + EdtDocumento.Text + '.', TimeToStr(time), alteracao, date);
        end;

      END
      else
        exit;
    end;
    Chama_Parcelas;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    iniciado:= false;
    Util.Desabilita_Campos(FrmLancamento_Financeiro);
end;

procedure TFrmLancamento_Financeiro.Chama_Parcelas;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select PL.* from Parcelas_Lancamentos PL');
    add('where PL.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

function TFrmLancamento_Financeiro.Confira: boolean;
begin
    Confira:= false;
    if EdtDocumento.Text = '' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtDocumento.SetFocus;
        abort;
      end;

    if EdtCodigo_Condicao_Pagamento.Text = '' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtCodigo_Condicao_Pagamento.SetFocus;
        abort;
      end;

    if EdtCodigo_Cli_Forn.Text = '' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtCodigo_Cli_Forn.SetFocus;
        abort;
      end;

    if MEdtData_Vencimento.Text = '  /  /    ' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        MEdtData_Vencimento.SetFocus;
        abort;
      end;

    if MEdtData_Lancamento.Text = '  /  /    ' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        MEdtData_Lancamento.SetFocus;
        abort;
      end;

    if (EdtValor_Documento.Text = '0,00') or (EdtValor_Documento.Text = '') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtValor_Documento.SetFocus;
        abort;
      end;

    if (EdtDesconto.Text = '') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtDesconto.SetFocus;
        abort;
      end;

    if (EdtMulta.Text = '') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtMulta.SetFocus;
        abort;
      end;

    if (EdtValor_Cobrado.Text = '0,00') or (EdtValor_Cobrado.Text = '') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtValor_Cobrado.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmLancamento_Financeiro.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_DOWN) then
  begin
    //Altera_Data;
  end;
end;

procedure TFrmLancamento_Financeiro.EdtCli_FornKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Cli_FornKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);

      if (RGTipo.ItemIndex = 0) then
        FrmChama_Cliente.RGTipo.ItemIndex:= 0
      else
        FrmChama_Cliente.RGTipo.ItemIndex:= 1;

      FrmChama_Cliente.ShowModal;
      FrmChama_Cliente.Free;
    end;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Cli_FornKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Condicao_PagamentoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
      FrmChama_Condicao_Pagamento.ShowModal;
      FrmChama_Condicao_Pagamento.Free;
    end;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Condicao_PagamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
    Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_DepartamentoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Departamento, FrmChama_Departamento);
      FrmChama_Departamento.ShowModal;
      FrmChama_Departamento.Free;
    end;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_DepartamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_PlanoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
      FrmChama_Plano_Financeiro.ShowModal;
      FrmChama_Plano_Financeiro.Free;
    end;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_PlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_SafraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Safra, FrmChama_Safra);
      FrmChama_Safra.ShowModal;
      FrmChama_Safra.Free;
    end;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Tipo_DocumentoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Tipo_Documento, FrmChama_Tipo_Documento);
      FrmChama_Tipo_Documento.ShowModal;
      FrmChama_Tipo_Documento.Free;
    end;
end;

procedure TFrmLancamento_Financeiro.EdtCodigo_Tipo_DocumentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtCondicao_PagamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtDepartamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtDescontoExit(Sender: TObject);
begin
  if (EdtDesconto.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtDesconto.SetFocus;
    abort;
  end;
  Util.FormataFloat(2, EdtDesconto, StrToFloat(EdtDesconto.Text));
end;

procedure TFrmLancamento_Financeiro.EdtDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmLancamento_Financeiro.EdtMultaExit(Sender: TObject);
begin
  if (EdtMulta.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtMulta.SetFocus;
    abort;
  end;
  Util.FormataFloat(2, EdtMulta, StrToFloat(EdtMulta.Text));
end;

procedure TFrmLancamento_Financeiro.EdtMultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmLancamento_Financeiro.EdtPlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtTipo_DocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Financeiro.EdtValor_CobradoEnter(Sender: TObject);
  var
    valor_documento, desconto, multa, result: double;
begin
  valor_documento:= StrToFloat(EdtValor_Documento.Text);
  desconto:= StrToFloat(EdtDesconto.Text);
  multa:= StrToFloat(EdtMulta.Text);
  result:= valor_documento - desconto + multa;
  EdtValor_Cobrado.Text:= FloatToStr(result);
  Util.FormataFloat(2, EdtValor_Cobrado, StrToFloat(EdtValor_Cobrado.Text));
end;

procedure TFrmLancamento_Financeiro.EdtValor_CobradoExit(Sender: TObject);
begin
  if (EdtValor_Cobrado.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor_Cobrado.SetFocus;
    abort;
  end;
  Util.FormataFloat(2, EdtValor_Cobrado, StrToFloat(EdtValor_Cobrado.Text));
end;

procedure TFrmLancamento_Financeiro.EdtValor_CobradoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmLancamento_Financeiro.EdtValor_DocumentoExit(Sender: TObject);
begin
  if (EdtValor_Documento.Text = '') then
  begin
    Mensagem.Qtde_Invalida;
    EdtValor_Documento.SetFocus;
    abort;
  end;
  Util.FormataFloat(2, EdtValor_Documento, StrToFloat(EdtValor_Documento.Text));
end;

procedure TFrmLancamento_Financeiro.EdtValor_DocumentoKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TFrmLancamento_Financeiro.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmLancamento_Financeiro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmLancamento_Financeiro.Free;
        FrmLancamento_Financeiro:= Nil;
      end;
end;

procedure TFrmLancamento_Financeiro.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmLancamento_Financeiro);
  Util.Limpa_Campos(FrmLancamento_Financeiro);
  Util.Desabilita_Campos(FrmLancamento_Financeiro);
  EdtValor_Documento.Text:= '0,00';
  EdtDesconto.Text:= '0,00';
  EdtMulta.Text:= '0,00';
  EdtValor_Cobrado.Text:= '0,00';
  achei:= false;
  iniciado:= false;
  ADOQuery1.Close;
  RGTipo.ItemIndex:= 1;
end;

procedure TFrmLancamento_Financeiro.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmLancamento_Financeiro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      if (iniciado = false) then
      begin
        Util.Habilita_Campos(FrmLancamento_Financeiro);
        Util.Limpa_Campos(FrmLancamento_Financeiro);
        BBtnSalvar.Enabled:= true;
        BBtnExcluir.Enabled:= false;
        BBtnPesquisar.Enabled:= false;
        BBtnCancelar.Enabled:= true;
        achei:= false;
        EdtDocumento.SetFocus;
        EdtValor_Documento.Text:= '0,00';
        EdtDesconto.Text:= '0,00';
        EdtMulta.Text:= '0,00';
        EdtValor_Cobrado.Text:= '0,00';
        iniciado:= true;
        ADOQuery1.Close;
        RGTipo.ItemIndex:= 1;
      end;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmLancamento_Financeiro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmLancamento_Financeiro.Gera_Codigo;
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
      add('select max(Codigo) as Codigo from Lancamento_Financeiro');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmLancamento_Financeiro.MEdtData_LancamentoEnter(Sender: TObject);
begin
  MEdtData_Lancamento.Text:= DateToStr(date);
end;

procedure TFrmLancamento_Financeiro.MEdtData_LancamentoExit(Sender: TObject);
begin
  if (MEdtData_Lancamento.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Lancamento);
end;

procedure TFrmLancamento_Financeiro.MEdtData_VencimentoEnter(Sender: TObject);
begin
  MEdtData_Vencimento.Text:= DateToStr(date);
end;

procedure TFrmLancamento_Financeiro.MEdtData_VencimentoExit(Sender: TObject);
begin
  if (MEdtData_Vencimento.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end
  else
    Util.Verifica_Data(MEdtData_Vencimento);

  {if StrToDateTime(MEdtData_Vencimento.Text) < StrToDateTime(MEdtData_Lancamento.Text) then
    begin
      Application.MessageBox('A data de vencimento deve ser maior que a data de lançamento', 'Erro', MB_OK+MB_ICONHAND);
      MEdtData_Vencimento.SetFocus;
    end; }
end;

procedure TFrmLancamento_Financeiro.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmLancamento_Financeiro.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Lancamento_Financeiro_Alterar, FrmChama_Lancamento_Financeiro_Alterar);
  FrmChama_Lancamento_Financeiro_Alterar.ShowModal;
  FrmChama_Lancamento_Financeiro_Alterar.Release;
end;

end.
