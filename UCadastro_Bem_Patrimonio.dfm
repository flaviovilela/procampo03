object FrmCadastro_Bem_Patrimonio: TFrmCadastro_Bem_Patrimonio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Bens Patrim'#244'niais'
  ClientHeight = 374
  ClientWidth = 819
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
    Width = 694
    Height = 374
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object LblCodigo: TLabel
        Left = 0
        Top = 17
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
      object Label4: TLabel
        Left = 55
        Top = 17
        Width = 74
        Height = 13
        Caption = 'Identifica'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 168
        Top = 17
        Width = 72
        Height = 13
        Caption = 'Respons'#225'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblMarca: TLabel
        Left = 0
        Top = 62
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
      object Label7: TLabel
        Left = 193
        Top = 62
        Width = 52
        Height = 13
        Caption = 'Tipo Bem'
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
      object EdtIdentificacao: TEdit
        Left = 55
        Top = 32
        Width = 114
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object EdtResponsavel: TEdit
        Left = 168
        Top = 32
        Width = 217
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 102
        Width = 649
        Height = 235
        Cursor = crHandPoint
        ActivePage = TabSheet3
        Style = tsFlatButtons
        TabOrder = 6
        object TabSheet3: TTabSheet
          Caption = 'Dados Principais'
          object Label5: TLabel
            Left = 192
            Top = 43
            Width = 65
            Height = 13
            Caption = 'Quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 98
            Top = 43
            Width = 52
            Height = 13
            Caption = 'Pre'#231'o ($)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 0
            Top = 43
            Width = 60
            Height = 13
            Caption = 'Pre'#231'o (R$)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 296
            Top = 96
            Width = 116
            Height = 13
            Caption = 'Descri'#231#227'o Detalhada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 296
            Top = 0
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
          object Label2: TLabel
            Left = 0
            Top = 0
            Width = 46
            Height = 13
            Caption = 'Unidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtQuantidade: TEdit
            Left = 192
            Top = 58
            Width = 80
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 4
            OnExit = EdtQuantidadeExit
            OnKeyPress = EdtQuantidadeKeyPress
          end
          object EdtPreco_S: TEdit
            Left = 98
            Top = 58
            Width = 95
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 3
            OnExit = EdtPreco_SExit
            OnKeyPress = EdtPreco_SKeyPress
          end
          object EdtPreco_RS: TEdit
            Left = 0
            Top = 58
            Width = 99
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 2
            OnExit = EdtPreco_RSExit
            OnKeyPress = EdtPreco_RSKeyPress
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 134
            Width = 272
            Height = 66
            Caption = 'Datas'
            TabOrder = 6
            object Label14: TLabel
              Left = 109
              Top = 21
              Width = 74
              Height = 13
              Caption = 'Data Compra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label1: TLabel
              Left = 18
              Top = 21
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
            object MEdtData_Compra: TMaskEdit
              Left = 109
              Top = 37
              Width = 79
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 1
              Text = '  /  /    '
              OnExit = MEdtData_CompraExit
            end
            object MEdtData_Cadastro: TMaskEdit
              Left = 18
              Top = 37
              Width = 79
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 0
              Text = '  /  /    '
              OnEnter = MEdtData_CadastroEnter
              OnExit = MEdtData_CadastroExit
            end
          end
          object RGTipo_Bem: TRadioGroup
            Left = 0
            Top = 81
            Width = 272
            Height = 47
            Caption = 'Tipo Bem'
            Columns = 3
            ItemIndex = 0
            Items.Strings = (
              'Im'#243'vel'
              'M'#243'vel'
              'Outros')
            TabOrder = 5
          end
          object MMODescricao_Detalhada: TMemo
            Left = 296
            Top = 115
            Width = 334
            Height = 85
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ScrollBars = ssVertical
            TabOrder = 8
          end
          object MMObservacoes: TMemo
            Left = 296
            Top = 19
            Width = 334
            Height = 71
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ScrollBars = ssVertical
            TabOrder = 7
          end
          object EdtUnidade: TEdit
            Left = 60
            Top = 15
            Width = 90
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            OnKeyPress = EdtUnidadeKeyPress
          end
          object EdtCodigo_Unidade: TEdit
            Left = 0
            Top = 15
            Width = 60
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
            OnKeyDown = EdtCodigo_UnidadeKeyDown
            OnKeyPress = EdtCodigo_UnidadeKeyPress
          end
        end
      end
      object EdtDescricao: TEdit
        Left = 0
        Top = 77
        Width = 194
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 3
      end
      object EdtTipo_Bem: TEdit
        Left = 253
        Top = 77
        Width = 132
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
        OnKeyPress = EdtTipo_BemKeyPress
      end
      object EdtCodigo_Tipo_Bem: TEdit
        Left = 193
        Top = 77
        Width = 60
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
        TabOrder = 4
        OnKeyDown = EdtCodigo_Tipo_BemKeyDown
        OnKeyPress = EdtCodigo_Tipo_BemKeyPress
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 374
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
