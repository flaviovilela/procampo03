unit UFechamento_Fornecimento_Leite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmFechamento_Fornecimento_Leite = class(TForm)
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
    LblData_Cadastro: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MEdtData_Inicial: TMaskEdit;
    EdtQtde: TEdit;
    MmoObservacao: TMemo;
    MEdtData_Final: TMaskEdit;
    EdtPreco: TEdit;
    EdtValor_Total: TEdit;
    EdtDesconto: TEdit;
    EdtAcrecimo: TEdit;
    EdtValor_Final: TEdit;
    MEdtData_Fechamento: TMaskEdit;
    Label2: TLabel;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtTotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTotal_AnimaisKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTotal_OrdenhasKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTemperaturaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAcrecimoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure MEdtData_FinalExit(Sender: TObject);
    procedure MEdtData_FechamentoExit(Sender: TObject);
    procedure EdtValor_TotalEnter(Sender: TObject);
    procedure EdtValor_FinalEnter(Sender: TObject);
    procedure EdtPrecoExit(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure EdtAcrecimoExit(Sender: TObject);
    procedure EdtValor_FinalExit(Sender: TObject);
    procedure EdtQtdeExit(Sender: TObject);
  private
    Util: TUtil;
    Leite: TFechamento_Fornecimento;
    Mensagem: TMensagem;
    qtde, vu, vt, des, acre, vf: double;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Calcula_Total_Animal;
  public
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmFechamento_Fornecimento_Leite: TFrmFechamento_Fornecimento_Leite;
implementation

uses UDM, UChama_Cliente, UChama_Fechamento_Fornecimento_Leite;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmFechamento_Fornecimento_Leite.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmFechamento_Fornecimento_Leite);
  Util.Desabilita_Campos(FrmFechamento_Fornecimento_Leite);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmFechamento_Fornecimento_Leite.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Leite.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU FECHAMENTO DE FORNECIMENTO DE LEITE DO DIA ' + MEdtData_Final.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmFechamento_Fornecimento_Leite);
  end;
end;

procedure TFrmFechamento_Fornecimento_Leite.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmFechamento_Fornecimento_Leite.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Fechamento_Fornecimento_Leite, FrmChama_Fechamento_Fornecimento_Leite);
  FrmChama_Fechamento_Fornecimento_Leite.ShowModal;
  FrmChama_Fechamento_Fornecimento_Leite.Free;
end;

procedure TFrmFechamento_Fornecimento_Leite.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Leite.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'LANÇOU FECHAMENTO DE FORNECIMENTO DE LEITE DO DIA ' + MEdtData_Final.Text + '.', TimeToStr(time), insercao, date);
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
        Leite.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU FECHAMENTO DE FORNECIMENTO DE LEITE DO DIA ' + MEdtData_Final.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmFechamento_Fornecimento_Leite);
end;

procedure TFrmFechamento_Fornecimento_Leite.Calcula_Total_Animal;
begin
end;

