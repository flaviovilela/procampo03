object FrmConsulta_Tempo_Producao: TFrmConsulta_Tempo_Producao
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Tempo de Produ'#231#227'o'
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
    Left = 455
    Top = 35
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
  object Label3: TLabel
    Left = 455
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
    Left = 515
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
    Height = 426
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
        FieldName = 'N_Pedido'
        Title.Caption = 'Pedido'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Cliente'
        Width = 289
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Movimento'
        Title.Caption = 'Data Movimento'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Pagar'
        Title.Caption = 'Valor Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tempo_Pedido'
        Title.Caption = 'Pedido'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tempo_Fabricacao'
        Title.Caption = 'Produ'#231#227'o'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tempo_Entrega'
        Title.Caption = 'Entrega'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tempo_Fechamento'
        Title.Caption = 'Fechamento'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tempo_Total'
        Title.Caption = 'Total'
        Width = 54
        Visible = True
      end>
  end
  object EdtN_Pedido: TEdit
    Left = 455
    Top = 51
    Width = 121
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
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
      'Pedido')
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
    Images = DM.ImgComandos
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
    Left = 455
    Top = 89
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
  object MEdtData_Final: TMaskEdit
    Left = 515
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
  object RGOrdena_Por: TRadioGroup
    Left = 232
    Top = 1
    Width = 217
    Height = 107
    Caption = 'Ordena por'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'N'#250'mero Pedido'
      'Data Movimento'
      'Cliente'
      'Pedido'
      'Produ'#231#227'o'
      'Entrega'
      'Fechamento'
      'Total')
    TabOrder = 6
  end
  object qryconsulta_tempo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select P.N_Pedido, CC.Nome, P.Valor_Pagar, P.Data_Movimento,'
      
        'convert(varchar(8), convert(varchar(4), (datepart(minute, P.Hora' +
        '_Fabricacao - P.Hora_Pedido))) + '#39':'#39' + convert(varchar(4), (date' +
        'part(second, P.Hora_Fabricacao - P.Hora_Pedido))))  as Tempo_Ped' +
        'ido,'
      
        'convert(varchar(8), convert(varchar(4), (datepart(minute, P.Hora' +
        '_Termino - P.Hora_Fabricacao))) + '#39':'#39' + convert(varchar(4), (dat' +
        'epart(second, P.Hora_Termino - P.Hora_Fabricacao))))  as Tempo_F' +
        'abricacao,'
      
        'convert(varchar(8), convert(varchar(4), (datepart(minute, P.Hora' +
        '_Entrega - P.Hora_Termino))) + '#39':'#39' + convert(varchar(4), (datepa' +
        'rt(second, P.Hora_Entrega - P.Hora_Termino))))  as Tempo_Entrega' +
        ','
      
        'convert(varchar(8), convert(varchar(4), (datepart(minute, P.Hora' +
        '_Fechamento - P.Hora_Entrega))) + '#39':'#39' + convert(varchar(4), (dat' +
        'epart(second, P.Hora_Fechamento - P.Hora_Entrega))))  as Tempo_F' +
        'echamento,'
      ''
      
        'convert(varchar(8), (isnull( datepart(minute, P.Hora_Fabricacao ' +
        '- P.Hora_Pedido),  0) + isnull( datepart(minute, P.Hora_Termino ' +
        '- P.Hora_Fabricacao),  0) + '
      
        'isnull( datepart(minute, P.Hora_Entrega - P.Hora_Termino ),  0) ' +
        ' + isnull( datepart(minute, P.Hora_Fechamento - P.Hora_Entrega),' +
        '  0))) + convert(varchar(1), '#39':'#39') + '
      
        'convert(varchar(8), isnull( datepart(second, P.Hora_Fabricacao -' +
        ' P.Hora_Pedido),  0) + isnull( datepart(second, P.Hora_Termino -' +
        ' P.Hora_Fabricacao),  0) + '
      
        'isnull( datepart(second, P.Hora_Entrega - P.Hora_Termino),  0) +' +
        ' isnull( datepart(second, P.Hora_Fechamento - P.Hora_Entrega),  ' +
        '0)) as Tempo_Total'
      'from Pedido P'
      'left join Cadastro_Cliente CC on (P.Codigo_Cliente = CC.Codigo)'
      ''
      '')
    Left = 469
    Top = 272
    object qryconsulta_tempoN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 15
    end
    object qryconsulta_tempoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryconsulta_tempoValor_Pagar: TFloatField
      FieldName = 'Valor_Pagar'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_tempoData_Movimento: TDateTimeField
      FieldName = 'Data_Movimento'
    end
    object qryconsulta_tempoTempo_Pedido: TStringField
      FieldName = 'Tempo_Pedido'
      ReadOnly = True
      Size = 8
    end
    object qryconsulta_tempoTempo_Fabricacao: TStringField
      FieldName = 'Tempo_Fabricacao'
      ReadOnly = True
      Size = 8
    end
    object qryconsulta_tempoTempo_Entrega: TStringField
      FieldName = 'Tempo_Entrega'
      ReadOnly = True
      Size = 8
    end
    object qryconsulta_tempoTempo_Fechamento: TStringField
      FieldName = 'Tempo_Fechamento'
      ReadOnly = True
      Size = 8
    end
    object qryconsulta_tempoTempo_Total: TStringField
      FieldName = 'Tempo_Total'
      ReadOnly = True
      Size = 17
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_tempo
    Left = 501
    Top = 272
  end
end
