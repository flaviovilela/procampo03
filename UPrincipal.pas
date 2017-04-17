unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, ActnMan, RibbonLunaStyleActnCtrls, Ribbon,
  ImgList, ToolWin, ActnCtrls, UUtilitarios, RibbonSilverStyleActnCtrls,
  ComCtrls, RibbonObsidianStyleActnCtrls, ActnMenus, RibbonActnMenus, ExtCtrls,
  jpeg, Menus, DB, ADODB, ShellAPI, Vcl.Imaging.pngimage;

type
  TFrmPrincipal = class(TForm)
    Ribbon1: TRibbon;
    ActionManager1: TActionManager;
    ImageList1: TImageList;
    RibbonPage1: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    AcCadastro_Empresa: TAction;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    AcCadastro_Usuario: TAction;
    acAgenda_Telefonica: TAction;
    Timer1: TTimer;
    acConsulta_Lancamento_Financeiro: TAction;
    acConsulta_Historico: TAction;
    PopupMenu1: TPopupMenu;
    Produtos1: TMenuItem;
    acConsulta_Acerto_Caixa: TAction;
    acConsulta_Fechamento_Caixa: TAction;
    acCadastro_Perfil_Usuario: TAction;
    acRecibo: TAction;
    acConsulta_Agenda_Telefonica: TAction;
    acMala_Direta: TAction;
    acGera_Etiqueta_Cliente: TAction;
    acGera_Etiqueta_Produto: TAction;
    acAgenda_Compromisso: TAction;
    acConsulta_Agenda_Compromisso: TAction;
    Image1: TImage;
    acChama_OS: TAction;
    acChama_Servico: TAction;
    acCadastro_Unidade_Medida: TAction;
    acConfiguracao_Sistema: TAction;
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
    acCadastro_Cidade: TAction;
    acCadastro_Setor: TAction;
    acCadastro_Logradouro: TAction;
    RibbonGroup3: TRibbonGroup;
    Label1: TLabel;
    Label2: TLabel;
    RibbonPage3: TRibbonPage;
    acCotacao_Preco: TAction;
    RibbonGroup2: TRibbonGroup;
    acRetorno_Cotacao: TAction;
    acCadastro_Cliente: TAction;
    acCadastro_Condicao_Pagamento: TAction;
    acComparativo_Preco: TAction;
    acCompra: TAction;
    acConciliacao_Produto: TAction;
    RibbonPage2: TRibbonPage;
    RibbonGroup4: TRibbonGroup;
    RibbonGroup5: TRibbonGroup;
    RibbonPage4: TRibbonPage;
    RibbonGroup6: TRibbonGroup;
    acAbertura_Caixa: TAction;
    acAcerto_Caixa: TAction;
    acLancamento_Financeiro: TAction;
    acBaixar_Contas: TAction;
    RibbonGroup7: TRibbonGroup;
    acCadastro_Plano_Financeiro: TAction;
    acCadastro_Departamento: TAction;
    acCadastro_Caixa: TAction;
    acCadastro_Tipo_Documento: TAction;
    acCadastro_Itens_Folha_Pagamento: TAction;
    acFolha_Pagamento: TAction;
    acConsulta_Folha_Pagamento: TAction;
    RibbonGroup8: TRibbonGroup;
    acConsulta_Cotacao_Preco: TAction;
    acConsulta_Retorno_Cotacao: TAction;
    acConsulta_Compra: TAction;
    RibbonGroup9: TRibbonGroup;
    StbStatus: TStatusBar;
    ProgressBar1: TProgressBar;
    LblMensagem: TLabel;
    RibbonGroup10: TRibbonGroup;
    acManutencao_Estoque: TAction;
    acConsulta_Estoque: TAction;
    RibbonGroup11: TRibbonGroup;
    acAltera_Propriedade: TAction;
    RibbonGroup12: TRibbonGroup;
    acCadastro_Agencia: TAction;
    acCadastro_Banco: TAction;
    acCadastro_Conta_Corrente: TAction;
    acCadastro_Cheque: TAction;
    acConsulta_Cheque: TAction;
    acBaixar_Cheque: TAction;
    acCadastro_Tipo_Bem_Patrimonial: TAction;
    acCadastro_Bem_Patrimonial: TAction;
    acOperacao_Bancaria: TAction;
    acLancamento_Bancario: TAction;
    acConsulta_Saldo_Bancario: TAction;
    acConciliacao_Bancaria: TAction;
    acCadastro_Marca: TAction;
    acCadastro_Grupo_Maquina: TAction;
    acCadastro_Maquina: TAction;
    acTransfere_Lancamentos: TAction;
    acCadastro_Safra: TAction;
    acCadastro_Tipo_Cultura: TAction;
    RibbonGroup13: TRibbonGroup;
    acConsulta_Patrimonio: TAction;
    acCadastro_Bancario: TAction;
    procedure AcCadastro_EmpresaExecute(Sender: TObject);
    procedure AcCadastro_UsuarioExecute(Sender: TObject);
    procedure acAgenda_TelefonicaExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure acCadastro_Perfil_UsuarioExecute(Sender: TObject);
    procedure acAgenda_CompromissoExecute(Sender: TObject);
    procedure acCadastro_Unidade_MedidaExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acCadastro_LogradouroExecute(Sender: TObject);
    procedure acCadastro_SetorExecute(Sender: TObject);
    procedure acCadastro_CidadeExecute(Sender: TObject);
    procedure acCadastro_ClienteExecute(Sender: TObject);
    procedure acCotacao_PrecoExecute(Sender: TObject);
    procedure acCadastro_Condicao_PagamentoExecute(Sender: TObject);
    procedure acRetorno_CotacaoExecute(Sender: TObject);
    procedure acCompraExecute(Sender: TObject);
    procedure acComparativo_PrecoExecute(Sender: TObject);
    procedure acConciliacao_ProdutoExecute(Sender: TObject);
    procedure acConsulta_HistoricoExecute(Sender: TObject);
    procedure acReciboExecute(Sender: TObject);
    procedure acCadastro_Plano_FinanceiroExecute(Sender: TObject);
    procedure acCadastro_DepartamentoExecute(Sender: TObject);
    procedure acCadastro_CaixaExecute(Sender: TObject);
    procedure acCadastro_Tipo_DocumentoExecute(Sender: TObject);
    procedure acAbertura_CaixaExecute(Sender: TObject);
    procedure acAcerto_CaixaExecute(Sender: TObject);
    procedure acLancamento_FinanceiroExecute(Sender: TObject);
    procedure acBaixar_ContasExecute(Sender: TObject);
    procedure acConsulta_Lancamento_FinanceiroExecute(Sender: TObject);
    procedure acConsulta_Acerto_CaixaExecute(Sender: TObject);
    procedure acCadastro_Itens_Folha_PagamentoExecute(Sender: TObject);
    procedure acFolha_PagamentoExecute(Sender: TObject);
    procedure acConsulta_Folha_PagamentoExecute(Sender: TObject);
    procedure acConsulta_Agenda_TelefonicaExecute(Sender: TObject);
    procedure acConsulta_Agenda_CompromissoExecute(Sender: TObject);
    procedure acConsulta_Cotacao_PrecoExecute(Sender: TObject);
    procedure acConsulta_Retorno_CotacaoExecute(Sender: TObject);
    procedure acConsulta_CompraExecute(Sender: TObject);
    procedure StbStatusDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure acManutencao_EstoqueExecute(Sender: TObject);
    procedure acConsulta_EstoqueExecute(Sender: TObject);
    procedure acAltera_PropriedadeExecute(Sender: TObject);
    procedure acCadastro_AgenciaExecute(Sender: TObject);
    procedure acCadastro_BancoExecute(Sender: TObject);
    procedure acCadastro_Conta_CorrenteExecute(Sender: TObject);
    procedure acCadastro_ChequeExecute(Sender: TObject);
    procedure acConsulta_ChequeExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acBaixar_ChequeExecute(Sender: TObject);
    procedure acCadastro_Tipo_Bem_PatrimonialExecute(Sender: TObject);
    procedure acCadastro_Bem_PatrimonialExecute(Sender: TObject);
    procedure acLancamento_BancarioExecute(Sender: TObject);
    procedure acOperacao_BancariaExecute(Sender: TObject);
    procedure acConsulta_Saldo_BancarioExecute(Sender: TObject);
    procedure acConciliacao_BancariaExecute(Sender: TObject);
    procedure acConfiguracao_SistemaExecute(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure acCadastro_MarcaExecute(Sender: TObject);
    procedure acCadastro_Grupo_MaquinaExecute(Sender: TObject);
    procedure acCadastro_MaquinaExecute(Sender: TObject);
    procedure acTransfere_LancamentosExecute(Sender: TObject);
    procedure acCadastro_SafraExecute(Sender: TObject);
    procedure acCadastro_Tipo_CulturaExecute(Sender: TObject);
    procedure acConsulta_PatrimonioExecute(Sender: TObject);
    procedure acCadastro_BancarioExecute(Sender: TObject);
  private
    Util: TUtil;
    { Private declarations }
    procedure Pega_Dados;
    procedure Inicia_Progress;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses UCadastro_Empresa, UDM, UCadastro_Usuario, UAgenda_Telefonica,
  UConsulta, UCadastro_Perfil_Usuario,
  UAgenda_Compromisso, UCadastro_Unidade_Medida, UCadastro_Logradouro, UCadastro_Setor, UCadastro_Cidade,
  UCadastro_Cliente, UCotacao_Preco_Produto, UCadastro_Condicao_Pagamento,
  URetorno_Cotacao, UCompra, UConsulta_Comparativo_Preco_Cotacao,
  UConciliacao_Compra, UConsulta_Historico_Log, URecibo, UCadastro_Caixa,
  UCadastro_Departamento, UCadastro_Plano_Financeiro, UCadastro_Tipo_Documento,
  UAbertura_Caixa, UAcerto_Caixa, ULancamento_Financeiro, UBaixar_Titulo,
  UConsulta_Acerto_Caixa, UConsulta_Lancamentos_Financeiros,
  UChama_Lancamentos_Financeiros, UCadastro_Itens_Folha_Pagamento,
  UFolha_Pagamento, UConsulta_Folha_Pagamento, UConsulta_Agenda_Compromisso,
  UConsulta_Agenda_Telefonica, UConsulta_Cotacao_Preco_Produto,
  UConsulta_Retorno_Cotacao_Preco, UConsulta_Compra, UManutencao_Estoque,
  UConsulta_Estoque, UChama_Propriedade_Inicial, UCadastro_Agencia,
  UCadastro_Banco, UCadastro_Conta_Corrente, UCadastro_Cheque, UConsulta_Cheque,
  UBaixar_Cheque, UCadastro_Bem_Patrimonio, UCadastro_Tipo_Bem_Patrimonio,
  ULancamento_Banco, UCadastro_Operacao_Bancaria, UConsulta_Saldo_Bancario,
  UConciliacao_Bancaria, UConfiguracao_Sistema, UMensagem_Sistema,
  UCadastro_Grupo_Maquina, UCadastro_Marca, UCadastro_Maquina,
  UTransfere_Lancamento, UCadastro_Cultura, UCadastro_Safra,
  UConsulta_Bem_Patrimonial, UConsulta_Extrato_Bancario;

{$R *.dfm}

procedure TFrmPrincipal.acAbertura_CaixaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmAbertura_Caixa);
  if (Codigo_Caixa = 0) then
  begin
    Application.CreateForm(TFrmAbertura_Caixa, FrmAbertura_Caixa);
    FrmAbertura_Caixa.Show;
    Util.Centraliza_Form(FrmAbertura_Caixa);
  end
  else
    Mensagem.Operacao_Nao_Permitida;