function TFrmFechamento_Fornecimento_Leite.Confira: boolean;
begin
  Confira:= false;

  if EdtQtde.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtQtde.SetFocus;
      abort;
    end;

  if EdtPreco.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtPreco.SetFocus;
      abort;
    end;

  if EdtValor_Total.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtValor_Total.SetFocus;
      abort;
    end;

  if EdtDesconto.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtDesconto.SetFocus;
      abort;
    end;

  if EdtAcrecimo.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtAcrecimo.SetFocus;
      abort;
    end;

  if EdtValor_Final.Text = '' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtValor_Final.SetFocus;
      abort;
    end;

  if MEdtData_Inicial.Text = '  /  /    ' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      MEdtData_Inicial.SetFocus;
      abort;
    end;

  if MEdtData_Final.Text = '  /  /    ' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      MEdtData_Final.SetFocus;
      abort;
    end;

  if MEdtData_Fechamento.Text = '  /  /    ' then
    begin
      Mensagem.Mensagem_Falta_Dados;
      MEdtData_Fechamento.SetFocus;
      abort;
    end;

  Confira:= true;
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtAcrecimoExit(Sender: TObject);
begin
  if (EdtAcrecimo.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtAcrecimo.SetFocus;
    abort;
  end
  else
    Util.FormataFloat(2, EdtAcrecimo, StrToFloat(EdtAcrecimo.Text));
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtAcrecimoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtCodigo_ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtCodigo_ClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtDescontoExit(Sender: TObject);
begin
  if (EdtDesconto.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtDesconto.SetFocus;
    abort;
  end
  else
    Util.FormataFloat(2, EdtDesconto, StrToFloat(EdtDesconto.Text));

end;

procedure TFrmFechamento_Fornecimento_Leite.EdtDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtPrecoExit(Sender: TObject);
begin
  if (EdtPreco.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtPreco.SetFocus;
    abort;
  end
  else
    Util.FormataFloat(2, EdtPreco, StrToFloat(EdtPreco.Text));
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtPrecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtQtdeExit(Sender: TObject);
begin
  if (EdtQtde.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtQtde.SetFocus;
    abort;
  end
  else
    Util.FormataFloat(2, EdtQtde, StrToFloat(EdtQtde.Text));
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtTemperaturaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtTotalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtTotal_AnimaisKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtTotal_OrdenhasKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtValor_FinalEnter(
  Sender: TObject);
begin
  des:= StrToFloat(EdtDesconto.Text);
  acre:= StrToFloat(EdtAcrecimo.Text);
  vf:= (vt - des) + acre;
  EdtValor_Final.Text:= FormatFloat('#0.0,0', vf);
  EdtValor_Final.Text:= StringReplace(EdtValor_Final.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtValor_FinalExit(Sender: TObject);
begin
  if (EdtValor_Final.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtValor_Final.SetFocus;
    abort;
  end
  else
    Util.FormataFloat(2, EdtValor_Final, StrToFloat(EdtValor_Final.Text));
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtValor_FinalKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtValor_TotalEnter(
  Sender: TObject);
begin
  qtde:= StrToFloat(EdtQtde.Text);
  vu:= StrToFloat(EdtPreco.Text);
  vt:= qtde * vu;
  EdtValor_Total.Text:= FormatFloat('#0.0,0', vt);
  EdtValor_Total.Text:= StringReplace(EdtValor_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmFechamento_Fornecimento_Leite.EdtValor_TotalKeyPress(
  Sender: TObject; var Key: Char);
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

procedure TFrmFechamento_Fornecimento_Leite.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmFechamento_Fornecimento_Leite.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmFechamento_Fornecimento_Leite.Free;
        FrmFechamento_Fornecimento_Leite:= Nil;
      end;
end;

procedure TFrmFechamento_Fornecimento_Leite.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmFechamento_Fornecimento_Leite);
  Util.Limpa_Campos(FrmFechamento_Fornecimento_Leite);
  Util.Desabilita_Campos(FrmFechamento_Fornecimento_Leite);
end;

procedure TFrmFechamento_Fornecimento_Leite.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmFechamento_Fornecimento_Leite.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmFechamento_Fornecimento_Leite);
      Util.Limpa_Campos(FrmFechamento_Fornecimento_Leite);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      EdtDesconto.Text:= '0,00';
      EdtAcrecimo.Text:= '0,00';
      EdtPreco.Text:= '0,00';
      MEdtData_Inicial.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmFechamento_Fornecimento_Leite.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmFechamento_Fornecimento_Leite.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Fechamento_Fornecimento');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmFechamento_Fornecimento_Leite.MEdtData_FechamentoExit(
  Sender: TObject);
var
  qAux: TADOQuery;
begin
  if (MEdtData_Fechamento.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtData_Fechamento.SetFocus;
    abort;
  end;
  Util.Verifica_Data(MEdtData_Inicial);

  qAux:= TADOQuery.Create(self);
  try
    with qAux do
    begin
      close;
      Connection:= dm.ADOConnection1;
      sql.clear;
      sql.add('select sum(Quantidade) as Qtde from Fornecimento_Leite where Data_Entrega between :DI and :DF');
      parameters.ParamByName('DI').Value := StrToDateTime(MEdtData_Inicial.Text);
      parameters.ParamByName('DF').Value := StrToDateTime(MEdtData_Final.Text);
      open;
    end;
    if (qAux.FieldByName('Qtde').AsString = '') then
      EdtQtde.Text:= '0'
    else
      EdtQtde.Text:= qAux.FieldByName('Qtde').AsString;
  finally
    FreeAndNil(qAux);
  end;

end;

procedure TFrmFechamento_Fornecimento_Leite.MEdtData_FinalExit(Sender: TObject);
begin
  if (MEdtData_Inicial.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtData_Inicial.SetFocus;
    abort;
  end;
  Util.Verifica_Data(MEdtData_Inicial);
end;

procedure TFrmFechamento_Fornecimento_Leite.MEdtData_InicialExit(
  Sender: TObject);
begin
  if (MEdtData_Inicial.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtData_Inicial.SetFocus;
    abort;
  end;
  Util.Verifica_Data(MEdtData_Inicial);
end;

end.
