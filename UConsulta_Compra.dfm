object FrmConsulta_Compra: TFrmConsulta_Compra
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Compras'
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
    Left = 506
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
    Left = 506
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
    Left = 566
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
    Left = 633
    Top = 73
    Width = 38
    Height = 13
    Caption = 'Pedido'
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
        FieldName = 'N_Pedido'
        Title.Caption = 'Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Pedido'
        Title.Caption = 'Data Pedido'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora_Pedido'
        Title.Caption = 'Hora Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Previsao_Entrega'
        Title.Caption = 'Prev. Entrega'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Baixa'
        Title.Caption = 'Data Baixa'
        Width = 76
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Responsavel'
        Title.Caption = 'Respons'#225'vel'
        Width = 239
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Condicao_Pagamento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Cond. Pag.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Frete'
        Title.Caption = 'Tipo Frete'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Frete'
        Title.Caption = 'Valor Frete'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Outras_Despesas'
        Title.Caption = 'Outras Despesas'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtde_Itens'
        Title.Caption = 'Qtde Itens'
        Width = 70
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
        Width = 73
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
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total_Pedido'
        Title.Caption = 'Total Pedido'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Observacoes'
        Visible = False
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
      'Pedido'
      'Data Pedido'
      'Data Prev. Ent.'
      'Fornecedor'
      'Data Pedido/Forn.'
      'Data Prev. Ent./Forn.')
    TabOrder = 5
  end
  object EdtFornecedor: TEdit
    Left = 563
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
    OnKeyPress = EdtFornecedorKeyPress
  end
  object RGOrdena_Por: TRadioGroup
    Left = 386
    Top = 0
    Width = 114
    Height = 107
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 0
    Items.Strings = (
      'Data Pedido'
      'Data Prev. Ent.'
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
  object EdtCodigo_Fornecedor: TEdit
    Left = 506
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
    OnKeyDown = EdtCodigo_FornecedorKeyDown
    OnKeyPress = EdtCodigo_FornecedorKeyPress
  end
  object Panel1: TPanel
    Left = 122
    Top = 113
    Width = 832
    Height = 25
    BorderStyle = bsSingle
    Caption = 'Compra(s)'
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
        FieldName = 'N_Pedido'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Produto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Produto'
        Title.Caption = 'Codigo Prod.'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sigla'
        Title.Caption = 'Un.'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Entrega'
        Title.Caption = 'Data Entrega'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtde'
        Title.Caption = 'Qtde. Sol.'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtde_Recebida'
        Title.Caption = 'Qtde. Rec.'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtde_Restante'
        Title.Caption = 'Qtde. Rest.'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Unitario'
        Title.Caption = 'Valor Unit'#225'rio'
        Width = 109
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
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sub_Total'
        Title.Caption = 'Sub Total'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Width = 76
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 122
    Top = 296
    Width = 832
    Height = 25
    BorderStyle = bsSingle
    Caption = 'Item(s) da Compra'
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
    Left = 506
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
    Left = 566
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
  object RGStatus: TRadioGroup
    Left = 270
    Top = 0
    Width = 114
    Height = 107
    Caption = 'Status'
    ItemIndex = 0
    Items.Strings = (
      'Pendente'
      'Baixado')
    TabOrder = 11
  end
  object EdtPedido: TEdit
    Left = 633
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
    TabOrder = 12
    OnKeyDown = EdtCodigo_FornecedorKeyDown
  end
  object qryconsulta_compra: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select C.*, Forn.Nome, CP.Descricao from Compra C'
      
        'inner join Cadastro_Cliente Forn on (C.Codigo_Fornecedor = Forn.' +
        'Codigo)'
      
        'inner join Condicao_Pagamento CP on (C.Codigo_Condicao_Pagamento' +
        ' = CP.Codigo)'
      '')
    Left = 478
    Top = 176
    object qryconsulta_compraCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryconsulta_compraN_Pedido: TIntegerField
      FieldName = 'N_Pedido'
    end
    object qryconsulta_compraData_Pedido: TDateTimeField
      FieldName = 'Data_Pedido'
    end
    object qryconsulta_compraHora_Pedido: TStringField
      FieldName = 'Hora_Pedido'
      Size = 10
    end
    object qryconsulta_compraData_Previsao_Entrega: TDateTimeField
      FieldName = 'Data_Previsao_Entrega'
    end
    object qryconsulta_compraCodigo_Fornecedor: TIntegerField
      FieldName = 'Codigo_Fornecedor'
    end
    object qryconsulta_compraCodigo_Condicao_Pagamento: TIntegerField
      FieldName = 'Codigo_Condicao_Pagamento'
    end
    object qryconsulta_compraResponsavel: TStringField
      FieldName = 'Responsavel'
      Size = 50
    end
    object qryconsulta_compraCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryconsulta_compraTipo_Frete: TStringField
      FieldName = 'Tipo_Frete'
      Size = 10
    end
    object qryconsulta_compraValor_Frete: TFloatField
      FieldName = 'Valor_Frete'
    end
    object qryconsulta_compraOutras_Despesas: TFloatField
      FieldName = 'Outras_Despesas'
    end
    object qryconsulta_compraQtde_Itens: TIntegerField
      FieldName = 'Qtde_Itens'
    end
    object qryconsulta_compraTotal_Produtos: TFloatField
      FieldName = 'Total_Produtos'
    end
    object qryconsulta_compraPeso_Total: TFloatField
      FieldName = 'Peso_Total'
    end
    object qryconsulta_compraDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qryconsulta_compraTipo_Desconto: TStringField
      FieldName = 'Tipo_Desconto'
      Size = 1
    end
    object qryconsulta_compraTotal_Pedido: TFloatField
      FieldName = 'Total_Pedido'
    end
    object qryconsulta_compraStatus: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object qryconsulta_compraObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 300
    end
    object qryconsulta_compraData_Baixa: TDateTimeField
      FieldName = 'Data_Baixa'
    end
    object qryconsulta_compraNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryconsulta_compraDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
  end
  object ds_consulta_folha: TDataSource
    DataSet = qryconsulta_compra
    Left = 510
    Top = 176
  end
  object qryitens_compra: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select IC.*, P.Descricao, UM.Sigla from Itens_Compra IC'
      'inner join Cadastro_Produtos P on (IC.Codigo_Produto = P.Codigo)'
      'inner join Unidade_Medida UM on (P.Codigo_Unidade = UM.Codigo)')
    Left = 483
    Top = 362
    object qryitens_compraCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryitens_compraN_Pedido: TIntegerField
      FieldName = 'N_Pedido'
    end
    object qryitens_compraCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryitens_compraQtde: TFloatField
      FieldName = 'Qtde'
    end
    object qryitens_compraQtde_Recebida: TFloatField
      FieldName = 'Qtde_Recebida'
    end
    object qryitens_compraQtde_Restante: TFloatField
      FieldName = 'Qtde_Restante'
    end
    object qryitens_compraValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
    end
    object qryitens_compraDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qryitens_compraTipo_Desconto: TStringField
      FieldName = 'Tipo_Desconto'
      Size = 1
    end
    object qryitens_compraSub_Total: TFloatField
      FieldName = 'Sub_Total'
    end
    object qryitens_compraStatus: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object qryitens_compraData_Entrega: TDateTimeField
      FieldName = 'Data_Entrega'
    end
    object qryitens_compraDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryitens_compraSigla: TStringField
      FieldName = 'Sigla'
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = qryitens_compra
    Left = 518
    Top = 360
  end
end
