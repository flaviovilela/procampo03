object FrmConsulta_Comparativo_Preco_Cotacao: TFrmConsulta_Comparativo_Preco_Cotacao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Comparativo de Pre'#231'os de Cota'#231#227'o('#245'es)'
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
    Left = 515
    Top = 20
    Width = 45
    Height = 13
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 515
    Top = 72
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
    Left = 139
    Top = 110
    Width = 811
    Height = 426
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Cotacao'
        Title.Caption = 'Cotacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Produto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Venda'
        Title.Caption = 'Codigo Venda'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 244
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Unitario'
        Title.Caption = 'Valor Unit'#225'rio'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desconto'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Desconto'
        Title.Caption = 'T. Desc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sub_Total'
        Title.Caption = 'Sub Total'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Fornecedor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Fornecedor'
        Width = 237
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cond_Pag'
        Title.Caption = 'Cond. Pag.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prazo_Entrega'
        Title.Caption = 'Prz. Entr.'
        Width = 58
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 139
    Top = -2
    Width = 122
    Height = 107
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Produto'
      'Fornecedor')
    TabOrder = 4
    OnClick = RGConsulta_PorClick
  end
  object EdtConsulta: TEdit
    Left = 572
    Top = 37
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
    Left = 386
    Top = -2
    Width = 114
    Height = 107
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 0
    Items.Strings = (
      'Produto'
      'Fornecedor')
    TabOrder = 5
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 120
    Height = 536
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 116
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
    TabOrder = 6
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
    object BBtnAprovar: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Caption = 'A&provar'
      Enabled = False
      ImageIndex = 6
      Wrap = True
      OnClick = BBtnAprovarClick
    end
    object BBtnEstorno: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Caption = 'Estor&nar'
      Enabled = False
      ImageIndex = 4
      Wrap = True
      OnClick = BBtnEstornoClick
    end
    object BBtnImprimir: TToolButton
      Left = 0
      Top = 152
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
    object BBtnImprimir_Selecionado: TToolButton
      Left = 0
      Top = 190
      Cursor = crHandPoint
      Caption = 'Imprimir &Sel.'
      Enabled = False
      ImageIndex = 3
      Wrap = True
      OnClick = BBtnImprimir_SelecionadoClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 228
      Cursor = crHandPoint
      Hint = 'Clique para fechar a janela'
      Caption = '&Fechar'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object EdtCodigo: TEdit
    Left = 515
    Top = 37
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
    OnKeyDown = EdtCodigoKeyDown
    OnKeyPress = EdtCodigoKeyPress
  end
  object EdtCotacao: TEdit
    Left = 515
    Top = 88
    Width = 81
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
  end
  object RGStatus: TRadioGroup
    Left = 266
    Top = -2
    Width = 114
    Height = 107
    Caption = 'Status'
    ItemIndex = 0
    Items.Strings = (
      'Pendente'
      'Aprovado'
      'Reprovado')
    TabOrder = 7
  end
  object qryconsulta_cotacao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select IRC.*, RC.Codigo_Fornecedor, RC.Codigo_Condicao_Pagamento' +
        ', RC.Prazo_Entrega, CP.Descricao as Cond_Pag, CC.Nome, P.Descric' +
        'ao, UM.Sigla from Itens_Retorno_Cotacao_Preco IRC'
      'left join Retorno_Cotacao_Preco RC on (IRC.Codigo = RC.Codigo )'
      
        'left join Cadastro_Cliente CC on (RC.Codigo_Fornecedor = CC.Codi' +
        'go)'
      
        'left join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento' +
        ' = CP.Codigo)'
      'left join Cadastro_Produtos P on (P.Codigo = IRC.Codigo_Produto)'
      'left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade)'
      ''
      'where RC.N_Cotacao = 2 order by P.Descricao, IRC.Valor_Unitario')
    Left = 711
    Top = 71
    object qryconsulta_cotacaoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_cotacaoN_Cotacao: TIntegerField
      FieldName = 'N_Cotacao'
    end
    object qryconsulta_cotacaoCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryconsulta_cotacaoQtde: TFloatField
      FieldName = 'Qtde'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_cotacaoValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_cotacaoDesconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_cotacaoTipo_Desconto: TStringField
      FieldName = 'Tipo_Desconto'
      Size = 3
    end
    object qryconsulta_cotacaoSub_Total: TFloatField
      FieldName = 'Sub_Total'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_cotacaoCodigo_Fornecedor: TIntegerField
      FieldName = 'Codigo_Fornecedor'
    end
    object qryconsulta_cotacaoPrazo_Entrega: TIntegerField
      FieldName = 'Prazo_Entrega'
    end
    object qryconsulta_cotacaoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryconsulta_cotacaoSigla: TStringField
      FieldName = 'Sigla'
      Size = 5
    end
    object qryconsulta_cotacaoCond_Pag: TStringField
      FieldName = 'Cond_Pag'
      Size = 30
    end
    object qryconsulta_cotacaoStatus: TStringField
      FieldName = 'Status'
    end
    object qryconsulta_cotacaoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_cotacao
    Left = 743
    Top = 71
  end
end
