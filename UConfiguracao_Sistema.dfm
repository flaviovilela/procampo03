object FrmConfiguracao_Sistema: TFrmConfiguracao_Sistema
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es do Sistema'
  ClientHeight = 384
  ClientWidth = 648
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 384
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 121
    DockSite = True
    DragCursor = crHandPoint
    DragKind = dkDock
    DrawingStyle = dsGradient
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esLowered
    EdgeOuter = esRaised
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    GradientEndColor = clWindow
    HideClippedButtons = True
    HotTrackColor = clMenu
    Images = DM.ImgComandos
    List = True
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = False
    TabOrder = 0
    object BBtnSalvar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para Salvar/Alterar o registro'
      Caption = '&Salvar'
      Enabled = False
      ImageIndex = 0
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnSalvarClick
    end
    object BBtnExcluir: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para Excluir o registro selecionado'
      Caption = '&Excluir'
      Enabled = False
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnExcluirClick
    end
    object BBtnPesquisar: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para pesquisar um registro desejado'
      Caption = '&Pesquisar'
      ImageIndex = 2
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnPesquisarClick
    end
    object BBtnCancelar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Hint = 'Clique para Cancelar a Inser'#231#227'o ou Altera'#231#227'o de um registro'
      Caption = '&Cancelar'
      Enabled = False
      ImageIndex = 3
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnCancelarClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 152
      Cursor = crHandPoint
      Hint = 'Clique para Fechar a Janela Ativa'
      Caption = '&Fechar Janela'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object PageControl1: TPageControl
    Left = 125
    Top = 0
    Width = 523
    Height = 384
    Cursor = crHandPoint
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Mensagens do Sistema'
      Enabled = False
      object GroupBox6: TGroupBox
        Left = 0
        Top = 12
        Width = 155
        Height = 90
        Caption = 'Financeiro'
        TabOrder = 0
        object CBLancamento_Financeiro: TCheckBox
          Left = 8
          Top = 17
          Width = 136
          Height = 17
          Caption = 'Lan'#231'amentos Financeiros'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object CBCheque_Vencer: TCheckBox
          Left = 8
          Top = 63
          Width = 104
          Height = 17
          Caption = 'Cheques a Vencer'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object CBContas_Fixas: TCheckBox
          Left = 8
          Top = 40
          Width = 104
          Height = 17
          Caption = 'Contas Fixas'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      object GroupBox8: TGroupBox
        Left = 161
        Top = 12
        Width = 185
        Height = 90
        Caption = 'Datas Importantes'
        TabOrder = 1
        object CBAniversario_Cliente: TCheckBox
          Left = 16
          Top = 63
          Width = 153
          Height = 17
          Caption = 'Anivers'#225'rio de Clientes'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object CBAniversario_Funcionario: TCheckBox
          Left = 16
          Top = 40
          Width = 153
          Height = 17
          Caption = 'Anivers'#225'rio de Funcion'#225'rios'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object CBProduto_Vencido: TCheckBox
          Left = 16
          Top = 17
          Width = 104
          Height = 17
          Caption = 'Produtos Vencidos'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      object GroupBox12: TGroupBox
        Left = 0
        Top = 105
        Width = 155
        Height = 66
        Caption = 'Sistema'
        TabOrder = 2
        object CBBackup: TCheckBox
          Left = 8
          Top = 32
          Width = 147
          Height = 17
          Caption = 'Backup ao Fechar Sistema'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
      object GroupBox11: TGroupBox
        Left = 161
        Top = 105
        Width = 132
        Height = 66
        Caption = 'Avisar com anteced'#234'ncia'
        TabOrder = 3
        object EdtDias_Antecedencia: TEdit
          Left = 40
          Top = 32
          Width = 46
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = clWhite
          TabOrder = 0
          Text = '0'
          OnKeyPress = EdtDias_AntecedenciaKeyPress
        end
      end
      object GroupBox32: TGroupBox
        Left = 0
        Top = 174
        Width = 209
        Height = 147
        Caption = 'Financeiro'
        TabOrder = 4
        object Label81: TLabel
          Left = 14
          Top = 22
          Width = 80
          Height = 13
          Caption = 'Limite Cheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label82: TLabel
          Left = 101
          Top = 22
          Width = 43
          Height = 13
          Caption = 'Dias ac.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label116: TLabel
          Left = 14
          Top = 62
          Width = 60
          Height = 13
          Caption = 'Contas <='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label117: TLabel
          Left = 101
          Top = 62
          Width = 63
          Height = 13
          Caption = 'Avisar com'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label118: TLabel
          Left = 14
          Top = 102
          Width = 60
          Height = 13
          Caption = 'Contas >='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label119: TLabel
          Left = 101
          Top = 102
          Width = 63
          Height = 13
          Caption = 'Avisar com'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtLimite_Cheque: TEdit
          Left = 14
          Top = 38
          Width = 76
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = clWhite
          TabOrder = 0
          Text = '0'
          OnKeyPress = EdtLimite_ChequeKeyPress
        end
        object EdtDias_Acrecimo: TEdit
          Left = 101
          Top = 38
          Width = 76
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = clWhite
          TabOrder = 1
          Text = '0'
          OnKeyPress = EdtDias_AcrecimoKeyPress
        end
        object EdtValor_Conta_Menor: TEdit
          Left = 14
          Top = 78
          Width = 67
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = clWhite
          TabOrder = 2
          Text = '0'
          OnKeyPress = EdtValor_Conta_MenorKeyPress
        end
        object EdtAvisa_Conta_Menor: TEdit
          Left = 101
          Top = 78
          Width = 67
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = clWhite
          TabOrder = 3
          Text = '0'
          OnKeyPress = EdtAvisa_Conta_MenorKeyPress
        end
        object EdtValor_Conta_Maior: TEdit
          Left = 14
          Top = 118
          Width = 67
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = clWhite
          TabOrder = 4
          Text = '0'
          OnKeyPress = EdtValor_Conta_MaiorKeyPress
        end
        object EdtAvisa_Conta_Maior: TEdit
          Left = 101
          Top = 118
          Width = 67
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = clWhite
          TabOrder = 5
          Text = '0'
          OnKeyPress = EdtAvisa_Conta_MaiorKeyPress
        end
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CS.* from Configuracao_Sistema CS')
    Left = 72
    Top = 248
    object ADOQuery1Codigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object ADOQuery1Dias_Secamento: TIntegerField
      FieldName = 'Dias_Secamento'
    end
    object ADOQuery1Dias_Paricao: TIntegerField
      FieldName = 'Dias_Paricao'
    end
    object ADOQuery1Dias_Cobertura: TIntegerField
      FieldName = 'Dias_Cobertura'
    end
    object ADOQuery1Dias_Cobertura_Sincronizacao: TIntegerField
      FieldName = 'Dias_Cobertura_Sincronizacao'
    end
    object ADOQuery1Lancamento_Financeiro: TStringField
      FieldName = 'Lancamento_Financeiro'
      Size = 3
    end
    object ADOQuery1Contas_Fixas: TStringField
      FieldName = 'Contas_Fixas'
      Size = 3
    end
    object ADOQuery1Cheque_Vencer: TStringField
      FieldName = 'Cheque_Vencer'
      Size = 3
    end
    object ADOQuery1Produtos_Vencidos: TStringField
      FieldName = 'Produtos_Vencidos'
      Size = 3
    end
    object ADOQuery1Aniversario_Funcionario: TStringField
      FieldName = 'Aniversario_Funcionario'
      Size = 3
    end
    object ADOQuery1Aniversario_Cliente: TStringField
      FieldName = 'Aniversario_Cliente'
      Size = 3
    end
    object ADOQuery1Animal_Cobrir: TStringField
      FieldName = 'Animal_Cobrir'
      Size = 3
    end
    object ADOQuery1Animal_Secar: TStringField
      FieldName = 'Animal_Secar'
      Size = 3
    end
    object ADOQuery1Animal_Parir: TStringField
      FieldName = 'Animal_Parir'
      Size = 3
    end
    object ADOQuery1Aplicacao_Programada: TStringField
      FieldName = 'Aplicacao_Programada'
      Size = 3
    end
    object ADOQuery1Animal_Idade: TStringField
      FieldName = 'Animal_Idade'
      Size = 3
    end
    object ADOQuery1Calendario_Sanitario: TStringField
      FieldName = 'Calendario_Sanitario'
      Size = 3
    end
    object ADOQuery1Periodo_Idade_De: TIntegerField
      FieldName = 'Periodo_Idade_De'
    end
    object ADOQuery1Periodo_Idade_Ate: TIntegerField
      FieldName = 'Periodo_Idade_Ate'
    end
    object ADOQuery1Dias_Aviso: TIntegerField
      FieldName = 'Dias_Aviso'
    end
    object ADOQuery1Finalizar_Periodo_Lactacao: TStringField
      FieldName = 'Finalizar_Periodo_Lactacao'
      Size = 3
    end
    object ADOQuery1Mostrar_Inicializacao: TStringField
      FieldName = 'Mostrar_Inicializacao'
      Size = 3
    end
    object ADOQuery1Backup_Fechar_Sistema: TStringField
      FieldName = 'Backup_Fechar_Sistema'
      Size = 3
    end
    object ADOQuery1Avisa_Dias_Coberta: TStringField
      FieldName = 'Avisa_Dias_Coberta'
      Size = 3
    end
    object ADOQuery1N_Dias_Coberta: TIntegerField
      FieldName = 'N_Dias_Coberta'
    end
    object ADOQuery1Avisa_Dias_Diagnosticada: TStringField
      FieldName = 'Avisa_Dias_Diagnosticada'
      Size = 3
    end
    object ADOQuery1N_Dias_Diagnosticada: TIntegerField
      FieldName = 'N_Dias_Diagnosticada'
    end
    object ADOQuery1Avisa_Dias_Seca: TStringField
      FieldName = 'Avisa_Dias_Seca'
      Size = 3
    end
    object ADOQuery1N_Dias_Seca: TIntegerField
      FieldName = 'N_Dias_Seca'
    end
    object ADOQuery1Avisa_Dias_Parida: TStringField
      FieldName = 'Avisa_Dias_Parida'
      Size = 3
    end
    object ADOQuery1N_Dias_Parida: TIntegerField
      FieldName = 'N_Dias_Parida'
    end
    object ADOQuery1Avisa_Lac_Sec_Vazia_Atrasada: TStringField
      FieldName = 'Avisa_Lac_Sec_Vazia_Atrasada'
      Size = 3
    end
    object ADOQuery1Avisa_Novilha_Atrasada: TStringField
      FieldName = 'Avisa_Novilha_Atrasada'
      Size = 3
    end
    object ADOQuery1Avisa_Novilha_Apta_Atrasada: TStringField
      FieldName = 'Avisa_Novilha_Apta_Atrasada'
      Size = 3
    end
    object ADOQuery1Avisa_Animal_Sincronizar: TStringField
      FieldName = 'Avisa_Animal_Sincronizar'
      Size = 3
    end
    object ADOQuery1Avisa_Protocolo_Sincronizacao: TStringField
      FieldName = 'Avisa_Protocolo_Sincronizacao'
      Size = 3
    end
    object ADOQuery1Avisa_Animais_Desmamar: TStringField
      FieldName = 'Avisa_Animais_Desmamar'
      Size = 3
    end
    object ADOQuery1Avisa_Novilhas_Aptas: TStringField
      FieldName = 'Avisa_Novilhas_Aptas'
      Size = 3
    end
    object ADOQuery1Avisa_Limite_Producao: TStringField
      FieldName = 'Avisa_Limite_Producao'
      Size = 3
    end
    object ADOQuery1Avisa_Limite_Diagnostico: TStringField
      FieldName = 'Avisa_Limite_Diagnostico'
      Size = 3
    end
    object ADOQuery1Limite_Producao: TFloatField
      FieldName = 'Limite_Producao'
    end
    object ADOQuery1Avisa_Vaca_Acima_Pesagem: TStringField
      FieldName = 'Avisa_Vaca_Acima_Pesagem'
      Size = 3
    end
    object ADOQuery1Peso_Maximo_Leite: TFloatField
      FieldName = 'Peso_Maximo_Leite'
    end
    object ADOQuery1Aptidao_Novilhas: TStringField
      FieldName = 'Aptidao_Novilhas'
      Size = 5
    end
    object ADOQuery1Valor_Aptidao: TFloatField
      FieldName = 'Valor_Aptidao'
    end
    object ADOQuery1Limite_Minimo_Aptidao: TIntegerField
      FieldName = 'Limite_Minimo_Aptidao'
    end
    object ADOQuery1Limite_Maximo_Aptidao: TIntegerField
      FieldName = 'Limite_Maximo_Aptidao'
    end
    object ADOQuery1Mu_Aut_Ap: TStringField
      FieldName = 'Mu_Aut_Ap'
      Size = 3
    end
    object ADOQuery1Dias_Matrizes_Atrasadas: TIntegerField
      FieldName = 'Dias_Matrizes_Atrasadas'
    end
    object ADOQuery1Dias_Novilhas_Atrasadas: TIntegerField
      FieldName = 'Dias_Novilhas_Atrasadas'
    end
    object ADOQuery1Dias_Novilhas_Aptas_Atrasadas: TIntegerField
      FieldName = 'Dias_Novilhas_Aptas_Atrasadas'
    end
    object ADOQuery1Limite_Diagnostico: TIntegerField
      FieldName = 'Limite_Diagnostico'
    end
    object ADOQuery1Limite_Desmama: TIntegerField
      FieldName = 'Limite_Desmama'
    end
    object ADOQuery1Animais_Lactantes: TIntegerField
      FieldName = 'Animais_Lactantes'
    end
    object ADOQuery1Avisa_Situacao1: TStringField
      FieldName = 'Avisa_Situacao1'
      Size = 3
    end
    object ADOQuery1De1: TIntegerField
      FieldName = 'De1'
    end
    object ADOQuery1Ate1: TIntegerField
      FieldName = 'Ate1'
    end
    object ADOQuery1Situacao1: TIntegerField
      FieldName = 'Situacao1'
    end
    object ADOQuery1Mu_Aut_Sit1: TStringField
      FieldName = 'Mu_Aut_Sit1'
      Size = 3
    end
    object ADOQuery1Avisa_Situacao2: TStringField
      FieldName = 'Avisa_Situacao2'
      Size = 3
    end
    object ADOQuery1De2: TIntegerField
      FieldName = 'De2'
    end
    object ADOQuery1Ate2: TIntegerField
      FieldName = 'Ate2'
    end
    object ADOQuery1Situacao2: TIntegerField
      FieldName = 'Situacao2'
    end
    object ADOQuery1Mu_Aut_Sit2: TStringField
      FieldName = 'Mu_Aut_Sit2'
      Size = 3
    end
    object ADOQuery1Avisa_Situacao3: TStringField
      FieldName = 'Avisa_Situacao3'
      Size = 3
    end
    object ADOQuery1De3: TIntegerField
      FieldName = 'De3'
    end
    object ADOQuery1Ate3: TIntegerField
      FieldName = 'Ate3'
    end
    object ADOQuery1Situacao3: TIntegerField
      FieldName = 'Situacao3'
    end
    object ADOQuery1Mu_Aut_Sit3: TStringField
      FieldName = 'Mu_Aut_Sit3'
      Size = 3
    end
    object ADOQuery1Avisa_Situacao4: TStringField
      FieldName = 'Avisa_Situacao4'
      Size = 3
    end
    object ADOQuery1De4: TIntegerField
      FieldName = 'De4'
    end
    object ADOQuery1Ate4: TIntegerField
      FieldName = 'Ate4'
    end
    object ADOQuery1Situacao4: TIntegerField
      FieldName = 'Situacao4'
    end
    object ADOQuery1Mu_Aut_Sit4: TStringField
      FieldName = 'Mu_Aut_Sit4'
      Size = 3
    end
    object ADOQuery1Avisa_Situacao5: TStringField
      FieldName = 'Avisa_Situacao5'
      Size = 3
    end
    object ADOQuery1De5: TIntegerField
      FieldName = 'De5'
    end
    object ADOQuery1Ate5: TIntegerField
      FieldName = 'Ate5'
    end
    object ADOQuery1Situacao5: TIntegerField
      FieldName = 'Situacao5'
    end
    object ADOQuery1Mu_Aut_Sit5: TStringField
      FieldName = 'Mu_Aut_Sit5'
      Size = 3
    end
    object ADOQuery1Avisa_Situacao6: TStringField
      FieldName = 'Avisa_Situacao6'
      Size = 3
    end
    object ADOQuery1De6: TIntegerField
      FieldName = 'De6'
    end
    object ADOQuery1Ate6: TIntegerField
      FieldName = 'Ate6'
    end
    object ADOQuery1Situacao6: TIntegerField
      FieldName = 'Situacao6'
    end
    object ADOQuery1Mu_Aut_Sit6: TStringField
      FieldName = 'Mu_Aut_Sit6'
      Size = 3
    end
    object ADOQuery1Novilhas_Aptas: TIntegerField
      FieldName = 'Novilhas_Aptas'
    end
    object ADOQuery1Novilhas_Aptas_Atrasadas: TIntegerField
      FieldName = 'Novilhas_Aptas_Atrasadas'
    end
    object ADOQuery1Novilhas_Vazias: TIntegerField
      FieldName = 'Novilhas_Vazias'
    end
    object ADOQuery1Novilhas_Vazias_Atrasadas: TIntegerField
      FieldName = 'Novilhas_Vazias_Atrasadas'
    end
    object ADOQuery1Novilhas_Cobertas: TIntegerField
      FieldName = 'Novilhas_Cobertas'
    end
    object ADOQuery1Novilhas_Gestantes: TIntegerField
      FieldName = 'Novilhas_Gestantes'
    end
    object ADOQuery1Vacas_Lactacao_Vazias_Normais: TIntegerField
      FieldName = 'Vacas_Lactacao_Vazias_Normais'
    end
    object ADOQuery1Vacas_Lactacao_Vazias_Atrasadas: TIntegerField
      FieldName = 'Vacas_Lactacao_Vazias_Atrasadas'
    end
    object ADOQuery1Vacas_Lactacao_Cobertas: TIntegerField
      FieldName = 'Vacas_Lactacao_Cobertas'
    end
    object ADOQuery1Vacas_Lactacao_Gestantes: TIntegerField
      FieldName = 'Vacas_Lactacao_Gestantes'
    end
    object ADOQuery1Vacas_Secas_Vazia: TIntegerField
      FieldName = 'Vacas_Secas_Vazia'
    end
    object ADOQuery1Vacas_Secas_Vazias_Atrasadas: TIntegerField
      FieldName = 'Vacas_Secas_Vazias_Atrasadas'
    end
    object ADOQuery1Vacas_Secas_Cobertas: TIntegerField
      FieldName = 'Vacas_Secas_Cobertas'
    end
    object ADOQuery1Vacas_Secas_Gestantes: TIntegerField
      FieldName = 'Vacas_Secas_Gestantes'
    end
    object ADOQuery1Vacas_Secas_Descartes: TIntegerField
      FieldName = 'Vacas_Secas_Descartes'
    end
    object ADOQuery1Animais_Lactantes_Macho: TIntegerField
      FieldName = 'Animais_Lactantes_Macho'
    end
    object ADOQuery1Avisa_Situacao1_Macho: TStringField
      FieldName = 'Avisa_Situacao1_Macho'
      Size = 3
    end
    object ADOQuery1De1_Macho: TIntegerField
      FieldName = 'De1_Macho'
    end
    object ADOQuery1Ate1_Macho: TIntegerField
      FieldName = 'Ate1_Macho'
    end
    object ADOQuery1Situacao1_Macho: TIntegerField
      FieldName = 'Situacao1_Macho'
    end
    object ADOQuery1Mu_Aut_Sit1_Macho: TStringField
      FieldName = 'Mu_Aut_Sit1_Macho'
      Size = 3
    end
    object ADOQuery1Avisa_Situacao2_Macho: TStringField
      FieldName = 'Avisa_Situacao2_Macho'
      Size = 3
    end
    object ADOQuery1De2_Macho: TIntegerField
      FieldName = 'De2_Macho'
    end
    object ADOQuery1Ate2_Macho: TIntegerField
      FieldName = 'Ate2_Macho'
    end
    object ADOQuery1Situacao2_Macho: TIntegerField
      FieldName = 'Situacao2_Macho'
    end
    object ADOQuery1Mu_Aut_Sit2_Macho: TStringField
      FieldName = 'Mu_Aut_Sit2_Macho'
      Size = 3
    end
    object ADOQuery1Avisa_Situacao3_Macho: TStringField
      FieldName = 'Avisa_Situacao3_Macho'
      Size = 3
    end
    object ADOQuery1De3_Macho: TIntegerField
      FieldName = 'De3_Macho'
    end
    object ADOQuery1Ate3_Macho: TIntegerField
      FieldName = 'Ate3_Macho'
    end
    object ADOQuery1Situacao3_Macho: TIntegerField
      FieldName = 'Situacao3_Macho'
    end
    object ADOQuery1Mu_Aut_Sit3_Macho: TStringField
      FieldName = 'Mu_Aut_Sit3_Macho'
      Size = 3
    end
    object ADOQuery1Avisa_Situacao4_Macho: TStringField
      FieldName = 'Avisa_Situacao4_Macho'
      Size = 3
    end
    object ADOQuery1De4_Macho: TIntegerField
      FieldName = 'De4_Macho'
    end
    object ADOQuery1Ate4_Macho: TIntegerField
      FieldName = 'Ate4_Macho'
    end
    object ADOQuery1Situacao4_Macho: TIntegerField
      FieldName = 'Situacao4_Macho'
    end
    object ADOQuery1Mu_Aut_Sit4_Macho: TStringField
      FieldName = 'Mu_Aut_Sit4_Macho'
      Size = 3
    end
    object ADOQuery1Avisa_Situacao5_Macho: TStringField
      FieldName = 'Avisa_Situacao5_Macho'
      Size = 3
    end
    object ADOQuery1De5_Macho: TIntegerField
      FieldName = 'De5_Macho'
    end
    object ADOQuery1Ate5_Macho: TIntegerField
      FieldName = 'Ate5_Macho'
    end
    object ADOQuery1Situacao5_Macho: TIntegerField
      FieldName = 'Situacao5_Macho'
    end
    object ADOQuery1Mu_Aut_Sit5_Macho: TStringField
      FieldName = 'Mu_Aut_Sit5_Macho'
      Size = 3
    end
    object ADOQuery1Avisa_Situacao6_Macho: TStringField
      FieldName = 'Avisa_Situacao6_Macho'
      Size = 3
    end
    object ADOQuery1De6_Macho: TIntegerField
      FieldName = 'De6_Macho'
    end
    object ADOQuery1Ate6_Macho: TIntegerField
      FieldName = 'Ate6_Macho'
    end
    object ADOQuery1Situacao6_Macho: TIntegerField
      FieldName = 'Situacao6_Macho'
    end
    object ADOQuery1Mu_Aut_Sit6_Macho: TStringField
      FieldName = 'Mu_Aut_Sit6_Macho'
      Size = 3
    end
    object ADOQuery1Avisa_Situacao7_Macho: TStringField
      FieldName = 'Avisa_Situacao7_Macho'
      Size = 3
    end
    object ADOQuery1De7_Macho: TIntegerField
      FieldName = 'De7_Macho'
    end
    object ADOQuery1Ate7_Macho: TIntegerField
      FieldName = 'Ate7_Macho'
    end
    object ADOQuery1Situacao7_Macho: TIntegerField
      FieldName = 'Situacao7_Macho'
    end
    object ADOQuery1Mu_Aut_Sit7_Macho: TStringField
      FieldName = 'Mu_Aut_Sit7_Macho'
      Size = 3
    end
    object ADOQuery1Reprodutor: TIntegerField
      FieldName = 'Reprodutor'
    end
    object ADOQuery1Rufiao: TIntegerField
      FieldName = 'Rufiao'
    end
    object ADOQuery1Boi_Carreiro: TIntegerField
      FieldName = 'Boi_Carreiro'
    end
    object ADOQuery1Semen: TIntegerField
      FieldName = 'Semen'
    end
    object ADOQuery1Cat_Ini_Lactante: TIntegerField
      FieldName = 'Cat_Ini_Lactante'
    end
    object ADOQuery1Cat_Ini_Em_Crescimento: TIntegerField
      FieldName = 'Cat_Ini_Em_Crescimento'
    end
    object ADOQuery1Cat_Ini_Novilha: TIntegerField
      FieldName = 'Cat_Ini_Novilha'
    end
    object ADOQuery1Cat_Ini_Matriz: TIntegerField
      FieldName = 'Cat_Ini_Matriz'
    end
    object ADOQuery1Cat_Ini_Lactante_Macho: TIntegerField
      FieldName = 'Cat_Ini_Lactante_Macho'
    end
    object ADOQuery1Cat_Ini_Em_Crescimento_Macho: TIntegerField
      FieldName = 'Cat_Ini_Em_Crescimento_Macho'
    end
    object ADOQuery1Cat_Ini_Reprodutor: TIntegerField
      FieldName = 'Cat_Ini_Reprodutor'
    end
    object ADOQuery1Cat_Ini_Rufiao: TIntegerField
      FieldName = 'Cat_Ini_Rufiao'
    end
    object ADOQuery1Cat_Ini_Boi_Carreiro: TIntegerField
      FieldName = 'Cat_Ini_Boi_Carreiro'
    end
    object ADOQuery1Limite_Cheque: TIntegerField
      FieldName = 'Limite_Cheque'
    end
    object ADOQuery1Dias_Acrecimo_Cheque: TIntegerField
      FieldName = 'Dias_Acrecimo_Cheque'
    end
    object ADOQuery1Avisa_Lote_1: TStringField
      FieldName = 'Avisa_Lote_1'
      Size = 3
    end
    object ADOQuery1De_Lote_1: TIntegerField
      FieldName = 'De_Lote_1'
    end
    object ADOQuery1Ate_Lote_1: TIntegerField
      FieldName = 'Ate_Lote_1'
    end
    object ADOQuery1Lote_1: TIntegerField
      FieldName = 'Lote_1'
    end
    object ADOQuery1Mu_Aut_Lote_1: TStringField
      FieldName = 'Mu_Aut_Lote_1'
      Size = 3
    end
    object ADOQuery1Avisa_Lote_2: TStringField
      FieldName = 'Avisa_Lote_2'
      Size = 3
    end
    object ADOQuery1De_Lote_2: TIntegerField
      FieldName = 'De_Lote_2'
    end
    object ADOQuery1Ate_Lote_2: TIntegerField
      FieldName = 'Ate_Lote_2'
    end
    object ADOQuery1Lote_2: TIntegerField
      FieldName = 'Lote_2'
    end
    object ADOQuery1Mu_Aut_Lote_2: TStringField
      FieldName = 'Mu_Aut_Lote_2'
      Size = 3
    end
    object ADOQuery1Avisa_Lote_3: TStringField
      FieldName = 'Avisa_Lote_3'
      Size = 3
    end
    object ADOQuery1De_Lote_3: TIntegerField
      FieldName = 'De_Lote_3'
    end
    object ADOQuery1Ate_Lote_3: TIntegerField
      FieldName = 'Ate_Lote_3'
    end
    object ADOQuery1Lote_3: TIntegerField
      FieldName = 'Lote_3'
    end
    object ADOQuery1Mu_Aut_Lote_3: TStringField
      FieldName = 'Mu_Aut_Lote_3'
      Size = 3
    end
    object ADOQuery1Avisa_Lote_4: TStringField
      FieldName = 'Avisa_Lote_4'
      Size = 3
    end
    object ADOQuery1De_Lote_4: TIntegerField
      FieldName = 'De_Lote_4'
    end
    object ADOQuery1Ate_Lote_4: TIntegerField
      FieldName = 'Ate_Lote_4'
    end
    object ADOQuery1Lote_4: TIntegerField
      FieldName = 'Lote_4'
    end
    object ADOQuery1Mu_Aut_Lote_4: TStringField
      FieldName = 'Mu_Aut_Lote_4'
      Size = 3
    end
    object ADOQuery1Avisa_Lote_5: TStringField
      FieldName = 'Avisa_Lote_5'
      Size = 3
    end
    object ADOQuery1De_Lote_5: TIntegerField
      FieldName = 'De_Lote_5'
    end
    object ADOQuery1Ate_Lote_5: TIntegerField
      FieldName = 'Ate_Lote_5'
    end
    object ADOQuery1Lote_5: TIntegerField
      FieldName = 'Lote_5'
    end
    object ADOQuery1Mu_Aut_Lote_5: TStringField
      FieldName = 'Mu_Aut_Lote_5'
      Size = 3
    end
    object ADOQuery1Avisa_Lote_6: TStringField
      FieldName = 'Avisa_Lote_6'
      Size = 3
    end
    object ADOQuery1De_Lote_6: TIntegerField
      FieldName = 'De_Lote_6'
    end
    object ADOQuery1Ate_Lote_6: TIntegerField
      FieldName = 'Ate_Lote_6'
    end
    object ADOQuery1Lote_6: TIntegerField
      FieldName = 'Lote_6'
    end
    object ADOQuery1Mu_Aut_Lote_6: TStringField
      FieldName = 'Mu_Aut_Lote_6'
      Size = 3
    end
    object ADOQuery1Avisa_Lote_7: TStringField
      FieldName = 'Avisa_Lote_7'
      Size = 3
    end
    object ADOQuery1De_Lote_7: TIntegerField
      FieldName = 'De_Lote_7'
    end
    object ADOQuery1Ate_Lote_7: TIntegerField
      FieldName = 'Ate_Lote_7'
    end
    object ADOQuery1Lote_7: TIntegerField
      FieldName = 'Lote_7'
    end
    object ADOQuery1Mu_Aut_Lote_7: TStringField
      FieldName = 'Mu_Aut_Lote_7'
      Size = 3
    end
    object ADOQuery1Avisa_Lote_8: TStringField
      FieldName = 'Avisa_Lote_8'
      Size = 3
    end
    object ADOQuery1De_Lote_8: TIntegerField
      FieldName = 'De_Lote_8'
    end
    object ADOQuery1Ate_Lote_8: TIntegerField
      FieldName = 'Ate_Lote_8'
    end
    object ADOQuery1Lote_8: TIntegerField
      FieldName = 'Lote_8'
    end
    object ADOQuery1Mu_Aut_Lote_8: TStringField
      FieldName = 'Mu_Aut_Lote_8'
      Size = 3
    end
    object ADOQuery1Avisa_Lote_9: TStringField
      FieldName = 'Avisa_Lote_9'
      Size = 3
    end
    object ADOQuery1De_Lote_9: TIntegerField
      FieldName = 'De_Lote_9'
    end
    object ADOQuery1Ate_Lote_9: TIntegerField
      FieldName = 'Ate_Lote_9'
    end
    object ADOQuery1Lote_9: TIntegerField
      FieldName = 'Lote_9'
    end
    object ADOQuery1Mu_Aut_Lote_9: TStringField
      FieldName = 'Mu_Aut_Lote_9'
      Size = 3
    end
    object ADOQuery1Avisa_Lote_10: TStringField
      FieldName = 'Avisa_Lote_10'
      Size = 3
    end
    object ADOQuery1De_Lote_10: TIntegerField
      FieldName = 'De_Lote_10'
    end
    object ADOQuery1Ate_Lote_10: TIntegerField
      FieldName = 'Ate_Lote_10'
    end
    object ADOQuery1Lote_10: TIntegerField
      FieldName = 'Lote_10'
    end
    object ADOQuery1Mu_Aut_Lote_10: TStringField
      FieldName = 'Mu_Aut_Lote_10'
      Size = 3
    end
    object ADOQuery1Valor_Conta_Menor: TFloatField
      FieldName = 'Valor_Conta_Menor'
    end
    object ADOQuery1Avisa_Conta_Menor: TIntegerField
      FieldName = 'Avisa_Conta_Menor'
    end
    object ADOQuery1Valor_Conta_Maior: TFloatField
      FieldName = 'Valor_Conta_Maior'
    end
    object ADOQuery1Avisa_Conta_Maior: TIntegerField
      FieldName = 'Avisa_Conta_Maior'
    end
  end
end
