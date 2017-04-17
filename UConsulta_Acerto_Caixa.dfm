object FrmConsulta_Acerto_Caixa: TFrmConsulta_Acerto_Caixa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Acerto de Caixa'
  ClientHeight = 536
  ClientWidth = 952
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
  Visible = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 417
    Top = 31
    Width = 61
    Height = 13
    Caption = 'Parametro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 417
    Top = 74
    Width = 31
    Height = 13
    Caption = 'Inicio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 477
    Top = 74
    Width = 20
    Height = 13
    Caption = 'Fim'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 113
    Top = 110
    Width = 838
    Height = 425
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Data_Abertura'
        Title.Caption = 'Data Abertura'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Fechamento'
        Title.Caption = 'Data Fechamento'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Caixa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Usuario'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Usu'#225'rio'
        Width = 213
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Caixa'
        Width = 248
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Abertura'
        Title.Caption = 'Abertura'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Entrada'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Saida'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Saldo'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Acerto'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fechamento'
        Width = 93
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 113
    Top = 0
    Width = 173
    Height = 107
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'Usu'#225'rio / Data Abertura'
      'Usu'#225'rio / Data Fechamento'
      'Caixa / Data Abertura'
      'Caixa / Data Fechamento')
    TabOrder = 5
  end
  object EdtDescricao: TEdit
    Left = 474
    Top = 48
    Width = 269
    Height = 17
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    OnKeyDown = EdtDescricaoKeyDown
  end
  object RGOrdena_Por: TRadioGroup
    Left = 290
    Top = 0
    Width = 120
    Height = 107
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 0
    Items.Strings = (
      'Usu'#225'rio'
      'Caixa'
      'Data Abertura'
      'Data Fechamento')
    TabOrder = 6
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 102
    Height = 536
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 98
    Caption = 'ToolBar1'
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
    HotTrackColor = clMenu
    Images = DM.ImgComandos
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 7
    object BBtnFiltrar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para pesquisar'
      Caption = '&Pesquisar'
      ImageIndex = 2
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnFiltrarClick
    end
    object BBtnLimpar: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para limpar a pesquisa realizada e iniciar outra'
      Caption = 'Li&mpar'
      Enabled = False
      ImageIndex = 7
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnLimparClick
    end
    object BBtnImprimir: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para imprimir a pesquisa realizada'
      Caption = 'Imp&rimir'
      Enabled = False
      ImageIndex = 6
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnImprimirClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Hint = 'Clique para fechar a janela'
      Caption = '&Fechar'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object EdtCodigo: TEdit
    Left = 417
    Top = 48
    Width = 57
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clCream
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyDown = EdtCodigoKeyDown
    OnKeyPress = EdtCodigoKeyPress
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 417
    Top = 89
    Width = 61
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '  /  /    '
    OnExit = MEdtData_InicialExit
  end
  object MEdtData_Final: TMaskEdit
    Left = 477
    Top = 89
    Width = 61
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 3
    Text = '  /  /    '
    OnExit = MEdtData_FinalExit
  end
  object qryconsulta_caixa: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select AC.*, CU.Nome, C.Caixa from Acerto_Caixa AC'
      
        'inner join Cadastro_Usuario CU on (AC.Codigo_Usuario = CU.Codigo' +
        ')'
      'inner join Caixa C on (AC.Codigo_Caixa = C.Codigo)')
    Left = 469
    Top = 272
    object qryconsulta_caixaData_Abertura: TDateTimeField
      FieldName = 'Data_Abertura'
    end
    object qryconsulta_caixaData_Fechamento: TDateTimeField
      FieldName = 'Data_Fechamento'
    end
    object qryconsulta_caixaCodigo_Caixa: TIntegerField
      FieldName = 'Codigo_Caixa'
    end
    object qryconsulta_caixaCodigo_Usuario: TIntegerField
      FieldName = 'Codigo_Usuario'
    end
    object qryconsulta_caixaEntrada: TFloatField
      FieldName = 'Entrada'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_caixaSaida: TFloatField
      FieldName = 'Saida'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_caixaSaldo: TFloatField
      FieldName = 'Saldo'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_caixaAcerto: TFloatField
      FieldName = 'Acerto'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_caixaFechamento: TFloatField
      FieldName = 'Fechamento'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_caixaNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryconsulta_caixaCaixa: TStringField
      FieldName = 'Caixa'
      Size = 100
    end
    object qryconsulta_caixaValor_Abertura: TFloatField
      FieldName = 'Valor_Abertura'
      DisplayFormat = '#0.0,0'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_caixa
    Left = 501
    Top = 272
  end
end
