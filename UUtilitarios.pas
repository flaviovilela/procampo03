unit UUtilitarios;

interface

uses
  Forms, ComCtrls, StdCtrls, Mask, Windows, SysUtils, Graphics, ADODB, DateUtils, IniFiles, Variants, Math,
  DBGrids, TLoggerUnit, ULog;

type
  TUtil = class
    procedure Habilita_Campos(Formulario: TForm);
    procedure Desabilita_Campos(Formulario: TForm);
    procedure Limpa_Campos(Formulario: TForm);
    procedure Somente_Apaga(var Key: Char);
    procedure Somente_Numero_Virgula(var Key: Char);
    procedure Somente_Numero(var key: char);
    procedure Somente_Numero_Sem_Zero(var key:char);
    procedure Verifica_Data(Componente: TMaskEdit);
    procedure FormataFloat(Casas: integer; Componente: TEdit; Valor: Double);
    procedure Centraliza_Form(Formulario: TForm);
    procedure Abre_Conexao(Ado: TADOConnection);
    procedure Pega_Caixa;
    procedure Inicia_Data(Data1, Data2: TMaskEdit);
    procedure Insere_Historico(Usuario, Historico, Hora, Tipo_Operacao: AnsiString; Data: TDate);
    procedure Pega_Empresa;
    function Alinha_Centro(Texto: String; Tamanho: Integer): Integer;
    function obterMenuNivel1(arvore: TTreeView; Texto: string): TTreeNode;
    procedure Atualiza_Estoque(Codigo_Produto: integer; Quantidade: double);

    function Calcula_MMC(x1, x2: Integer): Integer;
    procedure NextPrime(var P: Integer);
    procedure Atualiza_Estoque_Volume(Codigo_Produto: integer; Quantidade,
      Volume_Total: double);
    function Calcula_Juro_Composto(Principal, Taxa: double;
      Meses: integer): double;
    procedure Atualiza_Cheque(Data: TDate; Status:AnsiString; N_Cheque: integer);
    procedure Verifica_Form_Aberto(Form: TForm);
    function Gera_Codigo_Cadastro(Tabela: AnsiString): integer;
    procedure Pega_Endereco(Edt: TEdit);
    procedure Cadastra_Logradouro(Descricao, Tipo_Logradouro, CEP: AnsiString;
      Data_Cadastro: TDate);
    procedure Pega_Setor(Edt: TEdit);
    procedure Cadastra_Cidade(Descricao, UF, DDD: AnsiString;
      Data_Cadastro: TDate);
    procedure Cadastra_Setor(Descricao: AnsiString; Data_Cadastro: TDate);
    procedure Pega_Cidade(Edt: TEdit);
    procedure Ordena_Grid(Query: TADOQuery; Column: TColumn);
    procedure Atualiza_Saldo_Bancario(Codigo_Conta: integer; Valor_Operacao: Double; Tipo_Operacao: AnsiString; LancamentoExclusao: integer); overload;
    procedure Atualiza_Saldo_Bancario(NConta: AnsiString; Valor_Operacao: Double; Tipo_Operacao: AnsiString; LancamentoExclusao: integer); overload;
    procedure Atualiza_Status_Conta(Codigo_Lancamento: integer; Parcela: integer; Status: AnsiString; Data_Pagamento: TDate; NCheque: AnsiString;
    NConta: AnsiString; Codigo_L_Bancario: integer);
    procedure Atualiza_Status_Bancario(Codigo_Lancamento: integer; Status: AnsiString); overload;
    procedure Atualiza_Status_Bancario(NDocumento: AnsiString; Status: AnsiString); overload;
    function Pega_Saldo_Atual_Conta(Codigo_Conta: integer): double;
    function Pega_Tipo_Operacao(Codigo_Operacao: integer): AnsiString;
    function Pega_Codigo_Conta(NConta: AnsiString): integer;
    function Pega_Codigo_Cheque(NCheque: AnsiString): integer;
    procedure Insere_Extrato_Bancario(Codigo_Empresa: integer; N_Documento: integer; Data_Lancamento: TDate;
                                      Codigo_Conta: integer; Codigo_Cheque: Integer; Codigo_Operacao: integer;
                                      Codigo_Plano: integer; Descricao: AnsiString; Valor: double; Status: AnsiString;
                                      Saldo_Anterior: double; Saldo_Atual: double; Codigo_Conta_Transferencia: integer;
                                      Saldo_Anterior_Transferencia: double; Saldo_Atual_Transferencia: double);
  end;

  TMensagem= Class
    Procedure Mensagem_Falta_Dados;
    Procedure Cancele;
    function Confirma_Exclusao: Boolean;
    procedure Confirma_Insercao;
    procedure Impossivel_Executar;
    procedure Alteracao_Realizada;
    procedure Exclusao_Realizada;
    procedure Fim_Pesquisa;
    procedure Operacao_Iniciada;
    procedure Filme_Encontrado;
    procedure Qtde_Invalida;
    procedure Fracao_Invalida;
    procedure Composicao_Racial_Invalida;
    procedure Valor_Menor;
    procedure Impossivel_Excluir_Item;
    procedure Processo_Concluido;
    function Produto_Lancado: boolean;
    procedure Produto_Fracionado;
    procedure Fechar_Fracionado;
    procedure Pedido_Nao_Encontrado;
    procedure Operacao_Nao_Permitida;
    procedure Animal_Nao_Encontrado;
    procedure Quantidade_Estoque_Semen_Invalido;
    procedure Cobertura_Invalida;
    procedure Pesagem_Nao_Encontrada;
    procedure Pesagem_Encontrada;
    procedure Pedido_Fechado;
    procedure Pizza_Incompleta;
    procedure Mensagem_Cotacao_Existente;
    procedure Nao_Selecionado;
    function Confirma_Processo: boolean;
  End;

  const

  telefone_relatorio = '(64)9958-7272';
  empresa_relatorio_rodape = 'FAV Sistemas e Consultoria';
  empresa_relatorio_cabecalho = 'FAV Sistemas e Consultoria';

  insercao = 'INSERÇÃO';
  alteracao = 'ALTERAÇÃO';
  exclusao = 'EXCLUSÃO';
  consu = 'CONSULTA';

  var
  expressao, Usuario, Nome_Fantasia: string;
  cor_linha_dbgrid: TColor;
  cor_fonte_dbgrid: TColor;
  Codigo_Usuario, Codigo_Empresa, Codigo_Caixa: Integer;
  Data_Movimento: TDate;
  Habilitado: boolean;

  //Configurações do sistema
  avisa_contas_pagar, avisa_contas_receber, avisa_contas_fixas, avisa_cheque_vencer, avisa_produtos_vencidos, avisa_aniversario_funcionario,
  avisa_aniversario_cliente, avisa_animal_cobrir, avisa_animal_secar, avisa_animal_parir, avisa_aplicacao_programada,
  avisa_idade_animal, avisa_calendario, finalizar_periodo_lactacao, dias_coberta, dias_diagnosticada, dias_seca, dias_parida, avisa_lac_sec_vazia_atrasada,
  animal_sincronizar, protocolos_sincronizacao, mostrar_inicializacao,   fazer_backup, avisa_animal_sincronizar, avisa_protocolo_sincronizacao,
  animal_desmamar, avisa_novilhas_aptas, avisa_novilhas_aptas_atrasadas, avisa_novilhas_vazias_atrasadas, avisa_limite_producao, avisa_limite_diagnostico, avisa_animal_acima_pesagem, aptidao_novilhas, aviso_crescimento1,
  aviso_crescimento2, aviso_crescimento3, aviso_crescimento4, aviso_crescimento5, aviso_crescimento6, mu_aut_sit1, mu_aut_sit2, mu_aut_sit3, mu_aut_sit4, mu_aut_sit5, mu_aut_sit6, mu_aut_ap,
  aviso_crescimento1_macho, aviso_crescimento2_macho, aviso_crescimento3_macho, aviso_crescimento4_macho, aviso_crescimento5_macho, aviso_crescimento6_macho, aviso_crescimento7_macho,
  mu_aut_sit1_macho, mu_aut_sit2_macho, mu_aut_sit3_macho, mu_aut_sit4_macho, mu_aut_sit5_macho, mu_aut_sit6_macho, mu_aut_sit7_macho, mu_aut_lote_1, mu_aut_lote_2, mu_aut_lote_3, mu_aut_lote_4, mu_aut_lote_5, mu_aut_lote_6,
  mu_aut_lote_7, mu_aut_lote_8, mu_aut_lote_9, mu_aut_lote_10, avisa_lote_1, avisa_lote_2, avisa_lote_3, avisa_lote_4, avisa_lote_5, avisa_lote_6, avisa_lote_7, avisa_lote_8, avisa_lote_9, avisa_lote_10: string;

  situacao_crescimento1, situacao_crescimento2, situacao_crescimento3, situacao_crescimento4, situacao_crescimento5, situacao_crescimento6,
  dias_secamento, dias_paricao, dias_cobertura, dias_cobertura_sincronizacao, periodo_idade_de, periodo_idade_ate,
  dias_aviso, limite_producao_secagem, peso_maximo_leite, n_dias_coberta, n_dias_diagnosticada, n_dias_seca, n_dias_parida,
  valor_aptidao, n_dias_matrizes_atrasadas, n_dias_novilhas_aptas_atrasadas, n_dias_novilhas_atrasadas, limite_diagnostico, limite_desmama, de1, ate1,
  de2, ate2, de3, ate3, de4, ate4, de5, ate5, de6, ate6, situacao_animal_lactante, lim_min, lim_max,
  situacao_novilhas_aptas, situacao_novilhas_aptas_atrasadas, situacao_novilhas_vazias, situacao_novilhas_vazias_atrasadas, situacao_novilhas_cobertas, situacao_novilhas_gestantes,
  situacao_vaca_lac_vazia_normal, situacao_vaca_lac_vazia_atrasada, situacao_vaca_lac_coberta, situacao_vaca_lac_gestante,
  situacao_vaca_seca_vazia, situacao_vaca_seca_vazia_atrasada, situacao_vaca_seca_coberta, situacao_vaca_seca_gestante, situacao_vaca_seca_descarte,
  situacao_crescimento1_macho, situacao_crescimento2_macho, situacao_crescimento3_macho, situacao_crescimento4_macho, situacao_crescimento5_macho,
  situacao_crescimento6_macho, situacao_crescimento7_macho, situacao_reprodutor, situacao_rufiao, situacao_boi_carreiro, situacao_semen,
  situacao_lactante_macho, situacao_ini_lactante, situacao_ini_em_crescimento, situacao_ini_novilha, situacao_ini_matriz, situacao_ini_lactante_macho,
  situacao_ini_em_crescimento_macho, situacao_ini_reprodutor, situacao_ini_rufiao, situacao_ini_boi_carreiro, de1_macho, ate1_macho, de2_macho, ate2_macho,
  de3_macho, ate3_macho, de4_macho, ate4_macho, de5_macho, ate5_macho, de6_macho, ate6_macho, de7_macho, ate7_macho, limite_cheque, dias_acrecimo,
  de_lote_1, ate_lote_1, de_lote_2, ate_lote_2, de_lote_3, ate_lote_3, de_lote_4, ate_lote_4, de_lote_5, ate_lote_5, de_lote_6, ate_lote_6, de_lote_7, ate_lote_7,
  de_lote_8, ate_lote_8, de_lote_9, ate_lote_9, de_lote_10, ate_lote_10, sit_lote1, sit_lote2, sit_lote3, sit_lote4, sit_lote5, sit_lote6, sit_lote7, sit_lote8, sit_lote9, sit_lote10,
  avisa_conta_menor, avisa_conta_maior: integer;

  valor_conta_menor, valor_conta_maior: double;

  i, conta, conta_lote_1, conta_lote_2, conta_lote_3, conta_lote_4, conta_lote_5, conta_lote_6, conta_lote_7,
  conta_lote_8, conta_lote_9, conta_lote_10, conta_nov_vaz_atr, conta_nov_apta_atr, conta_nov_apta: integer;

  tem_nov_atr, tem_mat_atr, tem_nov_apta, tem_cres1, tem_cres2, tem_cres3, tem_cres4, tem_cres5, tem_cres6,
  tem_cres1_macho, tem_cres2_macho, tem_cres3_macho, tem_cres4_macho, tem_cres5_macho, tem_cres6_macho, tem_cres7_macho:
  boolean;

  achou_contas_pagar_maior, achou_contas_pagar_menor, achou_planejamento, achou_cliente, achou_produto, achou_pedido_compra,
  achou_funcionario, achou_secamento, achou_paricao, achou_cobertura, achou_calendario, achou_idade, achou_aplicacao,
  achou_limite_producao, achou_animal_acima_pesagem, achou_dias_coberta, achou_dias_diagnosticada, achou_dias_seca,
  achou_dias_parida, achou_animal_sincronizar, achou_protocolo_sincronizacao, achou_animal_desmamar, achou_novilhas_aptas,
  achou_dias_diagnostico, achou_situacao1, achou_situacao2, achou_situacao3, achou_situacao4, achou_situacao5, achou_situacao6,
  achou_lac_atrasada, achou_novilha_atrasada, achou_novilha_apta_atrasada, achou_sec_atrasada, achou_situacao1_macho, achou_situacao2_macho, achou_situacao3_macho, achou_situacao4_macho,
  achou_situacao5_macho, achou_situacao6_macho, achou_situacao7_macho, achou_cheque_vencer, achou_lote_1, achou_lote_2, achou_lote_3, achou_lote_4, achou_lote_5, achou_lote_6, achou_lote_7,
  achou_lote_8, achou_lote_9, achou_lote_10: Boolean;

  //verificar quais animais mudaram de lote
  animal_lote_1, animal_lote_2, animal_lote_3, animal_lote_4, animal_lote_5, animal_lote_6, animal_lote_7,
  animal_lote_8, animal_lote_9, animal_lote_10: string;

  // parametros para pegar dados da emprsa
  cnpj, tipo_endereco, endereco, numero, cidade, uf, telefone: AnsiString;

  //
  conta_mensagem: integer;
  conta_menor, conta_maior, cheque: AnsiString;

  //query para encontrar endereço, setor e cidade apenas digitando
  qAux_Endereco, qAux_Setor, qAux_Cidade: TADOQuery;