end;

procedure TFrmPrincipal.acAcerto_CaixaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmAcerto_Caixa);
  if (Codigo_Caixa <> 0) then
  begin
    Application.CreateForm(TFrmAcerto_Caixa, FrmAcerto_Caixa);
    FrmAcerto_Caixa.Show;
    Util.Centraliza_Form(FrmAcerto_Caixa);
  end
  else
    Mensagem.Operacao_Nao_Permitida;
end;

procedure TFrmPrincipal.acAgenda_CompromissoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmAgenda_Compromisso);
  Application.CreateForm(TFrmAgenda_Compromisso, FrmAgenda_Compromisso);
  FrmAgenda_Compromisso.Show;
  Util.Centraliza_Form(FrmAgenda_Compromisso);
end;

procedure TFrmPrincipal.acAgenda_TelefonicaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmAgenda_Telefonica);
  Application.CreateForm(TFrmAgenda_Telefonica, FrmAgenda_Telefonica);
  FrmAgenda_Telefonica.Show;
  Util.Centraliza_Form(FrmAgenda_Telefonica);
end;

procedure TFrmPrincipal.acAltera_PropriedadeExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Propriedade_Inicial, FrmChama_Propriedade_Inicial);
  FrmChama_Propriedade_Inicial.ShowModal;
  FrmChama_Propriedade_Inicial.Free;
