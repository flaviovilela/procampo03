object FrmConsulta_Estoque: TFrmConsulta_Estoque
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Estoque'
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
  DesignSize = (
    952
    536)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 113
    Top = 505
    Width = 29
    Height = 13
    Caption = 'Total'
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
    Height = 395
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'QTde'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Propriedade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 226
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Grupo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Preco'
        Title.Caption = 'Pre'#231'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade_Estoque'
        Title.Caption = 'Qtde. Estoque'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unidade'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Unidade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Unidade_Volume'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Volume'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Volume_Total'
        Title.Caption = 'Volume Total'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Data Cadastro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Ultima_Compra'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Validade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Tipo_Produto'
        Title.Caption = 'Tipo'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Animal_Reprodutor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Carencia'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Grupo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Animal'
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 113
    Top = 1
    Width = 114
    Height = 107
    Caption = 'Consulta por'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Medicamento'
      'Consumo Animal'
      'S'#234'men'
      'Embri'#227'o'
      'Outros')
    TabOrder = 1
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
    TabOrder = 2
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
  object RGOrdena_Por: TRadioGroup
    Left = 232
    Top = 1
    Width = 114
    Height = 107
    Caption = 'Ordena por'
    ItemIndex = 0
    Items.Strings = (
      'Descri'#231#227'o'
      'Grupo'
      'Tipo')
    TabOrder = 3
  end
  object EdtTotal: TEdit
    Left = 113
    Top = 519
    Width = 70
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object qryconsulta: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CP.*, CGP.Descricao as Grupo, UM.Descricao as Unidade, CA' +
        '.Brinco + '#39' - '#39' + CA.Nome as Animal,'
      
        '(select count(*) from Cadastro_Produtos CP where CP.Codigo_Propr' +
        'iedade = '#39'1'#39') as QTde'
      ' from Cadastro_Produtos CP'
      
        'left join Cadastro_Grupo_Produtos CGP on (CP.Codigo_Grupo = CGP.' +
        'Codigo)'
      'left join Unidade_Medida UM on (CP.Codigo_Unidade = UM.Codigo)'
      
        'left join Cadastro_Animal CA on (CP.Codigo_Animal_Reprodutor = C' +
        'A.Codigo)')
    Left = 469
    Top = 272
    object qryconsultaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsultaCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qryconsultaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryconsultaCodigo_Grupo: TIntegerField
      FieldName = 'Codigo_Grupo'
    end
    object qryconsultaPreco: TFloatField
      FieldName = 'Preco'
      DisplayFormat = '#0.0,0'
    end
    object qryconsultaQuantidade_Estoque: TFloatField
      FieldName = 'Quantidade_Estoque'
      DisplayFormat = '#0.0,0'
    end
    object qryconsultaCodigo_Unidade: TIntegerField
      FieldName = 'Codigo_Unidade'
    end
    object qryconsultaCodigo_Unidade_Volume: TIntegerField
      FieldName = 'Codigo_Unidade_Volume'
    end
    object qryconsultaVolume: TFloatField
      FieldName = 'Volume'
    end
    object qryconsultaVolume_Total: TFloatField
      FieldName = 'Volume_Total'
    end
    object qryconsultaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qryconsultaData_Ultima_Compra: TDateTimeField
      FieldName = 'Data_Ultima_Compra'
    end
    object qryconsultaData_Validade: TDateTimeField
      FieldName = 'Data_Validade'
    end
    object qryconsultaTipo_Produto: TStringField
      FieldName = 'Tipo_Produto'
      Size = 30
    end
    object qryconsultaCodigo_Animal_Reprodutor: TIntegerField
      FieldName = 'Codigo_Animal_Reprodutor'
    end
    object qryconsultaCarencia: TIntegerField
      FieldName = 'Carencia'
    end
    object qryconsultaGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qryconsultaUnidade: TStringField
      FieldName = 'Unidade'
      Size = 50
    end
    object qryconsultaAnimal: TStringField
      FieldName = 'Animal'
      ReadOnly = True
      Size = 83
    end
    object qryconsultaQTde: TIntegerField
      FieldName = 'QTde'
      ReadOnly = True
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta
    Left = 501
    Top = 272
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CP.*, CGP.Descricao as Grupo, UM.Descricao as Unidade, CA' +
        '.Brinco + '#39' - '#39' + CA.Nome as Animal,'
      
        '(select count(*) from Cadastro_Produtos CP where CP.Codigo_Propr' +
        'iedade = '#39'1'#39') as QTde'
      ' from Cadastro_Produtos CP'
      
        'left join Cadastro_Grupo_Produtos CGP on (CP.Codigo_Grupo = CGP.' +
        'Codigo)'
      'left join Unidade_Medida UM on (CP.Codigo_Unidade = UM.Codigo)'
      
        'left join Cadastro_Animal CA on (CP.Codigo_Animal_Reprodutor = C' +
        'A.Codigo)')
    Left = 472
    Top = 336
  end
end
