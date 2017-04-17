object FrmDiagnostico: TFrmDiagnostico
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Diagn'#243'stico'
  ClientHeight = 525
  ClientWidth = 782
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
  Scaled = False
  Visible = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 125
    Top = 0
    Width = 657
    Height = 525
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object LblCodigo: TLabel
        Left = 0
        Top = 13
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 55
        Top = 15
        Width = 66
        Height = 13
        Caption = 'Diagn'#243'stico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 0
        Top = 103
        Width = 57
        Height = 13
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 136
        Top = 102
        Width = 73
        Height = 13
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblAnimal: TLabel
        Left = 0
        Top = 60
        Width = 39
        Height = 13
        Caption = 'Animal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 311
        Top = 60
        Width = 57
        Height = 13
        Caption = 'Cobertura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtCodigo: TEdit
        Left = 0
        Top = 32
        Width = 56
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 0
      end
      object MEdtData_Diagnostico: TMaskEdit
        Left = 55
        Top = 32
        Width = 66
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = MEdtData_DiagnosticoEnter
        OnExit = MEdtData_DiagnosticoExit
      end
      object CMBResultado: TComboBox
        Left = 0
        Top = 119
        Width = 130
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Sorted = True
        TabOrder = 2
        Items.Strings = (
          'NEGATIVO'
          'POSITIVO')
      end
      object MMOObservacoes: TMemo
        Left = 136
        Top = 117
        Width = 440
        Height = 39
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ScrollBars = ssVertical
        TabOrder = 3
        OnExit = MMOObservacoesExit
      end
      object EdtAnimal: TEdit
        Left = 56
        Top = 76
        Width = 256
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 4
        OnKeyPress = EdtAnimalKeyPress
      end
      object MEdtData_Cobertura: TMaskEdit
        Left = 311
        Top = 76
        Width = 66
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 5
        Text = '  /  /    '
        OnKeyPress = MEdtData_CoberturaKeyPress
      end
      object EdtCodigo_Animal: TEdit
        Left = 0
        Top = 76
        Width = 56
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clBtnFace
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnKeyDown = EdtCodigo_AnimalKeyDown
        OnKeyPress = EdtCodigo_AnimalKeyPress
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 164
        Width = 632
        Height = 323
        Caption = 'Dados Animal'
        TabOrder = 7
        object DBGrid2: TDBGrid
          Left = 10
          Top = 19
          Width = 611
          Height = 293
          Hint = 
            'Pressione Delete para remover itens lan'#231'ados. Caso deseje remove' +
            'r um item j'#225' salvo, d'#234' duplo clique no registro desejado e cliqu' +
            'e no bot'#227'o Excluir'
          BorderStyle = bsNone
          DataSource = DataSource1
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyDown = DBGrid2KeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Codigo_Propriedade'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Codigo_Animal'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Animal'
              Width = 244
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Data_Cobertura'
              Title.Caption = 'Cobertura'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Data_Diagnostico'
              Title.Caption = 'Diagn'#243'stico'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Resultado'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Observacao'
              Title.Caption = 'Obs.'
              Visible = True
            end>
        end
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 525
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 121
    DockSite = True
    DragCursor = crHandPoint
    DragKind = dkDock
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
    HideClippedButtons = True
    HotTrackColor = clMenu
    Images = DM.ImgComandos
    List = True
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = False
    TabOrder = 1
    object BBtnSalvar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para Salvar/Alterar o registro'
      Caption = '&Salvar'
      Enabled = False
      ImageIndex = 0
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnSalvarClick
    end
    object BBtnExcluir: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para Excluir o registro selecionado'
      Caption = '&Excluir'
      Enabled = False
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnExcluirClick
    end
    object BBtnPesquisar: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para pesquisar um registro desejado'
      Caption = '&Pesquisar'
      ImageIndex = 2
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnPesquisarClick
    end
    object BBtnCancelar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Hint = 'Clique para Cancelar a Inser'#231#227'o ou Altera'#231#227'o de um registro'
      Caption = '&Cancelar'
      Enabled = False
      ImageIndex = 3
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnCancelarClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 152
      Cursor = crHandPoint
      Hint = 'Clique para Fechar a Janela Ativa'
      Caption = '&Fechar Janela'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select D.*, CA.Brinco + '#39' - '#39' + CA.Nome as Animal, CA.Codigo_Cat' +
        'egoria from Diagnostico D'
      'left join Cadastro_Animal CA on (D.Codigo_Animal = CA.Codigo)'
      'order by CA.Nome')
    Left = 384
    Top = 264
    object ADOQuery1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ADOQuery1Codigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object ADOQuery1Codigo_Animal: TIntegerField
      FieldName = 'Codigo_Animal'
    end
    object ADOQuery1Data_Cobertura: TDateTimeField
      FieldName = 'Data_Cobertura'
    end
    object ADOQuery1Data_Diagnostico: TDateTimeField
      FieldName = 'Data_Diagnostico'
    end
    object ADOQuery1Resultado: TStringField
      FieldName = 'Resultado'
      Size = 10
    end
    object ADOQuery1Observacao: TStringField
      FieldName = 'Observacao'
      Size = 300
    end
    object ADOQuery1Animal: TStringField
      FieldName = 'Animal'
      ReadOnly = True
      Size = 83
    end
    object ADOQuery1Codigo_Categoria: TIntegerField
      FieldName = 'Codigo_Categoria'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 416
    Top = 264
  end
end