//------------------------------------------------------------------------------//

implementation

uses UDM, UPrincipal, UMensagens;

{ TUtil }

function TUtil.Calcula_Juro_Composto(Principal, Taxa: double; Meses: integer): double;
begin
  result := Principal * power((1 + Taxa), Meses);
end;

procedure TUtil.Atualiza_Estoque_Volume(Codigo_Produto: integer; Quantidade,
  Volume_Total: double);
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Cadastro_Produtos set Quantidade_Estoque = :Quantidade_Estoque, Volume_Total = :Volume_total');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= Codigo_Produto;
      Parameters.ParamByName('Quantidade_Estoque').Value:= Quantidade;
      Parameters.ParamByName('Volume_total').Value:= Volume_Total;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Atualiza_Saldo_Bancario(Codigo_Conta: integer; Valor_Operacao: Double; Tipo_Operacao: AnsiString; LancamentoExclusao: integer);
var
  qAuxSaldo, qAuxAtualiza: TADOQuery;
begin
  try
    try
      TLog.Debug('---Método para atualizar o saldo da conta, encontrando a conta pelo código da conta---');
      qAuxSaldo:= TADOQuery.Create(nil);
      qAuxAtualiza:= TADOQuery.Create(nil);
      with qAuxSaldo, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('select CC.Saldo_Atual from Cadastro_Conta_Corrente CC where Codigo_Conta_Corrente = :Conta');
        Parameters.ParamByName('Conta').Value:= Codigo_Conta;
        Open;
      end;

      if (qAuxSaldo.IsEmpty = false) then
      begin
        TLog.Debug('Encontrou saldo da conta. Vai atualizar o saldo.');
        TLog.Debug('Código da conta: '+IntToStr(Codigo_Conta));
        TLog.Debug('Valor da operação: '+FloatToStr(Valor_Operacao));
        TLog.Debug('Tipo da operação: '+Tipo_Operacao);
        with qAuxAtualiza, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;

          add('update Cadastro_Conta_Corrente set Saldo_Atual = :Saldo where Codigo_Conta_Corrente = :Conta');
          Parameters.ParamByName('Conta').Value:= Codigo_Conta;

          if (LancamentoExclusao = 0) then
          begin
            if (Tipo_Operacao = 'DÉBITO') then
              Parameters.ParamByName('Saldo').Value:= FloatToStr(qAuxSaldo.FieldByName('Saldo_Atual').AsFloat - Valor_Operacao)
            else if (Tipo_Operacao = 'CRÉDITO') then
              Parameters.ParamByName('Saldo').Value:= FloatToStr(qAuxSaldo.FieldByName('Saldo_Atual').AsFloat + Valor_Operacao);
          end
          else
          begin
            if (Tipo_Operacao = 'DÉBITO') then
              Parameters.ParamByName('Saldo').Value:= FloatToStr(qAuxSaldo.FieldByName('Saldo_Atual').AsFloat + Valor_Operacao)
            else if (Tipo_Operacao = 'CRÉDITO') then
              Parameters.ParamByName('Saldo').Value:= FloatToStr(qAuxSaldo.FieldByName('Saldo_Atual').AsFloat - Valor_Operacao);
          end;

          ExecSQL;
        end;
      end
      else
        TLog.Debug('Não encontrou saldo da conta.');

    except on E:Exception do
    begin
      Application.MessageBox(PWideChar('Erro ao atualizar saldo bancário: '+e.Message), 'Erro ao atualizar saldo bancário', MB_OK+MB_ICONHAND);
      TLog.Error('Erro ao atualizar saldo bancário: '+e.Message);
    end;

    end;
    TLog.Debug('---FIM DO MÉTODO---');
  finally
    FreeAndNil(qAuxSaldo);
    FreeAndNil(qAuxAtualiza);
  end;

