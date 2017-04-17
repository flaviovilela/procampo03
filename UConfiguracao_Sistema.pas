unit UConfiguracao_Sistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmConfiguracao_Sistema = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    BBtnPesquisar: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo_Propriedade: TIntegerField;
    ADOQuery1Dias_Secamento: TIntegerField;
    ADOQuery1Dias_Paricao: TIntegerField;
    ADOQuery1Dias_Cobertura: TIntegerField;
    ADOQuery1Dias_Cobertura_Sincronizacao: TIntegerField;
    ADOQuery1Lancamento_Financeiro: TStringField;
    ADOQuery1Contas_Fixas: TStringField;
    ADOQuery1Cheque_Vencer: TStringField;
    ADOQuery1Produtos_Vencidos: TStringField;
    ADOQuery1Aniversario_Funcionario: TStringField;
    ADOQuery1Aniversario_Cliente: TStringField;
    ADOQuery1Animal_Cobrir: TStringField;
    ADOQuery1Animal_Secar: TStringField;
    ADOQuery1Animal_Parir: TStringField;
    ADOQuery1Aplicacao_Programada: TStringField;
    ADOQuery1Animal_Idade: TStringField;
    ADOQuery1Calendario_Sanitario: TStringField;
    ADOQuery1Periodo_Idade_De: TIntegerField;
    ADOQuery1Periodo_Idade_Ate: TIntegerField;
    ADOQuery1Dias_Aviso: TIntegerField;
    ADOQuery1Finalizar_Periodo_Lactacao: TStringField;
    ADOQuery1Mostrar_Inicializacao: TStringField;
    ADOQuery1Backup_Fechar_Sistema: TStringField;
    ADOQuery1Avisa_Dias_Coberta: TStringField;
    ADOQuery1N_Dias_Coberta: TIntegerField;
    ADOQuery1Avisa_Dias_Diagnosticada: TStringField;
    ADOQuery1N_Dias_Diagnosticada: TIntegerField;
    ADOQuery1Avisa_Dias_Seca: TStringField;
    ADOQuery1N_Dias_Seca: TIntegerField;
    ADOQuery1Avisa_Dias_Parida: TStringField;
    ADOQuery1N_Dias_Parida: TIntegerField;
    ADOQuery1Avisa_Lac_Sec_Vazia_Atrasada: TStringField;
    ADOQuery1Avisa_Novilha_Atrasada: TStringField;
    ADOQuery1Avisa_Novilha_Apta_Atrasada: TStringField;
    ADOQuery1Avisa_Animal_Sincronizar: TStringField;
    ADOQuery1Avisa_Protocolo_Sincronizacao: TStringField;
    ADOQuery1Avisa_Animais_Desmamar: TStringField;
    ADOQuery1Avisa_Novilhas_Aptas: TStringField;
    ADOQuery1Avisa_Limite_Producao: TStringField;
    ADOQuery1Avisa_Limite_Diagnostico: TStringField;
    ADOQuery1Limite_Producao: TFloatField;
    ADOQuery1Avisa_Vaca_Acima_Pesagem: TStringField;
    ADOQuery1Peso_Maximo_Leite: TFloatField;
    ADOQuery1Aptidao_Novilhas: TStringField;
    ADOQuery1Valor_Aptidao: TFloatField;
    ADOQuery1Limite_Minimo_Aptidao: TIntegerField;
    ADOQuery1Limite_Maximo_Aptidao: TIntegerField;
    ADOQuery1Mu_Aut_Ap: TStringField;
    ADOQuery1Dias_Matrizes_Atrasadas: TIntegerField;
    ADOQuery1Dias_Novilhas_Atrasadas: TIntegerField;
    ADOQuery1Dias_Novilhas_Aptas_Atrasadas: TIntegerField;
    ADOQuery1Limite_Diagnostico: TIntegerField;
    ADOQuery1Limite_Desmama: TIntegerField;
    ADOQuery1Animais_Lactantes: TIntegerField;
    ADOQuery1Avisa_Situacao1: TStringField;
    ADOQuery1De1: TIntegerField;
    ADOQuery1Ate1: TIntegerField;
    ADOQuery1Situacao1: TIntegerField;
    ADOQuery1Mu_Aut_Sit1: TStringField;
    ADOQuery1Avisa_Situacao2: TStringField;
    ADOQuery1De2: TIntegerField;
    ADOQuery1Ate2: TIntegerField;
    ADOQuery1Situacao2: TIntegerField;
    ADOQuery1Mu_Aut_Sit2: TStringField;
    ADOQuery1Avisa_Situacao3: TStringField;
    ADOQuery1De3: TIntegerField;
    ADOQuery1Ate3: TIntegerField;
    ADOQuery1Situacao3: TIntegerField;
    ADOQuery1Mu_Aut_Sit3: TStringField;
    ADOQuery1Avisa_Situacao4: TStringField;
    ADOQuery1De4: TIntegerField;
    ADOQuery1Ate4: TIntegerField;
    ADOQuery1Situacao4: TIntegerField;
    ADOQuery1Mu_Aut_Sit4: TStringField;
    ADOQuery1Avisa_Situacao5: TStringField;
    ADOQuery1De5: TIntegerField;
    ADOQuery1Ate5: TIntegerField;
    ADOQuery1Situacao5: TIntegerField;
    ADOQuery1Mu_Aut_Sit5: TStringField;
    ADOQuery1Avisa_Situacao6: TStringField;
    ADOQuery1De6: TIntegerField;
    ADOQuery1Ate6: TIntegerField;
    ADOQuery1Situacao6: TIntegerField;
    ADOQuery1Mu_Aut_Sit6: TStringField;
    ADOQuery1Novilhas_Aptas: TIntegerField;
    ADOQuery1Novilhas_Aptas_Atrasadas: TIntegerField;
    ADOQuery1Novilhas_Vazias: TIntegerField;
    ADOQuery1Novilhas_Vazias_Atrasadas: TIntegerField;
    ADOQuery1Novilhas_Cobertas: TIntegerField;
    ADOQuery1Novilhas_Gestantes: TIntegerField;
    ADOQuery1Vacas_Lactacao_Vazias_Normais: TIntegerField;
    ADOQuery1Vacas_Lactacao_Vazias_Atrasadas: TIntegerField;
    ADOQuery1Vacas_Lactacao_Cobertas: TIntegerField;
    ADOQuery1Vacas_Lactacao_Gestantes: TIntegerField;
    ADOQuery1Vacas_Secas_Vazia: TIntegerField;
    ADOQuery1Vacas_Secas_Vazias_Atrasadas: TIntegerField;
    ADOQuery1Vacas_Secas_Cobertas: TIntegerField;
    ADOQuery1Vacas_Secas_Gestantes: TIntegerField;
    ADOQuery1Vacas_Secas_Descartes: TIntegerField;
    ADOQuery1Animais_Lactantes_Macho: TIntegerField;
    ADOQuery1Avisa_Situacao1_Macho: TStringField;
    ADOQuery1De1_Macho: TIntegerField;
    ADOQuery1Ate1_Macho: TIntegerField;
    ADOQuery1Situacao1_Macho: TIntegerField;
    ADOQuery1Mu_Aut_Sit1_Macho: TStringField;
    ADOQuery1Avisa_Situacao2_Macho: TStringField;
    ADOQuery1De2_Macho: TIntegerField;
    ADOQuery1Ate2_Macho: TIntegerField;
    ADOQuery1Situacao2_Macho: TIntegerField;
    ADOQuery1Mu_Aut_Sit2_Macho: TStringField;
    ADOQuery1Avisa_Situacao3_Macho: TStringField;
    ADOQuery1De3_Macho: TIntegerField;
    ADOQuery1Ate3_Macho: TIntegerField;
    ADOQuery1Situacao3_Macho: TIntegerField;
    ADOQuery1Mu_Aut_Sit3_Macho: TStringField;
    ADOQuery1Avisa_Situacao4_Macho: TStringField;
    ADOQuery1De4_Macho: TIntegerField;
    ADOQuery1Ate4_Macho: TIntegerField;
    ADOQuery1Situacao4_Macho: TIntegerField;
    ADOQuery1Mu_Aut_Sit4_Macho: TStringField;
    ADOQuery1Avisa_Situacao5_Macho: TStringField;
    ADOQuery1De5_Macho: TIntegerField;
    ADOQuery1Ate5_Macho: TIntegerField;
    ADOQuery1Situacao5_Macho: TIntegerField;
    ADOQuery1Mu_Aut_Sit5_Macho: TStringField;
    ADOQuery1Avisa_Situacao6_Macho: TStringField;
    ADOQuery1De6_Macho: TIntegerField;
    ADOQuery1Ate6_Macho: TIntegerField;
    ADOQuery1Situacao6_Macho: TIntegerField;
    ADOQuery1Mu_Aut_Sit6_Macho: TStringField;
    ADOQuery1Avisa_Situacao7_Macho: TStringField;
    ADOQuery1De7_Macho: TIntegerField;
    ADOQuery1Ate7_Macho: TIntegerField;
    ADOQuery1Situacao7_Macho: TIntegerField;
    ADOQuery1Mu_Aut_Sit7_Macho: TStringField;
    ADOQuery1Reprodutor: TIntegerField;
    ADOQuery1Rufiao: TIntegerField;
    ADOQuery1Boi_Carreiro: TIntegerField;
    ADOQuery1Semen: TIntegerField;
    ADOQuery1Cat_Ini_Lactante: TIntegerField;
    ADOQuery1Cat_Ini_Em_Crescimento: TIntegerField;
    ADOQuery1Cat_Ini_Novilha: TIntegerField;
    ADOQuery1Cat_Ini_Matriz: TIntegerField;
    ADOQuery1Cat_Ini_Lactante_Macho: TIntegerField;
    ADOQuery1Cat_Ini_Em_Crescimento_Macho: TIntegerField;
    ADOQuery1Cat_Ini_Reprodutor: TIntegerField;
    ADOQuery1Cat_Ini_Rufiao: TIntegerField;
    ADOQuery1Cat_Ini_Boi_Carreiro: TIntegerField;
    ADOQuery1Limite_Cheque: TIntegerField;
    ADOQuery1Dias_Acrecimo_Cheque: TIntegerField;
    ADOQuery1Avisa_Lote_1: TStringField;
    ADOQuery1De_Lote_1: TIntegerField;
    ADOQuery1Ate_Lote_1: TIntegerField;
    ADOQuery1Lote_1: TIntegerField;
    ADOQuery1Mu_Aut_Lote_1: TStringField;
    ADOQuery1Avisa_Lote_2: TStringField;
    ADOQuery1De_Lote_2: TIntegerField;
    ADOQuery1Ate_Lote_2: TIntegerField;
    ADOQuery1Lote_2: TIntegerField;
    ADOQuery1Mu_Aut_Lote_2: TStringField;
    ADOQuery1Avisa_Lote_3: TStringField;
    ADOQuery1De_Lote_3: TIntegerField;
    ADOQuery1Ate_Lote_3: TIntegerField;
    ADOQuery1Lote_3: TIntegerField;
    ADOQuery1Mu_Aut_Lote_3: TStringField;
    ADOQuery1Avisa_Lote_4: TStringField;
    ADOQuery1De_Lote_4: TIntegerField;
    ADOQuery1Ate_Lote_4: TIntegerField;
    ADOQuery1Lote_4: TIntegerField;
    ADOQuery1Mu_Aut_Lote_4: TStringField;
    ADOQuery1Avisa_Lote_5: TStringField;
    ADOQuery1De_Lote_5: TIntegerField;
    ADOQuery1Ate_Lote_5: TIntegerField;
    ADOQuery1Lote_5: TIntegerField;
    ADOQuery1Mu_Aut_Lote_5: TStringField;
    ADOQuery1Avisa_Lote_6: TStringField;
    ADOQuery1De_Lote_6: TIntegerField;
    ADOQuery1Ate_Lote_6: TIntegerField;
    ADOQuery1Lote_6: TIntegerField;
    ADOQuery1Mu_Aut_Lote_6: TStringField;
    ADOQuery1Avisa_Lote_7: TStringField;
    ADOQuery1De_Lote_7: TIntegerField;
    ADOQuery1Ate_Lote_7: TIntegerField;
    ADOQuery1Lote_7: TIntegerField;
    ADOQuery1Mu_Aut_Lote_7: TStringField;
    ADOQuery1Avisa_Lote_8: TStringField;
    ADOQuery1De_Lote_8: TIntegerField;
    ADOQuery1Ate_Lote_8: TIntegerField;
    ADOQuery1Lote_8: TIntegerField;
    ADOQuery1Mu_Aut_Lote_8: TStringField;
    ADOQuery1Avisa_Lote_9: TStringField;
    ADOQuery1De_Lote_9: TIntegerField;
    ADOQuery1Ate_Lote_9: TIntegerField;
    ADOQuery1Lote_9: TIntegerField;
    ADOQuery1Mu_Aut_Lote_9: TStringField;
    ADOQuery1Avisa_Lote_10: TStringField;
    ADOQuery1De_Lote_10: TIntegerField;
    ADOQuery1Ate_Lote_10: TIntegerField;
    ADOQuery1Lote_10: TIntegerField;
    ADOQuery1Mu_Aut_Lote_10: TStringField;
    ADOQuery1Valor_Conta_Menor: TFloatField;
    ADOQuery1Avisa_Conta_Menor: TIntegerField;
    ADOQuery1Valor_Conta_Maior: TFloatField;
    ADOQuery1Avisa_Conta_Maior: TIntegerField;
    GroupBox6: TGroupBox;
    CBLancamento_Financeiro: TCheckBox;
    CBCheque_Vencer: TCheckBox;
    GroupBox8: TGroupBox;
    CBAniversario_Cliente: TCheckBox;
    CBAniversario_Funcionario: TCheckBox;
    CBProduto_Vencido: TCheckBox;
    GroupBox12: TGroupBox;
    CBBackup: TCheckBox;
    GroupBox11: TGroupBox;
    EdtDias_Antecedencia: TEdit;
    GroupBox32: TGroupBox;
    Label81: TLabel;
    Label82: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    EdtLimite_Cheque: TEdit;
    EdtDias_Acrecimo: TEdit;
    EdtValor_Conta_Menor: TEdit;
    EdtAvisa_Conta_Menor: TEdit;
    EdtValor_Conta_Maior: TEdit;
    EdtAvisa_Conta_Maior: TEdit;
    CBContas_Fixas: TCheckBox;
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
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtDias_AntecedenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLimite_ChequeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDias_AcrecimoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_Conta_MenorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAvisa_Conta_MenorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_Conta_MaiorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAvisa_Conta_MaiorKeyPress(Sender: TObject; var Key: Char);
  private
    Util: TUtil;
    Config: TConfiguracao;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Escreve_Texto;
    procedure Carrega_Variaveis;
  public
    con, lot: integer;
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmConfiguracao_Sistema: TFrmConfiguracao_Sistema;
implementation

