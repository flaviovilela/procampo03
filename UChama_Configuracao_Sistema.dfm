object FrmChama_Configuracao_Sistema: TFrmChama_Configuracao_Sistema
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Configura'#231#227'o'
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
        FieldName = 'Codigo_Propriedade'
        Title.Caption = 'Propriedade'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dias_Secamento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Dias_Paricao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Dias_Cobertura'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Dias_Cobertura_Sincronizacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Lancamento_Financeiro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Contas_Fixas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cheque_Vencer'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Produtos_Vencidos'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Aniversario_Funcionario'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Aniversario_Cliente'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Animal_Cobrir'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Animal_Secar'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Animal_Parir'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Aplicacao_Programada'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Animal_Idade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Calendario_Sanitario'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Periodo_Idade_De'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Periodo_Idade_Ate'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Dias_Aviso'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Finalizar_Periodo_Lactacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mostrar_Inicializacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Backup_Fechar_Sistema'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Dias_Coberta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Dias_Coberta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Dias_Diagnosticada'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Dias_Diagnosticada'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Dias_Seca'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Dias_Seca'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Dias_Parida'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Dias_Parida'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Lac_Sec_Vazia_Atrasada'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Novilha_Atrasada'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Novilha_Apta_Atrasada'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Animal_Sincronizar'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Protocolo_Sincronizacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Animais_Desmamar'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Novilhas_Aptas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Limite_Producao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Limite_Diagnostico'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Limite_Producao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Vaca_Acima_Pesagem'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Peso_Maximo_Leite'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Aptidao_Novilhas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Valor_Aptidao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Limite_Minimo_Aptidao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Limite_Maximo_Aptidao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Ap'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Dias_Matrizes_Atrasadas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Dias_Novilhas_Atrasadas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Dias_Novilhas_Aptas_Atrasadas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Limite_Diagnostico'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Limite_Desmama'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Animais_Lactantes'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Situacao1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Situacao1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Sit1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Situacao2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Situacao2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Sit2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Situacao3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Situacao3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Sit3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Situacao4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Situacao4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Sit4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Situacao5'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De5'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate5'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Situacao5'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Sit5'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Situacao6'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De6'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate6'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Situacao6'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Sit6'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Novilhas_Aptas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Novilhas_Aptas_Atrasadas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Novilhas_Vazias'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Novilhas_Vazias_Atrasadas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Novilhas_Cobertas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Novilhas_Gestantes'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Vacas_Lactacao_Vazias_Normais'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Vacas_Lactacao_Vazias_Atrasadas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Vacas_Lactacao_Cobertas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Vacas_Lactacao_Gestantes'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Vacas_Secas_Vazia'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Vacas_Secas_Vazias_Atrasadas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Vacas_Secas_Cobertas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Vacas_Secas_Gestantes'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Vacas_Secas_Descartes'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Animais_Lactantes_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Situacao1_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De1_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate1_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Situacao1_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Sit1_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Situacao2_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De2_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate2_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Situacao2_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Sit2_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Situacao3_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De3_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate3_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Situacao3_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Sit3_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Situacao4_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De4_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate4_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Situacao4_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Sit4_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Situacao5_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De5_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate5_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Situacao5_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Sit5_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Situacao6_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De6_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate6_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Situacao6_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Sit6_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Situacao7_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De7_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate7_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Situacao7_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Sit7_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Reprodutor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Rufiao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Boi_Carreiro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Semen'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cat_Ini_Lactante'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cat_Ini_Em_Crescimento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cat_Ini_Novilha'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cat_Ini_Matriz'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cat_Ini_Lactante_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cat_Ini_Em_Crescimento_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cat_Ini_Reprodutor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cat_Ini_Rufiao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cat_Ini_Boi_Carreiro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Limite_Cheque'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Dias_Acrecimo_Cheque'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Lote_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De_Lote_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate_Lote_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Lote_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Lote_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Lote_2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De_Lote_2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate_Lote_2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Lote_2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Lote_2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Lote_3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De_Lote_3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate_Lote_3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Lote_3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Lote_3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Lote_4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De_Lote_4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate_Lote_4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Lote_4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Lote_4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Lote_5'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De_Lote_5'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate_Lote_5'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Lote_5'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Lote_5'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Lote_6'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De_Lote_6'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate_Lote_6'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Lote_6'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Lote_6'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Lote_7'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De_Lote_7'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate_Lote_7'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Lote_7'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Lote_7'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Lote_8'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De_Lote_8'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate_Lote_8'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Lote_8'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Lote_8'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Lote_9'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De_Lote_9'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate_Lote_9'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Lote_9'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Lote_9'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Lote_10'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'De_Lote_10'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ate_Lote_10'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Lote_10'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mu_Aut_Lote_10'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Valor_Conta_Menor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Conta_Menor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Valor_Conta_Maior'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Avisa_Conta_Maior'
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
  end
  object qrychama: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Configuracao_Sistema')
    Left = 464
    Top = 272
    object qrychamaCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qrychamaLancamento_Financeiro: TStringField
      FieldName = 'Lancamento_Financeiro'
      Size = 3
    end
    object qrychamaContas_Fixas: TStringField
      FieldName = 'Contas_Fixas'
      Size = 3
    end
    object qrychamaCheque_Vencer: TStringField
      FieldName = 'Cheque_Vencer'
      Size = 3
    end
    object qrychamaProdutos_Vencidos: TStringField
      FieldName = 'Produtos_Vencidos'
      Size = 3
    end
    object qrychamaAniversario_Funcionario: TStringField
      FieldName = 'Aniversario_Funcionario'
      Size = 3
    end
    object qrychamaAniversario_Cliente: TStringField
      FieldName = 'Aniversario_Cliente'
      Size = 3
    end
    object qrychamaDias_Aviso: TIntegerField
      FieldName = 'Dias_Aviso'
    end
    object qrychamaBackup_Fechar_Sistema: TStringField
      FieldName = 'Backup_Fechar_Sistema'
      Size = 3
    end
    object qrychamaAvisa_Conta_Menor: TIntegerField
      FieldName = 'Avisa_Conta_Menor'
    end
    object qrychamaValor_Conta_Maior: TFloatField
      FieldName = 'Valor_Conta_Maior'
    end
    object qrychamaAvisa_Conta_Maior: TIntegerField
      FieldName = 'Avisa_Conta_Maior'
    end
    object qrychamaValor_Conta_Menor: TFloatField
      FieldName = 'Valor_Conta_Menor'
    end
    object qrychamaLimite_Cheque: TIntegerField
      FieldName = 'Limite_Cheque'
    end
    object qrychamaDias_Acrecimo_Cheque: TIntegerField
      FieldName = 'Dias_Acrecimo_Cheque'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama
    Left = 496
    Top = 272
  end
end