end;

procedure TUtil.Atualiza_Saldo_Bancario(NConta: AnsiString;
  Valor_Operacao: Double; Tipo_Operacao: AnsiString;
  LancamentoExclusao: integer);
var
  qAuxSaldo, qAuxAtualiza: TADOQuery;
begin
  try
    try
      TLog.Debug('---Método para atualizar o saldo da conta, encontrando a conta pelo nº da conta---');
      qAuxSaldo:= TADOQuery.Create(nil);
      qAuxAtualiza:= TADOQuery.Create(nil);
      with qAuxSaldo, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('select CC.Saldo_Atual from Cadastro_Conta_Corrente CC where Conta_Corrente = :Conta');
        Parameters.ParamByName('Conta').Value:= NConta;
        Open;
      end;

      if (qAuxSaldo.IsEmpty = false) then
      begin
        TLog.Debug('Encontrou saldo da conta. Vai atualizar o saldo.');
        TLog.Debug('Nº da conta: '+NConta);
        TLog.Debug('Valor da operação: '+FloatToStr(Valor_Operacao));
        TLog.Debug('Tipo da operação: '+Tipo_Operacao);
        with qAuxAtualiza, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;

          add('update Cadastro_Conta_Corrente set Saldo_Atual = :Saldo where Conta_Corrente = :Conta');
          Parameters.ParamByName('Conta').Value:= NConta;

          if (LancamentoExclusao = 0) then
          begin
            if (Tipo_Operacao = 'DÉBITO') then
              Parameters.ParamByName('Saldo').Value:= FloatToStr(qAuxSaldo.FieldByName('Saldo_Atual').AsFloat - Valor_Operacao)
            else if (Tipo_Operacao = 'CRÉDITO') then
              Parameters.ParamByName('Saldo').Value:= FloatToStr(qAuxSaldo.FieldByName('Saldo_Atual').AsFloat + Valor_Operacao);
          end
          else
          begin
            if (Tipo_Operacao = 'DÉBITO') then
              Parameters.ParamByName('Saldo').Value:= FloatToStr(qAuxSaldo.FieldByName('Saldo_Atual').AsFloat + Valor_Operacao)
            else if (Tipo_Operacao = 'CRÉDITO') then
              Parameters.ParamByName('Saldo').Value:= FloatToStr(qAuxSaldo.FieldByName('Saldo_Atual').AsFloat - Valor_Operacao);
          end;

          ExecSQL;
        end;
      end
      else
        TLog.Debug('Não encontrou saldo da conta.');

    except on E:Exception do
    begin
      Application.MessageBox(PWideChar('Erro ao atualizar saldo bancário: '+e.Message), 'Erro ao atualizar saldo bancário', MB_OK+MB_ICONHAND);
      TLog.Error('Erro ao atualizar saldo bancário: '+e.Message);
    end;

    end;
    TLog.Debug('---FIM DO MÉTODO---');
  finally
    FreeAndNil(qAuxSaldo);
    FreeAndNil(qAuxAtualiza);
  end;

