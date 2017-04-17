object FrmCadastro_Cliente: TFrmCadastro_Cliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Cliente'
  ClientHeight = 396
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
    Width = 817
    Height = 393
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
        Top = 59
        Width = 121
        Height = 13
        Caption = 'Nome/Nome Fantasia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 272
        Top = 59
        Width = 71
        Height = 13
        Caption = 'Raz'#227'o Social'
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
        ReadOnly = True
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
      object EdtNome: TEdit
        Left = 0
        Top = 74
        Width = 273
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 4
      end
      object CBTipo: TCheckBox
        Left = 272
        Top = 34
        Width = 97
        Height = 17
        Caption = 'F'#237'sico'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object EdtRazao_Social: TEdit
        Left = 272
        Top = 74
        Width = 265
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 5
        OnEnter = EdtRazao_SocialEnter
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 97
        Width = 366
        Height = 66
        Caption = 'Cliente F'#237'sico'
        TabOrder = 6
        object LblRG: TLabel
          Left = 110
          Top = 17
          Width = 16
          Height = 13
          Caption = 'RG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 190
          Top = 17
          Width = 60
          Height = 13
          Caption = 'Org'#227'o Exp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 275
          Top = 17
          Width = 76
          Height = 13
          Caption = 'Data Emiss'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 8
          Top = 17
          Width = 20
          Height = 13
          Caption = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtRG: TEdit
          Left = 110
          Top = 33
          Width = 81
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 1
          OnKeyPress = EdtRGKeyPress
        end
        object EdtOrgao_Expedidor: TEdit
          Left = 190
          Top = 33
          Width = 86
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 2
        end
        object EdtData_Emissao: TMaskEdit
          Left = 275
          Top = 33
          Width = 79
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 3
          Text = '  /  /    '
          OnExit = EdtData_EmissaoExit
        end
        object EdtCPF: TMaskEdit
          Left = 8
          Top = 33
          Width = 103
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditMask = '!999\.999\.999\-99;0;_'
          MaxLength = 14
          TabOrder = 0
        end
      end
      object GroupBox2: TGroupBox
        Left = 372
        Top = 97
        Width = 341
        Height = 66
        Caption = 'Cliente Jur'#237'dico'
        TabOrder = 7
        object Label22: TLabel
          Left = 122
          Top = 17
          Width = 50
          Height = 13
          Caption = 'Insc. Est.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 14
          Top = 17
          Width = 27
          Height = 13
          Caption = 'CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 212
          Top = 17
          Width = 83
          Height = 13
          Caption = 'Insc. Municipal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtInsc_Estadual: TEdit
          Left = 122
          Top = 33
          Width = 91
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 1
          OnKeyPress = EdtInsc_EstadualKeyPress
        end
        object EdtCNPJ: TMaskEdit
          Left = 14
          Top = 33
          Width = 109
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditMask = '!99\.999\.999\/9999\-99;0'
          MaxLength = 18
          TabOrder = 0
        end
        object EdtInsc_Municipal: TEdit
          Left = 212
          Top = 33
          Width = 91
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 2
          OnKeyPress = EdtInsc_MunicipalKeyPress
        end
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 169
        Width = 818
        Height = 216
        Cursor = crHandPoint
        ActivePage = TabSheet2
        Style = tsFlatButtons
        TabOrder = 8
        object TabSheet2: TTabSheet
          Caption = 'Inf. Principais'
          object LblNumero: TLabel
            Left = 308
            Top = 0
            Width = 13
            Height = 13
            Caption = 'N'#186
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 355
            Top = 0
            Width = 92
            Height = 13
            Caption = 'Tipo Logradouro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 462
            Top = 0
            Width = 20
            Height = 13
            Caption = 'CEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblUF: TLabel
            Left = 255
            Top = 89
            Width = 14
            Height = 13
            Caption = 'UF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label23: TLabel
            Left = 515
            Top = 0
            Width = 114
            Height = 13
            Caption = 'Ponto de Referencia'
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
            Width = 52
            Height = 13
            Caption = 'Endere'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 0
            Top = 89
            Width = 38
            Height = 13
            Caption = 'Cidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblEmail: TLabel
            Left = 243
            Top = 44
            Width = 34
            Height = 13
            Caption = 'E-Mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblProfissao: TLabel
            Left = 302
            Top = 89
            Width = 52
            Height = 13
            Caption = 'Profiss'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 568
            Top = 89
            Width = 64
            Height = 13
            Caption = 'Estado Civil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblData_Nasc: TLabel
            Left = 493
            Top = 89
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
          object Label7: TLabel
            Left = 0
            Top = 131
            Width = 49
            Height = 13
            Caption = 'Telefone'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 79
            Top = 131
            Width = 39
            Height = 13
            Caption = 'Celular'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 158
            Top = 131
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
          object Label10: TLabel
            Left = 380
            Top = 131
            Width = 49
            Height = 13
            Caption = 'Telefone'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 408
            Top = 44
            Width = 22
            Height = 13
            Caption = 'Site'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 680
            Top = 0
            Width = 79
            Height = 13
            Caption = 'Complemento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 0
            Top = 44
            Width = 31
            Height = 13
            Caption = 'Setor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 552
            Top = 44
            Width = 34
            Height = 13
            Caption = 'Grupo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object EdtEndereco: TEdit
            Left = 60
            Top = 17
            Width = 249
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            OnExit = EdtEnderecoExit
            OnKeyPress = EdtEnderecoKeyPress
            OnKeyUp = EdtEnderecoKeyUp
          end
          object EdtNumero: TEdit
            Left = 308
            Top = 17
            Width = 48
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 2
          end
          object EdtTipo_Logradouro: TEdit
            Left = 355
            Top = 17
            Width = 107
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 3
            OnKeyPress = EdtTipo_LogradouroKeyPress
          end
          object EdtCEP: TEdit
            Left = 461
            Top = 17
            Width = 55
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 4
            OnKeyPress = EdtCEPKeyPress
          end
          object EdtCidade: TEdit
            Left = 60
            Top = 106
            Width = 196
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = False
            TabOrder = 14
            OnExit = EdtCidadeExit
            OnKeyPress = EdtCidadeKeyPress
            OnKeyUp = EdtCidadeKeyUp
          end
          object EdtUF: TEdit
            Left = 255
            Top = 106
            Width = 48
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 15
          end
          object EdtReferencia: TEdit
            Left = 515
            Top = 17
            Width = 166
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 5
          end
          object EdtCodigo_Endereco: TEdit
            Left = 0
            Top = 17
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
            OnKeyDown = EdtCodigo_EnderecoKeyDown
            OnKeyPress = EdtCodigo_EnderecoKeyPress
          end
          object EdtCodigo_Cidade: TEdit
            Left = 0
            Top = 106
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
            TabOrder = 13
            OnKeyDown = EdtCodigo_CidadeKeyDown
            OnKeyPress = EdtCodigo_CidadeKeyPress
          end
          object EdtEmail: TEdit
            Left = 243
            Top = 61
            Width = 166
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 9
          end
          object EdtProfissao: TEdit
            Left = 302
            Top = 106
            Width = 192
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = False
            TabOrder = 16
          end
          object CmbEstado_Civil: TComboBox
            Left = 568
            Top = 106
            Width = 142
            Height = 21
            BevelInner = bvNone
            BevelKind = bkFlat
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 18
            Items.Strings = (
              'SOLTEIRO (A)'
              'CASADO (A)'
              'NOIVO (A)'
              'DIVORCIADO (A)'
              'VI'#218'VO (A)'
              'OUTROS (A)')
          end
          object MEdtData_Nascimento: TMaskEdit
            Left = 493
            Top = 106
            Width = 76
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 17
            Text = '  /  /    '
            OnExit = MEdtData_NascimentoExit
          end
          object MEdtTelefone: TMaskEdit
            Left = 0
            Top = 148
            Width = 80
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!\(99\)9999-9999;1;_'
            MaxLength = 13
            TabOrder = 19
            Text = '(  )    -    '
          end
          object MEdtCelular: TMaskEdit
            Left = 79
            Top = 148
            Width = 80
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!\(99\)9999-9999;1;_'
            MaxLength = 13
            TabOrder = 20
            Text = '(  )    -    '
          end
          object EdtContato: TEdit
            Left = 158
            Top = 148
            Width = 223
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 21
          end
          object MEdtTelefone_Contato: TMaskEdit
            Left = 380
            Top = 148
            Width = 74
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!\(99\)9999-9999;1;_'
            MaxLength = 13
            TabOrder = 22
            Text = '(  )    -    '
          end
          object EdtSite: TEdit
            Left = 408
            Top = 61
            Width = 145
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 10
          end
          object EdtComplemento: TEdit
            Left = 680
            Top = 17
            Width = 125
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 6
          end
          object EdtSetor: TEdit
            Left = 60
            Top = 61
            Width = 184
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = False
            TabOrder = 8
            OnExit = EdtSetorExit
            OnKeyPress = EdtSetorKeyPress
            OnKeyUp = EdtSetorKeyUp
          end
          object EdtCodigo_Setor: TEdit
            Left = 0
            Top = 61
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
            TabOrder = 7
            OnKeyDown = EdtCodigo_SetorKeyDown
            OnKeyPress = EdtCodigo_SetorKeyPress
          end
          object EdtCodigo_Grupo: TEdit
            Left = 552
            Top = 61
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
            TabOrder = 11
            Visible = False
            OnKeyPress = EdtCodigo_GrupoKeyPress
          end
          object EdtGrupo: TEdit
            Left = 612
            Top = 61
            Width = 184
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            ParentShowHint = False
            ShowHint = False
            TabOrder = 12
            Visible = False
            OnKeyPress = EdtSetorKeyPress
          end
        end
      end
      object RGTipo: TRadioGroup
        Left = 161
        Top = 0
        Width = 99
        Height = 58
        Caption = 'Tipo'
        ItemIndex = 0
        Items.Strings = (
          'Cliente'
          'Fornecedor'
          'Funcion'#225'rio')
        TabOrder = 2
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 396
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
      'select * from cadastro_cliente_dependente')
    Left = 766
    Top = 352
    object ADOQuery1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ADOQuery1Nome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object ADOQuery1CPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object ADOQuery1RG: TStringField
      FieldName = 'RG'
      Size = 10
    end
    object ADOQuery1Data_Nascimento: TDateTimeField
      FieldName = 'Data_Nascimento'
    end
    object ADOQuery1Sexo: TStringField
      FieldName = 'Sexo'
      Size = 10
    end
    object ADOQuery1Grau_Parentesco: TStringField
      FieldName = 'Grau_Parentesco'
      Size = 50
    end
    object ADOQuery1Codigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 684
    Top = 352
  end
end