uses UDM, UChama_Configuracao_Sistema;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmConfiguracao_Sistema.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmConfiguracao_Sistema);
  Util.Desabilita_Campos(FrmConfiguracao_Sistema);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmConfiguracao_Sistema.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Config.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU CONFIGURAÇÃO DO SISTEMA ' + Nome_Fantasia + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmConfiguracao_Sistema);
  end;
end;

procedure TFrmConfiguracao_Sistema.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmConfiguracao_Sistema.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Configuracao_Sistema, FrmChama_Configuracao_Sistema);
  FrmChama_Configuracao_Sistema.ShowModal;
  FrmChama_Configuracao_Sistema.Free;
end;

procedure TFrmConfiguracao_Sistema.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        //Gera_Codigo;
        try
          Config.Inserir;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'CADASTROU CONFIGURAÇÃO DO SISTEMA ' + Nome_Fantasia + '.', TimeToStr(time), insercao, date);
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
        Config.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU CONFIGURAÇÃO DO SISTEMA ' + Nome_Fantasia + '.', TimeToStr(time), alteracao, date);
      except
        Mensagem.Impossivel_Executar;
      end;
      end
      else
        exit;
    end;
    Carrega_Variaveis;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmConfiguracao_Sistema);
end;

procedure TFrmConfiguracao_Sistema.Carrega_Variaveis;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select CS.* from Configuracao_Sistema CS where Codigo_Propriedade = :Propriedade');
    Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
    open;
  end;

  avisa_contas_pagar:= ADOQuery1Lancamento_Financeiro.AsString;
  avisa_contas_fixas:= ADOQuery1Contas_Fixas.AsString;
  avisa_cheque_vencer:= ADOQuery1Cheque_Vencer.AsString;
  avisa_produtos_vencidos:= ADOQuery1Produtos_Vencidos.AsString;
  avisa_aniversario_funcionario:= ADOQuery1Aniversario_Funcionario.AsString;
  avisa_aniversario_cliente:= ADOQuery1Aniversario_Cliente.AsString;
  avisa_animal_cobrir:= ADOQuery1Animal_Cobrir.AsString;
  avisa_animal_secar:= ADOQuery1Animal_Secar.AsString;
  avisa_animal_parir:= ADOQuery1Animal_Parir.AsString;
  avisa_aplicacao_programada:= ADOQuery1Aplicacao_Programada.AsString;
  avisa_idade_animal:= ADOQuery1Animal_Idade.AsString;
  avisa_calendario:= ADOQuery1Calendario_Sanitario.AsString;
  finalizar_periodo_lactacao:= ADOQuery1Finalizar_Periodo_Lactacao.AsString;
  mostrar_inicializacao:= ADOQuery1mostrar_inicializacao.AsString;

  fazer_backup:= ADOQuery1Backup_Fechar_Sistema.AsString;
  avisa_animal_sincronizar:= ADOQuery1Avisa_Animal_Sincronizar.AsString;
  avisa_protocolo_sincronizacao:= ADOQuery1Avisa_Protocolo_Sincronizacao.AsString;
  animal_desmamar:= ADOQuery1Avisa_Animais_Desmamar.AsString;
  avisa_novilhas_aptas:= ADOQuery1Avisa_Novilhas_Aptas.AsString;
  avisa_limite_producao:= ADOQuery1Avisa_Limite_Producao.AsString;
  avisa_limite_diagnostico:= ADOQuery1Avisa_Limite_Diagnostico.AsString;
  avisa_animal_acima_pesagem:= ADOQuery1Avisa_Vaca_Acima_Pesagem.AsString;
  avisa_lac_sec_vazia_atrasada:= ADOQuery1Avisa_Lac_Sec_Vazia_Atrasada.AsString;
  avisa_novilhas_vazias_atrasadas:= ADOQuery1Avisa_Novilha_Atrasada.AsString;
  aptidao_novilhas:= ADOQuery1Aptidao_Novilhas.AsString;
  aviso_crescimento1:= ADOQuery1Avisa_Situacao1.AsString;
  situacao_crescimento1:= ADOQuery1Situacao1.AsInteger;
  aviso_crescimento2:= ADOQuery1Avisa_Situacao2.AsString;
  situacao_crescimento2:= ADOQuery1Situacao2.AsInteger;
  aviso_crescimento3:= ADOQuery1Avisa_Situacao3.AsString;
  situacao_crescimento3:= ADOQuery1Situacao3.AsInteger;
  aviso_crescimento4:= ADOQuery1Avisa_Situacao4.AsString;
  situacao_crescimento4:= ADOQuery1Situacao4.AsInteger;
  aviso_crescimento5:= ADOQuery1Avisa_Situacao5.AsString;
  situacao_crescimento5:= ADOQuery1Situacao5.AsInteger;
  aviso_crescimento6:= ADOQuery1Avisa_Situacao6.AsString;
  situacao_crescimento6:= ADOQuery1Situacao6.AsInteger;
  situacao_animal_lactante:= ADOQuery1Animais_Lactantes.AsInteger;
  situacao_novilhas_aptas:= ADOQuery1Novilhas_Aptas.AsInteger;
  situacao_novilhas_vazias:= ADOQuery1Novilhas_vazias.AsInteger;
  situacao_novilhas_vazias_atrasadas:= ADOQuery1Novilhas_Vazias_Atrasadas.AsInteger;
  situacao_novilhas_cobertas:= ADOQuery1Novilhas_Cobertas.AsInteger;
  situacao_novilhas_gestantes:= ADOQuery1Novilhas_Gestantes.AsInteger;
  situacao_vaca_lac_vazia_normal:= ADOQuery1Vacas_Lactacao_Vazias_Normais.AsInteger;
  situacao_vaca_lac_vazia_atrasada:= ADOQuery1Vacas_Lactacao_Vazias_Atrasadas.AsInteger;
  situacao_vaca_lac_coberta:= ADOQuery1Vacas_Lactacao_Cobertas.AsInteger;
  situacao_vaca_lac_gestante:= ADOQuery1Vacas_Lactacao_Gestantes.AsInteger;
  situacao_vaca_seca_vazia:= ADOQuery1Vacas_Secas_Vazia.AsInteger;
  situacao_vaca_seca_vazia_atrasada:= ADOQuery1Vacas_Secas_Vazias_Atrasadas.AsInteger;
  situacao_vaca_seca_coberta:= ADOQuery1Vacas_Secas_Cobertas.AsInteger;
  situacao_vaca_seca_gestante:= ADOQuery1Vacas_Secas_Gestantes.AsInteger;
  situacao_vaca_seca_descarte:= ADOQuery1Vacas_Secas_Descartes.AsInteger;

  dias_coberta:= ADOQuery1Avisa_Dias_Coberta.AsString;
  dias_diagnosticada:= ADOQuery1Avisa_Dias_Diagnosticada.AsString;
  dias_seca:= ADOQuery1Avisa_Dias_Seca.AsString;
  dias_parida:= ADOQuery1Avisa_Dias_Parida.AsString;

  dias_secamento:= ADOQuery1Dias_Secamento.AsInteger;
  dias_paricao:= ADOQuery1Dias_Paricao.AsInteger;
  dias_cobertura:= ADOQuery1Dias_Cobertura.AsInteger;
  dias_cobertura_sincronizacao:= ADOQuery1Dias_Cobertura_Sincronizacao.AsInteger;
  periodo_idade_ate:= ADOQuery1Periodo_Idade_Ate.AsInteger;
  periodo_idade_de:= ADOQuery1Periodo_Idade_De.AsInteger;
  dias_aviso:= ADOQuery1Dias_Aviso.AsInteger;
  limite_producao_secagem:= ADOQuery1Limite_Producao.AsInteger;
  peso_maximo_leite:= ADOQuery1Peso_Maximo_Leite.AsInteger;
  n_dias_coberta:= ADOQuery1N_Dias_Coberta.AsInteger;
  n_dias_diagnosticada:= ADOQuery1N_Dias_Diagnosticada.AsInteger;
  n_dias_seca:= ADOQuery1N_Dias_Seca.AsInteger;
  n_dias_parida:= ADOQuery1N_Dias_Parida.AsInteger;
  avisa_lac_sec_vazia_atrasada:= ADOQuery1Avisa_Lac_Sec_Vazia_Atrasada.AsString;
  valor_aptidao:= ADOQuery1Valor_Aptidao.AsInteger;
  lim_min:= ADOQuery1Limite_Minimo_Aptidao.AsInteger;
  lim_max:= ADOQuery1Limite_Maximo_Aptidao.AsInteger;
  n_dias_matrizes_atrasadas:= ADOQuery1Dias_Matrizes_Atrasadas.AsInteger;
  n_dias_novilhas_atrasadas:= ADOQuery1Dias_Novilhas_Atrasadas.AsInteger;
  limite_diagnostico:= ADOQuery1Limite_Diagnostico.AsInteger;
  limite_desmama:= ADOQuery1Limite_Desmama.AsInteger;
  de1:= ADOQuery1De1.AsInteger;
  ate1:= ADOQuery1Ate1.AsInteger;
  de2:= ADOQuery1De2.AsInteger;
  ate2:= ADOQuery1Ate2.AsInteger;
  de3:= ADOQuery1De3.AsInteger;
  ate3:= ADOQuery1Ate3.AsInteger;
  de4:= ADOQuery1De4.AsInteger;
  ate4:= ADOQuery1Ate4.AsInteger;
  de5:= ADOQuery1De5.AsInteger;
  ate5:= ADOQuery1Ate5.AsInteger;
  de6:= ADOQuery1De6.AsInteger;
  ate6:= ADOQuery1Ate6.AsInteger;
  mu_aut_sit1:= ADOQuery1Mu_Aut_Sit1.AsString;
  mu_aut_sit2:= ADOQuery1Mu_Aut_Sit2.AsString;
  mu_aut_sit3:= ADOQuery1Mu_Aut_Sit3.AsString;
  mu_aut_sit4:= ADOQuery1Mu_Aut_Sit4.AsString;
  mu_aut_sit5:= ADOQuery1Mu_Aut_Sit5.AsString;
  mu_aut_sit6:= ADOQuery1Mu_Aut_Sit6.AsString;
  mu_aut_ap:= ADOQuery1Mu_Aut_Ap.AsString;
  aviso_crescimento1_macho:= ADOQuery1Avisa_Situacao1_Macho.AsString;
  aviso_crescimento2_macho:= ADOQuery1Avisa_Situacao2_Macho.AsString;
  aviso_crescimento3_macho:= ADOQuery1Avisa_Situacao3_Macho.AsString;
  aviso_crescimento4_macho:= ADOQuery1Avisa_Situacao4_Macho.AsString;
  aviso_crescimento5_macho:= ADOQuery1Avisa_Situacao5_Macho.AsString;
  aviso_crescimento6_macho:= ADOQuery1Avisa_Situacao6_Macho.AsString;
  aviso_crescimento7_macho:= ADOQuery1Avisa_Situacao7_Macho.AsString;
  de1_Macho:= ADOQuery1De1_Macho.AsInteger;
  ate1_Macho:= ADOQuery1Ate1_Macho.AsInteger;
  de2_Macho:= ADOQuery1De2_Macho.AsInteger;
  ate2_Macho:= ADOQuery1Ate2_Macho.AsInteger;
  de3_Macho:= ADOQuery1De3_Macho.AsInteger;
  ate3_Macho:= ADOQuery1Ate3_Macho.AsInteger;
  de4_Macho:= ADOQuery1De4_Macho.AsInteger;
  ate4_Macho:= ADOQuery1Ate4_Macho.AsInteger;
  de5_Macho:= ADOQuery1De5_Macho.AsInteger;
  ate5_Macho:= ADOQuery1Ate5_Macho.AsInteger;
  de6_Macho:= ADOQuery1De6_Macho.AsInteger;
  ate6_Macho:= ADOQuery1Ate6_Macho.AsInteger;
  de7_Macho:= ADOQuery1De7_Macho.AsInteger;
  ate7_Macho:= ADOQuery1Ate7_Macho.AsInteger;

  situacao_crescimento1_macho:= ADOQuery1Situacao1_Macho.AsInteger;
  situacao_crescimento2_macho:= ADOQuery1Situacao2_Macho.AsInteger;
  situacao_crescimento3_macho:= ADOQuery1Situacao3_Macho.AsInteger;
  situacao_crescimento4_macho:= ADOQuery1Situacao4_Macho.AsInteger;
  situacao_crescimento5_macho:= ADOQuery1Situacao5_Macho.AsInteger;
  situacao_crescimento6_macho:= ADOQuery1Situacao6_Macho.AsInteger;
  situacao_crescimento7_macho:= ADOQuery1Situacao7_Macho.AsInteger;
  situacao_reprodutor:= ADOQuery1Reprodutor.AsInteger;
  situacao_rufiao:= ADOQuery1Rufiao.AsInteger;
  situacao_boi_carreiro:= ADOQuery1Boi_Carreiro.AsInteger;
  situacao_semen:= ADOQuery1Semen.AsInteger;
  situacao_lactante_macho:= ADOQuery1Animais_Lactantes_Macho.AsInteger;
  situacao_ini_lactante:= ADOQuery1Cat_Ini_Lactante.AsInteger;
  situacao_ini_em_crescimento:= ADOQuery1Cat_Ini_Em_Crescimento.AsInteger;
  situacao_ini_novilha:= ADOQuery1Cat_Ini_Novilha.AsInteger;
  situacao_ini_matriz:= ADOQuery1Cat_Ini_Matriz.AsInteger;
  situacao_ini_lactante_macho:= ADOQuery1Cat_Ini_Lactante_Macho.AsInteger;
  situacao_ini_em_crescimento_macho:= ADOQuery1Cat_Ini_Em_Crescimento_Macho.AsInteger;
  situacao_ini_reprodutor:= ADOQuery1Cat_Ini_Reprodutor.AsInteger;
  situacao_ini_rufiao:= ADOQuery1Cat_Ini_Rufiao.AsInteger;
  situacao_ini_boi_carreiro:= ADOQuery1Cat_Ini_Boi_Carreiro.AsInteger;
  limite_cheque:= ADOQuery1Limite_Cheque.AsInteger;
  dias_acrecimo:= ADOQuery1Dias_Acrecimo_Cheque.AsInteger;
  situacao_novilhas_aptas_atrasadas:= ADOQuery1Novilhas_Aptas_Atrasadas.AsInteger;
  avisa_novilhas_aptas_atrasadas:= ADOQuery1Avisa_Novilha_Apta_Atrasada.AsString;
  n_dias_novilhas_aptas_atrasadas:= ADOQuery1Dias_Novilhas_Aptas_Atrasadas.AsInteger;

  avisa_lote_1:= ADOQuery1Avisa_Lote_1.AsString;
  de_lote_1:= ADOQuery1De_Lote_1.AsInteger;
  ate_lote_1:= ADOQuery1Ate_Lote_1.AsInteger;
  sit_lote1:= ADOQuery1Lote_1.AsInteger;
  mu_aut_lote_1:= ADOQuery1Mu_Aut_Lote_1.AsString;

  avisa_lote_2:= ADOQuery1Avisa_Lote_2.AsString;
  de_lote_2:= ADOQuery1De_Lote_2.AsInteger;
  ate_lote_2:= ADOQuery1Ate_Lote_2.AsInteger;
  sit_lote2:= ADOQuery1Lote_2.AsInteger;
  mu_aut_lote_2:= ADOQuery1Mu_Aut_Lote_2.AsString;

  avisa_lote_3:= ADOQuery1Avisa_Lote_3.AsString;
  de_lote_3:= ADOQuery1De_Lote_3.AsInteger;
  ate_lote_3:= ADOQuery1Ate_Lote_3.AsInteger;
  sit_lote3:= ADOQuery1Lote_3.AsInteger;
  mu_aut_lote_3:= ADOQuery1Mu_Aut_Lote_3.AsString;

  avisa_lote_4:= ADOQuery1Avisa_Lote_4.AsString;
  de_lote_4:= ADOQuery1De_Lote_4.AsInteger;
  ate_lote_4:= ADOQuery1Ate_Lote_4.AsInteger;
  sit_lote4:= ADOQuery1Lote_4.AsInteger;
  mu_aut_lote_4:= ADOQuery1Mu_Aut_Lote_4.AsString;

  avisa_lote_5:= ADOQuery1Avisa_Lote_5.AsString;
  de_lote_5:= ADOQuery1De_Lote_5.AsInteger;
  ate_lote_5:= ADOQuery1Ate_Lote_5.AsInteger;
  sit_lote5:= ADOQuery1Lote_5.AsInteger;
  mu_aut_lote_5:= ADOQuery1Mu_Aut_Lote_5.AsString;

  avisa_lote_6:= ADOQuery1Avisa_Lote_6.AsString;
  de_lote_6:= ADOQuery1De_Lote_6.AsInteger;
  ate_lote_6:= ADOQuery1Ate_Lote_6.AsInteger;
  sit_lote6:= ADOQuery1Lote_6.AsInteger;
  mu_aut_lote_6:= ADOQuery1Mu_Aut_Lote_6.AsString;

  avisa_lote_7:= ADOQuery1Avisa_Lote_7.AsString;
  de_lote_7:= ADOQuery1De_Lote_7.AsInteger;
  ate_lote_7:= ADOQuery1Ate_Lote_7.AsInteger;
  sit_lote7:= ADOQuery1Lote_7.AsInteger;
  mu_aut_lote_7:= ADOQuery1Mu_Aut_Lote_7.AsString;

  avisa_lote_8:= ADOQuery1Avisa_Lote_8.AsString;
  de_lote_8:= ADOQuery1De_Lote_8.AsInteger;
  ate_lote_8:= ADOQuery1Ate_Lote_8.AsInteger;
  sit_lote8:= ADOQuery1Lote_8.AsInteger;
  mu_aut_lote_8:= ADOQuery1Mu_Aut_Lote_8.AsString;

  avisa_lote_9:= ADOQuery1Avisa_Lote_9.AsString;
  de_lote_9:= ADOQuery1De_Lote_9.AsInteger;
  ate_lote_9:= ADOQuery1Ate_Lote_9.AsInteger;
  sit_lote9:= ADOQuery1Lote_9.AsInteger;
  mu_aut_lote_9:= ADOQuery1Mu_Aut_Lote_9.AsString;

  avisa_lote_10:= ADOQuery1Avisa_Lote_10.AsString;
  de_lote_10:= ADOQuery1De_Lote_10.AsInteger;
  ate_lote_10:= ADOQuery1Ate_Lote_10.AsInteger;
  sit_lote10:= ADOQuery1Lote_10.AsInteger;
  mu_aut_lote_10:= ADOQuery1Mu_Aut_Lote_10.AsString;

  avisa_conta_menor:= ADOQuery1Avisa_Conta_Menor.AsInteger;
  valor_conta_menor:= ADOQuery1Valor_Conta_Menor.AsFloat;
  avisa_conta_maior:= ADOQuery1Avisa_Conta_Maior.AsInteger;
  valor_conta_maior:= ADOQuery1Valor_Conta_Maior.AsFloat;