end;

procedure TFrmPrincipal.acBaixar_ChequeExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmBaixar_Cheque);
  Application.CreateForm(TFrmBaixar_Cheque, FrmBaixar_Cheque);
  FrmBaixar_Cheque.Show;
  Util.Centraliza_Form(FrmBaixar_Cheque);
end;

procedure TFrmPrincipal.acBaixar_ContasExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmChama_Lancamentos_Financeiros);
  Application.CreateForm(TFrmChama_Lancamentos_Financeiros, FrmChama_Lancamentos_Financeiros);
  FrmChama_Lancamentos_Financeiros.Show;
  Util.Centraliza_Form(FrmChama_Lancamentos_Financeiros);
end;

procedure TFrmPrincipal.acCadastro_AgenciaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Agencia);
  Application.CreateForm(TFrmCadastro_Agencia, FrmCadastro_Agencia);
  FrmCadastro_Agencia.Show;
  Util.Centraliza_Form(FrmCadastro_Agencia);
end;

procedure TFrmPrincipal.acCadastro_BancarioExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Extrato_Bancario);
  Application.CreateForm(TFrmConsulta_Extrato_Bancario, FrmConsulta_Extrato_Bancario);
  FrmConsulta_Extrato_Bancario.Show;
  Util.Centraliza_Form(FrmConsulta_Extrato_Bancario);
