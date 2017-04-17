unit UChama_Perfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Perfil = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_perfil: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_perfilCodigo: TIntegerField;
    qrychama_perfilPerfil: TStringField;
    qrychama_perfilCadastro_Propriedade: TIntegerField;
    qrychama_perfilCadastro_Retiro: TIntegerField;
    qrychama_perfilCadastro_Tipo_Bem: TIntegerField;
    qrychama_perfilCadastro_Patrimonio: TIntegerField;
    qrychama_perfilCadastro_Animal: TIntegerField;
    qrychama_perfilCadastro_Lote: TIntegerField;
    qrychama_perfilCadastro_Raca: TIntegerField;
    qrychama_perfilCadastro_Pelagem: TIntegerField;
    qrychama_perfilCadastro_Situacao: TIntegerField;
    qrychama_perfilCadastro_Localidade: TIntegerField;
    qrychama_perfilCadastro_Criador_Proprietario: TIntegerField;
    qrychama_perfilCadastro_Destinacao: TIntegerField;
    qrychama_perfilCadastro_Tipo_Pastagem: TIntegerField;
    qrychama_perfilCadastro_Causa_Mortis: TIntegerField;
    qrychama_perfilCadastro_Escore: TIntegerField;
    qrychama_perfilCadastro_Cor: TIntegerField;
    qrychama_perfilCadastro_Exame: TIntegerField;
    qrychama_perfilCadastro_Doenca: TIntegerField;
    qrychama_perfilCadastro_Vacina: TIntegerField;
    qrychama_perfilCadastro_Ocorrencia: TIntegerField;
    qrychama_perfilCadastro_Evento_Sanitario: TIntegerField;
    qrychama_perfilCadastro_Itens_Analise_Leite: TIntegerField;
    qrychama_perfilCadastro_Produto: TIntegerField;
    qrychama_perfilCadastro_Grupo_Produto: TIntegerField;
    qrychama_perfilCadastro_Unidade_Medida: TIntegerField;
    qrychama_perfilCadastro_Cliente: TIntegerField;
    qrychama_perfilCadastro_Grupo_Cliente: TIntegerField;
    qrychama_perfilCadastro_Funcionario: TIntegerField;
    qrychama_perfilCadastro_Cargo: TIntegerField;
    qrychama_perfilCadastro_Departamento: TIntegerField;
    qrychama_perfilCadastro_Fornecedor: TIntegerField;
    qrychama_perfilCadastro_Cidade: TIntegerField;
    qrychama_perfilCadastro_Setor: TIntegerField;
    qrychama_perfilCadastro_Tipo_Logradouro: TIntegerField;
    qrychama_perfilCadastro_Logradouro: TIntegerField;
    qrychama_perfilCadastro_Tipo_Atividade: TIntegerField;
    qrychama_perfilCadastro_Cheque: TIntegerField;
    qrychama_perfilCadastro_Tipo_Cheque: TIntegerField;
    qrychama_perfilCadastro_Banco: TIntegerField;
    qrychama_perfilCadastro_Agencia: TIntegerField;
    qrychama_perfilCadastro_Operacao_Bancaria: TIntegerField;
    qrychama_perfilCadastro_Conta_Corrente: TIntegerField;
    qrychama_perfilCadastro_Historico_Conta: TIntegerField;
    qrychama_perfilCadastro_Tipo_Documento: TIntegerField;
    qrychama_perfilCadastro_Caixa: TIntegerField;
    qrychama_perfilCadastro_Centro_Custo: TIntegerField;
    qrychama_perfilCadastro_Plano_Financeiro: TIntegerField;
    qrychama_perfilCadastro_Forma_Pagamento: TIntegerField;
    qrychama_perfilCobertura: TIntegerField;
    qrychama_perfilDiagnostico: TIntegerField;
    qrychama_perfilAborto: TIntegerField;
    qrychama_perfilSecamento: TIntegerField;
    qrychama_perfilParto: TIntegerField;
    qrychama_perfilDesmama: TIntegerField;
    qrychama_perfilBaixa: TIntegerField;
    qrychama_perfilAnalise_Leite: TIntegerField;
    qrychama_perfilEvento_Sanitario: TIntegerField;
    qrychama_perfilCalendario_Sanitario: TIntegerField;
    qrychama_perfilExame: TIntegerField;
    qrychama_perfilExame_Andrologico: TIntegerField;
    qrychama_perfilVacina: TIntegerField;
    qrychama_perfilOcorrencia_Reprodutiva: TIntegerField;
    qrychama_perfilMamite_Clinica: TIntegerField;
    qrychama_perfilMamite_Subclinica: TIntegerField;
    qrychama_perfilAplicacao_Programada: TIntegerField;
    qrychama_perfilCarregar_Aplicacao: TIntegerField;
    qrychama_perfilEntre_Retiro: TIntegerField;
    qrychama_perfilEntre_Lote: TIntegerField;
    qrychama_perfilEntre_Local: TIntegerField;
    qrychama_perfilEntre_Fazenda: TIntegerField;
    qrychama_perfilPesagem_Leite_Individual: TIntegerField;
    qrychama_perfilPesagem_Leite_Geral: TIntegerField;
    qrychama_perfilFornecimento_Leite: TIntegerField;
    qrychama_perfilFechamento_Fornecimento: TIntegerField;
    qrychama_perfilConfinamento: TIntegerField;
    qrychama_perfilPesagem_Corporal: TIntegerField;
    qrychama_perfilAltura_Animal: TIntegerField;
    qrychama_perfilAcompanhamento_Crescimento: TIntegerField;
    qrychama_perfilNovilha_Apta: TIntegerField;
    qrychama_perfilEstacao_Monta: TIntegerField;
    qrychama_perfilSincronizacao_Cio: TIntegerField;
    qrychama_perfilProtocolo_Sincronizacao: TIntegerField;
    qrychama_perfilColeta_Embriao: TIntegerField;
    qrychama_perfilTransferencia_Embriao: TIntegerField;
    qrychama_perfilSexagem: TIntegerField;
    qrychama_perfilPesagem_Corporal_Lote: TIntegerField;
    qrychama_perfilEvento_Sanitario_Lote: TIntegerField;
    qrychama_perfilDespesas_Com_Lote: TIntegerField;
    qrychama_perfilDados_Meteorologicos: TIntegerField;
    qrychama_perfilPremiacao: TIntegerField;
    qrychama_perfilVenda: TIntegerField;
    qrychama_perfilAssociar_Animal_Venda: TIntegerField;
    qrychama_perfilCompra: TIntegerField;
    qrychama_perfilAssociar_Animal_Compra: TIntegerField;
    qrychama_perfilCotacao_Produto: TIntegerField;
    qrychama_perfilManutencao_Estoque: TIntegerField;
    qrychama_perfilLancamento_Financeiro: TIntegerField;
    qrychama_perfilBaixar_Titulo: TIntegerField;
    qrychama_perfilBaixar_Cheque: TIntegerField;
    qrychama_perfilCadastro_Itens_Folha_Pagamento: TIntegerField;
    qrychama_perfilFolha_Pagamento: TIntegerField;
    qrychama_perfilLancamento_Bancario: TIntegerField;
    qrychama_perfilConciliacao_Bancaria: TIntegerField;
    qrychama_perfilConsulta_Saldo_Bancario: TIntegerField;
    qrychama_perfilConsulta_Extrato_Bancario: TIntegerField;
    qrychama_perfilConsulta_Saldo_Consolidado: TIntegerField;
    qrychama_perfilConsulta_Valores_Bloqueados: TIntegerField;
    qrychama_perfilPlanejamento_Conta: TIntegerField;
    qrychama_perfilConsulta_Arvore_Genealogica: TIntegerField;
    qrychama_perfilConsulta_Relacao_Animal: TIntegerField;
    qrychama_perfilConsulta_Situacao_Animal: TIntegerField;
    qrychama_perfilConsulta_Idade_Animal: TIntegerField;
    qrychama_perfilConsulta_Parida: TIntegerField;
    qrychama_perfilConsulta_Vazia: TIntegerField;
    qrychama_perfilConsulta_Coberta: TIntegerField;
    qrychama_perfilConsulta_Diagnosticada: TIntegerField;
    qrychama_perfilConsulta_Seca: TIntegerField;
    qrychama_perfilConsulta_Abortada: TIntegerField;
    qrychama_perfilConsulta_A_Desmamar: TIntegerField;
    qrychama_perfilConsulta_Baixa: TIntegerField;
    qrychama_perfilConsulta_Cobertura: TIntegerField;
    qrychama_perfilConsulta_Diagnostico: TIntegerField;
    qrychama_perfilConsulta_Secamento: TIntegerField;
    qrychama_perfilConsulta_Aborto: TIntegerField;
    qrychama_perfilConsulta_Partos: TIntegerField;
    qrychama_perfilConsulta_Desmama: TIntegerField;
    qrychama_perfilConsulta_Previsao_Secamento: TIntegerField;
    qrychama_perfilConsulta_Previsao_Paricao: TIntegerField;
    qrychama_perfilConsulta_Previsao_Cobertura: TIntegerField;
    qrychama_perfilConsulta_Previsao_Diagnostico: TIntegerField;
    qrychama_perfilConsulta_Intervalo_Parto: TIntegerField;
    qrychama_perfilConsulta_Parto_Aborto: TIntegerField;
    qrychama_perfilConsulta_Anotacao_Acompanhamento: TIntegerField;
    qrychama_perfilConsulta_Anotacao_Ordenha: TIntegerField;
    qrychama_perfilConsulta_Anotacao_Cadastro_Inicial: TIntegerField;
    qrychama_perfilConsulta_Anotacao_Cria_Recria: TIntegerField;
    qrychama_perfilConsulta_Anotacao_Ocorrencia: TIntegerField;
    qrychama_perfilConsulta_Anotacao_Produto: TIntegerField;
    qrychama_perfilConsulta_Avaliacao_Reprodutor: TIntegerField;
    qrychama_perfilConsulta_Agenda_Telefonica: TIntegerField;
    qrychama_perfilConsulta_Aplicacao_Programada: TIntegerField;
    qrychama_perfilConsulta_Analise_Leite: TIntegerField;
    qrychama_perfilConsulta_Evento_Sanitario: TIntegerField;
    qrychama_perfilConsulta_Calendario_Sanitario: TIntegerField;
    qrychama_perfilConsulta_Exame: TIntegerField;
    qrychama_perfilConsulta_Exame_Andrologico: TIntegerField;
    qrychama_perfilConsulta_Vacina: TIntegerField;
    qrychama_perfilConsulta_Ocorrencia: TIntegerField;
    qrychama_perfilConsulta_Mamite_Clinica: TIntegerField;
    qrychama_perfilConsulta_Mamite_Subclinica: TIntegerField;
    qrychama_perfilConsulta_Pesagem_Leite_Individual: TIntegerField;
    qrychama_perfilConsulta_Pesagem_Leite_Geral: TIntegerField;
    qrychama_perfilConsulta_Periodo_Lactacao: TIntegerField;
    qrychama_perfilConsulta_Rancking_Producao_Leite: TIntegerField;
    qrychama_perfilConsulta_Fornecimento_Leite: TIntegerField;
    qrychama_perfilConsulta_Fechamento_Fornecimento: TIntegerField;
    qrychama_perfilConsulta_Pesagem_Corporal: TIntegerField;
    qrychama_perfilConsulta_Comparativo_Peso_Periodo: TIntegerField;
    qrychama_perfilConsulta_Altura_Animal: TIntegerField;
    qrychama_perfilConsulta_Comparativo_Altura_Periodo: TIntegerField;
    qrychama_perfilConsulta_Estacao_Monta: TIntegerField;
    qrychama_perfilConsulta_Sincronizacao_Cio: TIntegerField;
    qrychama_perfilConsulta_Protocolo_Sincronizacao: TIntegerField;
    qrychama_perfilConsulta_Coleta_Embriao: TIntegerField;
    qrychama_perfilConsulta_Transferencia_Embriao: TIntegerField;
    qrychama_perfilConsulta_Transferencias: TIntegerField;
    qrychama_perfilConsulta_Local_Animal: TIntegerField;
    qrychama_perfilConsulta_Lotes_Cadastrados: TIntegerField;
    qrychama_perfilConsulta_Pesagem_Corporal_Lote: TIntegerField;
    qrychama_perfilConsulta_Evento_Sanitario_Lote: TIntegerField;
    qrychama_perfilConsulta_Animal_Lote_X: TIntegerField;
    qrychama_perfilConsulta_Despesa_Animal: TIntegerField;
    qrychama_perfilConsulta_Venda: TIntegerField;
    qrychama_perfilConsulta_Detalhe_Venda_Animal: TIntegerField;
    qrychama_perfilConsulta_Compra: TIntegerField;
    qrychama_perfilConsulta_Detalhe_Compra_Animal: TIntegerField;
    qrychama_perfilConsulta_Cotacao_Produto: TIntegerField;
    qrychama_perfilConsulta_Estoque_Semen: TIntegerField;
    qrychama_perfilConsulta_Estoque_Embriao: TIntegerField;
    qrychama_perfilConsulta_Estoque_Produto: TIntegerField;
    qrychama_perfilConsulta_Premiacao: TIntegerField;
    qrychama_perfilConsulta_Dados_Meteorologicos: TIntegerField;
    qrychama_perfilConsulta_Lancamento_Financeiro: TIntegerField;
    qrychama_perfilConsulta_Conta_Fixa: TIntegerField;
    qrychama_perfilConsulta_Cheque: TIntegerField;
    qrychama_perfilConsulta_Folha_Pagamento: TIntegerField;
    qrychama_perfilConsulta_Caixa: TIntegerField;
    qrychama_perfilConsulta_Custo_Leite: TIntegerField;
    qrychama_perfilConsulta_Produtos: TIntegerField;
    qrychama_perfilConsulta_Alteracao_Preco: TIntegerField;
    qrychama_perfilConsulta_Patrimonio: TIntegerField;
    qrychama_perfilConsulta_Funcionario: TIntegerField;
    qrychama_perfilConsulta_Cliente: TIntegerField;
    qrychama_perfilConsulta_Plano_Financeiro: TIntegerField;
    qrychama_perfilConsulta_Centro_Custo: TIntegerField;
    qrychama_perfilConfiguracao_Sistema: TIntegerField;
    qrychama_perfilMensagem_Sistema: TIntegerField;
    qrychama_perfilAgenda_Telefonica: TIntegerField;
    qrychama_perfilBloco_Notas: TIntegerField;
    qrychama_perfilCalculadora: TIntegerField;
    qrychama_perfilRestaurar_Backup: TIntegerField;
    qrychama_perfilCadastro_Usuario: TIntegerField;
    qrychama_perfilPerfil_Usuario: TIntegerField;
    qrychama_perfilTrocar_Usuario: TIntegerField;
    qrychama_perfilSair: TIntegerField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Perfil: TFrmChama_Perfil;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Perfil_Usuario, UCadastro_Usuario;

