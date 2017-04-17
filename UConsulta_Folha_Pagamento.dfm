object FrmConsulta_Folha_Pagamento: TFrmConsulta_Folha_Pagamento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Folhas de Pagamentos'
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
    Left = 394
    Top = 21
    Width = 65
    Height = 13
    Caption = 'Funcion'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 394
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
  object LblData_Cadastro: TLabel
    Left = 533
    Top = 74
    Width = 51
    Height = 13
    Caption = 'M'#234's/Ano'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 454
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
    Left = 122
    Top = 144
    Width = 829
    Height = 148
    BorderStyle = bsNone
    DataSource = ds_consulta_folha
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Funcionario'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Empresa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Funcion'#225'rio'
        Width = 270
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Mes_Ano'
        Title.Caption = 'M'#234's Ano'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Fechamento'
        Title.Caption = 'Data Fechamento'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Entradas'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Saidas'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desconto'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Salario'
        Title.Caption = 'Sal'#225'rio'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade_Itens'
        Title.Caption = 'Quantidade Itens'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Title.Caption = 'Observa'#231#227'o'
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 122
    Top = 0
    Width = 145
    Height = 107
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'Funcion'#225'rio/Data Fec.'
      'Funcion'#225'rio/M'#234's-Ano'
      'M'#234's-Ano'
      'Data Fec.')
    TabOrder = 6
  end
  object EdtFuncionario: TEdit
    Left = 451
    Top = 38
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
  end
  object RGOrdena_Por: TRadioGroup
    Left = 273
    Top = 0
    Width = 114
    Height = 107
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 0
    Items.Strings = (
      'Data Fec.'
      'M'#234's-Ano'
      'Funcion'#225'rio')
    TabOrder = 7
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
    Images = DM.ImgImagens_Consulta
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 8
    object BBtnFiltrar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para pesquisar'
      Caption = '&Pesquisar'
      ImageIndex = 1
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
      ImageIndex = 2
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
      ImageIndex = 3
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
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object EdtCodigo_Funcionario: TEdit
    Left = 394
    Top = 38
    Width = 57
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clBtnFace
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyDown = EdtCodigo_FuncionarioKeyDown
    OnKeyPress = EdtCodigo_FuncionarioKeyPress
  end
  object Panel1: TPanel
    Left = 119
    Top = 113
    Width = 832
    Height = 25
    BorderStyle = bsSingle
    Caption = 'Folha(s) de Pagamento(s)'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 9
  end
  object DBGrid2: TDBGrid
    Left = 122
    Top = 322
    Width = 829
    Height = 167
    BorderStyle = bsNone
    DataSource = ds_consulta_itens_folha
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid2DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = #205'tem'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Item'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Natureza'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 88
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 119
    Top = 296
    Width = 832
    Height = 25
    BorderStyle = bsSingle
    Caption = 'Folha(s) de Pagamento(s)'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 11
  end
  object Edit2: TEdit
    Left = 122
    Top = 502
    Width = 95
    Height = 17
    TabStop = False
    Alignment = taCenter
    BevelInner = bvNone
    BevelKind = bkFlat
    BiDiMode = bdLeftToRight
    BorderStyle = bsNone
    Color = clMenu
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 12
    Text = 'Entradas'
  end
  object EdtEntradas: TEdit
    Left = 122
    Top = 518
    Width = 95
    Height = 17
    Alignment = taCenter
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    DoubleBuffered = False
    ParentDoubleBuffered = False
    ReadOnly = True
    TabOrder = 13
    Text = '0,00'
  end
  object EdtSaidas: TEdit
    Left = 216
    Top = 518
    Width = 95
    Height = 17
    Alignment = taCenter
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    DoubleBuffered = False
    ParentDoubleBuffered = False
    ReadOnly = True
    TabOrder = 14
    Text = '0,00'
  end
  object Edit4: TEdit
    Left = 216
    Top = 502
    Width = 95
    Height = 17
    TabStop = False
    Alignment = taCenter
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 15
    Text = 'Saidas'
  end
  object EdtDesconto: TEdit
    Left = 404
    Top = 518
    Width = 95
    Height = 17
    Alignment = taCenter
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 16
    Text = '0,00'
  end
  object Edit8: TEdit
    Left = 404
    Top = 502
    Width = 95
    Height = 17
    TabStop = False
    Alignment = taCenter
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 17
    Text = 'Desconto'
  end
  object Edit5: TEdit
    Left = 498
    Top = 502
    Width = 95
    Height = 17
    TabStop = False
    Alignment = taCenter
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 18
    Text = 'Sal'#225'rio'
  end
  object EdtSalario: TEdit
    Left = 498
    Top = 518
    Width = 95
    Height = 17
    Alignment = taCenter
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    DoubleBuffered = False
    ParentDoubleBuffered = False
    ReadOnly = True
    TabOrder = 19
    Text = '0,00'
  end
  object Edit1: TEdit
    Left = 310
    Top = 502
    Width = 95
    Height = 17
    TabStop = False
    Alignment = taCenter
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 20
    Text = 'Comiss'#227'o'
  end
  object EdtComissao: TEdit
    Left = 310
    Top = 518
    Width = 95
    Height = 17
    Alignment = taCenter
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    DoubleBuffered = False
    ParentDoubleBuffered = False
    ReadOnly = True
    TabOrder = 21
    Text = '0,00'
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 394
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
  object MEdtMes_Ano: TMaskEdit
    Left = 533
    Top = 89
    Width = 60
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/9999;1;_'
    MaxLength = 7
    TabOrder = 4
    Text = '  /    '
  end
  object MEdtData_Final: TMaskEdit
    Left = 454
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
  object qryconsulta_folha: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select FP.*, Cli.Nome from Folha_Pagamento FP'
      
        'inner join Cadastro_Cliente Cli on (FP.Codigo_Funcionario = Cli.' +
        'Codigo)')
    Left = 478
    Top = 176
    object qryconsulta_folhaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_folhaCodigo_Funcionario: TIntegerField
      FieldName = 'Codigo_Funcionario'
    end
    object qryconsulta_folhaCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qryconsulta_folhaMes_Ano: TStringField
      FieldName = 'Mes_Ano'
      Size = 50
    end
    object qryconsulta_folhaData_Fechamento: TDateTimeField
      FieldName = 'Data_Fechamento'
    end
    object qryconsulta_folhaEntradas: TFloatField
      FieldName = 'Entradas'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_folhaSaidas: TFloatField
      FieldName = 'Saidas'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_folhaDesconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_folhaSalario: TFloatField
      FieldName = 'Salario'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_folhaQuantidade_Itens: TIntegerField
      FieldName = 'Quantidade_Itens'
    end
    object qryconsulta_folhaObservacao: TStringField
      FieldName = 'Observacao'
      Size = 300
    end
    object qryconsulta_folhaNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object ds_consulta_folha: TDataSource
    DataSet = qryconsulta_folha
    Left = 510
    Top = 176
  end
  object qryitens_folha: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select IFP.*, IFF.Descricao, IFF.Natureza from Itens_Folha_Pagam' +
        'ento IFP'
      
        'inner join Cadastro_Itens_Folha_Pagamento IFF on (IFP.Codigo_Ite' +
        'm = IFF.Codigo)')
    Left = 483
    Top = 362
    object qryitens_folhaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryitens_folhaCodigo_Item: TIntegerField
      FieldName = 'Codigo_Item'
    end
    object qryitens_folhaValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_folhaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object qryitens_folhaNatureza: TStringField
      FieldName = 'Natureza'
      Size = 7
    end
  end
  object ds_consulta_itens_folha: TDataSource
    DataSet = qryitens_folha
    Left = 515
    Top = 362
  end
end
