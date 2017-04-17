object FrmChama_Perfil: TFrmChama_Perfil
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Perfil de Usu'#225'rio'
  ClientHeight = 553
  ClientWidth = 942
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LblMarca: TLabel
    Left = 127
    Top = 40
    Width = 61
    Height = 13
    Caption = 'Par'#226'metro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 80
    Width = 941
    Height = 473
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Perfil'
        Title.Caption = 'Descri'#231#227'o'
        Width = 337
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Visible = False
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 0
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Consulta por:'
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 127
    Top = 56
    Width = 289
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    TabOrder = 0
    OnChange = EdtConsultaChange
  end
  object qrychama_perfil: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Cadastro_Perfil_Usuario order by perfil')
    Left = 496
    Top = 320
    object qrychama_perfilCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_perfilPerfil: TStringField
      FieldName = 'Perfil'
    end
    object qrychama_perfilCadastro_Propriedade: TIntegerField
      FieldName = 'Cadastro_Propriedade'
    end
    object qrychama_perfilCadastro_Retiro: TIntegerField
      FieldName = 'Cadastro_Retiro'
    end
    object qrychama_perfilCadastro_Tipo_Bem: TIntegerField
      FieldName = 'Cadastro_Tipo_Bem'
    end
    object qrychama_perfilCadastro_Patrimonio: TIntegerField
      FieldName = 'Cadastro_Patrimonio'
    end
    object qrychama_perfilCadastro_Animal: TIntegerField
      FieldName = 'Cadastro_Animal'
    end
    object qrychama_perfilCadastro_Lote: TIntegerField
      FieldName = 'Cadastro_Lote'
    end
    object qrychama_perfilCadastro_Raca: TIntegerField
      FieldName = 'Cadastro_Raca'
    end
    object qrychama_perfilCadastro_Pelagem: TIntegerField
      FieldName = 'Cadastro_Pelagem'
    end
    object qrychama_perfilCadastro_Situacao: TIntegerField
      FieldName = 'Cadastro_Situacao'
    end
    object qrychama_perfilCadastro_Localidade: TIntegerField
      FieldName = 'Cadastro_Localidade'
    end
    object qrychama_perfilCadastro_Criador_Proprietario: TIntegerField
      FieldName = 'Cadastro_Criador_Proprietario'
    end
    object qrychama_perfilCadastro_Destinacao: TIntegerField
      FieldName = 'Cadastro_Destinacao'
    end
    object qrychama_perfilCadastro_Tipo_Pastagem: TIntegerField
      FieldName = 'Cadastro_Tipo_Pastagem'
    end
    object qrychama_perfilCadastro_Causa_Mortis: TIntegerField
      FieldName = 'Cadastro_Causa_Mortis'
    end
    object qrychama_perfilCadastro_Escore: TIntegerField
      FieldName = 'Cadastro_Escore'
    end
    object qrychama_perfilCadastro_Cor: TIntegerField
      FieldName = 'Cadastro_Cor'
    end
    object qrychama_perfilCadastro_Exame: TIntegerField
      FieldName = 'Cadastro_Exame'
    end
    object qrychama_perfilCadastro_Doenca: TIntegerField
      FieldName = 'Cadastro_Doenca'
    end
    object qrychama_perfilCadastro_Vacina: TIntegerField
      FieldName = 'Cadastro_Vacina'
    end
    object qrychama_perfilCadastro_Ocorrencia: TIntegerField
      FieldName = 'Cadastro_Ocorrencia'
    end
    object qrychama_perfilCadastro_Evento_Sanitario: TIntegerField
      FieldName = 'Cadastro_Evento_Sanitario'
    end
    object qrychama_perfilCadastro_Itens_Analise_Leite: TIntegerField
      FieldName = 'Cadastro_Itens_Analise_Leite'
    end
    object qrychama_perfilCadastro_Produto: TIntegerField
      FieldName = 'Cadastro_Produto'
    end
    object qrychama_perfilCadastro_Grupo_Produto: TIntegerField
      FieldName = 'Cadastro_Grupo_Produto'
    end
    object qrychama_perfilCadastro_Unidade_Medida: TIntegerField
      FieldName = 'Cadastro_Unidade_Medida'
    end
    object qrychama_perfilCadastro_Cliente: TIntegerField
      FieldName = 'Cadastro_Cliente'
    end
    object qrychama_perfilCadastro_Grupo_Cliente: TIntegerField
      FieldName = 'Cadastro_Grupo_Cliente'
    end
    object qrychama_perfilCadastro_Funcionario: TIntegerField
      FieldName = 'Cadastro_Funcionario'
    end
    object qrychama_perfilCadastro_Cargo: TIntegerField
      FieldName = 'Cadastro_Cargo'
    end
    object qrychama_perfilCadastro_Departamento: TIntegerField
      FieldName = 'Cadastro_Departamento'
    end
    object qrychama_perfilCadastro_Fornecedor: TIntegerField
      FieldName = 'Cadastro_Fornecedor'
    end
    object qrychama_perfilCadastro_Cidade: TIntegerField
      FieldName = 'Cadastro_Cidade'
    end
    object qrychama_perfilCadastro_Setor: TIntegerField
      FieldName = 'Cadastro_Setor'
    end
    object qrychama_perfilCadastro_Tipo_Logradouro: TIntegerField
      FieldName = 'Cadastro_Tipo_Logradouro'
    end
    object qrychama_perfilCadastro_Logradouro: TIntegerField
      FieldName = 'Cadastro_Logradouro'
    end
    object qrychama_perfilCadastro_Tipo_Atividade: TIntegerField
      FieldName = 'Cadastro_Tipo_Atividade'
    end
    object qrychama_perfilCadastro_Cheque: TIntegerField
      FieldName = 'Cadastro_Cheque'
    end
    object qrychama_perfilCadastro_Tipo_Cheque: TIntegerField
      FieldName = 'Cadastro_Tipo_Cheque'
    end
    object qrychama_perfilCadastro_Banco: TIntegerField
      FieldName = 'Cadastro_Banco'
    end
    object qrychama_perfilCadastro_Agencia: TIntegerField
      FieldName = 'Cadastro_Agencia'
    end
    object qrychama_perfilCadastro_Operacao_Bancaria: TIntegerField
      FieldName = 'Cadastro_Operacao_Bancaria'
    end
    object qrychama_perfilCadastro_Conta_Corrente: TIntegerField
      FieldName = 'Cadastro_Conta_Corrente'
    end
    object qrychama_perfilCadastro_Historico_Conta: TIntegerField
      FieldName = 'Cadastro_Historico_Conta'
    end
    object qrychama_perfilCadastro_Tipo_Documento: TIntegerField
      FieldName = 'Cadastro_Tipo_Documento'
    end
    object qrychama_perfilCadastro_Caixa: TIntegerField
      FieldName = 'Cadastro_Caixa'
    end
    object qrychama_perfilCadastro_Centro_Custo: TIntegerField
      FieldName = 'Cadastro_Centro_Custo'
    end
    object qrychama_perfilCadastro_Plano_Financeiro: TIntegerField
      FieldName = 'Cadastro_Plano_Financeiro'
    end
    object qrychama_perfilCadastro_Forma_Pagamento: TIntegerField
      FieldName = 'Cadastro_Forma_Pagamento'
    end
    object qrychama_perfilCobertura: TIntegerField
      FieldName = 'Cobertura'
    end
    object qrychama_perfilDiagnostico: TIntegerField
      FieldName = 'Diagnostico'
    end
    object qrychama_perfilAborto: TIntegerField
      FieldName = 'Aborto'
    end
    object qrychama_perfilSecamento: TIntegerField
      FieldName = 'Secamento'
    end
    object qrychama_perfilParto: TIntegerField
      FieldName = 'Parto'
    end
    object qrychama_perfilDesmama: TIntegerField
      FieldName = 'Desmama'
    end
    object qrychama_perfilBaixa: TIntegerField
      FieldName = 'Baixa'
    end
    object qrychama_perfilAnalise_Leite: TIntegerField
      FieldName = 'Analise_Leite'
    end
    object qrychama_perfilEvento_Sanitario: TIntegerField
      FieldName = 'Evento_Sanitario'
    end
    object qrychama_perfilCalendario_Sanitario: TIntegerField
      FieldName = 'Calendario_Sanitario'
    end
    object qrychama_perfilExame: TIntegerField
      FieldName = 'Exame'
    end
    object qrychama_perfilExame_Andrologico: TIntegerField
      FieldName = 'Exame_Andrologico'
    end
    object qrychama_perfilVacina: TIntegerField
      FieldName = 'Vacina'
    end
    object qrychama_perfilOcorrencia_Reprodutiva: TIntegerField
      FieldName = 'Ocorrencia_Reprodutiva'
    end
    object qrychama_perfilMamite_Clinica: TIntegerField
      FieldName = 'Mamite_Clinica'
    end
    object qrychama_perfilMamite_Subclinica: TIntegerField
      FieldName = 'Mamite_Subclinica'
    end
    object qrychama_perfilAplicacao_Programada: TIntegerField
      FieldName = 'Aplicacao_Programada'
    end
    object qrychama_perfilCarregar_Aplicacao: TIntegerField
      FieldName = 'Carregar_Aplicacao'
    end
    object qrychama_perfilEntre_Retiro: TIntegerField
      FieldName = 'Entre_Retiro'
    end
    object qrychama_perfilEntre_Lote: TIntegerField
      FieldName = 'Entre_Lote'
    end
    object qrychama_perfilEntre_Local: TIntegerField
      FieldName = 'Entre_Local'
    end
    object qrychama_perfilEntre_Fazenda: TIntegerField
      FieldName = 'Entre_Fazenda'
    end
    object qrychama_perfilPesagem_Leite_Individual: TIntegerField
      FieldName = 'Pesagem_Leite_Individual'
    end
    object qrychama_perfilPesagem_Leite_Geral: TIntegerField
      FieldName = 'Pesagem_Leite_Geral'
    end
    object qrychama_perfilFornecimento_Leite: TIntegerField
      FieldName = 'Fornecimento_Leite'
    end
    object qrychama_perfilFechamento_Fornecimento: TIntegerField
      FieldName = 'Fechamento_Fornecimento'
    end
    object qrychama_perfilConfinamento: TIntegerField
      FieldName = 'Confinamento'
    end
    object qrychama_perfilPesagem_Corporal: TIntegerField
      FieldName = 'Pesagem_Corporal'
    end
    object qrychama_perfilAltura_Animal: TIntegerField
      FieldName = 'Altura_Animal'
    end
    object qrychama_perfilAcompanhamento_Crescimento: TIntegerField
      FieldName = 'Acompanhamento_Crescimento'
    end
    object qrychama_perfilNovilha_Apta: TIntegerField
      FieldName = 'Novilha_Apta'
    end
    object qrychama_perfilEstacao_Monta: TIntegerField
      FieldName = 'Estacao_Monta'
    end
    object qrychama_perfilSincronizacao_Cio: TIntegerField
      FieldName = 'Sincronizacao_Cio'
    end
    object qrychama_perfilProtocolo_Sincronizacao: TIntegerField
      FieldName = 'Protocolo_Sincronizacao'
    end
    object qrychama_perfilColeta_Embriao: TIntegerField
      FieldName = 'Coleta_Embriao'
    end
    object qrychama_perfilTransferencia_Embriao: TIntegerField
      FieldName = 'Transferencia_Embriao'
    end
    object qrychama_perfilSexagem: TIntegerField
      FieldName = 'Sexagem'
    end
    object qrychama_perfilPesagem_Corporal_Lote: TIntegerField
      FieldName = 'Pesagem_Corporal_Lote'
    end
    object qrychama_perfilEvento_Sanitario_Lote: TIntegerField
      FieldName = 'Evento_Sanitario_Lote'
    end
    object qrychama_perfilDespesas_Com_Lote: TIntegerField
      FieldName = 'Despesas_Com_Lote'
    end
    object qrychama_perfilDados_Meteorologicos: TIntegerField
      FieldName = 'Dados_Meteorologicos'
    end
    object qrychama_perfilPremiacao: TIntegerField
      FieldName = 'Premiacao'
    end
    object qrychama_perfilVenda: TIntegerField
      FieldName = 'Venda'
    end
    object qrychama_perfilAssociar_Animal_Venda: TIntegerField
      FieldName = 'Associar_Animal_Venda'
    end
    object qrychama_perfilCompra: TIntegerField
      FieldName = 'Compra'
    end
    object qrychama_perfilAssociar_Animal_Compra: TIntegerField
      FieldName = 'Associar_Animal_Compra'
    end
    object qrychama_perfilCotacao_Produto: TIntegerField
      FieldName = 'Cotacao_Produto'
    end
    object qrychama_perfilManutencao_Estoque: TIntegerField
      FieldName = 'Manutencao_Estoque'
    end
    object qrychama_perfilLancamento_Financeiro: TIntegerField
      FieldName = 'Lancamento_Financeiro'
    end
    object qrychama_perfilBaixar_Titulo: TIntegerField
      FieldName = 'Baixar_Titulo'
    end
    object qrychama_perfilBaixar_Cheque: TIntegerField
      FieldName = 'Baixar_Cheque'
    end
    object qrychama_perfilCadastro_Itens_Folha_Pagamento: TIntegerField
      FieldName = 'Cadastro_Itens_Folha_Pagamento'
    end
    object qrychama_perfilFolha_Pagamento: TIntegerField
      FieldName = 'Folha_Pagamento'
    end
    object qrychama_perfilLancamento_Bancario: TIntegerField
      FieldName = 'Lancamento_Bancario'
    end
    object qrychama_perfilConciliacao_Bancaria: TIntegerField
      FieldName = 'Conciliacao_Bancaria'
    end
    object qrychama_perfilConsulta_Saldo_Bancario: TIntegerField
      FieldName = 'Consulta_Saldo_Bancario'
    end
    object qrychama_perfilConsulta_Extrato_Bancario: TIntegerField
      FieldName = 'Consulta_Extrato_Bancario'
    end
    object qrychama_perfilConsulta_Saldo_Consolidado: TIntegerField
      FieldName = 'Consulta_Saldo_Consolidado'
    end
    object qrychama_perfilConsulta_Valores_Bloqueados: TIntegerField
      FieldName = 'Consulta_Valores_Bloqueados'
    end
    object qrychama_perfilPlanejamento_Conta: TIntegerField
      FieldName = 'Planejamento_Conta'
    end
    object qrychama_perfilConsulta_Arvore_Genealogica: TIntegerField
      FieldName = 'Consulta_Arvore_Genealogica'
    end
    object qrychama_perfilConsulta_Relacao_Animal: TIntegerField
      FieldName = 'Consulta_Relacao_Animal'
    end
    object qrychama_perfilConsulta_Situacao_Animal: TIntegerField
      FieldName = 'Consulta_Situacao_Animal'
    end
    object qrychama_perfilConsulta_Idade_Animal: TIntegerField
      FieldName = 'Consulta_Idade_Animal'
    end
    object qrychama_perfilConsulta_Parida: TIntegerField
      FieldName = 'Consulta_Parida'
    end
    object qrychama_perfilConsulta_Vazia: TIntegerField
      FieldName = 'Consulta_Vazia'
    end
    object qrychama_perfilConsulta_Coberta: TIntegerField
      FieldName = 'Consulta_Coberta'
    end
    object qrychama_perfilConsulta_Diagnosticada: TIntegerField
      FieldName = 'Consulta_Diagnosticada'
    end
    object qrychama_perfilConsulta_Seca: TIntegerField
      FieldName = 'Consulta_Seca'
    end
    object qrychama_perfilConsulta_Abortada: TIntegerField
      FieldName = 'Consulta_Abortada'
    end
    object qrychama_perfilConsulta_A_Desmamar: TIntegerField
      FieldName = 'Consulta_A_Desmamar'
    end
    object qrychama_perfilConsulta_Baixa: TIntegerField
      FieldName = 'Consulta_Baixa'
    end
    object qrychama_perfilConsulta_Cobertura: TIntegerField
      FieldName = 'Consulta_Cobertura'
    end
    object qrychama_perfilConsulta_Diagnostico: TIntegerField
      FieldName = 'Consulta_Diagnostico'
    end
    object qrychama_perfilConsulta_Secamento: TIntegerField
      FieldName = 'Consulta_Secamento'
    end
    object qrychama_perfilConsulta_Aborto: TIntegerField
      FieldName = 'Consulta_Aborto'
    end
    object qrychama_perfilConsulta_Partos: TIntegerField
      FieldName = 'Consulta_Partos'
    end
    object qrychama_perfilConsulta_Desmama: TIntegerField
      FieldName = 'Consulta_Desmama'
    end
    object qrychama_perfilConsulta_Previsao_Secamento: TIntegerField
      FieldName = 'Consulta_Previsao_Secamento'
    end
    object qrychama_perfilConsulta_Previsao_Paricao: TIntegerField
      FieldName = 'Consulta_Previsao_Paricao'
    end
    object qrychama_perfilConsulta_Previsao_Cobertura: TIntegerField
      FieldName = 'Consulta_Previsao_Cobertura'
    end
    object qrychama_perfilConsulta_Previsao_Diagnostico: TIntegerField
      FieldName = 'Consulta_Previsao_Diagnostico'
    end
    object qrychama_perfilConsulta_Intervalo_Parto: TIntegerField
      FieldName = 'Consulta_Intervalo_Parto'
    end
    object qrychama_perfilConsulta_Parto_Aborto: TIntegerField
      FieldName = 'Consulta_Parto_Aborto'
    end
    object qrychama_perfilConsulta_Anotacao_Acompanhamento: TIntegerField
      FieldName = 'Consulta_Anotacao_Acompanhamento'
    end
    object qrychama_perfilConsulta_Anotacao_Ordenha: TIntegerField
      FieldName = 'Consulta_Anotacao_Ordenha'
    end
    object qrychama_perfilConsulta_Anotacao_Cadastro_Inicial: TIntegerField
      FieldName = 'Consulta_Anotacao_Cadastro_Inicial'
    end
    object qrychama_perfilConsulta_Anotacao_Cria_Recria: TIntegerField
      FieldName = 'Consulta_Anotacao_Cria_Recria'
    end
    object qrychama_perfilConsulta_Anotacao_Ocorrencia: TIntegerField
      FieldName = 'Consulta_Anotacao_Ocorrencia'
    end
    object qrychama_perfilConsulta_Anotacao_Produto: TIntegerField
      FieldName = 'Consulta_Anotacao_Produto'
    end
    object qrychama_perfilConsulta_Avaliacao_Reprodutor: TIntegerField
      FieldName = 'Consulta_Avaliacao_Reprodutor'
    end
    object qrychama_perfilConsulta_Agenda_Telefonica: TIntegerField
      FieldName = 'Consulta_Agenda_Telefonica'
    end
    object qrychama_perfilConsulta_Aplicacao_Programada: TIntegerField
      FieldName = 'Consulta_Aplicacao_Programada'
    end
    object qrychama_perfilConsulta_Analise_Leite: TIntegerField
      FieldName = 'Consulta_Analise_Leite'
    end
    object qrychama_perfilConsulta_Evento_Sanitario: TIntegerField
      FieldName = 'Consulta_Evento_Sanitario'
    end
    object qrychama_perfilConsulta_Calendario_Sanitario: TIntegerField
      FieldName = 'Consulta_Calendario_Sanitario'
    end
    object qrychama_perfilConsulta_Exame: TIntegerField
      FieldName = 'Consulta_Exame'
    end
    object qrychama_perfilConsulta_Exame_Andrologico: TIntegerField
      FieldName = 'Consulta_Exame_Andrologico'
    end
    object qrychama_perfilConsulta_Vacina: TIntegerField
      FieldName = 'Consulta_Vacina'
    end
    object qrychama_perfilConsulta_Ocorrencia: TIntegerField
      FieldName = 'Consulta_Ocorrencia'
    end
    object qrychama_perfilConsulta_Mamite_Clinica: TIntegerField
      FieldName = 'Consulta_Mamite_Clinica'
    end
    object qrychama_perfilConsulta_Mamite_Subclinica: TIntegerField
      FieldName = 'Consulta_Mamite_Subclinica'
    end
    object qrychama_perfilConsulta_Pesagem_Leite_Individual: TIntegerField
      FieldName = 'Consulta_Pesagem_Leite_Individual'
    end
    object qrychama_perfilConsulta_Pesagem_Leite_Geral: TIntegerField
      FieldName = 'Consulta_Pesagem_Leite_Geral'
    end
    object qrychama_perfilConsulta_Periodo_Lactacao: TIntegerField
      FieldName = 'Consulta_Periodo_Lactacao'
    end
    object qrychama_perfilConsulta_Rancking_Producao_Leite: TIntegerField
      FieldName = 'Consulta_Rancking_Producao_Leite'
    end
    object qrychama_perfilConsulta_Fornecimento_Leite: TIntegerField
      FieldName = 'Consulta_Fornecimento_Leite'
    end
    object qrychama_perfilConsulta_Fechamento_Fornecimento: TIntegerField
      FieldName = 'Consulta_Fechamento_Fornecimento'
    end
    object qrychama_perfilConsulta_Pesagem_Corporal: TIntegerField
      FieldName = 'Consulta_Pesagem_Corporal'
    end
    object qrychama_perfilConsulta_Comparativo_Peso_Periodo: TIntegerField
      FieldName = 'Consulta_Comparativo_Peso_Periodo'
    end
    object qrychama_perfilConsulta_Altura_Animal: TIntegerField
      FieldName = 'Consulta_Altura_Animal'
    end
    object qrychama_perfilConsulta_Comparativo_Altura_Periodo: TIntegerField
      FieldName = 'Consulta_Comparativo_Altura_Periodo'
    end
    object qrychama_perfilConsulta_Estacao_Monta: TIntegerField
      FieldName = 'Consulta_Estacao_Monta'
    end
    object qrychama_perfilConsulta_Sincronizacao_Cio: TIntegerField
      FieldName = 'Consulta_Sincronizacao_Cio'
    end
    object qrychama_perfilConsulta_Protocolo_Sincronizacao: TIntegerField
      FieldName = 'Consulta_Protocolo_Sincronizacao'
    end
    object qrychama_perfilConsulta_Coleta_Embriao: TIntegerField
      FieldName = 'Consulta_Coleta_Embriao'
    end
    object qrychama_perfilConsulta_Transferencia_Embriao: TIntegerField
      FieldName = 'Consulta_Transferencia_Embriao'
    end
    object qrychama_perfilConsulta_Transferencias: TIntegerField
      FieldName = 'Consulta_Transferencias'
    end
    object qrychama_perfilConsulta_Local_Animal: TIntegerField
      FieldName = 'Consulta_Local_Animal'
    end
    object qrychama_perfilConsulta_Lotes_Cadastrados: TIntegerField
      FieldName = 'Consulta_Lotes_Cadastrados'
    end
    object qrychama_perfilConsulta_Pesagem_Corporal_Lote: TIntegerField
      FieldName = 'Consulta_Pesagem_Corporal_Lote'
    end
    object qrychama_perfilConsulta_Evento_Sanitario_Lote: TIntegerField
      FieldName = 'Consulta_Evento_Sanitario_Lote'
    end
    object qrychama_perfilConsulta_Animal_Lote_X: TIntegerField
      FieldName = 'Consulta_Animal_Lote_X'
    end
    object qrychama_perfilConsulta_Despesa_Animal: TIntegerField
      FieldName = 'Consulta_Despesa_Animal'
    end
    object qrychama_perfilConsulta_Venda: TIntegerField
      FieldName = 'Consulta_Venda'
    end
    object qrychama_perfilConsulta_Detalhe_Venda_Animal: TIntegerField
      FieldName = 'Consulta_Detalhe_Venda_Animal'
    end
    object qrychama_perfilConsulta_Compra: TIntegerField
      FieldName = 'Consulta_Compra'
    end
    object qrychama_perfilConsulta_Detalhe_Compra_Animal: TIntegerField
      FieldName = 'Consulta_Detalhe_Compra_Animal'
    end
    object qrychama_perfilConsulta_Cotacao_Produto: TIntegerField
      FieldName = 'Consulta_Cotacao_Produto'
    end
    object qrychama_perfilConsulta_Estoque_Semen: TIntegerField
      FieldName = 'Consulta_Estoque_Semen'
    end
    object qrychama_perfilConsulta_Estoque_Embriao: TIntegerField
      FieldName = 'Consulta_Estoque_Embriao'
    end
    object qrychama_perfilConsulta_Estoque_Produto: TIntegerField
      FieldName = 'Consulta_Estoque_Produto'
    end
    object qrychama_perfilConsulta_Premiacao: TIntegerField
      FieldName = 'Consulta_Premiacao'
    end
    object qrychama_perfilConsulta_Dados_Meteorologicos: TIntegerField
      FieldName = 'Consulta_Dados_Meteorologicos'
    end
    object qrychama_perfilConsulta_Lancamento_Financeiro: TIntegerField
      FieldName = 'Consulta_Lancamento_Financeiro'
    end
    object qrychama_perfilConsulta_Conta_Fixa: TIntegerField
      FieldName = 'Consulta_Conta_Fixa'
    end
    object qrychama_perfilConsulta_Cheque: TIntegerField
      FieldName = 'Consulta_Cheque'
    end
    object qrychama_perfilConsulta_Folha_Pagamento: TIntegerField
      FieldName = 'Consulta_Folha_Pagamento'
    end
    object qrychama_perfilConsulta_Caixa: TIntegerField
      FieldName = 'Consulta_Caixa'
    end
    object qrychama_perfilConsulta_Custo_Leite: TIntegerField
      FieldName = 'Consulta_Custo_Leite'
    end
    object qrychama_perfilConsulta_Produtos: TIntegerField
      FieldName = 'Consulta_Produtos'
    end
    object qrychama_perfilConsulta_Alteracao_Preco: TIntegerField
      FieldName = 'Consulta_Alteracao_Preco'
    end
    object qrychama_perfilConsulta_Patrimonio: TIntegerField
      FieldName = 'Consulta_Patrimonio'
    end
    object qrychama_perfilConsulta_Funcionario: TIntegerField
      FieldName = 'Consulta_Funcionario'
    end
    object qrychama_perfilConsulta_Cliente: TIntegerField
      FieldName = 'Consulta_Cliente'
    end
    object qrychama_perfilConsulta_Plano_Financeiro: TIntegerField
      FieldName = 'Consulta_Plano_Financeiro'
    end
    object qrychama_perfilConsulta_Centro_Custo: TIntegerField
      FieldName = 'Consulta_Centro_Custo'
    end
    object qrychama_perfilConfiguracao_Sistema: TIntegerField
      FieldName = 'Configuracao_Sistema'
    end
    object qrychama_perfilMensagem_Sistema: TIntegerField
      FieldName = 'Mensagem_Sistema'
    end
    object qrychama_perfilAgenda_Telefonica: TIntegerField
      FieldName = 'Agenda_Telefonica'
    end
    object qrychama_perfilBloco_Notas: TIntegerField
      FieldName = 'Bloco_Notas'
    end
    object qrychama_perfilCalculadora: TIntegerField
      FieldName = 'Calculadora'
    end
    object qrychama_perfilRestaurar_Backup: TIntegerField
      FieldName = 'Restaurar_Backup'
    end
    object qrychama_perfilCadastro_Usuario: TIntegerField
      FieldName = 'Cadastro_Usuario'
    end
    object qrychama_perfilPerfil_Usuario: TIntegerField
      FieldName = 'Perfil_Usuario'
    end
    object qrychama_perfilTrocar_Usuario: TIntegerField
      FieldName = 'Trocar_Usuario'
    end
    object qrychama_perfilSair: TIntegerField
      FieldName = 'Sair'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_perfil
    Left = 496
    Top = 272
  end
end