end;

procedure TFrmPrincipal.acCadastro_BancoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Banco);
  Application.CreateForm(TFrmCadastro_Banco, FrmCadastro_Banco);
  FrmCadastro_Banco.Show;
  Util.Centraliza_Form(FrmCadastro_Banco);
end;

procedure TFrmPrincipal.acCadastro_Bem_PatrimonialExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Bem_Patrimonio);
  Application.CreateForm(TFrmCadastro_Bem_Patrimonio, FrmCadastro_Bem_Patrimonio);
  FrmCadastro_Bem_Patrimonio.Show;
  Util.Centraliza_Form(FrmCadastro_Bem_Patrimonio);
end;

procedure TFrmPrincipal.acCadastro_CaixaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Caixa);
  Application.CreateForm(TFrmCadastro_Caixa, FrmCadastro_Caixa);
  FrmCadastro_Caixa.Show;
  Util.Centraliza_Form(FrmCadastro_Caixa);
end;

procedure TFrmPrincipal.acCadastro_ChequeExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Cheque);
  Application.CreateForm(TFrmCadastro_Cheque, FrmCadastro_Cheque);
  FrmCadastro_Cheque.Show;
  Util.Centraliza_Form(FrmCadastro_Cheque);
end;

procedure TFrmPrincipal.acCadastro_CidadeExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Cidade);
  Application.CreateForm(TFrmCadastro_Cidade, FrmCadastro_Cidade);
  FrmCadastro_Cidade.Show;
  Util.Centraliza_Form(FrmCadastro_Cidade);
end;

procedure TFrmPrincipal.acCadastro_ClienteExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Cliente);
  Application.CreateForm(TFrmCadastro_Cliente, FrmCadastro_Cliente);
  FrmCadastro_Cliente.Show;
  Util.Centraliza_Form(FrmCadastro_Cliente);
end;

procedure TFrmPrincipal.acCadastro_Condicao_PagamentoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Condicao_Pagamento);
  Application.CreateForm(TFrmCadastro_Condicao_Pagamento, FrmCadastro_Condicao_Pagamento);
  FrmCadastro_Condicao_Pagamento.Show;
  Util.Centraliza_Form(FrmCadastro_Condicao_Pagamento);
end;

procedure TFrmPrincipal.acCadastro_Conta_CorrenteExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Conta_Corrente);
  Application.CreateForm(TFrmCadastro_Conta_Corrente, FrmCadastro_Conta_Corrente);
  FrmCadastro_Conta_Corrente.Show;
  Util.Centraliza_Form(FrmCadastro_Conta_Corrente);
end;

procedure TFrmPrincipal.acCadastro_DepartamentoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Departamento);
  Application.CreateForm(TFrmCadastro_Departamento, FrmCadastro_Departamento);
  FrmCadastro_Departamento.Show;
  Util.Centraliza_Form(FrmCadastro_Departamento);