end;

procedure TUtil.Atualiza_Status_Bancario(Codigo_Lancamento: integer;
  Status: AnsiString);
var
  qAux: TADOQuery;
begin
  try
    try
      qAux:= TADOQuery.Create(nil);
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Lancamento_Banco set Status = :Status');
        Add('where Codigo = :Codigo');

        Parameters.ParamByName('Status').Value:= Status;
        Parameters.ParamByName('Codigo').Value:= Codigo_Lancamento;
        ExecSQL;
      end;
    except on e:Exception do
    begin
      Application.MessageBox(PWideChar('Erro ao atualizar status do lançamento bancário pelo código do lançamento: '+e.Message), 'Erro', MB_OK+MB_ICONHAND);
      TLog.Error('Erro ao atualizar status do lançamento bancário pelo código do lançamento: '+e.Message);
    end;

    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Atualiza_Status_Bancario(NDocumento: AnsiString;
  Status: AnsiString);
var
  qAux: TADOQuery;
begin
  try
    try
      qAux:= TADOQuery.Create(nil);
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Lancamento_Banco set Status = :Status');
        Add('where N_Documento = :N_Documento');

        Parameters.ParamByName('Status').Value:= Status;
        Parameters.ParamByName('N_Documento').Value:= NDocumento;
        ExecSQL;
      end;
    except on e:Exception do
    begin
      Application.MessageBox(PWideChar('Erro ao atualizar status do lançamento bancário pelo número do documento: '+e.Message), 'Erro', MB_OK+MB_ICONHAND);
      TLog.Error('Erro ao atualizar status do lançamento bancário pelo número do documento: '+e.Message);
    end;

    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Atualiza_Status_Conta(Codigo_Lancamento, Parcela: integer;
  Status: AnsiString; Data_Pagamento: TDate; NCheque, NConta: AnsiString;
  Codigo_L_Bancario: integer);
var
  qAux: TADOQuery;
begin
  try
    try
      qAux:= TADOQuery.Create(nil);
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Parcelas_Lancamentos set Status = :Status, Data_Pagamento = :Data_Pagamento, Cheque = :Cheque,');
        Add('Conta = :Conta, Codigo_Lancamento_Bancario = :Codigo_Lancamento_Bancario');
        Add('where Codigo = :Codigo and Parcela = :Parcela');

        Parameters.ParamByName('Status').Value:= Status;
        Parameters.ParamByName('Data_Pagamento').Value:= Data_Pagamento;
        Parameters.ParamByName('Cheque').Value:= NCheque;
        Parameters.ParamByName('Conta').Value:= NConta;
        Parameters.ParamByName('Codigo_Lancamento_Bancario').Value:= Codigo_L_Bancario;
        Parameters.ParamByName('Codigo').Value:= Codigo_Lancamento;
        Parameters.ParamByName('Parcela').Value:= Parcela;
        ExecSQL;
      end;
    except on e:Exception do
    begin
      Application.MessageBox(PWideChar('Erro ao atualizar status da conta: '+e.Message), 'Erro', MB_OK+MB_ICONHAND);
      TLog.Error('Erro ao atualizar status da conta: '+e.Message);
    end;

    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Abre_Conexao(Ado: TADOConnection);
var
  ArqIni: TIniFile;
  i: integer;
  banco, servidor, caminho_servidor: AnsiString;
begin
  cor_linha_dbgrid:= clMenu;
  cor_fonte_dbgrid:= clBlack;
  Ado.Connected:= false;

  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Conexao.ini');
  usuario:= ArqIni.ReadString('conecta', 'usuario', '');
  banco:= ArqIni.ReadString('conecta', 'base', '');
  servidor:= ArqIni.ReadString('conecta', 'servidor', '');
  caminho_servidor:= ArqIni.ReadString('conecta', 'caminho', '');
  Ado.ConnectionString:= PWideChar('Provider=SQLOLEDB.1;Password=@dminf@v01032011;Persist Security Info=True;User ID='+usuario+';Initial Catalog='+ banco +';Data Source='+ servidor + '');
  try
    Ado.Connected := true;
  except
    Application.MessageBox('Erro ao inicializar o banco de dados. Por favor, verifique.', 'Impossível Continuar', MB_OK+MB_ICONHAND);
    abort;
  end;
  ArqIni.Free

end;

function TUtil.Calcula_MMC(x1, x2: Integer): Integer;
var
  Resp, Prime: Integer;
  Flip: Boolean;
