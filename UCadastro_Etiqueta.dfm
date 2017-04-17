object FrmCadastro_Etiqueta: TFrmCadastro_Etiqueta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Etiquetas'
  ClientHeight = 386
  ClientWidth = 725
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
    Left = 128
    Top = 0
    Width = 593
    Height = 385
    ActivePage = TabSheet1
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
      object LblMarca: TLabel
        Left = 0
        Top = 57
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
      object EdtDescricao: TEdit
        Left = 0
        Top = 72
        Width = 257
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 93
        Width = 577
        Height = 260
        Caption = 'Dimens'#245'es'
        TabOrder = 3
        object GroupBox2: TGroupBox
          Left = 16
          Top = 24
          Width = 177
          Height = 105
          Caption = 'Margem'
          TabOrder = 0
          object LblNumero: TLabel
            Left = 6
            Top = 22
            Width = 48
            Height = 13
            Caption = 'Superior'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 6
            Top = 59
            Width = 43
            Height = 13
            Caption = 'Inferior'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 78
            Top = 22
            Width = 52
            Height = 13
            Caption = 'Esquerda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 78
            Top = 59
            Width = 38
            Height = 13
            Caption = 'Direita'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtMargem_Superior: TEdit
            Left = 6
            Top = 37
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 0
            Text = '0,00'
            OnKeyPress = EdtMargem_SuperiorKeyPress
          end
          object EdtMargem_Inferior: TEdit
            Left = 6
            Top = 74
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 1
            Text = '0,00'
            OnKeyPress = EdtMargem_InferiorKeyPress
          end
          object EdtMargem_Esquerda: TEdit
            Left = 78
            Top = 37
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 2
            Text = '0,00'
            OnKeyPress = EdtMargem_EsquerdaKeyPress
          end
          object EdtMargem_Direita: TEdit
            Left = 78
            Top = 74
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 3
            Text = '0,00'
            OnKeyPress = EdtMargem_DireitaKeyPress
          end
        end
        object GroupBox3: TGroupBox
          Left = 199
          Top = 24
          Width = 177
          Height = 105
          Caption = 'Dist'#226'ncia entre Etiquetas'
          TabOrder = 1
          object Label4: TLabel
            Left = 16
            Top = 38
            Width = 58
            Height = 13
            Caption = 'Horizontal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 88
            Top = 38
            Width = 43
            Height = 13
            Caption = 'Vertical'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtDistancia_Horizontal: TEdit
            Left = 16
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 0
            Text = '0,00'
            OnKeyPress = EdtDistancia_HorizontalKeyPress
          end
          object EdtDistancia_Vertical: TEdit
            Left = 88
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 1
            Text = '0,00'
            OnKeyPress = EdtDistancia_VerticalKeyPress
          end
        end
        object GroupBox4: TGroupBox
          Left = 382
          Top = 24
          Width = 177
          Height = 105
          Caption = 'Tamanho Etiquetas'
          TabOrder = 2
          object Label5: TLabel
            Left = 16
            Top = 38
            Width = 35
            Height = 13
            Caption = 'Altura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 88
            Top = 38
            Width = 44
            Height = 13
            Caption = 'Largura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtAltura_Etiqueta: TEdit
            Left = 16
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 0
            Text = '0,00'
            OnKeyPress = EdtAltura_EtiquetaKeyPress
          end
          object EdtLargura_Etiqueta: TEdit
            Left = 88
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 1
            Text = '0,00'
            OnKeyPress = EdtLargura_EtiquetaKeyPress
          end
        end
        object GroupBox5: TGroupBox
          Left = 16
          Top = 135
          Width = 177
          Height = 105
          Caption = 'P'#225'gina'
          TabOrder = 3
          object Label8: TLabel
            Left = 16
            Top = 38
            Width = 35
            Height = 13
            Caption = 'Altura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 88
            Top = 38
            Width = 44
            Height = 13
            Caption = 'Largura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtAltura_Pagina: TEdit
            Left = 16
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 0
            Text = '0,00'
            OnKeyPress = EdtAltura_PaginaKeyPress
          end
          object EdtLargura_Pagina: TEdit
            Left = 88
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 1
            Text = '0,00'
            OnKeyPress = EdtLargura_PaginaKeyPress
          end
        end
        object GroupBox6: TGroupBox
          Left = 199
          Top = 135
          Width = 247
          Height = 105
          Caption = 'Geral'
          TabOrder = 4
          object Label10: TLabel
            Left = 16
            Top = 38
            Width = 68
            Height = 13
            Caption = 'Etiq. por Lin.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 88
            Top = 38
            Width = 68
            Height = 13
            Caption = 'Lin. por P'#225'g.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 160
            Top = 38
            Width = 63
            Height = 13
            Caption = 'Tam. Fonte'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtEtiqueta_Linha: TEdit
            Left = 16
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 0
            Text = '0,00'
            OnKeyPress = EdtEtiqueta_LinhaKeyPress
          end
          object EdtLinha_Pagina: TEdit
            Left = 88
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 1
            Text = '0,00'
            OnKeyPress = EdtLinha_PaginaKeyPress
          end
          object EdtTamanho_Fonte: TEdit
            Left = 160
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 2
            Text = '0'
            OnKeyPress = EdtTamanho_FonteKeyPress
          end
        end
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 386
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
