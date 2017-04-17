object FrmCadastro_Produto: TFrmCadastro_Produto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produto'
  ClientHeight = 445
  ClientWidth = 913
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
    Width = 785
    Height = 445
    ActivePage = TabSheet1
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
      object Label2: TLabel
        Left = 256
        Top = 57
        Width = 34
        Height = 13
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 7
        Top = 343
        Width = 76
        Height = 13
        Caption = 'Valor Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 93
        Top = 343
        Width = 69
        Height = 13
        Caption = 'Custo M'#233'dio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 179
        Top = 343
        Width = 45
        Height = 13
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 149
        Top = 16
        Width = 66
        Height = 13
        Caption = #218'lt. Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 227
        Top = 16
        Width = 57
        Height = 13
        Caption = #218'lt. Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 265
        Top = 343
        Width = 79
        Height = 13
        Caption = 'Saldo Estoque'
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
        TabOrder = 4
      end
      object EdtGrupo: TEdit
        Left = 316
        Top = 72
        Width = 249
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 6
        OnKeyPress = EdtGrupoKeyPress
      end
      object EdtCodigo_Grupo: TEdit
        Left = 256
        Top = 72
        Width = 60
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clCream
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnKeyDown = EdtCodigo_GrupoKeyDown
        OnKeyPress = EdtCodigo_GrupoKeyPress
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 95
        Width = 345
        Height = 234
        Caption = 'Valores'
        TabOrder = 10
        object Label1: TLabel
          Left = 15
          Top = 43
          Width = 68
          Height = 13
          Caption = 'Mini..............:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 15
          Top = 75
          Width = 67
          Height = 13
          Caption = 'Pequena.....:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 15
          Top = 141
          Width = 68
          Height = 13
          Caption = 'Grande........:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 15
          Top = 109
          Width = 67
          Height = 13
          Caption = 'M'#233'dia..........:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 15
          Top = 174
          Width = 68
          Height = 13
          Caption = 'Gigante.......:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 15
          Top = 207
          Width = 70
          Height = 13
          Caption = 'Fam'#237'lia.........:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblNumero: TLabel
          Left = 89
          Top = 19
          Width = 29
          Height = 13
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 225
          Top = 19
          Width = 87
          Height = 13
          Caption = 'Borda Adicional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape1: TShape
          Left = 195
          Top = 22
          Width = 2
          Height = 205
        end
        object EdtValor_Mini: TEdit
          Left = 89
          Top = 40
          Width = 77
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 0
          Text = '0,00'
          OnExit = EdtValor_MiniExit
          OnKeyPress = EdtValor_MiniKeyPress
        end
        object EdtValor_Pequena: TEdit
          Left = 89
          Top = 72
          Width = 77
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 1
          Text = '0,00'
          OnExit = EdtValor_PequenaExit
          OnKeyPress = EdtValor_PequenaKeyPress
        end
        object EdtValor_Media: TEdit
          Left = 89
          Top = 106
          Width = 77
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 2
          Text = '0,00'
          OnExit = EdtValor_MediaExit
          OnKeyPress = EdtValor_MediaKeyPress
        end
        object EdtValor_Grande: TEdit
          Left = 89
          Top = 138
          Width = 77
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 3
          Text = '0,00'
          OnExit = EdtValor_GrandeExit
          OnKeyPress = EdtValor_GrandeKeyPress
        end
        object EdtValor_Gigante: TEdit
          Left = 89
          Top = 171
          Width = 77
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 4
          Text = '0,00'
          OnExit = EdtValor_GiganteExit
          OnKeyPress = EdtValor_GiganteKeyPress
        end
        object EdtValor_Familia: TEdit
          Left = 89
          Top = 204
          Width = 77
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 5
          Text = '0,00'
          OnExit = EdtValor_FamiliaExit
          OnKeyPress = EdtValor_FamiliaKeyPress
        end
        object EdtBorda_Mini: TEdit
          Left = 225
          Top = 40
          Width = 77
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 6
          Text = '0,00'
          OnExit = EdtBorda_MiniExit
          OnKeyPress = EdtBorda_MiniKeyPress
        end
        object EdtBorda_Pequena: TEdit
          Left = 225
          Top = 72
          Width = 77
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 7
          Text = '0,00'
          OnExit = EdtBorda_PequenaExit
          OnKeyPress = EdtBorda_PequenaKeyPress
        end
        object EdtBorda_Media: TEdit
          Left = 225
          Top = 106
          Width = 77
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 8
          Text = '0,00'
          OnExit = EdtBorda_MediaExit
          OnKeyPress = EdtBorda_MediaKeyPress
        end
        object EdtBorda_Grande: TEdit
          Left = 225
          Top = 138
          Width = 77
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 9
          Text = '0,00'
          OnExit = EdtBorda_GrandeExit
          OnKeyPress = EdtBorda_GrandeKeyPress
        end
        object EdtBorda_Gigante: TEdit
          Left = 225
          Top = 171
          Width = 77
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 10
          Text = '0,00'
          OnExit = EdtBorda_GiganteExit
          OnKeyPress = EdtBorda_GiganteKeyPress
        end
        object EdtBorda_Familia: TEdit
          Left = 225
          Top = 204
          Width = 77
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 11
          Text = '0,00'
          OnExit = EdtBorda_FamiliaExit
          OnKeyPress = EdtBorda_FamiliaKeyPress
        end
      end
      object GroupBox2: TGroupBox
        Left = 354
        Top = 95
        Width = 407
        Height = 316
        Caption = 'Ingredientes'
        TabOrder = 11
        object DBGrid1: TDBGrid
          Left = 16
          Top = 32
          Width = 377
          Height = 273
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid1DrawColumnCell
          OnKeyDown = DBGrid1KeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo_Produto'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Codigo_Ingrediente'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Ingrediente'
              Width = 243
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Permissao'
              Title.Caption = 'Uso'
              Width = 60
              Visible = True
            end>
        end
      end
      object CBCozinha: TCheckBox
        Left = 576
        Top = 52
        Width = 97
        Height = 17
        Caption = 'Cozinha'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object CBFracionado: TCheckBox
        Left = 576
        Top = 72
        Width = 97
        Height = 17
        Caption = 'Fracionado'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object EdtValor_Compra: TEdit
        Left = 7
        Top = 360
        Width = 82
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 12
        Text = '0,00'
        OnExit = EdtValor_CompraExit
        OnKeyPress = EdtValor_CompraKeyPress
      end
      object EdtCusto_Medio: TEdit
        Left = 93
        Top = 360
        Width = 82
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 13
        Text = '0,00'
        OnExit = EdtCusto_MedioExit
        OnKeyPress = EdtCusto_MedioKeyPress
      end
      object EdtEstoque: TEdit
        Left = 179
        Top = 360
        Width = 82
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 14
        Text = '0,00'
        OnExit = EdtEstoqueExit
        OnKeyPress = EdtEstoqueKeyPress
      end
      object CBAtivo: TCheckBox
        Left = 576
        Top = 31
        Width = 97
        Height = 17
        Caption = 'Ativo'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object MEdtData_Ultima_Compra: TMaskEdit
        Left = 149
        Top = 32
        Width = 79
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
        OnEnter = MEdtData_CadastroEnter
        OnExit = MEdtData_CadastroExit
      end
      object MEdtData_Ultima_Venda: TMaskEdit
        Left = 227
        Top = 32
        Width = 79
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
        OnEnter = MEdtData_CadastroEnter
        OnExit = MEdtData_CadastroExit
      end
      object EdtSaldo_Estoque: TEdit
        Left = 265
        Top = 360
        Width = 82
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 15
        Text = '0,00'
        OnEnter = EdtSaldo_EstoqueEnter
        OnExit = EdtSaldo_EstoqueExit
        OnKeyPress = EdtSaldo_EstoqueKeyPress
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 445
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
      
        'select IP.*, CI.Descricao as Ingrediente from Ingrediente_Produt' +
        'o IP'
      
        'left join Cadastro_Ingrediente CI on (IP.Codigo_Ingrediente = CI' +
        '.Codigo)')
    Left = 656
    Top = 224
    object ADOQuery1Codigo: TAutoIncField
      FieldName = 'Codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ADOQuery1Codigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object ADOQuery1Codigo_Ingrediente: TIntegerField
      FieldName = 'Codigo_Ingrediente'
    end
    object ADOQuery1Permissao: TStringField
      FieldName = 'Permissao'
      Size = 3
    end
    object ADOQuery1Ingrediente: TStringField
      FieldName = 'Ingrediente'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 696
    Top = 224
  end
end