begin
//Inicializando as variáveis de controle
  Flip := false;
  Resp := 1;
  Prime := 2;

  while (x1 > 1) or (x2 > 1) do
  begin
  //Se x1 for divisível por Prime...
    if (x1 > 1) and ((x1 mod Prime) = 0) then
    begin
      x1 := x1 div Prime;
      Flip := true;
    end;

    //Se x2 for divisível por Prime...
    if (x2 > 1) and ((x2 mod Prime) = 0) then
    begin
      x2 := x2 div Prime;
      Flip := true;
    end;

    if Flip then
    begin
      Resp := Resp * Prime;
      Flip := false;
    end
    else
      NextPrime(Prime);
  end;
    result := Resp;
end;

procedure TUtil.NextPrime(var P: Integer);
begin
  if P = 2 then
    P := 3
    else if P = 3 then
    P := 5
    else if P = 5 then
    P := 7
    else if P = 7 then
    P := 11
    else if P = 11 then
    P := 13
    else if P = 13 then
    P := 17
    else if P = 17 then
    P := 19
    else if P = 19 then
    P := 23
    else if P = 23 then
    P := 29
    else if P = 29 then
    P := 31
    else if P = 31 then
    P := 37
    else if P = 37 then
    P := 41
    else if P = 41 then
    P := 43
    else if P = 43 then
    P := 47
    else if P = 47 then
    P := 49
    else if P = 53 then
    P := 59
end;

procedure TUtil.Centraliza_Form(Formulario: TForm);
begin
  Formulario.Left:= (GetSystemMetrics(SM_CXSCREEN) - Formulario.Width) div 2;
  Formulario.Top:= (FrmPrincipal.Height - Formulario.Height - FrmPrincipal.Ribbon1.Height )div 2 - FrmPrincipal.StbStatus.Height;
  Formulario.Refresh;
end;

procedure TUtil.Desabilita_Campos(Formulario: TForm);
var
  x: integer;
begin
  for x := 0 to Formulario.ComponentCount - 1 do
    if Formulario.Components[x] is TPageControl then
      TPageControl(Formulario.Components[x]).Enabled:= false;
end;

procedure TUtil.FormataFloat(Casas: integer; Componente: TEdit; Valor: Double);
begin
  if (casas = 2) then
    expressao:= '#0.0,0'
  else if (casas = 3) then
    expressao := '#0.0,00';

  Componente.Text:= FormatFloat(expressao, Valor);
  Componente.Text:= StringReplace(Componente.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

function TUtil.Gera_Codigo_Cadastro(Tabela: AnsiString): integer;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from ' + (Tabela)+'');
      open;
      Result:= qAux.FieldByName('Codigo').AsInteger + 1;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Pega_Endereco(Edt: TEdit);
var
  Posicao, Aux: Integer;
begin
  if (qAux_Endereco = Nil) then
    qAux_Endereco:= TADOQuery.Create(nil);
  try
    with qAux_Endereco, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select L.* from Cadastro_Logradouro L');
      add('where L.Logradouro like '''+ Edt.Text +'%'' order by L.Logradouro');
      open;
    end;

    If qAux_Endereco.FieldByName('Logradouro').AsString <> '' then
    begin
      Posicao := length(Edt.Text);
      For Aux := length(Edt.Text)+1 to Length(qAux_Endereco.FieldByName('Logradouro').AsString) do
      begin
        Edt.Text := Edt.Text + qAux_Endereco.FieldByName('Logradouro').AsString[Aux];
      end;
      Edt.SelStart := Posicao;
      Edt.SelLength := length(Edt.Text);
    end;
  finally
    //FreeAndNil(qAux_Produto);
  end;
end;

function TUtil.Pega_Saldo_Atual_Conta(Codigo_Conta: integer): double;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select CCC.Saldo_Atual from Cadastro_Conta_Corrente CCC where Codigo_Conta_Corrente = :Codigo');
      Parameters.ParamByName('Codigo').Value:= Codigo_Conta;
      open;
      Result:= qAux.FieldByName('Saldo_Atual').AsFloat;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Pega_Setor(Edt: TEdit);
var
  Posicao, Aux: Integer;
begin
  if (qAux_Setor = Nil) then
    qAux_Setor:= TADOQuery.Create(nil);
  try
    with qAux_Setor, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select L.Codigo, L.Descricao from Cadastro_Setor L');
      add('where L.Descricao like '''+ Edt.Text +'%'' order by L.Descricao');
      open;
    end;

    If qAux_Setor.FieldByName('Descricao').AsString <> '' then
    begin
      Posicao := length(Edt.Text);
      For Aux := length(Edt.Text)+1 to Length(qAux_Setor.FieldByName('Descricao').AsString) do
      begin
        Edt.Text := Edt.Text + qAux_Setor.FieldByName('Descricao').AsString[Aux];
      end;
      Edt.SelStart := Posicao;
      Edt.SelLength := length(Edt.Text);
    end;
  finally
    //FreeAndNil(qAux_Produto);
  end;
end;

function TUtil.Pega_Tipo_Operacao(Codigo_Operacao: integer): AnsiString;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select OB.Tipo from Operacao_Bancaria OB where OB.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= Codigo_Operacao;
      open;
      Result:= qAux.FieldByName('Tipo').AsString;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Ordena_Grid(Query: TADOQuery; Column: TColumn);
begin
  if (Query.Sort <> Column.FieldName+ ' ASC') then
    Query.Sort:= Column.FieldName+ ' ASC'
  else
    Query.sort:= Column.fieldname+ ' DESC';
end;

procedure TUtil.Pega_Cidade(Edt: TEdit);
var
  Posicao, Aux: Integer;
begin
  if (qAux_Cidade = Nil) then
    qAux_Cidade:= TADOQuery.Create(nil);
  try
    with qAux_Cidade, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select L.* from Cadastro_Cidade L');
      add('where L.Cidade like '''+ Edt.Text +'%'' order by L.Cidade');
      open;
    end;

    If qAux_Cidade.FieldByName('Cidade').AsString <> '' then
    begin
      Posicao := length(Edt.Text);
      For Aux := length(Edt.Text)+1 to Length(qAux_Cidade.FieldByName('Cidade').AsString) do
      begin
        Edt.Text := Edt.Text + qAux_Cidade.FieldByName('Cidade').AsString[Aux];
      end;
      Edt.SelStart := Posicao;
      Edt.SelLength := length(Edt.Text);
    end;
  finally
    //FreeAndNil(qAux_Produto);
  end;
end;

function TUtil.Pega_Codigo_Cheque(NCheque: AnsiString): integer;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select CC.Codigo_Cheque from Cadastro_Cheque CC where Numero_Cheque = :Codigo');
      Parameters.ParamByName('Codigo').Value:= NCheque;
      open;
      Result:= qAux.FieldByName('Codigo_Cheque').AsInteger;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

function TUtil.Pega_Codigo_Conta(NConta: AnsiString): integer;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select CCC.Codigo_Conta_Corrente from Cadastro_Conta_Corrente CCC where Conta_Corrente = :Codigo');
      Parameters.ParamByName('Codigo').Value:= NConta;
      open;
      Result:= qAux.FieldByName('Codigo_Conta_Corrente').AsInteger;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Cadastra_Logradouro(Descricao, Tipo_Logradouro, CEP: AnsiString; Data_Cadastro: TDate);
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);
  try
    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('Insert into Cadastro_Logradouro');
        add('(Codigo,');
        Add('Logradouro,');
        add('CEP,');
        add('Tipo_Logradouro,');
        add('Data_Cadastro)');

        add('values');

        add('(:Codigo,');
        add(':Logradouro,');
        add(':CEP,');
        add(':Tipo_Logradouro,');
        add(':Data_Cadastro)');

        Parameters.ParamByName('Codigo').Value:= Gera_Codigo_Cadastro('Cadastro_Logradouro');
        Parameters.ParamByName('Logradouro').Value:= Descricao;
        Parameters.ParamByName('CEP').Value:= CEP;
        Parameters.ParamByName('Tipo_Logradouro').Value:= Tipo_Logradouro;
        Parameters.ParamByName('Data_Cadastro').Value:= Data_Cadastro;
        ExecSQL;
      end;
    except on E:Exception do
    begin
      TMensagens.MensagemErro('Erro ao gravar Logradouro através do cadastro de cliente: '+e.Message);
    end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Cadastra_Setor(Descricao: AnsiString; Data_Cadastro: TDate);
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);
  try
    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('Insert into Cadastro_Setor');
        add('(Codigo,');
        add('Descricao,');
        add('Data_Cadastro)');

        add('values');

        add('(:Codigo,');
        add(' :Descricao,');
        add(' :Data_Cadastro)');

        Parameters.ParamByName('Codigo').Value:= Gera_Codigo_Cadastro('Cadastro_Setor');
        Parameters.ParamByName('Descricao').Value:= Descricao;
        Parameters.ParamByName('Data_Cadastro').Value:= Data_Cadastro;
        ExecSQL;
      end;
    except on E:Exception do
    begin
      TMensagens.MensagemErro('Erro ao gravar Setor através do cadastro de cliente: '+e.Message);
    end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Cadastra_Cidade(Descricao, UF, DDD: AnsiString; Data_Cadastro: TDate);
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);
  try
    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('Insert into Cadastro_Cidade');
        add('(Codigo,');
        add('Cidade,');
        add('UF,');
        add('DDD,');
        add('Data_Cadastro)');

        add('values');

        add('(:Codigo,');
        add(':Cidade,');
        add(':UF,');
        add(':DDD,');
        add(':Data_Cadastro)');

        Parameters.ParamByName('Codigo').Value:= Gera_Codigo_Cadastro('Cadastro_Cidade');
        Parameters.ParamByName('Cidade').Value:= Descricao;
        Parameters.ParamByName('UF').Value:= UF;
        Parameters.ParamByName('DDD').Value:= DDD;
        Parameters.ParamByName('Data_Cadastro').Value:= Data_Cadastro;
        ExecSQL;
      end;
    except on E:Exception do
    begin
      TMensagens.MensagemErro('Erro ao gravar Cidade através do cadastro de cliente: '+e.Message);
    end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Habilita_Campos(Formulario: TForm);
