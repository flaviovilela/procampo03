object FrmLeite_Individual: TFrmLeite_Individual
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pesagem de Leite Individual'
  ClientHeight = 562
  ClientWidth = 928
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
    Width = 803
    Height = 562
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object LblCodigo: TLabel
        Left = 0
        Top = 16
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
      object LblData_Cadastro: TLabel
        Left = 55
        Top = 16
        Width = 82
        Height = 13
        Caption = 'Data Pesagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 0
        Top = 498
        Width = 64
        Height = 13
        Caption = 'Total Litros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 85
        Top = 498
        Width = 77
        Height = 13
        Caption = 'Total Animais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 170
        Top = 498
        Width = 70
        Height = 13
        Caption = 'Media Di'#225'ria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 155
        Top = 16
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
      object MEdtData_Pesagem: TMaskEdit
        Left = 55
        Top = 32
        Width = 75
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = MEdtData_PesagemEnter
        OnExit = MEdtData_PesagemExit
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 100
        Width = 793
        Height = 392
        Hint = 'Pressione Delete para remover itens lan'#231'ados'
        BorderStyle = bsNone
        DataSource = DataSource1
        DrawingStyle = gdsGradient
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Data_Pesagem'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Codigo_1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Animal'
            Width = 361
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ordenha1'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ordenha2'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ordenha3'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Codigo_Animal'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Ultima_Pesagem_Leite'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Codigo_Lote'
            Visible = False
          end>
      end
      object EdtPesquisa_Animal: TEdit
        Left = 0
        Top = 84
        Width = 612
        Height = 17
        Hint = 
          'Filtre os animais digitando "peda'#231'os" de seu nome ou brinco. Cas' +
          'o preferir, ao localizar o animal desejado, pressione a tecla TA' +
          'B uma vez, para posteriormente pressionar ENTER no animal deseja' +
          'do.'
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnChange = EdtPesquisa_AnimalChange
      end
      object RGTipo_Pesquisa: TRadioGroup
        Left = 669
        Top = 38
        Width = 113
        Height = 60
        Caption = 'Tipo Pesquisa'
        ItemIndex = 1
        Items.Strings = (
          'Codigo Animal'
          'Nome'
          'Brinco')
        TabOrder = 5
      end
      object EdtTotal_Litros: TEdit
        Left = 0
        Top = 514
        Width = 86
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object EdtTotal_Animais: TEdit
        Left = 85
        Top = 514
        Width = 86
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object EdtMedia: TEdit
        Left = 170
        Top = 514
        Width = 93
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object MMOObservacoes: TMemo
        Left = 155
        Top = 32
        Width = 270
        Height = 33
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object CBFinalizar_Ordenha: TCheckBox
        Left = 431
        Top = 51
        Width = 111
        Height = 17
        Caption = 'Finalizar Ordenha'
        TabOrder = 9
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 562
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
    object BBtnCancelar: TToolButton
      Left = 0
      Top = 76
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
      Top = 114
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
    AutoCalcFields = False
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select ILI.Codigo_Registro, ILI.Data_Pesagem, CA.Codigo as Codig' +
        'o_Animal, CA.Brinco + '#39'-'#39'+ CA.Nome as Animal, CA.Ultima_Pesagem_' +
        'Leite, CA.Codigo_Lote,'
      
        'ILI.Ordenha1, ILI.Ordenha2, ILI.Ordenha3, ILI.Total from Itens_L' +
        'eite_Individual ILI'
      'left join Cadastro_Animal CA on (ILI.Codigo_Animal = CA.Codigo)')
    Left = 456
    Top = 272
    object ADOQuery1Codigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ADOQuery1Data_Pesagem: TDateTimeField
      FieldName = 'Data_Pesagem'
      ProviderFlags = []
    end
    object ADOQuery1Codigo_Animal: TIntegerField
      FieldName = 'Codigo_Animal'
      ProviderFlags = []
    end
    object ADOQuery1Animal: TStringField
      FieldName = 'Animal'
      ProviderFlags = []
      ReadOnly = True
      Size = 81
    end
    object ADOQuery1Ultima_Pesagem_Leite: TFloatField
      FieldName = 'Ultima_Pesagem_Leite'
      ProviderFlags = []
    end
    object ADOQuery1Codigo_Lote: TIntegerField
      FieldName = 'Codigo_Lote'
      ProviderFlags = []
    end
    object ADOQuery1Ordenha1: TFloatField
      FieldName = 'Ordenha1'
      ProviderFlags = [pfInUpdate]
    end
    object ADOQuery1Ordenha2: TFloatField
      FieldName = 'Ordenha2'
      ProviderFlags = [pfInUpdate]
    end
    object ADOQuery1Ordenha3: TFloatField
      FieldName = 'Ordenha3'
      ProviderFlags = [pfInUpdate]
    end
    object ADOQuery1Total: TFloatField
      FieldName = 'Total'
      ProviderFlags = [pfInUpdate]
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 496
    Top = 272
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADOQuery1
    OnGetTableName = DataSetProvider1GetTableName
    Left = 376
    Top = 272
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Codigo_Registro'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'Data_Pesagem'
        DataType = ftDateTime
      end
      item
        Name = 'Codigo_Animal'
        DataType = ftInteger
      end
      item
        Name = 'Animal'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 81
      end
      item
        Name = 'Ultima_Pesagem_Leite'
        DataType = ftFloat
      end
      item
        Name = 'Codigo_Lote'
        DataType = ftInteger
      end
      item
        Name = 'Ordenha1'
        DataType = ftFloat
      end
      item
        Name = 'Ordenha2'
        DataType = ftFloat
      end
      item
        Name = 'Ordenha3'
        DataType = ftFloat
      end
      item
        Name = 'Total'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    BeforeInsert = ClientDataSet1BeforeInsert
    BeforeScroll = ClientDataSet1BeforeScroll
    Left = 416
    Top = 272
    object ClientDataSet1Codigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ClientDataSet1Data_Pesagem: TDateTimeField
      FieldName = 'Data_Pesagem'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1Codigo_Animal: TIntegerField
      FieldName = 'Codigo_Animal'
      ProviderFlags = []
    end
    object ClientDataSet1Animal: TStringField
      FieldName = 'Animal'
      ProviderFlags = []
      ReadOnly = True
      Size = 81
    end
    object ClientDataSet1Ultima_Pesagem_Leite: TFloatField
      FieldName = 'Ultima_Pesagem_Leite'
      ProviderFlags = []
    end
    object ClientDataSet1Codigo_Lote: TIntegerField
      FieldName = 'Codigo_Lote'
      ProviderFlags = []
    end
    object ClientDataSet1Ordenha1: TFloatField
      FieldName = 'Ordenha1'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.0,0'
    end
    object ClientDataSet1Ordenha2: TFloatField
      FieldName = 'Ordenha2'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.0,0'
    end
    object ClientDataSet1Ordenha3: TFloatField
      FieldName = 'Ordenha3'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.0,0'
    end
    object ClientDataSet1Total: TFloatField
      FieldName = 'Total'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.0,0'
    end
  end
end
