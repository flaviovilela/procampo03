object FrmConsulta_Retorno_Cotacao_Preco: TFrmConsulta_Retorno_Cotacao_Preco
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Retorno de Cota'#231#227'o de Pre'#231'os'
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
    Left = 431
    Top = 22
    Width = 64
    Height = 13
    Caption = 'Fornecedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 431
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
    Left = 491
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
    Left = 558
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
    TabOrder = 4
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
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Cotacao'
        Title.Caption = 'Cota'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cotacao'
        Title.Caption = 'Data Cota'#231#227'o'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Retorno'
        Title.Caption = 'Data Retorno'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prazo_Entrega'
        Title.Caption = 'Prazo Entrega'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Fornecedor'
        Title.Caption = 'Fornecedor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Fornecedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Condicao_Pagamento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cond_Pag'
        Title.Caption = 'Condi'#231#227'o Pagamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Empresa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Tipo_Frete'
        Title.Caption = 'Tipo Frete'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Frete'
        Title.Caption = 'Valor Frete'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Outras_Despesas'
        Title.Caption = 'Outras Despesas'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtde_Itens'
        Title.Caption = 'Qtde. Itens'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total_Produtos'
        Title.Caption = 'Total Produtos'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Peso_Total'
        Title.Caption = 'Peso Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desconto'
        Width = 70
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
        FieldName = 'Total_Pedido'
        Title.Caption = 'Total Pedido'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacoes'
        Title.Caption = 'Obs.'
        Width = 395
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 122
    Top = 0
    Width = 183
    Height = 107
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'Cota'#231#227'o'
      'Data Cota'#231#227'o'
      'Data Retorno'
      'Fornecedor / Data Cota'#231#227'o'
      'Fornecedor / Data Retorno')
    TabOrder = 5
  end
  object EdtFuncionario: TEdit
    Left = 488
    Top = 39
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
    OnKeyPress = EdtFuncionarioKeyPress
  end
  object RGOrdena_Por: TRadioGroup
    Left = 311
    Top = 0
    Width = 114
    Height = 107
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 0
    Items.Strings = (
      'Cota'#231#227'o'
      'Data Cota'#231#227'o'
      'Fornecedor')
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
    Images = DM.ImgImagens_Consulta
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
    Left = 431
    Top = 39
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
    TabOrder = 8
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
    TabOrder = 9
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
        FieldName = 'N_Cotacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Produto'
        Title.Caption = 'Codigo Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 246
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
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Unitario'
        Title.Caption = 'Valor Unit'#225'rio'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desconto'
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
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
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
    TabOrder = 10
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 431
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
    OnExit = MEdtData_InicialExit
  end
  object MEdtData_Final: TMaskEdit
    Left = 491
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
    OnExit = MEdtData_FinalExit
  end
  object EdtCotacao: TEdit
    Left = 558
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
    TabOrder = 11
    OnKeyDown = EdtCodigo_FuncionarioKeyDown
  end
  object qryconsulta_cotacao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select RC.*, Forn.Nome, CP.Descricao as Cond_Pag from Retorno_Co' +
        'tacao_Preco RC'
      
        'inner join Cadastro_Cliente Forn on (RC.Codigo_Fornecedor = Forn' +
        '.Codigo)'
      
        'inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagament' +
        'o = CP.Codigo)')
    Left = 478
    Top = 176
    object qryconsulta_cotacaoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_cotacaoN_Cotacao: TIntegerField
      FieldName = 'N_Cotacao'
    end
    object qryconsulta_cotacaoData_Cotacao: TDateTimeField
      FieldName = 'Data_Cotacao'
    end
    object qryconsulta_cotacaoData_Retorno: TDateTimeField
      FieldName = 'Data_Retorno'
    end
    object qryconsulta_cotacaoPrazo_Entrega: TIntegerField
      FieldName = 'Prazo_Entrega'
    end
    object qryconsulta_cotacaoCodigo_Fornecedor: TIntegerField
      FieldName = 'Codigo_Fornecedor'
    end
    object qryconsulta_cotacaoCodigo_Condicao_Pagamento: TIntegerField
      FieldName = 'Codigo_Condicao_Pagamento'
    end
    object qryconsulta_cotacaoResponsavel: TStringField
      FieldName = 'Responsavel'
      Size = 50
    end
    object qryconsulta_cotacaoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryconsulta_cotacaoTipo_Frete: TStringField
      FieldName = 'Tipo_Frete'
      Size = 10
    end
    object qryconsulta_cotacaoValor_Frete: TFloatField
      FieldName = 'Valor_Frete'
    end
    object qryconsulta_cotacaoOutras_Despesas: TFloatField
      FieldName = 'Outras_Despesas'
    end
    object qryconsulta_cotacaoQtde_Itens: TIntegerField
      FieldName = 'Qtde_Itens'
    end
    object qryconsulta_cotacaoTotal_Produtos: TFloatField
      FieldName = 'Total_Produtos'
    end
    object qryconsulta_cotacaoPeso_Total: TFloatField
      FieldName = 'Peso_Total'
    end
    object qryconsulta_cotacaoDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qryconsulta_cotacaoTipo_Desconto: TStringField
      FieldName = 'Tipo_Desconto'
      Size = 1
    end
    object qryconsulta_cotacaoTotal_Pedido: TFloatField
      FieldName = 'Total_Pedido'
    end
    object qryconsulta_cotacaoObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 300
    end
    object qryconsulta_cotacaoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryconsulta_cotacaoCond_Pag: TStringField
      FieldName = 'Cond_Pag'
      Size = 30
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
      
        'select IRC.*, P.Descricao, UM.Sigla from Itens_Retorno_Cotacao_P' +
        'reco IRC'
      'left join Cadastro_Produtos P on (P.Codigo = IRC.Codigo_Produto)'
      'left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade)')
    Left = 491
    Top = 362
    object qryitens_cotacaoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryitens_cotacaoN_Cotacao: TIntegerField
      FieldName = 'N_Cotacao'
    end
    object qryitens_cotacaoCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryitens_cotacaoQtde: TFloatField
      FieldName = 'Qtde'
    end
    object qryitens_cotacaoValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
    end
    object qryitens_cotacaoDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qryitens_cotacaoTipo_Desconto: TStringField
      FieldName = 'Tipo_Desconto'
      Size = 3
    end
    object qryitens_cotacaoSub_Total: TFloatField
      FieldName = 'Sub_Total'
    end
    object qryitens_cotacaoStatus: TStringField
      FieldName = 'Status'
    end
    object qryitens_cotacaoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryitens_cotacaoSigla: TStringField
      FieldName = 'Sigla'
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = qryitens_cotacao
    Left = 454
    Top = 360
  end
end
