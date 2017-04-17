object FrmConsulta_Rancking_Venda_Cliente: TFrmConsulta_Rancking_Venda_Cliente
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Rancking de Vendas por Cliente'
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
  object Label3: TLabel
    Left = 271
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
    Left = 331
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
    Height = 426
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
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
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Cliente'
        Title.Caption = 'Produto'
        Width = 252
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtde'
        Title.Caption = 'Qtde.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total_vendido'
        Title.Caption = 'Total Vendido'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Custo_total'
        Title.Caption = 'Custo Total'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lucratividade'
        Title.Caption = 'Lucro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'percentual'
        Title.Caption = '%'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lucratividade_unitaria'
        Title.Caption = 'Lucro Unit'#225'rio'
        Width = 80
        Visible = True
      end>
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
    TabOrder = 3
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
  object MEdtData_Inicial: TMaskEdit
    Left = 271
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
  end
  object MEdtData_Final: TMaskEdit
    Left = 331
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
  end
  object RGOrdena_Por: TRadioGroup
    Left = 113
    Top = 2
    Width = 152
    Height = 106
    Caption = 'Ordena Por'
    ItemIndex = 0
    Items.Strings = (
      'Quantidade'
      'Total Vendido'
      'Custo Total'
      'Lucro'
      '%'
      'Lucro Unit'#225'rio')
    TabOrder = 4
  end
  object qryconsulta_rancking: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from ('
      'select          H.Cliente,'
      #9'   H.Total_Vendido,'
      '                   H.Qtde,'
      #9'   H.Custo_total,'
      
        '                  (H.Total_vendido - H.Custo_total) as lucrativi' +
        'dade,'
      #9'  ((H.custo_total / H.totalgeral)*100) as percentual,'
      
        '                  ((H.Total_vendido - H.Custo_total) / H.Qtde) a' +
        's lucratividade_unitaria'
      'FROM('
      'select '#9'   Y.Cliente,'
      #9'   sum(Y.Quantidade) Qtde,'
      #9'   sum(Y.Total_vendido) Total_vendido,'
      #9'   sum(Y.Custo_total) Custo_total,'
      #9'   sum(Y.totalgeral) totalgeral'#9
      'from('
      'select Pro.Codigo,'
      '          Pro.Descricao, '
      '          Ped.Codigo_Cliente,'
      '          CC.Nome as Cliente,'
      '          sum(IP.Quantidade) as Qtde, '
      '          sum(IP.Valor_Venda) as Total_Vendido,'
      '          Pro.Valor_Compra * sum(IP.Quantidade) as Custo_Total,'
      ''
      '          (select sum(t.Valor_Venda) from Itens_Pedido t '
      '          left join Pedido Ped on (t.Codigo = Ped.Codigo)'
      
        '          where Ped.Data_Movimento between '#39'05/05/2011'#39' and '#39'20/' +
        '05/2011'#39') as totalgeral '
      ''
      'from Itens_Pedido IP'
      'left join Pedido Ped on (IP.Codigo = Ped.Codigo)'
      
        'left join Cadastro_Produto Pro on (IP.Codigo_Produto = Pro.Codig' +
        'o)'
      
        'left join Cadastro_Cliente CC on (Ped.Codigo_Cliente = CC.Codigo' +
        ')'
      ''
      'where Ped.Data_Movimento between '#39'05/05/2011'#39' and '#39'20/05/2011'#39
      
        'group by Pro.Codigo, Pro.Descricao, Ped.Codigo_Cliente, CC.Nome,' +
        ' Pro.Valor_Compra ) Y'
      'group by Y.Cliente) H ) U'
      'order by U.percentual desc'
      '')
    Left = 469
    Top = 272
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_rancking
    Left = 501
    Top = 272
  end
end
