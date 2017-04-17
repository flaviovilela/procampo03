object FrmCadastro_Condicao_Pagamento: TFrmCadastro_Condicao_Pagamento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Condi'#231#227'o de Pagamento'
  ClientHeight = 246
  ClientWidth = 598
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 125
    Top = 0
    Width = 473
    Height = 246
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    ExplicitLeft = 137
    ExplicitWidth = 464
    ExplicitHeight = 241
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      ExplicitWidth = 456
      ExplicitHeight = 210
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
      object LblMarca: TLabel
        Left = 0
        Top = 59
        Width = 55
        Height = 13
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblParcelas: TLabel
        Left = 134
        Top = 59
        Width = 28
        Height = 13
        Caption = 'Parc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblDias: TLabel
        Left = 184
        Top = 59
        Width = 32
        Height = 13
        Caption = 'Prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 232
        Top = 59
        Width = 28
        Height = 13
        Caption = 'Taxa'
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
        OnKeyPress = EdtCodigoKeyPress
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
      end
      object EdtDescricao: TEdit
        Left = 0
        Top = 74
        Width = 136
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 3
      end
      object EdtParcela: TEdit
        Left = 135
        Top = 74
        Width = 49
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BiDiMode = bdLeftToRight
        BorderStyle = bsNone
        ParentBiDiMode = False
        TabOrder = 4
        OnKeyPress = EdtParcelaKeyPress
      end
      object EdtPrazo: TEdit
        Left = 183
        Top = 74
        Width = 49
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 5
        OnKeyPress = EdtPrazoKeyPress
      end
      object EdtTaxa_Juros: TEdit
        Left = 231
        Top = 74
        Width = 57
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 6
        OnExit = EdtTaxa_JurosExit
        OnKeyPress = EdtTaxa_JurosKeyPress
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 97
        Width = 138
        Height = 46
        Caption = 'Tipo Pagamento'
        TabOrder = 7
        object RBA_Vista: TRadioButton
          Left = 8
          Top = 19
          Width = 53
          Height = 17
          Caption = 'A Vista'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RBA_PRazo: TRadioButton
          Left = 75
          Top = 19
          Width = 55
          Height = 17
          Caption = 'A Prazo'
          TabOrder = 1
        end
      end
      object CBStatus: TCheckBox
        Left = 156
        Top = 36
        Width = 53
        Height = 17
        Caption = 'Ativo'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object RGTipo_Juro: TRadioGroup
        Left = 144
        Top = 97
        Width = 97
        Height = 46
        Caption = 'Tipo Juro'
        ItemIndex = 0
        Items.Strings = (
          'Simples'
          'Composto')
        TabOrder = 8
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 246
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 121
    DoubleBuffered = False
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
    ParentDoubleBuffered = False
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
