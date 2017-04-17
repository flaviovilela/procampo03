object FrmConsulta_Agenda_Telefonica: TFrmConsulta_Agenda_Telefonica
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Agenda Telef'#244'nica'
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
    Left = 233
    Top = 75
    Width = 45
    Height = 13
    Caption = 'Contato'
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
    TabOrder = 1
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
        FieldName = 'Nome'
        Width = 360
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone1'
        Title.Caption = 'Telefone 1'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone2'
        Title.Caption = 'Telefone 2'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone3'
        Title.Caption = 'Telefone 3'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Data Cadastro'
        Visible = True
      end>
  end
  object EdtContato: TEdit
    Left = 233
    Top = 91
    Width = 272
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
      'Contato')
    TabOrder = 2
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
  object qryconsulta_agenda: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select AT.* from Agenda_Telefonica AT')
    Left = 469
    Top = 272
    object qryconsulta_agendaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_agendaNome: TStringField
      FieldName = 'Nome'
      Size = 70
    end
    object qryconsulta_agendaTelefone1: TStringField
      FieldName = 'Telefone1'
    end
    object qryconsulta_agendaTelefone2: TStringField
      FieldName = 'Telefone2'
    end
    object qryconsulta_agendaTelefone3: TStringField
      FieldName = 'Telefone3'
    end
    object qryconsulta_agendaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_agenda
    Left = 501
    Top = 272
  end
end