var
  x: integer;
begin
  for x := 0 to Formulario.ComponentCount - 1 do
    if Formulario.Components[x] is TPageControl then
      TPageControl(Formulario.Components[x]).Enabled:= true;
end;

function TUtil.Alinha_Centro(Texto: String; Tamanho: Integer): Integer;
begin
  Result := ((Tamanho - Length(Texto)) div 2);
end;

procedure TUtil.Atualiza_Cheque(Data: TDate; Status: AnsiString; N_Cheque: integer);
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Cadastro_Cheque set Data_Saida = :Data_Saida, Status = :Status');
      add('where Codigo_Cheque = :Numero');
      //Parameters.ParamByName('Enviado').Value:= EdtEnviado_A.Text;
      Parameters.ParamByName('Data_Saida').Value:= Data;
      Parameters.ParamByName('Status').Value:= Status;
      Parameters.ParamByName('Numero').Value:= N_Cheque;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Atualiza_Estoque(Codigo_Produto: integer; Quantidade: double);
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Cadastro_Produtos set Quantidade_Estoque = :Quantidade_Estoque');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= Codigo_Produto;
      Parameters.ParamByName('Quantidade_Estoque').Value:= Quantidade;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;

end;

procedure TUtil.Limpa_Campos(Formulario: TForm);
var
  x: integer;
begin
  for x := 0 to Formulario.ComponentCount - 1 do
    if Formulario.Components[x] is TEdit then
      TEdit(Formulario.Components[x]).Clear
    else if Formulario.Components[x] is TMaskEdit then
      TMaskEdit(Formulario.Components[x]).Clear
    else if Formulario.Components[x] is TComboBox then
      TComboBox(Formulario.Components[x]).ItemIndex:= -1
    else if Formulario.Components[x] is TMemo then
      TMemo(Formulario.Components[x]).Clear
    else if Formulario.Components[x] is TCheckBox then
      TCheckBox(Formulario.Components[x]).Checked:= true;
end;

function TUtil.obterMenuNivel1(arvore: TTreeView; Texto: string): TTreeNode;
var
  menu: TTreeNode;
  i: Integer;
begin
  menu := nil;

  // vamos obter o menu informado
  for i := 0 to arvore.items.count - 1 do
  begin
    if arvore.items[i].level > 0 then
      continue;

    if arvore.items[i].Text = Texto then
    begin
      menu := arvore.items[i];
      break;
    end;
  end;

  Result := menu;
end;

