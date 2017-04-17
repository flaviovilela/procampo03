object FrmCobertura: TFrmCobertura
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Insemina'#231#227'o / Cobertura'
  ClientHeight = 320
  ClientWidth = 776
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
    Width = 651
    Height = 320
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
      object LblData_Cadastro: TLabel
        Left = 55
        Top = 13
        Width = 81
        Height = 13
        Caption = 'Data Cadastro'
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
      object MEdtData_Cadastro: TMaskEdit
        Left = 55
        Top = 32
        Width = 81
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = MEdtData_CadastroEnter
        OnExit = MEdtData_CadastroExit
      end
      object RGForma: TRadioGroup
        Left = 156
        Top = 13
        Width = 207
        Height = 72
        Caption = 'Formas de Cobertura'
        ItemIndex = 0
        Items.Strings = (
          'Monta Natural'
          'Insemina'#231#227'o Artificial'
          'Transferencia de Embri'#227'o'
          'Sexagem')
        TabOrder = 2
        OnClick = RGFormaClick
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 90
        Width = 635
        Height = 119
        Caption = 'Dados Principais da Cobertura'
        TabOrder = 3
        object Label5: TLabel
          Left = 10
          Top = 20
          Width = 30
          Height = 13
          Caption = 'Data '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 80
          Top = 20
          Width = 27
          Height = 13
          Caption = 'Hora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 145
          Top = 20
          Width = 150
          Height = 13
          Caption = 'Inseminador/Respons'#225'vel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 392
          Top = 20
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
        object Label3: TLabel
          Left = 10
          Top = 69
          Width = 99
          Height = 13
          Caption = 'S'#234'men / Doadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 331
          Top = 69
          Width = 34
          Height = 13
          Caption = 'Doses'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object MedtData_Inseminacao: TMaskEdit
          Left = 10
          Top = 36
          Width = 71
          Height = 17
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
          OnEnter = MedtData_InseminacaoEnter
          OnExit = MedtData_InseminacaoExit
        end
        object MEdtHora: TMaskEdit
          Left = 80
          Top = 36
          Width = 66
          Height = 17
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Enabled = False
          EditMask = '00:00;1;_'
          MaxLength = 5
          TabOrder = 1
          Text = '  :  '
          OnEnter = MEdtData_CadastroEnter
        end
        object MMOObservacoes: TMemo
          Left = 392
          Top = 36
          Width = 234
          Height = 66
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ScrollBars = ssVertical
          TabOrder = 6
        end
        object EdtTouro: TEdit
          Left = 66
          Top = 85
          Width = 266
          Height = 17
          BevelEdges = [beTop, beRight, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 4
          OnKeyPress = EdtTouroKeyPress
        end
        object EdtCodigo_Touro_Doadora: TEdit
          Left = 10
          Top = 85
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
          TabOrder = 3
          OnKeyDown = EdtCodigo_Touro_DoadoraKeyDown
          OnKeyPress = EdtCodigo_Touro_DoadoraKeyPress
        end
        object EdtDoses: TEdit
          Left = 331
          Top = 85
          Width = 55
          Height = 17
          Hint = 
            'A quantidade de dose informada deve ser a soma de todas as doses' +
            ' utilizadas para os animais desse lan'#231'amento'
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 5
        end
        object EdtInseminador: TEdit
          Left = 145
          Top = 36
          Width = 241
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 2
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 214
        Width = 635
        Height = 69
        Caption = 'Animal utilizado na cobertura/insemina'#231#227'o'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        object Label2: TLabel
          Left = 10
          Top = 22
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
        object EdtAnimal: TEdit
          Left = 66
          Top = 39
          Width = 291
          Height = 17
          BevelEdges = [beTop, beRight, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 1
          OnKeyPress = EdtAnimalKeyPress
        end
        object EdtCodigo_Animal: TEdit
          Left = 10
          Top = 39
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
          TabOrder = 0
          OnKeyDown = EdtCodigo_AnimalKeyDown
          OnKeyPress = EdtCodigo_AnimalKeyPress
        end
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 320
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
end