end;

procedure TFrmPrincipal.AcCadastro_EmpresaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Empresa);
  Application.CreateForm(TFrmCadastro_Empresa, FrmCadastro_Empresa);
  FrmCadastro_Empresa.Show;
  Util.Centraliza_Form(FrmCadastro_Empresa);
end;

procedure TFrmPrincipal.acCadastro_Grupo_MaquinaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Grupo_Maquina);
  Application.CreateForm(TFrmCadastro_Grupo_Maquina, FrmCadastro_Grupo_Maquina);
  FrmCadastro_Grupo_Maquina.Show;
  Util.Centraliza_Form(FrmCadastro_Grupo_Maquina);
end;

procedure TFrmPrincipal.acCadastro_Itens_Folha_PagamentoExecute(
  Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Itens_Folha_Pagamento);
  Application.CreateForm(TFrmCadastro_Itens_Folha_Pagamento, FrmCadastro_Itens_Folha_Pagamento);
  FrmCadastro_Itens_Folha_Pagamento.Show;
  Util.Centraliza_Form(FrmCadastro_Itens_Folha_Pagamento);
end;

procedure TFrmPrincipal.acCadastro_LogradouroExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Logradouro);
  Application.CreateForm(TFrmCadastro_Logradouro, FrmCadastro_Logradouro);
  FrmCadastro_Logradouro.Show;
  Util.Centraliza_Form(FrmCadastro_Logradouro);
end;

procedure TFrmPrincipal.acCadastro_MaquinaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Maquina);
  Application.CreateForm(TFrmCadastro_Maquina, FrmCadastro_Maquina);
  FrmCadastro_Maquina.Show;
  Util.Centraliza_Form(FrmCadastro_Maquina);
end;

procedure TFrmPrincipal.acCadastro_MarcaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Marca);
  Application.CreateForm(TFrmCadastro_Marca, FrmCadastro_Marca);
  FrmCadastro_Marca.Show;
  Util.Centraliza_Form(FrmCadastro_Marca);
end;

procedure TFrmPrincipal.acCadastro_Perfil_UsuarioExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Perfil_Usuario);
  Application.CreateForm(TFrmCadastro_Perfil_Usuario, FrmCadastro_Perfil_Usuario);
  FrmCadastro_Perfil_Usuario.Show;
  Util.Centraliza_Form(FrmCadastro_Perfil_Usuario);
end;

procedure TFrmPrincipal.acCadastro_Plano_FinanceiroExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Plano_Financeiro);
  Application.CreateForm(TFrmCadastro_Plano_Financeiro, FrmCadastro_Plano_Financeiro);
  FrmCadastro_Plano_Financeiro.Show;
  Util.Centraliza_Form(FrmCadastro_Plano_Financeiro);
end;

procedure TFrmPrincipal.acCadastro_SafraExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Safra);
  Application.CreateForm(TFrmCadastro_Safra, FrmCadastro_Safra);
  FrmCadastro_Safra.Show;
  Util.Centraliza_Form(FrmCadastro_Safra);
end;

procedure TFrmPrincipal.acCadastro_SetorExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Setor);
  Application.CreateForm(TFrmCadastro_Setor, FrmCadastro_Setor);
  FrmCadastro_Setor.Show;
  Util.Centraliza_Form(FrmCadastro_Setor);
end;

procedure TFrmPrincipal.acCadastro_Tipo_Bem_PatrimonialExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Tipo_Bem_Patrimonio);
  Application.CreateForm(TFrmCadastro_Tipo_Bem_Patrimonio, FrmCadastro_Tipo_Bem_Patrimonio);
  FrmCadastro_Tipo_Bem_Patrimonio.Show;
  Util.Centraliza_Form(FrmCadastro_Tipo_Bem_Patrimonio);
end;

procedure TFrmPrincipal.acCadastro_Tipo_CulturaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Cultura);
  Application.CreateForm(TFrmCadastro_Cultura, FrmCadastro_Cultura);
  FrmCadastro_Cultura.Show;
  Util.Centraliza_Form(FrmCadastro_Cultura);
end;

procedure TFrmPrincipal.acCadastro_Tipo_DocumentoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Tipo_Documento);
  Application.CreateForm(TFrmCadastro_Tipo_Documento, FrmCadastro_Tipo_Documento);
  FrmCadastro_Tipo_Documento.Show;
  Util.Centraliza_Form(FrmCadastro_Tipo_Documento);