procedure TUtil.Pega_Empresa;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select CE.Codigo, CE.Nome_Fantasia from Cadastro_Empresa CE');
      open;
    end;

    if (qAux.IsEmpty) then
    begin
      Codigo_Empresa := 0;
      Nome_Fantasia:= '';
    end
    else
    begin
      Codigo_Empresa := qAux.FieldByName('Codigo').AsInteger;
      Nome_Fantasia:= qAux.FieldByName('Nome_Fantasia').AsString;
    end;

    FrmPrincipal.StbStatus.Panels[0].Text := 'EMPRESA...: ' + qAux.FieldByName('Nome_Fantasia').AsString;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Pega_Caixa;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select C.Caixa, AC.Codigo_Caixa, AC.Data_Abertura from Abertura_Caixa AC');
      add('left join Cadastro_Caixa C on (AC.Codigo_Caixa = C.Codigo)');
      add('where AC.Acerto = :Acerto and AC.Codigo_Usuario = :Usuario ');//and AC.Data_Abertura = :Dat');
      Parameters.ParamByName('Acerto').Value := 0;
      Parameters.ParamByName('Usuario').Value := Codigo_Usuario;
      open;
    end;

    if (qAux.IsEmpty) then
    begin
      Codigo_Caixa := 0;
      Data_Movimento:= StrToDate('01/01/1990');
      Habilitado:= false;
    end
    else
    begin
      Codigo_Caixa := qAux.FieldByName('Codigo_Caixa').AsInteger;
      Data_Movimento:= qAux.FieldByName('Data_Abertura').AsDateTime;
      Habilitado:= true;
    end;

    FrmPrincipal.StbStatus.Panels[4].Text := 'Caixa...: ' + qAux.FieldByName('Caixa').AsString;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Somente_Apaga(var Key: Char);
