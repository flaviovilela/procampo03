object FrmCadastro_Animal: TFrmCadastro_Animal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Animais'
  ClientHeight = 393
  ClientWidth = 807
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
    Width = 682
    Height = 393
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object LblCodigo: TLabel
        Left = 0
        Top = 15
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
        Top = 15
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
      object LblNome: TLabel
        Left = 0
        Top = 58
        Width = 32
        Height = 13
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 291
        Top = 53
        Width = 28
        Height = 13
        Caption = 'Sexo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 208
        Top = 58
        Width = 35
        Height = 13
        Caption = 'Brinco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label50: TLabel
        Left = 381
        Top = 53
        Width = 55
        Height = 13
        Caption = 'Categoria'
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
      object RGLocalizacao: TRadioGroup
        Left = 159
        Top = 11
        Width = 185
        Height = 40
        Caption = 'Localiza'#231#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Propriedade'
          'Externo')
        TabOrder = 2
      end
      object EdtNome: TEdit
        Left = 0
        Top = 72
        Width = 209
        Height = 17
        Hint = 
          'Digite um nome para o animal. Caso cadastrar um animal provenien' +
          'te de um parto, pressione F3 para consultar'
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 3
      end
      object CmbSexo: TComboBox
        Left = 291
        Top = 68
        Width = 84
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Sorted = True
        TabOrder = 5
        OnExit = CmbSexoExit
        Items.Strings = (
          'F'#202'MEA'
          'MACHO')
      end
      object EdtBrinco: TEdit
        Left = 208
        Top = 72
        Width = 84
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 4
      end
      object CmbCategoria: TComboBox
        Left = 381
        Top = 68
        Width = 127
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Sorted = True
        TabOrder = 6
        OnExit = CmbCategoriaExit
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 104
        Width = 653
        Height = 247
        Cursor = crHandPoint
        ActivePage = TabSheet2
        MultiLine = True
        Style = tsFlatButtons
        TabOrder = 7
        object TabSheet2: TTabSheet
          Caption = 'Dados Gerais'
          object Label34: TLabel
            Left = 194
            Top = 53
            Width = 67
            Height = 13
            Caption = #218'ltimo Peso'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label43: TLabel
            Left = 267
            Top = 53
            Width = 75
            Height = 13
            Caption = #218'ltima Altura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label45: TLabel
            Left = 3
            Top = 12
            Width = 17
            Height = 13
            Caption = 'Pai'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblComposicao: TLabel
            Left = 194
            Top = 200
            Width = 3
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label11: TLabel
            Left = 194
            Top = 185
            Width = 123
            Height = 13
            Caption = 'Grau de Sangue/Ra'#231'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label53: TLabel
            Left = 347
            Top = 53
            Width = 24
            Height = 13
            Caption = 'I.E.P'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 311
            Top = 12
            Width = 24
            Height = 13
            Caption = 'M'#227'e'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtPai: TEdit
            Left = 59
            Top = 26
            Width = 253
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 1
            OnKeyPress = EdtPaiKeyPress
          end
          object GroupBox4: TGroupBox
            Left = 195
            Top = 90
            Width = 425
            Height = 65
            Caption = 'Entrada na Fazenda'
            TabOrder = 8
            object Label28: TLabel
              Left = 14
              Top = 20
              Width = 27
              Height = 13
              Caption = 'Peso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label29: TLabel
              Left = 206
              Top = 20
              Width = 74
              Height = 13
              Caption = 'Data Entrada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label30: TLabel
              Left = 144
              Top = 20
              Width = 32
              Height = 13
              Caption = 'Pre'#231'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label44: TLabel
              Left = 80
              Top = 20
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
            object Label10: TLabel
              Left = 290
              Top = 20
              Width = 41
              Height = 13
              Caption = 'Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtPeso: TEdit
              Left = 14
              Top = 37
              Width = 67
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              TabOrder = 0
              OnKeyPress = EdtPesoKeyPress
            end
            object MEdtData_Entrada: TMaskEdit
              Left = 206
              Top = 37
              Width = 84
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 3
              Text = '  /  /    '
            end
            object EdtPreco: TEdit
              Left = 144
              Top = 37
              Width = 63
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              TabOrder = 2
              OnKeyPress = EdtPrecoKeyPress
            end
            object EdtAltura: TEdit
              Left = 80
              Top = 37
              Width = 65
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              TabOrder = 1
              OnKeyPress = EdtAlturaKeyPress
            end
            object CMBOrigem: TComboBox
              Left = 292
              Top = 37
              Width = 105
              Height = 21
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Sorted = True
              TabOrder = 4
              Items.Strings = (
                'COMPRA'
                'EMPR'#201'STIMO'
                'NASCIMENTO'
                'TRANSFER'#202'NCIA ')
            end
          end
          object EdtUltimo_Peso: TEdit
            Left = 194
            Top = 70
            Width = 67
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 5
            OnKeyPress = EdtUltimo_PesoKeyPress
          end
          object EdtUltima_Altura: TEdit
            Left = 267
            Top = 70
            Width = 75
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 6
            OnKeyPress = EdtUltima_AlturaKeyPress
          end
          object EdtCodigo_Pai: TEdit
            Left = 3
            Top = 26
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
            OnKeyDown = EdtCodigo_PaiKeyDown
            OnKeyPress = EdtCodigo_PaiKeyPress
          end
          object GroupBox6: TGroupBox
            Left = 3
            Top = 49
            Width = 185
            Height = 164
            Caption = 'Composi'#231#227'o Racial'
            TabOrder = 4
            object Label55: TLabel
              Left = 60
              Top = 15
              Width = 20
              Height = 13
              Caption = 'Sig.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label56: TLabel
              Left = 132
              Top = 15
              Width = 42
              Height = 13
              Caption = 'Sangue'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label57: TLabel
              Left = 60
              Top = 51
              Width = 20
              Height = 13
              Caption = 'Sig.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label58: TLabel
              Left = 132
              Top = 51
              Width = 42
              Height = 13
              Caption = 'Sangue'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label59: TLabel
              Left = 60
              Top = 88
              Width = 20
              Height = 13
              Caption = 'Sig.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label60: TLabel
              Left = 132
              Top = 88
              Width = 42
              Height = 13
              Caption = 'Sangue'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label54: TLabel
              Left = 60
              Top = 123
              Width = 20
              Height = 13
              Caption = 'Sig.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label61: TLabel
              Left = 132
              Top = 123
              Width = 42
              Height = 13
              Caption = 'Sangue'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label62: TLabel
              Left = 151
              Top = 30
              Width = 4
              Height = 13
              Caption = '/'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label63: TLabel
              Left = 151
              Top = 66
              Width = 4
              Height = 13
              Caption = '/'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label64: TLabel
              Left = 151
              Top = 103
              Width = 4
              Height = 13
              Caption = '/'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label65: TLabel
              Left = 151
              Top = 139
              Width = 4
              Height = 13
              Caption = '/'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object EdtRaca1: TEdit
              Left = 92
              Top = 29
              Width = 37
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Enabled = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 2
              OnKeyPress = EdtRaca1KeyPress
            end
            object EdtSangue1: TEdit
              Left = 132
              Top = 29
              Width = 19
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnExit = EdtSangue1Exit
              OnKeyPress = EdtSangue1KeyPress
            end
            object EdtRaca2: TEdit
              Left = 92
              Top = 65
              Width = 37
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Enabled = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 7
              OnKeyPress = EdtRaca2KeyPress
            end
            object EdtSangue2: TEdit
              Left = 132
              Top = 65
              Width = 19
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 8
              OnExit = EdtSangue2Exit
              OnKeyPress = EdtSangue2KeyPress
            end
            object EdtRaca3: TEdit
              Left = 92
              Top = 102
              Width = 37
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Enabled = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 12
              OnKeyPress = EdtRaca3KeyPress
            end
            object EdtSangue3: TEdit
              Left = 132
              Top = 102
              Width = 19
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 13
              OnExit = EdtSangue3Exit
              OnKeyPress = EdtSangue3KeyPress
            end
            object EdtRaca4: TEdit
              Left = 92
              Top = 137
              Width = 37
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Enabled = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 17
              OnKeyPress = EdtRaca4KeyPress
            end
            object EdtSangue4: TEdit
              Left = 132
              Top = 137
              Width = 19
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 18
              OnExit = EdtSangue4Exit
              OnKeyPress = EdtSangue4KeyPress
            end
            object EdtSangue11: TEdit
              Left = 155
              Top = 29
              Width = 19
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnExit = EdtSangue11Exit
              OnKeyPress = EdtSangue11KeyPress
            end
            object EdtSangue22: TEdit
              Left = 155
              Top = 65
              Width = 19
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
              OnExit = EdtSangue22Exit
              OnKeyPress = EdtSangue22KeyPress
            end
            object EdtSangue33: TEdit
              Left = 155
              Top = 102
              Width = 19
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 14
              OnExit = EdtSangue33Exit
              OnKeyPress = EdtSangue33KeyPress
            end
            object EdtSangue44: TEdit
              Left = 155
              Top = 137
              Width = 19
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 19
              OnExit = EdtSangue44Exit
              OnKeyPress = EdtSangue44KeyPress
            end
            object CBRaca1: TCheckBox
              Left = 6
              Top = 29
              Width = 50
              Height = 17
              Caption = 'Ra'#231'a 1'
              TabOrder = 0
              OnClick = CBRaca1Click
            end
            object CBRaca2: TCheckBox
              Left = 6
              Top = 66
              Width = 50
              Height = 17
              Caption = 'Ra'#231'a 2'
              TabOrder = 5
              OnClick = CBRaca2Click
            end
            object CBRaca3: TCheckBox
              Left = 6
              Top = 102
              Width = 50
              Height = 17
              Caption = 'Ra'#231'a 3'
              TabOrder = 10
              OnClick = CBRaca3Click
            end
            object CBRaca4: TCheckBox
              Left = 6
              Top = 138
              Width = 50
              Height = 17
              Caption = 'Ra'#231'a 4'
              TabOrder = 15
              OnClick = CBRaca4Click
            end
            object EdtCodigo_Raca1: TEdit
              Left = 60
              Top = 29
              Width = 33
              Height = 17
              Hint = 'Pressione F3 para consultar'
              BevelEdges = [beLeft, beTop, beBottom]
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Color = clBtnFace
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnKeyDown = EdtCodigo_Raca1KeyDown
              OnKeyPress = EdtCodigo_Raca1KeyPress
            end
            object EdtCodigo_Raca2: TEdit
              Left = 60
              Top = 65
              Width = 33
              Height = 17
              Hint = 'Pressione F3 para consultar'
              BevelEdges = [beLeft, beTop, beBottom]
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Color = clBtnFace
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              OnKeyDown = EdtCodigo_Raca2KeyDown
              OnKeyPress = EdtCodigo_Raca2KeyPress
            end
            object EdtCodigo_Raca3: TEdit
              Left = 60
              Top = 102
              Width = 33
              Height = 17
              Hint = 'Pressione F3 para consultar'
              BevelEdges = [beLeft, beTop, beBottom]
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Color = clBtnFace
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              OnKeyDown = EdtCodigo_Raca3KeyDown
              OnKeyPress = EdtCodigo_Raca3KeyPress
            end
            object EdtCodigo_Raca4: TEdit
              Left = 60
              Top = 137
              Width = 33
              Height = 17
              Hint = 'Pressione F3 para consultar'
              BevelEdges = [beLeft, beTop, beBottom]
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Color = clBtnFace
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 16
              OnKeyDown = EdtCodigo_Raca4KeyDown
              OnKeyPress = EdtCodigo_Raca4KeyPress
            end
          end
          object EdtIEP: TEdit
            Left = 347
            Top = 70
            Width = 75
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 7
            OnKeyPress = EdtIEPKeyPress
          end
          object EdtMae: TEdit
            Left = 367
            Top = 26
            Width = 253
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 3
            OnKeyPress = EdtMaeKeyPress
          end
          object EdtCodigo_Mae: TEdit
            Left = 311
            Top = 26
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
            TabOrder = 2
            OnKeyDown = EdtCodigo_MaeKeyDown
            OnKeyPress = EdtCodigo_MaeKeyPress
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Dados Secund'#225'rios'
          ImageIndex = 1
          object Label2: TLabel
            Left = 3
            Top = 12
            Width = 57
            Height = 13
            Caption = 'Cor Brinco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 216
            Top = 12
            Width = 49
            Height = 13
            Caption = 'Pelagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 216
            Top = 91
            Width = 43
            Height = 13
            Caption = 'Piquete'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 3
            Top = 52
            Width = 75
            Height = 13
            Caption = 'Lote Anterior'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 216
            Top = 52
            Width = 25
            Height = 13
            Caption = 'Lote'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 3
            Top = 91
            Width = 93
            Height = 13
            Caption = 'Piquete Anterior'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtCor: TEdit
            Left = 59
            Top = 26
            Width = 158
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ReadOnly = True
            TabOrder = 1
            OnKeyPress = EdtCorKeyPress
          end
          object EdtCodigo_Cor: TEdit
            Left = 3
            Top = 26
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
            OnKeyDown = EdtCodigo_CorKeyDown
            OnKeyPress = EdtCodigo_CorKeyPress
          end
          object EdtPelagem: TEdit
            Left = 272
            Top = 26
            Width = 158
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ReadOnly = True
            TabOrder = 3
            OnKeyPress = EdtPelagemKeyPress
          end
          object EdtCodigo_Pelagem: TEdit
            Left = 216
            Top = 26
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
            TabOrder = 2
            OnKeyDown = EdtCodigo_PelagemKeyDown
            OnKeyPress = EdtCodigo_PelagemKeyPress
          end
          object EdtPiquete: TEdit
            Left = 272
            Top = 105
            Width = 158
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ReadOnly = True
            TabOrder = 11
            OnKeyPress = EdtPiqueteKeyPress
          end
          object EdtCodigo_Piquete: TEdit
            Left = 216
            Top = 105
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
            TabOrder = 10
            OnKeyDown = EdtCodigo_PiqueteKeyDown
            OnKeyPress = EdtCodigo_PiqueteKeyPress
          end
          object EdtLote_Anterior: TEdit
            Left = 59
            Top = 66
            Width = 158
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ReadOnly = True
            TabOrder = 5
            OnKeyPress = EdtLote_AnteriorKeyPress
          end
          object EdtCodigo_Lote_Anterior: TEdit
            Left = 3
            Top = 66
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
            TabOrder = 4
            OnKeyPress = EdtCodigo_Lote_AnteriorKeyPress
          end
          object EdtLote: TEdit
            Left = 272
            Top = 66
            Width = 158
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ReadOnly = True
            TabOrder = 7
            OnKeyPress = EdtLoteKeyPress
          end
          object EdtCodigo_Lote: TEdit
            Left = 216
            Top = 66
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
            OnKeyDown = EdtCodigo_LoteKeyDown
            OnKeyPress = EdtCodigo_LoteKeyPress
          end
          object EdtPiquete_Anterior: TEdit
            Left = 59
            Top = 105
            Width = 158
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ReadOnly = True
            TabOrder = 9
            OnKeyPress = EdtPiquete_AnteriorKeyPress
          end
          object EdtCodigo_Piquete_Anterior: TEdit
            Left = 3
            Top = 105
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
            TabOrder = 8
            OnKeyPress = EdtCodigo_Piquete_AnteriorKeyPress
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'Reprodutivo'
          ImageIndex = 7
          object LblNumero_Aborto: TLabel
            Left = 354
            Top = 100
            Width = 45
            Height = 13
            Caption = 'Abortos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label20: TLabel
            Left = 362
            Top = 81
            Width = 37
            Height = 13
            Caption = 'Partos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 338
            Top = 119
            Width = 61
            Height = 13
            Caption = 'Crias Vivas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 328
            Top = 138
            Width = 71
            Height = 13
            Caption = 'Crias Mortas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label49: TLabel
            Left = 460
            Top = 138
            Width = 103
            Height = 13
            Caption = 'Primeiro Parto(m)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label51: TLabel
            Left = 495
            Top = 119
            Width = 67
            Height = 13
            Caption = 'M'#233'dia Atual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 493
            Top = 101
            Width = 69
            Height = 13
            Caption = 'Pen. Pes. Le.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 498
            Top = 81
            Width = 64
            Height = 13
            Caption = #218'lt. Pes. Le.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label52: TLabel
            Left = 328
            Top = 162
            Width = 65
            Height = 13
            Caption = #218'ltimo Rep.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtN_Abortos: TEdit
            Left = 405
            Top = 97
            Width = 50
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 1
            OnKeyPress = EdtN_AbortosKeyPress
          end
          object EdtN_Partos: TEdit
            Left = 405
            Top = 78
            Width = 50
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 0
            OnKeyPress = EdtN_PartosKeyPress
          end
          object EdtCrias_Vivas: TEdit
            Left = 405
            Top = 116
            Width = 50
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 2
            OnKeyPress = EdtCrias_VivasKeyPress
          end
          object EdtCrias_Mortas: TEdit
            Left = 405
            Top = 135
            Width = 50
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 3
            OnKeyPress = EdtCrias_MortasKeyPress
          end
          object Panel1: TPanel
            Left = 0
            Top = 10
            Width = 646
            Height = 54
            BorderStyle = bsSingle
            Caption = 'Panel1'
            TabOrder = 11
            object RichEdit1: TRichEdit
              Left = 0
              Top = 0
              Width = 641
              Height = 49
              Color = clSilver
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Lines.Strings = (
                
                  'Aba com preenchimento autom'#225'tico. Ao informar Coberturas/Insemin' +
                  'a'#231#245'es, Diagnosticos, Abortos, '
                
                  'Secamentos, Pari'#231#245'es, Desmama, ser'#225' atualizado os campos. Mas, n' +
                  'o primeiro cadastro do devido animal, caso '
                'saiba os itens abaixo, pode-se informar os mesmos.')
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 70
            Width = 323
            Height = 146
            BorderStyle = bsSingle
            TabOrder = 10
            object CBDiagnosticada: TCheckBox
              Left = 11
              Top = 81
              Width = 97
              Height = 17
              Caption = 'Diagnosticada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object CBCoberta: TCheckBox
              Left = 11
              Top = 58
              Width = 97
              Height = 17
              Caption = 'Coberta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object CBParida: TCheckBox
              Left = 11
              Top = 35
              Width = 87
              Height = 17
              Caption = 'Parida'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object CBSeca: TCheckBox
              Left = 123
              Top = 58
              Width = 46
              Height = 17
              Caption = 'Seca'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
            object CBAbortada: TCheckBox
              Left = 123
              Top = 35
              Width = 87
              Height = 17
              Caption = 'Abortada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
            end
            object CBBaixada: TCheckBox
              Left = 123
              Top = 81
              Width = 70
              Height = 17
              Caption = 'Baixada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
            end
            object CBVendida: TCheckBox
              Left = 11
              Top = 105
              Width = 70
              Height = 17
              Caption = 'Vendida'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
            end
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 318
              Height = 29
              BorderStyle = bsSingle
              Caption = 'Panel1'
              TabOrder = 7
              object RichEdit3: TRichEdit
                Left = 0
                Top = 0
                Width = 312
                Height = 25
                Alignment = taCenter
                Color = clSilver
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Lines.Strings = (
                  'Ciclo Reprodutivo')
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
          end
          object EdtIdade_Primeiro_Parto: TEdit
            Left = 568
            Top = 135
            Width = 50
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 7
            OnKeyPress = EdtIdade_Primeiro_PartoKeyPress
          end
          object EdtMedia_Atual: TEdit
            Left = 568
            Top = 116
            Width = 50
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 6
            OnKeyPress = EdtMedia_AtualKeyPress
          end
          object EdtPenultima_Pesagem_Leite: TEdit
            Left = 568
            Top = 97
            Width = 50
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 5
            OnKeyPress = EdtPenultima_Pesagem_LeiteKeyPress
          end
          object EdtUltima_Pesagem_Leite: TEdit
            Left = 568
            Top = 78
            Width = 50
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 4
            OnKeyPress = EdtUltima_Pesagem_LeiteKeyPress
          end
          object EdtCodigo_Ultimo_Reprodutor: TEdit
            Left = 328
            Top = 176
            Width = 65
            Height = 17
            Hint = 'Pressione F3 para consultar'
            BevelEdges = [beLeft, beTop, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            Color = clBtnFace
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 8
          end
          object EdtUltimo_Reprodutor: TEdit
            Left = 392
            Top = 176
            Width = 226
            Height = 17
            Hint = 'Pressione F3 para consultar'
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 9
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'Datas'
          ImageIndex = 6
          object GroupBox1: TGroupBox
            Left = 0
            Top = 32
            Width = 137
            Height = 184
            Caption = 'Datas Principais'
            TabOrder = 0
            object Label9: TLabel
              Left = 15
              Top = 17
              Width = 66
              Height = 13
              Caption = 'Nascimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 15
              Top = 57
              Width = 51
              Height = 13
              Caption = 'Cadastro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label39: TLabel
              Left = 15
              Top = 95
              Width = 57
              Height = 13
              Caption = 'Desmama'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label48: TLabel
              Left = 15
              Top = 135
              Width = 71
              Height = 13
              Caption = 'Novilha Apta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object MEdtData_Nascimento: TMaskEdit
              Left = 15
              Top = 34
              Width = 74
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 0
              Text = '  /  /    '
              OnExit = MEdtData_NascimentoExit
            end
            object MaskEdit1: TMaskEdit
              Left = 15
              Top = 74
              Width = 74
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 1
              Text = '  /  /    '
              OnExit = MEdtData_CadastroExit
            end
            object MEdtData_Desmama: TMaskEdit
              Left = 15
              Top = 112
              Width = 74
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 2
              Text = '  /  /    '
              OnExit = MEdtData_DesmamaExit
            end
            object MEdtNovilha_Apta: TMaskEdit
              Left = 15
              Top = 152
              Width = 74
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 3
              Text = '  /  /    '
              OnExit = MEdtNovilha_AptaExit
            end
          end
          object GroupBox2: TGroupBox
            Left = 143
            Top = 31
            Width = 290
            Height = 141
            Caption = 'Per'#237'odo Reprodutivo'
            TabOrder = 1
            object Label23: TLabel
              Left = 15
              Top = 96
              Width = 79
              Height = 13
              Caption = #218'ltimo Aborto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label24: TLabel
              Left = 168
              Top = 58
              Width = 82
              Height = 13
              Caption = #218'ltima Pari'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 15
              Top = 58
              Width = 68
              Height = 13
              Caption = #218'ltimo Diag.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 15
              Top = 18
              Width = 97
              Height = 13
              Caption = #218'ltima Cobertura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label26: TLabel
              Left = 168
              Top = 18
              Width = 81
              Height = 13
              Caption = #218'ltimo Secam.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label27: TLabel
              Left = 168
              Top = 96
              Width = 61
              Height = 13
              Caption = 'Data Baixa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object MedtData_Aborto: TMaskEdit
              Left = 15
              Top = 113
              Width = 86
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ReadOnly = True
              TabOrder = 2
              Text = '  /  /    '
              OnExit = MedtData_AbortoExit
            end
            object MEdtData_Paricao: TMaskEdit
              Left = 168
              Top = 75
              Width = 86
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ReadOnly = True
              TabOrder = 4
              Text = '  /  /    '
              OnExit = MEdtData_ParicaoExit
            end
            object MEdtData_Enxerto: TMaskEdit
              Left = 15
              Top = 75
              Width = 86
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ReadOnly = True
              TabOrder = 1
              Text = '  /  /    '
              OnExit = MEdtData_EnxertoExit
            end
            object MedtData_Cobertura: TMaskEdit
              Left = 15
              Top = 35
              Width = 86
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ReadOnly = True
              TabOrder = 0
              Text = '  /  /    '
              OnExit = MedtData_CoberturaExit
            end
            object MEdtData_Ultimo_Secamento: TMaskEdit
              Left = 168
              Top = 35
              Width = 86
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ReadOnly = True
              TabOrder = 3
              Text = '  /  /    '
              OnExit = MEdtData_Ultimo_SecamentoExit
            end
            object MEdtData_Baixa: TMaskEdit
              Left = 168
              Top = 113
              Width = 86
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ReadOnly = True
              TabOrder = 5
              Text = '  /  /    '
              OnExit = MEdtData_BaixaExit
            end
          end
          object GroupBox3: TGroupBox
            Left = 439
            Top = 31
            Width = 169
            Height = 140
            Caption = 'Previs'#245'es'
            TabOrder = 2
            object Label7: TLabel
              Left = 11
              Top = 18
              Width = 116
              Height = 13
              Caption = 'Previs'#227'o Secamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 11
              Top = 58
              Width = 94
              Height = 13
              Caption = 'Previs'#227'o Pari'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 11
              Top = 96
              Width = 109
              Height = 13
              Caption = 'Previs'#227'o Cobertura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object MEdtData_Secamento: TMaskEdit
              Left = 11
              Top = 35
              Width = 86
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ReadOnly = True
              TabOrder = 0
              Text = '  /  /    '
              OnExit = MEdtData_SecamentoExit
            end
            object MEdtData_Previsao_Paricao: TMaskEdit
              Left = 11
              Top = 75
              Width = 86
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ReadOnly = True
              TabOrder = 1
              Text = '  /  /    '
              OnExit = MEdtData_Previsao_ParicaoExit
            end
            object MEdtData_Previsao_Cobertura: TMaskEdit
              Left = 11
              Top = 113
              Width = 86
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ReadOnly = True
              TabOrder = 2
              Text = '  /  /    '
              OnExit = MEdtData_Previsao_CoberturaExit
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 3
            Width = 646
            Height = 28
            BorderStyle = bsSingle
            Caption = 'Panel1'
            TabOrder = 4
            object RichEdit2: TRichEdit
              Left = 0
              Top = 0
              Width = 641
              Height = 23
              Color = clSilver
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Lines.Strings = (
                
                  'Os '#250'nicos campos a serem informados nessa aba s'#227'o, se necess'#225'rio' +
                  ': Data do Nascimento e Data do Cadastro.')
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object GroupBox5: TGroupBox
            Left = 143
            Top = 171
            Width = 361
            Height = 45
            Caption = #218'ltimo(a)'
            TabOrder = 3
            object Label33: TLabel
              Left = 7
              Top = 21
              Width = 92
              Height = 13
              Caption = #218'ltima Pesagem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label42: TLabel
              Left = 185
              Top = 21
              Width = 87
              Height = 13
              Caption = #218'ltima Medi'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object MEdtData_Ultima_Pesagem: TMaskEdit
              Left = 105
              Top = 18
              Width = 72
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 0
              Text = '  /  /    '
              OnExit = MEdtData_Ultima_PesagemExit
            end
            object MEdtData_Ultima_Medicao: TMaskEdit
              Left = 279
              Top = 18
              Width = 68
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 1
              Text = '  /  /    '
              OnExit = MEdtData_Ultima_MedicaoExit
            end
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'Observa'#231#245'es'
          ImageIndex = 5
          object Label47: TLabel
            Left = 0
            Top = 15
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
          object MmoObservacoes: TMemo
            Left = 0
            Top = 34
            Width = 592
            Height = 145
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 393
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
      'select * from Cadastro_Categoria CC')
    Left = 72
    Top = 248
    object ADOQuery1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ADOQuery1Descricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object ADOQuery1Data_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
  end
end
