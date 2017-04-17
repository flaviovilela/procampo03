object FrmChama_Propriedade_Inicial: TFrmChama_Propriedade_Inicial
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Consulta Propriedade'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 941
    Height = 552
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Nome_fantasia'
        Title.Caption = 'Nome'
        Width = 403
        Visible = True
      end>
  end
  object qrychama: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CP.Codigo, CP.Nome_fantasia, CP.Numero, CP.Telefone, CP.I' +
        'nscricao_Estadual, CC.Cidade, CC.UF, CS.Descricao as Setor, '
      'CL.Logradouro, CL.Tipo_Logradouro from Cadastro_Empresa CP'
      'left join Cadastro_Cidade CC on (CP.Codigo_Cidade = CC.Codigo)'
      'left join Cadastro_Setor CS on (CP.Codigo_Setor = CS.Codigo)'
      
        'left join Cadastro_Logradouro CL on (CP.Codigo_Endereco = CL.Cod' +
        'igo)')
    Left = 496
    Top = 320
    object qrychamaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychamaNome_fantasia: TStringField
      FieldName = 'Nome_fantasia'
      Size = 50
    end
    object qrychamaCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qrychamaSetor: TStringField
      FieldName = 'Setor'
      Size = 50
    end
    object qrychamaLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 100
    end
    object qrychamaTipo_Logradouro: TStringField
      FieldName = 'Tipo_Logradouro'
    end
    object qrychamaNumero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qrychamaTelefone: TStringField
      FieldName = 'Telefone'
    end
    object qrychamaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrychamaInscricao_Estadual: TStringField
      FieldName = 'Inscricao_Estadual'
      Size = 15
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama
    Left = 496
    Top = 272
  end
  object qryparametros: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CS.* from Configuracao_Sistema CS')
    Left = 216
    Top = 264
    object qryparametrosCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qryparametrosDias_Secamento: TIntegerField
      FieldName = 'Dias_Secamento'
    end
    object qryparametrosDias_Paricao: TIntegerField
      FieldName = 'Dias_Paricao'
    end
    object qryparametrosDias_Cobertura: TIntegerField
      FieldName = 'Dias_Cobertura'
    end
    object qryparametrosDias_Cobertura_Sincronizacao: TIntegerField
      FieldName = 'Dias_Cobertura_Sincronizacao'
    end
    object qryparametrosLancamento_Financeiro: TStringField
      FieldName = 'Lancamento_Financeiro'
      Size = 3
    end
    object qryparametrosContas_Fixas: TStringField
      FieldName = 'Contas_Fixas'
      Size = 3
    end
    object qryparametrosCheque_Vencer: TStringField
      FieldName = 'Cheque_Vencer'
      Size = 3
    end
    object qryparametrosProdutos_Vencidos: TStringField
      FieldName = 'Produtos_Vencidos'
      Size = 3
    end
    object qryparametrosAniversario_Funcionario: TStringField
      FieldName = 'Aniversario_Funcionario'
      Size = 3
    end
    object qryparametrosAniversario_Cliente: TStringField
      FieldName = 'Aniversario_Cliente'
      Size = 3
    end
    object qryparametrosAnimal_Cobrir: TStringField
      FieldName = 'Animal_Cobrir'
      Size = 3
    end
    object qryparametrosAnimal_Secar: TStringField
      FieldName = 'Animal_Secar'
      Size = 3
    end
    object qryparametrosAnimal_Parir: TStringField
      FieldName = 'Animal_Parir'
      Size = 3
    end
    object qryparametrosAplicacao_Programada: TStringField
      FieldName = 'Aplicacao_Programada'
      Size = 3
    end
    object qryparametrosAnimal_Idade: TStringField
      FieldName = 'Animal_Idade'
      Size = 3
    end
    object qryparametrosCalendario_Sanitario: TStringField
      FieldName = 'Calendario_Sanitario'
      Size = 3
    end
    object qryparametrosPeriodo_Idade_De: TIntegerField
      FieldName = 'Periodo_Idade_De'
    end
    object qryparametrosPeriodo_Idade_Ate: TIntegerField
      FieldName = 'Periodo_Idade_Ate'
    end
    object qryparametrosDias_Aviso: TIntegerField
      FieldName = 'Dias_Aviso'
    end
    object qryparametrosFinalizar_Periodo_Lactacao: TStringField
      FieldName = 'Finalizar_Periodo_Lactacao'
      Size = 3
    end
    object qryparametrosMostrar_Inicializacao: TStringField
      FieldName = 'Mostrar_Inicializacao'
      Size = 3
    end
    object qryparametrosBackup_Fechar_Sistema: TStringField
      FieldName = 'Backup_Fechar_Sistema'
      Size = 3
    end
    object qryparametrosAvisa_Dias_Coberta: TStringField
      FieldName = 'Avisa_Dias_Coberta'
      Size = 3
    end
    object qryparametrosN_Dias_Coberta: TIntegerField
      FieldName = 'N_Dias_Coberta'
    end
    object qryparametrosAvisa_Dias_Diagnosticada: TStringField
      FieldName = 'Avisa_Dias_Diagnosticada'
      Size = 3
    end
    object qryparametrosN_Dias_Diagnosticada: TIntegerField
      FieldName = 'N_Dias_Diagnosticada'
    end
    object qryparametrosAvisa_Dias_Seca: TStringField
      FieldName = 'Avisa_Dias_Seca'
      Size = 3
    end
    object qryparametrosN_Dias_Seca: TIntegerField
      FieldName = 'N_Dias_Seca'
    end
    object qryparametrosAvisa_Dias_Parida: TStringField
      FieldName = 'Avisa_Dias_Parida'
      Size = 3
    end
    object qryparametrosN_Dias_Parida: TIntegerField
      FieldName = 'N_Dias_Parida'
    end
    object qryparametrosAvisa_Lac_Sec_Vazia_Atrasada: TStringField
      FieldName = 'Avisa_Lac_Sec_Vazia_Atrasada'
      Size = 3
    end
    object qryparametrosAvisa_Novilha_Atrasada: TStringField
      FieldName = 'Avisa_Novilha_Atrasada'
      Size = 3
    end
    object qryparametrosAvisa_Novilha_Apta_Atrasada: TStringField
      FieldName = 'Avisa_Novilha_Apta_Atrasada'
      Size = 3
    end
    object qryparametrosAvisa_Animal_Sincronizar: TStringField
      FieldName = 'Avisa_Animal_Sincronizar'
      Size = 3
    end
    object qryparametrosAvisa_Protocolo_Sincronizacao: TStringField
      FieldName = 'Avisa_Protocolo_Sincronizacao'
      Size = 3
    end
    object qryparametrosAvisa_Animais_Desmamar: TStringField
      FieldName = 'Avisa_Animais_Desmamar'
      Size = 3
    end
    object qryparametrosAvisa_Novilhas_Aptas: TStringField
      FieldName = 'Avisa_Novilhas_Aptas'
      Size = 3
    end
    object qryparametrosAvisa_Limite_Producao: TStringField
      FieldName = 'Avisa_Limite_Producao'
      Size = 3
    end
    object qryparametrosAvisa_Limite_Diagnostico: TStringField
      FieldName = 'Avisa_Limite_Diagnostico'
      Size = 3
    end
    object qryparametrosLimite_Producao: TFloatField
      FieldName = 'Limite_Producao'
    end
    object qryparametrosAvisa_Vaca_Acima_Pesagem: TStringField
      FieldName = 'Avisa_Vaca_Acima_Pesagem'
      Size = 3
    end
    object qryparametrosPeso_Maximo_Leite: TFloatField
      FieldName = 'Peso_Maximo_Leite'
    end
    object qryparametrosAptidao_Novilhas: TStringField
      FieldName = 'Aptidao_Novilhas'
      Size = 5
    end
    object qryparametrosValor_Aptidao: TFloatField
      FieldName = 'Valor_Aptidao'
    end
    object qryparametrosLimite_Minimo_Aptidao: TIntegerField
      FieldName = 'Limite_Minimo_Aptidao'
    end
    object qryparametrosLimite_Maximo_Aptidao: TIntegerField
      FieldName = 'Limite_Maximo_Aptidao'
    end
    object qryparametrosMu_Aut_Ap: TStringField
      FieldName = 'Mu_Aut_Ap'
      Size = 3
    end
    object qryparametrosDias_Matrizes_Atrasadas: TIntegerField
      FieldName = 'Dias_Matrizes_Atrasadas'
    end
    object qryparametrosDias_Novilhas_Atrasadas: TIntegerField
      FieldName = 'Dias_Novilhas_Atrasadas'
    end
    object qryparametrosDias_Novilhas_Aptas_Atrasadas: TIntegerField
      FieldName = 'Dias_Novilhas_Aptas_Atrasadas'
    end
    object qryparametrosLimite_Diagnostico: TIntegerField
      FieldName = 'Limite_Diagnostico'
    end
    object qryparametrosLimite_Desmama: TIntegerField
      FieldName = 'Limite_Desmama'
    end
    object qryparametrosAnimais_Lactantes: TIntegerField
      FieldName = 'Animais_Lactantes'
    end
    object qryparametrosAvisa_Situacao1: TStringField
      FieldName = 'Avisa_Situacao1'
      Size = 3
    end
    object qryparametrosDe1: TIntegerField
      FieldName = 'De1'
    end
    object qryparametrosAte1: TIntegerField
      FieldName = 'Ate1'
    end
    object qryparametrosSituacao1: TIntegerField
      FieldName = 'Situacao1'
    end
    object qryparametrosMu_Aut_Sit1: TStringField
      FieldName = 'Mu_Aut_Sit1'
      Size = 3
    end
    object qryparametrosAvisa_Situacao2: TStringField
      FieldName = 'Avisa_Situacao2'
      Size = 3
    end
    object qryparametrosDe2: TIntegerField
      FieldName = 'De2'
    end
    object qryparametrosAte2: TIntegerField
      FieldName = 'Ate2'
    end
    object qryparametrosSituacao2: TIntegerField
      FieldName = 'Situacao2'
    end
    object qryparametrosMu_Aut_Sit2: TStringField
      FieldName = 'Mu_Aut_Sit2'
      Size = 3
    end
    object qryparametrosAvisa_Situacao3: TStringField
      FieldName = 'Avisa_Situacao3'
      Size = 3
    end
    object qryparametrosDe3: TIntegerField
      FieldName = 'De3'
    end
    object qryparametrosAte3: TIntegerField
      FieldName = 'Ate3'
    end
    object qryparametrosSituacao3: TIntegerField
      FieldName = 'Situacao3'
    end
    object qryparametrosMu_Aut_Sit3: TStringField
      FieldName = 'Mu_Aut_Sit3'
      Size = 3
    end
    object qryparametrosAvisa_Situacao4: TStringField
      FieldName = 'Avisa_Situacao4'
      Size = 3
    end
    object qryparametrosDe4: TIntegerField
      FieldName = 'De4'
    end
    object qryparametrosAte4: TIntegerField
      FieldName = 'Ate4'
    end
    object qryparametrosSituacao4: TIntegerField
      FieldName = 'Situacao4'
    end
    object qryparametrosMu_Aut_Sit4: TStringField
      FieldName = 'Mu_Aut_Sit4'
      Size = 3
    end
    object qryparametrosAvisa_Situacao5: TStringField
      FieldName = 'Avisa_Situacao5'
      Size = 3
    end
    object qryparametrosDe5: TIntegerField
      FieldName = 'De5'
    end
    object qryparametrosAte5: TIntegerField
      FieldName = 'Ate5'
    end
    object qryparametrosSituacao5: TIntegerField
      FieldName = 'Situacao5'
    end
    object qryparametrosMu_Aut_Sit5: TStringField
      FieldName = 'Mu_Aut_Sit5'
      Size = 3
    end
    object qryparametrosAvisa_Situacao6: TStringField
      FieldName = 'Avisa_Situacao6'
      Size = 3
    end
    object qryparametrosDe6: TIntegerField
      FieldName = 'De6'
    end
    object qryparametrosAte6: TIntegerField
      FieldName = 'Ate6'
    end
    object qryparametrosSituacao6: TIntegerField
      FieldName = 'Situacao6'
    end
    object qryparametrosMu_Aut_Sit6: TStringField
      FieldName = 'Mu_Aut_Sit6'
      Size = 3
    end
    object qryparametrosNovilhas_Aptas: TIntegerField
      FieldName = 'Novilhas_Aptas'
    end
    object qryparametrosNovilhas_Aptas_Atrasadas: TIntegerField
      FieldName = 'Novilhas_Aptas_Atrasadas'
    end
    object qryparametrosNovilhas_Vazias: TIntegerField
      FieldName = 'Novilhas_Vazias'
    end
    object qryparametrosNovilhas_Vazias_Atrasadas: TIntegerField
      FieldName = 'Novilhas_Vazias_Atrasadas'
    end
    object qryparametrosNovilhas_Cobertas: TIntegerField
      FieldName = 'Novilhas_Cobertas'
    end
    object qryparametrosNovilhas_Gestantes: TIntegerField
      FieldName = 'Novilhas_Gestantes'
    end
    object qryparametrosVacas_Lactacao_Vazias_Normais: TIntegerField
      FieldName = 'Vacas_Lactacao_Vazias_Normais'
    end
    object qryparametrosVacas_Lactacao_Vazias_Atrasadas: TIntegerField
      FieldName = 'Vacas_Lactacao_Vazias_Atrasadas'
    end
    object qryparametrosVacas_Lactacao_Cobertas: TIntegerField
      FieldName = 'Vacas_Lactacao_Cobertas'
    end
    object qryparametrosVacas_Lactacao_Gestantes: TIntegerField
      FieldName = 'Vacas_Lactacao_Gestantes'
    end
    object qryparametrosVacas_Secas_Vazia: TIntegerField
      FieldName = 'Vacas_Secas_Vazia'
    end
    object qryparametrosVacas_Secas_Vazias_Atrasadas: TIntegerField
      FieldName = 'Vacas_Secas_Vazias_Atrasadas'
    end
    object qryparametrosVacas_Secas_Cobertas: TIntegerField
      FieldName = 'Vacas_Secas_Cobertas'
    end
    object qryparametrosVacas_Secas_Gestantes: TIntegerField
      FieldName = 'Vacas_Secas_Gestantes'
    end
    object qryparametrosVacas_Secas_Descartes: TIntegerField
      FieldName = 'Vacas_Secas_Descartes'
    end
    object qryparametrosAnimais_Lactantes_Macho: TIntegerField
      FieldName = 'Animais_Lactantes_Macho'
    end
    object qryparametrosAvisa_Situacao1_Macho: TStringField
      FieldName = 'Avisa_Situacao1_Macho'
      Size = 3
    end
    object qryparametrosDe1_Macho: TIntegerField
      FieldName = 'De1_Macho'
    end
    object qryparametrosAte1_Macho: TIntegerField
      FieldName = 'Ate1_Macho'
    end
    object qryparametrosSituacao1_Macho: TIntegerField
      FieldName = 'Situacao1_Macho'
    end
    object qryparametrosMu_Aut_Sit1_Macho: TStringField
      FieldName = 'Mu_Aut_Sit1_Macho'
      Size = 3
    end
    object qryparametrosAvisa_Situacao2_Macho: TStringField
      FieldName = 'Avisa_Situacao2_Macho'
      Size = 3
    end
    object qryparametrosDe2_Macho: TIntegerField
      FieldName = 'De2_Macho'
    end
    object qryparametrosAte2_Macho: TIntegerField
      FieldName = 'Ate2_Macho'
    end
    object qryparametrosSituacao2_Macho: TIntegerField
      FieldName = 'Situacao2_Macho'
    end
    object qryparametrosMu_Aut_Sit2_Macho: TStringField
      FieldName = 'Mu_Aut_Sit2_Macho'
      Size = 3
    end
    object qryparametrosAvisa_Situacao3_Macho: TStringField
      FieldName = 'Avisa_Situacao3_Macho'
      Size = 3
    end
    object qryparametrosDe3_Macho: TIntegerField
      FieldName = 'De3_Macho'
    end
    object qryparametrosAte3_Macho: TIntegerField
      FieldName = 'Ate3_Macho'
    end
    object qryparametrosSituacao3_Macho: TIntegerField
      FieldName = 'Situacao3_Macho'
    end
    object qryparametrosMu_Aut_Sit3_Macho: TStringField
      FieldName = 'Mu_Aut_Sit3_Macho'
      Size = 3
    end
    object qryparametrosAvisa_Situacao4_Macho: TStringField
      FieldName = 'Avisa_Situacao4_Macho'
      Size = 3
    end
    object qryparametrosDe4_Macho: TIntegerField
      FieldName = 'De4_Macho'
    end
    object qryparametrosAte4_Macho: TIntegerField
      FieldName = 'Ate4_Macho'
    end
    object qryparametrosSituacao4_Macho: TIntegerField
      FieldName = 'Situacao4_Macho'
    end
    object qryparametrosMu_Aut_Sit4_Macho: TStringField
      FieldName = 'Mu_Aut_Sit4_Macho'
      Size = 3
    end
    object qryparametrosAvisa_Situacao5_Macho: TStringField
      FieldName = 'Avisa_Situacao5_Macho'
      Size = 3
    end
    object qryparametrosDe5_Macho: TIntegerField
      FieldName = 'De5_Macho'
    end
    object qryparametrosAte5_Macho: TIntegerField
      FieldName = 'Ate5_Macho'
    end
    object qryparametrosSituacao5_Macho: TIntegerField
      FieldName = 'Situacao5_Macho'
    end
    object qryparametrosMu_Aut_Sit5_Macho: TStringField
      FieldName = 'Mu_Aut_Sit5_Macho'
      Size = 3
    end
    object qryparametrosAvisa_Situacao6_Macho: TStringField
      FieldName = 'Avisa_Situacao6_Macho'
      Size = 3
    end
    object qryparametrosDe6_Macho: TIntegerField
      FieldName = 'De6_Macho'
    end
    object qryparametrosAte6_Macho: TIntegerField
      FieldName = 'Ate6_Macho'
    end
    object qryparametrosSituacao6_Macho: TIntegerField
      FieldName = 'Situacao6_Macho'
    end
    object qryparametrosMu_Aut_Sit6_Macho: TStringField
      FieldName = 'Mu_Aut_Sit6_Macho'
      Size = 3
    end
    object qryparametrosAvisa_Situacao7_Macho: TStringField
      FieldName = 'Avisa_Situacao7_Macho'
      Size = 3
    end
    object qryparametrosDe7_Macho: TIntegerField
      FieldName = 'De7_Macho'
    end
    object qryparametrosAte7_Macho: TIntegerField
      FieldName = 'Ate7_Macho'
    end
    object qryparametrosSituacao7_Macho: TIntegerField
      FieldName = 'Situacao7_Macho'
    end
    object qryparametrosMu_Aut_Sit7_Macho: TStringField
      FieldName = 'Mu_Aut_Sit7_Macho'
      Size = 3
    end
    object qryparametrosReprodutor: TIntegerField
      FieldName = 'Reprodutor'
    end
    object qryparametrosRufiao: TIntegerField
      FieldName = 'Rufiao'
    end
    object qryparametrosBoi_Carreiro: TIntegerField
      FieldName = 'Boi_Carreiro'
    end
    object qryparametrosSemen: TIntegerField
      FieldName = 'Semen'
    end
    object qryparametrosCat_Ini_Lactante: TIntegerField
      FieldName = 'Cat_Ini_Lactante'
    end
    object qryparametrosCat_Ini_Em_Crescimento: TIntegerField
      FieldName = 'Cat_Ini_Em_Crescimento'
    end
    object qryparametrosCat_Ini_Novilha: TIntegerField
      FieldName = 'Cat_Ini_Novilha'
    end
    object qryparametrosCat_Ini_Matriz: TIntegerField
      FieldName = 'Cat_Ini_Matriz'
    end
    object qryparametrosCat_Ini_Lactante_Macho: TIntegerField
      FieldName = 'Cat_Ini_Lactante_Macho'
    end
    object qryparametrosCat_Ini_Em_Crescimento_Macho: TIntegerField
      FieldName = 'Cat_Ini_Em_Crescimento_Macho'
    end
    object qryparametrosCat_Ini_Reprodutor: TIntegerField
      FieldName = 'Cat_Ini_Reprodutor'
    end
    object qryparametrosCat_Ini_Rufiao: TIntegerField
      FieldName = 'Cat_Ini_Rufiao'
    end
    object qryparametrosCat_Ini_Boi_Carreiro: TIntegerField
      FieldName = 'Cat_Ini_Boi_Carreiro'
    end
    object qryparametrosLimite_Cheque: TIntegerField
      FieldName = 'Limite_Cheque'
    end
    object qryparametrosDias_Acrecimo_Cheque: TIntegerField
      FieldName = 'Dias_Acrecimo_Cheque'
    end
    object qryparametrosAvisa_Lote_1: TStringField
      FieldName = 'Avisa_Lote_1'
      Size = 3
    end
    object qryparametrosDe_Lote_1: TIntegerField
      FieldName = 'De_Lote_1'
    end
    object qryparametrosAte_Lote_1: TIntegerField
      FieldName = 'Ate_Lote_1'
    end
    object qryparametrosLote_1: TIntegerField
      FieldName = 'Lote_1'
    end
    object qryparametrosMu_Aut_Lote_1: TStringField
      FieldName = 'Mu_Aut_Lote_1'
      Size = 3
    end
    object qryparametrosAvisa_Lote_2: TStringField
      FieldName = 'Avisa_Lote_2'
      Size = 3
    end
    object qryparametrosDe_Lote_2: TIntegerField
      FieldName = 'De_Lote_2'
    end
    object qryparametrosAte_Lote_2: TIntegerField
      FieldName = 'Ate_Lote_2'
    end
    object qryparametrosLote_2: TIntegerField
      FieldName = 'Lote_2'
    end
    object qryparametrosMu_Aut_Lote_2: TStringField
      FieldName = 'Mu_Aut_Lote_2'
      Size = 3
    end
    object qryparametrosAvisa_Lote_3: TStringField
      FieldName = 'Avisa_Lote_3'
      Size = 3
    end
    object qryparametrosDe_Lote_3: TIntegerField
      FieldName = 'De_Lote_3'
    end
    object qryparametrosAte_Lote_3: TIntegerField
      FieldName = 'Ate_Lote_3'
    end
    object qryparametrosLote_3: TIntegerField
      FieldName = 'Lote_3'
    end
    object qryparametrosMu_Aut_Lote_3: TStringField
      FieldName = 'Mu_Aut_Lote_3'
      Size = 3
    end
    object qryparametrosAvisa_Lote_4: TStringField
      FieldName = 'Avisa_Lote_4'
      Size = 3
    end
    object qryparametrosDe_Lote_4: TIntegerField
      FieldName = 'De_Lote_4'
    end
    object qryparametrosAte_Lote_4: TIntegerField
      FieldName = 'Ate_Lote_4'
    end
    object qryparametrosLote_4: TIntegerField
      FieldName = 'Lote_4'
    end
    object qryparametrosMu_Aut_Lote_4: TStringField
      FieldName = 'Mu_Aut_Lote_4'
      Size = 3
    end
    object qryparametrosAvisa_Lote_5: TStringField
      FieldName = 'Avisa_Lote_5'
      Size = 3
    end
    object qryparametrosDe_Lote_5: TIntegerField
      FieldName = 'De_Lote_5'
    end
    object qryparametrosAte_Lote_5: TIntegerField
      FieldName = 'Ate_Lote_5'
    end
    object qryparametrosLote_5: TIntegerField
      FieldName = 'Lote_5'
    end
    object qryparametrosMu_Aut_Lote_5: TStringField
      FieldName = 'Mu_Aut_Lote_5'
      Size = 3
    end
    object qryparametrosAvisa_Lote_6: TStringField
      FieldName = 'Avisa_Lote_6'
      Size = 3
    end
    object qryparametrosDe_Lote_6: TIntegerField
      FieldName = 'De_Lote_6'
    end
    object qryparametrosAte_Lote_6: TIntegerField
      FieldName = 'Ate_Lote_6'
    end
    object qryparametrosLote_6: TIntegerField
      FieldName = 'Lote_6'
    end
    object qryparametrosMu_Aut_Lote_6: TStringField
      FieldName = 'Mu_Aut_Lote_6'
      Size = 3
    end
    object qryparametrosAvisa_Lote_7: TStringField
      FieldName = 'Avisa_Lote_7'
      Size = 3
    end
    object qryparametrosDe_Lote_7: TIntegerField
      FieldName = 'De_Lote_7'
    end
    object qryparametrosAte_Lote_7: TIntegerField
      FieldName = 'Ate_Lote_7'
    end
    object qryparametrosLote_7: TIntegerField
      FieldName = 'Lote_7'
    end
    object qryparametrosMu_Aut_Lote_7: TStringField
      FieldName = 'Mu_Aut_Lote_7'
      Size = 3
    end
    object qryparametrosAvisa_Lote_8: TStringField
      FieldName = 'Avisa_Lote_8'
      Size = 3
    end
    object qryparametrosDe_Lote_8: TIntegerField
      FieldName = 'De_Lote_8'
    end
    object qryparametrosAte_Lote_8: TIntegerField
      FieldName = 'Ate_Lote_8'
    end
    object qryparametrosLote_8: TIntegerField
      FieldName = 'Lote_8'
    end
    object qryparametrosMu_Aut_Lote_8: TStringField
      FieldName = 'Mu_Aut_Lote_8'
      Size = 3
    end
    object qryparametrosAvisa_Lote_9: TStringField
      FieldName = 'Avisa_Lote_9'
      Size = 3
    end
    object qryparametrosDe_Lote_9: TIntegerField
      FieldName = 'De_Lote_9'
    end
    object qryparametrosAte_Lote_9: TIntegerField
      FieldName = 'Ate_Lote_9'
    end
    object qryparametrosLote_9: TIntegerField
      FieldName = 'Lote_9'
    end
    object qryparametrosMu_Aut_Lote_9: TStringField
      FieldName = 'Mu_Aut_Lote_9'
      Size = 3
    end
    object qryparametrosAvisa_Lote_10: TStringField
      FieldName = 'Avisa_Lote_10'
      Size = 3
    end
    object qryparametrosDe_Lote_10: TIntegerField
      FieldName = 'De_Lote_10'
    end
    object qryparametrosAte_Lote_10: TIntegerField
      FieldName = 'Ate_Lote_10'
    end
    object qryparametrosLote_10: TIntegerField
      FieldName = 'Lote_10'
    end
    object qryparametrosMu_Aut_Lote_10: TStringField
      FieldName = 'Mu_Aut_Lote_10'
      Size = 3
    end
    object qryparametrosValor_Conta_Menor: TFloatField
      FieldName = 'Valor_Conta_Menor'
    end
    object qryparametrosAvisa_Conta_Menor: TIntegerField
      FieldName = 'Avisa_Conta_Menor'
    end
    object qryparametrosValor_Conta_Maior: TFloatField
      FieldName = 'Valor_Conta_Maior'
    end
    object qryparametrosAvisa_Conta_Maior: TIntegerField
      FieldName = 'Avisa_Conta_Maior'
    end
  end
end