begin
  if not (key in [#08]) then
    key:= #0
end;

procedure TUtil.Somente_Numero(var key: char);
begin
  if not (key in ['0'..'9', #08]) then
    key:= #0
end;

procedure TUtil.Somente_Numero_Sem_Zero(var key: char);
begin
  if not (key in ['1'..'9', #08]) then
    key:= #0
end;

procedure TUtil.Somente_Numero_Virgula(var Key: Char);
begin
  if not (key in ['0'..'9', ',', #08]) then
    key:= #0
end;

procedure TUtil.Verifica_Data(Componente: TMaskEdit);
begin
  if (Componente.Text <> '  /  /    ') then
  begin
    try
      StrToDate(Componente.Text);
    except
    on EConvertError do
      begin
        Application.MessageBox('Data inválida.', 'Erro', MB_OK+MB_ICONHAND);
        Componente.SetFocus;
        Componente.Clear;
        Componente.Text:= DateToStr(date);
      end;
    end;
  end;
end;

procedure TUtil.Verifica_Form_Aberto(Form: TForm);
begin
  if (Form <> nil) then
  begin
    Application.MessageBox('Janela já aberta', 'Aviso', MB_OK+MB_ICONHAND);
    abort;
  end;
end;

procedure TUtil.Inicia_Data(Data1, Data2: TMaskEdit);
begin
  Data1.Text:= DateToStr(date);
  Data2.Text:= DateToStr(date);
end;

procedure TUtil.Insere_Extrato_Bancario(Codigo_Empresa, N_Documento: integer;
  Data_Lancamento: TDate; Codigo_Conta, Codigo_Cheque, Codigo_Operacao,
  Codigo_Plano: integer; Descricao: AnsiString; Valor: double;
  Status: AnsiString; Saldo_Anterior, Saldo_Atual: double;
  Codigo_Conta_Transferencia: integer; Saldo_Anterior_Transferencia,
  Saldo_Atual_Transferencia: double);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('Insert into Lancamento_Banco ');
      Add('(Codigo_Empresa, N_Documento, Data_Lancamento, Codigo_Conta, Codigo_Cheque,');
      add('Codigo_Operacao, Codigo_Plano, Descricao, Valor, Status, Saldo_Anterior, Saldo_Atual,');
      Add('Codigo_Conta_Transferencia, Saldo_Anterior_Transferencia, Saldo_Atual_Transferencia)');
      Add('values');
      Add('(:Codigo_Empresa, :N_Documento, :Data_Lancamento, :Codigo_Conta, :Codigo_Cheque,');
      add(':Codigo_Operacao, :Codigo_Plano, :Descricao, :Valor, :Status, :Saldo_Anterior, :Saldo_Atual,');
      Add(':Codigo_Conta_Transferencia, :Saldo_Anterior_Transferencia, :Saldo_Atual_Transferencia)');

      Parameters.ParamByName('Codigo_Empresa').Value := Codigo_Empresa;
      Parameters.ParamByName('N_Documento').Value := N_Documento;
      Parameters.ParamByName('Data_Lancamento').Value := Data_Lancamento;
      Parameters.ParamByName('Codigo_Conta').Value := Codigo_Conta;
      Parameters.ParamByName('Codigo_Cheque').Value := Codigo_Cheque;
      Parameters.ParamByName('Codigo_Operacao').Value := Codigo_Operacao;
      Parameters.ParamByName('Codigo_Plano').Value := Codigo_Plano;
      Parameters.ParamByName('Descricao').Value := Descricao;
      Parameters.ParamByName('Valor').Value := Valor;
      Parameters.ParamByName('Status').Value := Status;
      Parameters.ParamByName('Saldo_Anterior').Value := Saldo_Anterior;
      Parameters.ParamByName('Saldo_Atual').Value := Saldo_Atual;
      Parameters.ParamByName('Codigo_Conta_Transferencia').Value := Codigo_Conta_Transferencia;
      Parameters.ParamByName('Saldo_Anterior_Transferencia').Value := Saldo_Anterior_Transferencia;
      Parameters.ParamByName('Saldo_Atual_Transferencia').Value := Saldo_Atual_Transferencia;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TUtil.Insere_Historico(Usuario, Historico, Hora, Tipo_Operacao: AnsiString;
  Data: TDate);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('Insert into Historico (Usuario, Historico, Data, Hora, Tipo_Operacao) values ');
      add('(:Usuario, :Historico, :Data, :Hora, :Tipo_Operacao)');
      Parameters.ParamByName('Usuario').Value := Usuario;
      Parameters.ParamByName('Historico').Value := Historico;
      Parameters.ParamByName('Data').Value := Data;
      Parameters.ParamByName('Hora').Value := Hora;
      Parameters.ParamByName('Tipo_Operacao').Value := Tipo_Operacao;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

{ TMensagem }

procedure TMensagem.Alteracao_Realizada;
begin
  Application.MessageBox('Dados alterados com sucesso.', 'Confirmação', MB_OK+MB_ICONQUESTION);
end;

procedure TMensagem.Animal_Nao_Encontrado;
begin
  Application.MessageBox('O Animal que está fornecendo o embrião ou o sêmen, não se encontra cadastrado no Cadastro de Produtos. Por favor, cadastre', 'Atenção', MB_ICONHAND+MB_OK);
end;

procedure TMensagem.Cancele;
begin
  Application.MessageBox('Há uma operação em andamento. Por favor, salve ou cancele para fechar a janela.', 'Impossível fechar', MB_OK+MB_ICONHAND);
end;

procedure TMensagem.Cobertura_Invalida;
begin
  Application.MessageBox('Verifique a categoria do animal.', 'Atenção', MB_OK+MB_ICONHAND);
end;

procedure TMensagem.Composicao_Racial_Invalida;
begin
  Application.MessageBox('Composição inválida. A soma das raças deve igual a 1.', 'Atenção', MB_OK+MB_ICONHAND);
end;

function TMensagem.Confirma_Exclusao: Boolean;
begin
  if Application.MessageBox('Confirma a exclusão do registro selecionado?', 'Confirmação', MB_YESNO+MB_ICONQUESTION)=IDYES then
    Confirma_Exclusao:= true
  else
    Confirma_Exclusao:= false;
end;

procedure TMensagem.Confirma_Insercao;
begin
  Application.MessageBox('Dados inseridos com sucesso.', 'Confirmação', MB_OK+MB_ICONQUESTION);
end;

procedure TMensagem.Pedido_Fechado;
begin
  Application.MessageBox('OS já paga. Não se pode salvar/alterar o registro. Por favor, verifique.', 'Erro', MB_OK+MB_ICONHAND);
end;

procedure TMensagem.Exclusao_Realizada;
begin
  Application.MessageBox('Dados excluidos com sucesso.', 'Confirmação', MB_OK+MB_ICONQUESTION);
end;

procedure TMensagem.Fechar_Fracionado;
begin
  Application.MessageBox('O pedido não pode ser fechado com o valor fracionado. Por favor, verifique.', 'Erro', MB_OK+MB_ICONHAND);
end;

procedure TMensagem.Filme_Encontrado;
begin
  Application.MessageBox('Documento não encontrado', 'Erro', MB_OK+MB_ICONHAND);
end;

procedure TMensagem.Fim_Pesquisa;
begin
  Application.MessageBox('Dados não encontrados.', 'Fim de Pesquisa', MB_OK+MB_ICONEXCLAMATION);
end;

procedure TMensagem.Fracao_Invalida;
begin
  Application.MessageBox('Fração inválida. Por favor, verifique', 'Erro', MB_OK+MB_ICONHAND);
end;

procedure TMensagem.Impossivel_Excluir_Item;
begin
  Application.MessageBox('Impossível excluir item já devolvido.', 'Erro', MB_OK+MB_ICONHAND);
end;

procedure TMensagem.Impossivel_Executar;
begin
  Application.MessageBox('Impossível realizar operação.', 'Erro', MB_OK+MB_ICONHAND);
end;

procedure TMensagem.Mensagem_Falta_Dados;
begin
  Application.MessageBox('Há dados incorretos que não foram preenchidos.', 'Erro', MB_OK+MB_ICONHAND);
end;

procedure TMensagem.Operacao_Iniciada;
begin
  Application.MessageBox('Existe uma operação em andamento.', 'Erro', MB_OK+MB_ICONHAND);
end;

procedure TMensagem.Operacao_Nao_Permitida;
begin
  Application.MessageBox('Operação não permitida no momento.', 'Atenção', MB_OK+MB_ICONHAND);
end;

function TMensagem.Confirma_Processo: boolean;
begin
  if (Application.MessageBox('Confirma o procedimento com os registros selecionados?', 'Confirmação',
      MB_YESNO + MB_ICONQUESTION)) = idyes then
    Result := true
  else
    Result := false;
end;

procedure TMensagem.Pedido_Nao_Encontrado;
begin
  Application.MessageBox('Número de pedido não encontrado. Por favor, verifique.', 'Erro', MB_OK+MB_ICONHAND);
end;

procedure TMensagem.Pesagem_Encontrada;
begin
  Application.MessageBox('Foi encontrado lançamentos nesta data informada. Para alterar a(s) ordenha(s) dos animais, dê DUPLO CLIQUE ou pressione a tecla ENTER no animal desejado.', 'Atenção', MB_OK+MB_ICONQUESTION);
end;

procedure TMensagem.Pesagem_Nao_Encontrada;
begin
  Application.MessageBox('Não foi encontrado lançamentos de leite para essa data na Propriedade informada. Será criado um novo registro para que possa começar outro dia de lactação', 'Atenção', MB_OK+MB_ICONEXCLAMATION);
end;

procedure TMensagem.Pizza_Incompleta;
begin
  Application.MessageBox('O produto escolhido não está fechado num produto inteiro. Por favor, verifique.', 'Erro', MB_OK+MB_ICONHAND);
end;

procedure TMensagem.Processo_Concluido;
begin
  Application.MessageBox('Processo concluido com sucesso', 'Pronto', MB_OK+MB_ICONQUESTION);
end;

procedure TMensagem.Produto_Fracionado;
begin
  Application.MessageBox('O produto selecionado não pode ser vendido fracionado. Por favor, verifique.', 'Erro', MB_OK+MB_ICONHAND);
end;

function TMensagem.Produto_Lancado: boolean;
begin
  Application.MessageBox('Serviço já lançado.', 'Erro', MB_OK+MB_ICONHAND);
end;

procedure TMensagem.Qtde_Invalida;
begin
  Application.MessageBox('Valor inválido. Por favor, verifique.', 'Erro', MB_OK+MB_ICONHAND);
end;

procedure TMensagem.Nao_Selecionado;
begin
  Application.MessageBox('Item não encontrado. Por favor, verifique', 'Erro',
    MB_OK + MB_ICONHAND);
end;

procedure TMensagem.Mensagem_Cotacao_Existente;
begin
  Application.MessageBox('A cotação selecionada já se encontra lançada para esse fornecedor',
    'Cotação já realizada', MB_OK + MB_ICONHAND);
end;

procedure TMensagem.Quantidade_Estoque_Semen_Invalido;
begin
  Application.MessageBox('O Animal que está fornecendo o embrião ou o sêmen, encontra-se com o estoque inferior a quantidade informada. Por favor, verifique', 'Atenção', MB_ICONHAND+MB_OK);
end;

procedure TMensagem.Valor_Menor;
begin
  Application.MessageBox('Valor recebido é menor que o valor a pagar. Por favor, verifique.', 'Erro', MB_OK+MB_ICONHAND);
end;

end.
