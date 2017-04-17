object FrmConsulta_Pedido: TFrmConsulta_Pedido
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Pedidos'
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
  object Label2: TLabel
    Left = 711
    Top = 35
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
  object Label3: TLabel
    Left = 711
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
    Left = 771
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
  object Label1: TLabel
    Left = 866
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
  object Label5: TLabel
    Left = 906
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
    Top = 143
    Width = 838
    Height = 154
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
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
        FieldName = 'Cliente'
        Width = 254
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Movimento'
        Title.Caption = 'Data Mov.'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora_Ped'
        Title.Caption = 'Hora Ped.'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora_Fab'
        Title.Caption = 'Hora Fab.'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora_Term'
        Title.Caption = 'Hora T'#233'rm.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora_Ent'
        Title.Caption = 'Hora Entr.'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora_Fec'
        Title.Caption = 'Hora Fech.'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Mesa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mesa'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Atendente'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Atendente'
        Width = 234
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Cliente'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Condicao_Pagamento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Condicao_Pagamento'
        Title.Caption = 'Cond.Pag.'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Entregador'
        Width = 248
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade_Itens'
        Title.Caption = 'Qtde. Itens'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total_Pedido'
        Title.Caption = 'Total Ped.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Taxa_Entrega'
        Title.Caption = 'Tx. Entrega'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desconto'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Acrescimo'
        Title.Caption = 'Acr'#233'scimo'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Pagar'
        Title.Caption = 'Valor Pagar'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Recebido'
        Title.Caption = 'Valor Rec.'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Troco'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Entregador'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Visible = True
      end>
  end
  object EdtParametro: TEdit
    Left = 768
    Top = 51
    Width = 183
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
    Left = 335
    Top = 0
    Width = 226
    Height = 106
    Caption = 'Ordenar Pesquisa:'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Pedido'
      'Hora Pedido'
      'Hora Fabrica'#231#227'o'
      'Hora T'#233'rmino'
      'Hora Entrega'
      'Cliente'
      'Entregador'
      'Data Movimento')
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
    Images = DM.ImgComandos
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
  object EdtCodigo_Parametro: TEdit
    Left = 711
    Top = 51
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
    OnKeyDown = EdtCodigo_ParametroKeyDown
    OnKeyPress = EdtCodigo_ParametroKeyPress
  end
  object RGConsulta_Por: TRadioGroup
    Left = 113
    Top = 0
    Width = 216
    Height = 106
    Caption = 'Consulta por'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Pedido'
      'Hora Pedido'
      'Hora Fabrica'#231#227'o'
      'Hora Termino'
      'Hora Entrega'
      'Atendente'
      'Cliente'
      'Entregador')
    TabOrder = 9
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 711
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
  end
  object MEdtData_Final: TMaskEdit
    Left = 771
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
  end
  object RGStatus: TRadioGroup
    Left = 567
    Top = 0
    Width = 138
    Height = 106
    Caption = 'Status'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Pendente'
      'Montagem'
      'Pronto p/ Entrega'
      'Saiu p/ Entrega'
      'Fechado')
    TabOrder = 10
  end
  object MEdtHora_Inicial: TMaskEdit
    Left = 866
    Top = 89
    Width = 41
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99:99;1;_'
    MaxLength = 5
    TabOrder = 4
    Text = '  :  '
  end
  object MEdtHora_Final: TMaskEdit
    Left = 906
    Top = 89
    Width = 41
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99:99;1;_'
    MaxLength = 5
    TabOrder = 5
    Text = '  :  '
  end
  object Panel1: TPanel
    Left = 113
    Top = 116
    Width = 838
    Height = 25
    BorderStyle = bsSingle
    Caption = 'Pedido'
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
  object Panel2: TPanel
    Left = 113
    Top = 299
    Width = 838
    Height = 25
    BorderStyle = bsSingle
    Caption = 'Itens Pedido'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 12
  end
  object DBGrid2: TDBGrid
    Left = 113
    Top = 324
    Width = 838
    Height = 212
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 13
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
        FieldName = 'N_Pedido'
        Title.Caption = 'Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Produto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Produto'
        Width = 238
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tamanho'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Borda'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sabor_Borda'
        Title.Caption = 'S. Borda'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Unitario'
        Title.Caption = 'Valor Unit.'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Title.Caption = 'Qtde.'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sub_Total'
        Title.Caption = 'Sub Total'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desconto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Venda'
        Title.Caption = 'Total'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Title.Caption = 'Obs.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cozinha'
        Visible = False
      end>
  end
  object qryconsulta_pedido: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as ' +
        'Mesa, '
      
        'CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregad' +
        'or,'
      'convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,'
      'convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,'
      'convert (varchar(8),P.Hora_Termino,114) as Hora_Term,'
      'convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,'
      'convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec'
      ''
      ' from Pedido P'
      
        'left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento ' +
        '= CP.Codigo)'
      'left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)'
      
        'left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo' +
        ')'
      
        'left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codi' +
        'go)'
      
        'left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Cod' +
        'igo)')
    Left = 453
    Top = 200
    object qryconsulta_pedidoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_pedidoN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 15
    end
    object qryconsulta_pedidoData_Movimento: TDateTimeField
      FieldName = 'Data_Movimento'
    end
    object qryconsulta_pedidoHora_Pedido: TDateTimeField
      FieldName = 'Hora_Pedido'
    end
    object qryconsulta_pedidoHora_Fabricacao: TDateTimeField
      FieldName = 'Hora_Fabricacao'
    end
    object qryconsulta_pedidoHora_Termino: TDateTimeField
      FieldName = 'Hora_Termino'
    end
    object qryconsulta_pedidoHora_Entrega: TDateTimeField
      FieldName = 'Hora_Entrega'
    end
    object qryconsulta_pedidoTipo: TStringField
      FieldName = 'Tipo'
      Size = 15
    end
    object qryconsulta_pedidoCodigo_Mesa: TIntegerField
      FieldName = 'Codigo_Mesa'
    end
    object qryconsulta_pedidoCodigo_Atendente: TIntegerField
      FieldName = 'Codigo_Atendente'
    end
    object qryconsulta_pedidoCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object qryconsulta_pedidoCodigo_Condicao_Pagamento: TIntegerField
      FieldName = 'Codigo_Condicao_Pagamento'
    end
    object qryconsulta_pedidoObservacao: TStringField
      FieldName = 'Observacao'
      Size = 500
    end
    object qryconsulta_pedidoQuantidade_Itens: TIntegerField
      FieldName = 'Quantidade_Itens'
    end
    object qryconsulta_pedidoTotal_Pedido: TFloatField
      FieldName = 'Total_Pedido'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_pedidoTaxa_Entrega: TFloatField
      FieldName = 'Taxa_Entrega'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_pedidoDesconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_pedidoAcrescimo: TFloatField
      FieldName = 'Acrescimo'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_pedidoValor_Pagar: TFloatField
      FieldName = 'Valor_Pagar'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_pedidoValor_Recebido: TFloatField
      FieldName = 'Valor_Recebido'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_pedidoTroco: TFloatField
      FieldName = 'Troco'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_pedidoStatus: TStringField
      FieldName = 'Status'
    end
    object qryconsulta_pedidoCodigo_Entregador: TIntegerField
      FieldName = 'Codigo_Entregador'
    end
    object qryconsulta_pedidoCondicao_Pagamento: TStringField
      FieldName = 'Condicao_Pagamento'
      Size = 30
    end
    object qryconsulta_pedidoMesa: TStringField
      FieldName = 'Mesa'
      Size = 50
    end
    object qryconsulta_pedidoCliente: TStringField
      FieldName = 'Cliente'
      Size = 50
    end
    object qryconsulta_pedidoAtendente: TStringField
      FieldName = 'Atendente'
      Size = 50
    end
    object qryconsulta_pedidoEntregador: TStringField
      FieldName = 'Entregador'
      Size = 50
    end
    object qryconsulta_pedidoHora_Fechamento: TDateTimeField
      FieldName = 'Hora_Fechamento'
    end
    object qryconsulta_pedidoHora_Ped: TStringField
      FieldName = 'Hora_Ped'
      ReadOnly = True
      Size = 11
    end
    object qryconsulta_pedidoHora_Fab: TStringField
      FieldName = 'Hora_Fab'
      ReadOnly = True
      Size = 8
    end
    object qryconsulta_pedidoHora_Term: TStringField
      FieldName = 'Hora_Term'
      ReadOnly = True
      Size = 8
    end
    object qryconsulta_pedidoHora_Ent: TStringField
      FieldName = 'Hora_Ent'
      ReadOnly = True
      Size = 8
    end
    object qryconsulta_pedidoHora_Fec: TStringField
      FieldName = 'Hora_Fec'
      ReadOnly = True
      Size = 8
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_pedido
    Left = 485
    Top = 200
  end
  object qryitens_pedido: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select IP.*, CP.Descricao, CP.Cozinha from Itens_Pedido IP'
      
        'inner join Cadastro_Produto CP on (IP.Codigo_Produto = CP.Codigo' +
        ')')
    Left = 461
    Top = 384
    object qryitens_pedidoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryitens_pedidoN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 15
    end
    object qryitens_pedidoCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryitens_pedidoTamanho: TStringField
      FieldName = 'Tamanho'
    end
    object qryitens_pedidoBorda: TStringField
      FieldName = 'Borda'
      Size = 1
    end
    object qryitens_pedidoValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_pedidoQuantidade: TFloatField
      FieldName = 'Quantidade'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_pedidoSub_Total: TFloatField
      FieldName = 'Sub_Total'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_pedidoDesconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_pedidoValor_Venda: TFloatField
      FieldName = 'Valor_Venda'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_pedidoObservacao: TStringField
      FieldName = 'Observacao'
      Size = 500
    end
    object qryitens_pedidoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 70
    end
    object qryitens_pedidoCozinha: TStringField
      FieldName = 'Cozinha'
      Size = 3
    end
    object qryitens_pedidoSabor_Borda: TStringField
      FieldName = 'Sabor_Borda'
    end
  end
  object DataSource1: TDataSource
    DataSet = qryitens_pedido
    Left = 493
    Top = 384
  end
end