end;

function TFrmConfiguracao_Sistema.Confira: boolean;
begin
  Confira:= false;

  Confira:= true;
end;

procedure TFrmConfiguracao_Sistema.EdtAvisa_Conta_MaiorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmConfiguracao_Sistema.EdtAvisa_Conta_MenorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmConfiguracao_Sistema.EdtDias_AcrecimoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmConfiguracao_Sistema.EdtDias_AntecedenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmConfiguracao_Sistema.EdtLimite_ChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmConfiguracao_Sistema.EdtValor_Conta_MaiorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmConfiguracao_Sistema.EdtValor_Conta_MenorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmConfiguracao_Sistema.Escreve_Texto;
begin
  EdtDias_Antecedencia.Text:= '0';
  EdtLimite_Cheque.Text:= '0';
  EdtDias_Acrecimo.Text:= '0';
  EdtAvisa_Conta_Menor.Text:= '0';
  EdtAvisa_Conta_Maior.Text:= '0';
  EdtValor_Conta_Menor.Text:= '0,00';
  EdtValor_Conta_Maior.Text:= '0,00';
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmConfiguracao_Sistema.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConfiguracao_Sistema.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmConfiguracao_Sistema.Free;
        FrmConfiguracao_Sistema:= Nil;
      end;
end;

procedure TFrmConfiguracao_Sistema.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmConfiguracao_Sistema);
  Util.Limpa_Campos(FrmConfiguracao_Sistema);
  Util.Desabilita_Campos(FrmConfiguracao_Sistema);
  PageControl1.TabIndex:= 0;
end;

procedure TFrmConfiguracao_Sistema.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConfiguracao_Sistema.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmConfiguracao_Sistema);
      Util.Limpa_Campos(FrmConfiguracao_Sistema);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      PageControl1.TabIndex:= 0;
      TabSheet1.Enabled:= true;
      Escreve_Texto;
      achei:= false;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmConfiguracao_Sistema.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmConfiguracao_Sistema.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cadastro_Setor');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
  finally
    FreeAndNil(qAux);
  end;
end;

end.