end;

procedure TFrmPrincipal.acCadastro_Unidade_MedidaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Unidade_Medida);
  Application.CreateForm(TFrmCadastro_Unidade_Medida, FrmCadastro_Unidade_Medida);
  FrmCadastro_Unidade_Medida.Show;
  Util.Centraliza_Form(FrmCadastro_Unidade_Medida);
end;

procedure TFrmPrincipal.AcCadastro_UsuarioExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Usuario);
  Application.CreateForm(TFrmCadastro_Usuario, FrmCadastro_Usuario);
  FrmCadastro_Usuario.Show;
  Util.Centraliza_Form(FrmCadastro_Usuario);
end;

procedure TFrmPrincipal.acComparativo_PrecoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Comparativo_Preco_Cotacao);
  Application.CreateForm(TFrmConsulta_Comparativo_Preco_Cotacao, FrmConsulta_Comparativo_Preco_Cotacao);
  FrmConsulta_Comparativo_Preco_Cotacao.Show;
  Util.Centraliza_Form(FrmConsulta_Comparativo_Preco_Cotacao);
end;

procedure TFrmPrincipal.acCompraExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCompra);
  Application.CreateForm(TFrmCompra, FrmCompra);
  FrmCompra.Show;
  Util.Centraliza_Form(FrmCompra);
end;

procedure TFrmPrincipal.acConciliacao_BancariaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConciliacao_Bancaria);
  Application.CreateForm(TFrmConciliacao_Bancaria, FrmConciliacao_Bancaria);
  FrmConciliacao_Bancaria.Show;
  Util.Centraliza_Form(FrmConciliacao_Bancaria);
end;

procedure TFrmPrincipal.acConciliacao_ProdutoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConciliacao_Compra);
  Application.CreateForm(TFrmConciliacao_Compra, FrmConciliacao_Compra);
  FrmConciliacao_Compra.Show;
  Util.Centraliza_Form(FrmConciliacao_Compra);
end;

procedure TFrmPrincipal.acConfiguracao_SistemaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConfiguracao_Sistema);
  Application.CreateForm(TFrmConfiguracao_Sistema, FrmConfiguracao_Sistema);
  FrmConfiguracao_Sistema.Show;
  Util.Centraliza_Form(FrmConfiguracao_Sistema);
end;

procedure TFrmPrincipal.acConsulta_Acerto_CaixaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Acerto_Caixa);
  Application.CreateForm(TFrmConsulta_Acerto_Caixa, FrmConsulta_Acerto_Caixa);
  FrmConsulta_Acerto_Caixa.Show;
  Util.Centraliza_Form(FrmConsulta_Acerto_Caixa);
end;

procedure TFrmPrincipal.acConsulta_Agenda_CompromissoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Agenda_Compromisso);
  Application.CreateForm(TFrmConsulta_Agenda_Compromisso, FrmConsulta_Agenda_Compromisso);
  FrmConsulta_Agenda_Compromisso.Show;
  Util.Centraliza_Form(FrmConsulta_Agenda_Compromisso);
end;

procedure TFrmPrincipal.acConsulta_Agenda_TelefonicaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Agenda_Telefonica);
  Application.CreateForm(TFrmConsulta_Agenda_Telefonica, FrmConsulta_Agenda_Telefonica);
  FrmConsulta_Agenda_Telefonica.Show;
  Util.Centraliza_Form(FrmConsulta_Agenda_Telefonica);
end;

procedure TFrmPrincipal.acConsulta_ChequeExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Cheque);
  Application.CreateForm(TFrmConsulta_Cheque, FrmConsulta_Cheque);
  FrmConsulta_Cheque.Show;
  Util.Centraliza_Form(FrmConsulta_Cheque);
end;

procedure TFrmPrincipal.acConsulta_CompraExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Compra);
  Application.CreateForm(TFrmConsulta_Compra, FrmConsulta_Compra);
  FrmConsulta_Compra.Show;
  Util.Centraliza_Form(FrmConsulta_Compra);
end;

procedure TFrmPrincipal.acConsulta_Cotacao_PrecoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Cotacao_Preco_Produto);
  Application.CreateForm(TFrmConsulta_Cotacao_Preco_Produto, FrmConsulta_Cotacao_Preco_Produto);
  FrmConsulta_Cotacao_Preco_Produto.Show;
  Util.Centraliza_Form(FrmConsulta_Cotacao_Preco_Produto);
