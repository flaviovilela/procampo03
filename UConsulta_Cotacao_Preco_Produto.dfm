object FrmConsulta_Cotacao_Preco_Produto: TFrmConsulta_Cotacao_Preco_Produto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Cota'#231#227'o de Pre'#231'os'
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
  object Label1: TLabel
    Left = 450
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
  object Label3: TLabel
    Left = 510
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
  object Label4: TLabel
    Left = 577
    Top = 75
    Width = 46
    Height = 13
    Caption = 'Cota'#231#227'o'
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
    TabOrder = 2
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
        FieldName = 'N_Cotacao'
        Title.Caption = 'Cota'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Empresa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Responsavel'
        Title.Caption = 'Respons'#225'vel'
        Width = 413
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cotacao'
        Title.Caption = 'Data Cota'#231#227'o'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora_Cotacao'
        Title.Caption = 'Hora Cota'#231#227'o'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Vencimento'
        Title.Caption = 'Data Vencimento'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtde_Itens'
        Title.Caption = 'Qtde. Itens'
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 122
    Top = 0
    Width = 191
    Height = 107
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'Cota'#231#227'o'
      'Data Cota'#231#227'o'
      'Data Vencimento')
    TabOrder = 3
  end
  object RGOrdena_Por: TRadioGroup
    Left = 319
    Top = 0
    Width = 114
    Height = 107
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 0
    Items.Strings = (
      'Cota'#231#227'o'
      'Respons'#225'vel')
    TabOrder = 4
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
    TabOrder = 5
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
  object Panel1: TPanel
    Left = 122
    Top = 113
    Width = 832
    Height = 25
    BorderStyle = bsSingle
    Caption = 'Cota'#231#227'o('#245'es)'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
  end
  object DBGrid2: TDBGrid
    Left = 122
    Top = 321
    Width = 829
    Height = 215
    BorderStyle = bsNone
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid2DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'N_Cotacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Produto'
        Title.Caption = 'Codigo Produto'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 411
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sigla'
        Title.Caption = 'Un.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtde'
        Title.Caption = 'Qtde.'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 122
    Top = 296
    Width = 832
    Height = 25
    BorderStyle = bsSingle
    Caption = 'Item(s) da Cota'#231#227'o'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 8
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 450
    Top = 90
    Width = 61
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
    OnExit = MEdtData_InicialExit
  end
  object MEdtData_Final: TMaskEdit
    Left = 510
    Top = 90
    Width = 61
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
    OnExit = MEdtData_FinalExit
  end
  object EdtCotacao: TEdit
    Left = 577
    Top = 90
    Width = 112
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 9
    OnKeyPress = EdtCotacaoKeyPress
  end
  object qryconsulta_cotacao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select CP.* from Cotacao_Preco_Produto CP')
    Left = 478
    Top = 176
    object qryconsulta_cotacaoN_Cotacao: TIntegerField
      FieldName = 'N_Cotacao'
    end
    object qryconsulta_cotacaoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryconsulta_cotacaoResponsavel: TStringField
      FieldName = 'Responsavel'
      Size = 50
    end
    object qryconsulta_cotacaoData_Cotacao: TDateTimeField
      FieldName = 'Data_Cotacao'
    end
    object qryconsulta_cotacaoHora_Cotacao: TStringField
      FieldName = 'Hora_Cotacao'
      Size = 15
    end
    object qryconsulta_cotacaoData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qryconsulta_cotacaoQtde_Itens: TFloatField
      FieldName = 'Qtde_Itens'
    end
  end
  object ds_consulta_folha: TDataSource
    DataSet = qryconsulta_cotacao
    Left = 510
    Top = 176
  end
  object qryitens_cotacao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select IC.*, P.Descricao, UM.Sigla from Itens_Cotacao_Preco_Prod' +
        'uto IC'
      'left join Cadastro_Produtos P on (P.Codigo = IC.Codigo_Produto)'
      'left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade)')
    Left = 491
    Top = 362
    object qryitens_cotacaoN_Cotacao: TIntegerField
      FieldName = 'N_Cotacao'
    end
    object qryitens_cotacaoCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryitens_cotacaoQtde: TFloatField
      FieldName = 'Qtde'
    end
    object qryitens_cotacaoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryitens_cotacaoSigla: TStringField
      FieldName = 'Sigla'
      Size = 5
    end
  end
  object DataSource1: TDataSource
    DataSet = qryitens_cotacao
    Left = 454
    Top = 360
  end
end