{$R *.dfm}

procedure TFrmChama_Perfil.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Perfil.DBGrid1DblClick(Sender: TObject);
begin
  {if (FrmCadastro_Perfil_Usuario <> NIl) and (FrmCadastro_Perfil_Usuario.ativo = true) then
  begin
    FrmCadastro_Perfil_Usuario.EdtCodigo.Text:= qrychama_perfilCodigo.AsString;
    FrmCadastro_Perfil_Usuario.EdtPerfil.Text:= qrychama_perfilPerfil.AsString;

    //cadastros
    if (qrychama_perfilCadastro_Empresa.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[0].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[0].StateIndex := 2;

    if (qrychama_perfilCadastro_Cliente.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[1].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[1].StateIndex := 2;

    if (qrychama_perfilCadastro_Produto.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[2].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[2].StateIndex := 2;

    if (qrychama_perfilCadastro_Mesa.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[3].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[3].StateIndex := 2;

    if (qrychama_perfilCadastro_Usuario.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[4].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[4].StateIndex := 2;

    if (qrychama_perfilCadastro_Perfil_Usuario.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[5].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[5].StateIndex := 2;

    if (qrychama_perfilCadastro_Grupo_Produto.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[6].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[6].StateIndex := 2;

    if (qrychama_perfilCadastro_Ingrediente.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[7].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[7].StateIndex := 2;

    if (qrychama_perfilCadastro_Condicao_Pagamento.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[8].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[8].StateIndex := 2;

    if (qrychama_perfilCadastro_Plano_Financeiro.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[9].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[9].StateIndex := 2;

    if (qrychama_perfilCadastro_Tipo_Documento.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[10].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[10].StateIndex := 2;

    if (qrychama_perfilCadastro_Departamento.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[11].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[11].StateIndex := 2;

    if (qrychama_perfilCadastro_Caixa.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[12].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[12].StateIndex := 2;

    if (qrychama_perfilCadastro_Cidade.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[13].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[13].StateIndex := 2;

    if (qrychama_perfilCadastro_Setor.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[14].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[14].StateIndex := 2;

    if (qrychama_perfilCadastro_Logradouro.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[15].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[15].StateIndex := 2;


    //movimentação
    if (qrychama_perfilAbertura_Caixa.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[0].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[0].StateIndex := 2;

    if (qrychama_perfilAcerto_Caixa.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[1].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[1].StateIndex := 2;

    if (qrychama_perfilLancamento_Financeiro.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[2].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[2].StateIndex := 2;

    if (qrychama_perfilBaixar_Conta.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[3].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[3].StateIndex := 2;

    if (qrychama_perfilPedido.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[4].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[4].StateIndex := 2;

    if (qrychama_perfilMudanca_Status.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[5].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[5].StateIndex := 2;


    //ferramentas
    if (qrychama_perfilAgenda_Telefonica.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[0].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[0].StateIndex := 2;

    if (qrychama_perfilRecibo.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[1].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[1].StateIndex := 2;

    //relatórios

    if (qrychama_perfilConsulta_Lancamento_Financeiro.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[0].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[0].StateIndex := 2;

    if (qrychama_perfilConsulta_Acerto_Caixa.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[1].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[1].StateIndex := 2;

    if (qrychama_perfilConsulta_Fechamento_Caixa.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[2].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[2].StateIndex := 2;

    if (qrychama_perfilConsulta_Agenda_Telefonica.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[3].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[3].StateIndex := 2;

    if (qrychama_perfilConsulta_Historico_Acesso.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[4].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[4].StateIndex := 2;

    if (qrychama_perfilConsulta_Pedido.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[5].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[5].StateIndex := 2;

    if (qrychama_perfilConsulta_Rancking_Venda_Produto.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[6].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[6].StateIndex := 2;

    if (qrychama_perfilConsulta_Rancking_Venda_Cliente.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[7].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[7].StateIndex := 2;

    if (qrychama_perfilConsulta_Tempo_Producao.AsInteger = 1) then
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[8].StateIndex := 1
    else
      Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[8].StateIndex := 2;

    FrmCadastro_Perfil_Usuario.MEdtData_Cadastro.Text:= qrychama_perfilData_Cadastro.AsString;
    FrmChama_Perfil.Close;

    FrmCadastro_Perfil_Usuario.BBtnSalvar.Enabled:= true;
    FrmCadastro_Perfil_Usuario.BBtnExcluir.Enabled:= true;
    FrmCadastro_Perfil_Usuario.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Perfil_Usuario.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Perfil_Usuario);
    FrmCadastro_Perfil_Usuario.achei:= true;
    FrmCadastro_Perfil_Usuario.TreeView1.FullExpand;
  end
  else if (FrmCadastro_Usuario <> nil) and (FrmCadastro_Usuario.ativo = true) then
  begin
    FrmCadastro_Usuario.EdtCodigo_Perfil.Text:= qrychama_perfilCodigo.AsString;
    FrmCadastro_Usuario.EdtPerfil.Text:= qrychama_perfilPerfil.AsString;
    FrmChama_Perfil.Close;
  end;}
end;

procedure TFrmChama_Perfil.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmChama_Perfil.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Perfil.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Perfil;
end;

procedure TFrmChama_Perfil.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Perfil.Release;
end;

procedure TFrmChama_Perfil.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Perfil.FormShow(Sender: TObject);
begin
  qrychama_perfil.Close;
  qrychama_perfil.Open;
end;

end.