end;

procedure TFrmPrincipal.acConsulta_Folha_PagamentoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Folha_Pagamento);
  Application.CreateForm(TFrmConsulta_Folha_Pagamento, FrmConsulta_Folha_Pagamento);
  FrmConsulta_Folha_Pagamento.Show;
  Util.Centraliza_Form(FrmConsulta_Folha_Pagamento);
end;

procedure TFrmPrincipal.acConsulta_HistoricoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Historico_Log);
  Application.CreateForm(TFrmConsulta_Historico_Log, FrmConsulta_Historico_Log);
  FrmConsulta_Historico_Log.Show;
  Util.Centraliza_Form(FrmConsulta_Historico_Log);
end;

procedure TFrmPrincipal.acConsulta_Lancamento_FinanceiroExecute(
  Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Lancamentos_Financeiros);
  Application.CreateForm(TFrmConsulta_Lancamentos_Financeiros, FrmConsulta_Lancamentos_Financeiros);
  FrmConsulta_Lancamentos_Financeiros.Show;
  Util.Centraliza_Form(FrmConsulta_Lancamentos_Financeiros);
end;

procedure TFrmPrincipal.acConsulta_PatrimonioExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Bem_Patrimonial);
  Application.CreateForm(TFrmConsulta_Bem_Patrimonial, FrmConsulta_Bem_Patrimonial);
  FrmConsulta_Bem_Patrimonial.Show;
  Util.Centraliza_Form(FrmConsulta_Bem_Patrimonial);
end;

procedure TFrmPrincipal.acConsulta_Retorno_CotacaoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Retorno_Cotacao_Preco);
  Application.CreateForm(TFrmConsulta_Retorno_Cotacao_Preco, FrmConsulta_Retorno_Cotacao_Preco);
  FrmConsulta_Retorno_Cotacao_Preco.Show;
  Util.Centraliza_Form(FrmConsulta_Retorno_Cotacao_Preco);
end;

procedure TFrmPrincipal.acConsulta_Saldo_BancarioExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Saldo_Bancario);
  Application.CreateForm(TFrmConsulta_Saldo_Bancario, FrmConsulta_Saldo_Bancario);
  FrmConsulta_Saldo_Bancario.Show;
  Util.Centraliza_Form(FrmConsulta_Saldo_Bancario);
end;

procedure TFrmPrincipal.acCotacao_PrecoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCotacao_Preco_Produto);
  Application.CreateForm(TFrmCotacao_Preco_Produto, FrmCotacao_Preco_Produto);
  FrmCotacao_Preco_Produto.Show;
  Util.Centraliza_Form(FrmCotacao_Preco_Produto);
end;

procedure TFrmPrincipal.acFolha_PagamentoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmFolha_Pagamento);
  Application.CreateForm(TFrmFolha_Pagamento, FrmFolha_Pagamento);
  FrmFolha_Pagamento.Show;
  Util.Centraliza_Form(FrmFolha_Pagamento);
end;

procedure TFrmPrincipal.acLancamento_BancarioExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmLancamento_Banco);
  Application.CreateForm(TFrmLancamento_Banco, FrmLancamento_Banco);
  FrmLancamento_Banco.Show;
  Util.Centraliza_Form(FrmLancamento_Banco);
end;

procedure TFrmPrincipal.acLancamento_FinanceiroExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmLancamento_Financeiro);
  Application.CreateForm(TFrmLancamento_Financeiro, FrmLancamento_Financeiro);
  FrmLancamento_Financeiro.Show;
  Util.Centraliza_Form(FrmLancamento_Financeiro);
end;

procedure TFrmPrincipal.acManutencao_EstoqueExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmManutencao_Estoque);
  Application.CreateForm(TFrmManutencao_Estoque, FrmManutencao_Estoque);
  FrmManutencao_Estoque.Show;
  Util.Centraliza_Form(FrmManutencao_Estoque);
end;

procedure TFrmPrincipal.acOperacao_BancariaExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmCadastro_Operacao_Bancaria);
  Application.CreateForm(TFrmCadastro_Operacao_Bancaria, FrmCadastro_Operacao_Bancaria);
  FrmCadastro_Operacao_Bancaria.Show;
  Util.Centraliza_Form(FrmCadastro_Operacao_Bancaria);
end;

