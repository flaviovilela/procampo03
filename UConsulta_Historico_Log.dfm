object FrmConsulta_Historico_Log: TFrmConsulta_Historico_Log
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderStyle = bsSingle
  Caption = 'Hist'#243'rico de navega'#231#227'o no sistema'
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
    Left = 353
    Top = 37
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
    Left = 353
    Top = 76
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
    Left = 413
    Top = 76
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
        FieldName = 'Usuario'
        Title.Caption = 'Usu'#225'rio'
        Width = 251
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Historico'
        Title.Caption = 'Hist'#243'rico'
        Width = 344
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Operacao'
        Title.Caption = 'T. Opera'#231#227'o'
        Width = 79
        Visible = True
      end>
  end
  object EdtUsuario: TEdit
    Left = 410
    Top = 53
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
    Left = 113
    Top = 1
    Width = 114
    Height = 107
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 0
    Items.Strings = (
      'Hist'#243'rico'
      'Data'
      'Tipo Opera'#231#227'o')
    TabOrder = 5
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
    TabOrder = 6
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
    Left = 353
    Top = 53
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
    OnKeyDown = EdtCodigo_UsuarioKeyDown
    OnKeyPress = EdtCodigo_UsuarioKeyPress
  end
  object RGTipo: TRadioGroup
    Left = 233
    Top = 2
    Width = 114
    Height = 106
    Caption = 'Tipo Conta:'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Inser'#231#227'o'
      'Altera'#231#227'o'
      'Exclus'#227'o'
      'Consulta')
    TabOrder = 7
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 353
    Top = 91
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
    Left = 413
    Top = 91
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
  object qryconsulta_historico: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Historico.* from Historico')
    Left = 469
    Top = 272
    object qryconsulta_historicoUsuario: TStringField
      FieldName = 'Usuario'
      Size = 70
    end
    object qryconsulta_historicoHistorico: TStringField
      FieldName = 'Historico'
      Size = 200
    end
    object qryconsulta_historicoData: TDateTimeField
      FieldName = 'Data'
    end
    object qryconsulta_historicoHora: TStringField
      FieldName = 'Hora'
      Size = 10
    end
    object qryconsulta_historicoTipo_Operacao: TStringField
      FieldName = 'Tipo_Operacao'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_historico
    Left = 501
    Top = 272
  end
end
