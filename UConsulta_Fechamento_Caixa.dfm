object FrmConsulta_Fechamento_Caixa: TFrmConsulta_Fechamento_Caixa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Fechamento de Caixa'
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
    Left = 400
    Top = 32
    Width = 43
    Height = 13
    Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 400
    Top = 75
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
    Left = 460
    Top = 75
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
        FieldName = 'Nome'
        Title.Caption = 'Usu'#225'rio'
        Width = 252
        Visible = True
      end
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
        FieldName = 'Forma_Pagamento'
        Title.Caption = 'Forma Pagamento'
        Width = 253
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Usuario'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Valor_Abertura'
        Title.Caption = 'Valor Abertura'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Fechamento'
        Title.Caption = 'Valor Fechamento'
        Width = 111
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 113
    Top = 0
    Width = 161
    Height = 107
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'Usu'#225'rio / Data Abertura'
      'Usu'#225'rio / Data Fechamento')
    TabOrder = 5
  end
  object EdtUsuario: TEdit
    Left = 457
    Top = 49
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
    OnKeyDown = EdtUsuarioKeyDown
  end
  object RGOrdena_Por: TRadioGroup
    Left = 280
    Top = 0
    Width = 114
    Height = 107
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 0
    Items.Strings = (
      'Usu'#225'rio'
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
  object EdtCodigo_Usuario: TEdit
    Left = 400
    Top = 49
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
    OnKeyDown = EdtCodigo_UsuarioKeyDown
    OnKeyPress = EdtCodigo_UsuarioKeyPress
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 400
    Top = 90
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
  end
  object MEdtData_Final: TMaskEdit
    Left = 460
    Top = 90
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
  end
  object qryconsulta_caixa: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select FC.*, CU.Nome from Fechamento_Caixa FC'
      
        'inner join Cadastro_Usuario CU on (FC.Codigo_Usuario = CU.Codigo' +
        ')')
    Left = 469
    Top = 272
    object qryconsulta_caixaData_Abertura: TDateTimeField
      FieldName = 'Data_Abertura'
    end
    object qryconsulta_caixaData_Fechamento: TDateTimeField
      FieldName = 'Data_Fechamento'
    end
    object qryconsulta_caixaForma_Pagamento: TStringField
      FieldName = 'Forma_Pagamento'
      Size = 50
    end
    object qryconsulta_caixaCodigo_Usuario: TIntegerField
      FieldName = 'Codigo_Usuario'
    end
    object qryconsulta_caixaValor_Abertura: TFloatField
      FieldName = 'Valor_Abertura'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_caixaValor_Fechamento: TFloatField
      FieldName = 'Valor_Fechamento'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_caixaNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_caixa
    Left = 501
    Top = 272
  end
end