procedure TFrmPrincipal.acReciboExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmRecibo);
  Application.CreateForm(TFrmRecibo, FrmRecibo);
  FrmRecibo.Show;
  Util.Centraliza_Form(FrmRecibo);
end;

procedure TFrmPrincipal.acRetorno_CotacaoExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmRetorno_Cotacao);
  Application.CreateForm(TFrmRetorno_Cotacao, FrmRetorno_Cotacao);
  FrmRetorno_Cotacao.Show;
  Util.Centraliza_Form(FrmRetorno_Cotacao);
end;

procedure TFrmPrincipal.acTransfere_LancamentosExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmTransfere_Lancamento);
  Application.CreateForm(TFrmTransfere_Lancamento, FrmTransfere_Lancamento);
  FrmTransfere_Lancamento.Show;
  Util.Centraliza_Form(FrmTransfere_Lancamento);
end;

procedure TFrmPrincipal.acConsulta_EstoqueExecute(Sender: TObject);
begin
  Util.Verifica_Form_Aberto(FrmConsulta_Estoque);
  Application.CreateForm(TFrmConsulta_Estoque, FrmConsulta_Estoque);
  FrmConsulta_Estoque.Show;
  Util.Centraliza_Form(FrmConsulta_Estoque);
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('Deseja sair do sistema?', 'Saindo...', MB_YESNO+MB_ICONHAND)= idno then
    CanClose:= false
  else
  begin
    if (fazer_backup = 'Sim') then
    begin
      shellexecute(handle, 'open', (PWideChar(ExtractFilePath(Application.ExeName) + 'Backup.exe')), '', nil,sw_shownormal);
    end;
    //FrmMenu_Geral.Free;
    Application.Terminate;
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  Application.HintPause:= 500;
  Application.HintHidePause:= 10000;

  Codigo_Empresa:= 1;
  Pega_Dados;
  Inicia_Progress;
end;

procedure TFrmPrincipal.Inicia_Progress;
var
  ProgressBarStyle: integer;
begin
  StbStatus.Panels[5].Style := psOwnerDraw;
  ProgressBar1.Parent := StbStatus;
  ProgressBarStyle := GetWindowLong(ProgressBar1.Handle, GWL_EXSTYLE);
  ProgressBarStyle := ProgressBarStyle - WS_EX_STATICEDGE;
  SetWindowLong(ProgressBar1.Handle, GWL_EXSTYLE, ProgressBarStyle);
end;

procedure TFrmPrincipal.Label2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMensagem_Sistema, FrmMensagem_Sistema);
  FrmMensagem_Sistema.Show;
  Util.Centraliza_Form(FrmMensagem_Sistema);
end;

procedure TFrmPrincipal.Pega_Dados;
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

procedure TFrmPrincipal.StbStatusDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel = StatusBar.Panels[5] then
  begin
    with ProgressBar1 do
    begin
      Top := Rect.Top;
      Left := Rect.Left;
      Width := Rect.Right - Rect.Left - 15;
      Height := Rect.Bottom - Rect.Top;
    end;
  end;
end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
var
  hora: string;
begin
  //StbStatus.Panels[4].Text := TimeToStr(time);

  case DayOfWeek(date) of
    1:
      StbStatus.Panels[3].Text := 'Domingo, ' + DateToStr(date);
    2:
      StbStatus.Panels[3].Text := 'Segunda Feira, ' + DateToStr(date);
    3:
      StbStatus.Panels[3].Text := 'Terça Feira, ' + DateToStr(date);
    4:
      StbStatus.Panels[3].Text := 'Quarta Feira, ' + DateToStr(date);
    5:
      StbStatus.Panels[3].Text := 'Quinta Feira, ' + DateToStr(date);
    6:
      StbStatus.Panels[3].Text := 'Sexta Feira, ' + DateToStr(date);
    7:
      StbStatus.Panels[3].Text := 'Sábado, ' + DateToStr(date);
  end;

  hora := TimeToStr(time);
  delete(hora, 3, 6);

  if (StrToInt(hora) >= 0) and (StrToInt(hora) < 12) then
    StbStatus.Panels[2].Text := 'Bom Dia'
  else if (StrToInt(hora) >= 12) and (StrToInt(hora) < 18) then
    StbStatus.Panels[2].Text := 'Boa Tarde'
  else
    StbStatus.Panels[2].Text := 'Boa Noite';
end;

end.
