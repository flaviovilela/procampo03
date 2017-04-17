object FrmCadastro_Plano_Financeiro: TFrmCadastro_Plano_Financeiro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Planos Financeiros'
  ClientHeight = 525
  ClientWidth = 850
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
    Width = 725
    Height = 525
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    ExplicitWidth = 460
    ExplicitHeight = 258
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      ExplicitWidth = 452
      ExplicitHeight = 227
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
      object Label1: TLabel
        Left = 0
        Top = 97
        Width = 48
        Height = 13
        Caption = 'Subn'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 280
        Top = 59
        Width = 99
        Height = 13
        Caption = 'C'#243'digo Sub Grupo'
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
        ParentShowHint = False
        ShowHint = False
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
      end
      object EdtDescricao: TEdit
        Left = 0
        Top = 74
        Width = 281
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 3
      end
      object RGTipo: TRadioGroup
        Left = 160
        Top = 11
        Width = 94
        Height = 51
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = 'Tipo'
        Ctl3D = False
        ItemIndex = 1
        Items.Strings = (
          'Receita'
          'Despesa')
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
      end
      object EdtSubnivel: TEdit
        Left = 49
        Top = 112
        Width = 361
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnKeyPress = EdtSubnivelKeyPress
      end
      object EdtCodigo_SubNivel: TEdit
        Left = 0
        Top = 112
        Width = 49
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clMenu
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnKeyDown = EdtCodigo_SubNivelKeyDown
        OnKeyPress = EdtCodigo_SubNivelKeyPress
      end
      object EdtSub_Grupo: TEdit
        Left = 280
        Top = 74
        Width = 130
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 4
        OnEnter = EdtSub_GrupoEnter
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 135
        Width = 717
        Height = 359
        Hint = 
          'Clique na linha de um determinado registro para verificar suas p' +
          'arcelas'
        DataSource = ds_qry_consulta_padrao
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'N_Documento'
            Title.Caption = 'N'#186' Documento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Caption = 'Cli./Forn.'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Historico'
            Title.Caption = 'Hist'#243'rico'
            Width = 196
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Lancamento'
            Title.Caption = 'Lan'#231'amento'
            Width = 75
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Valor_Cobrado'
            Title.Caption = 'Valor Cobrado'
            Width = 110
            Visible = True
          end>
      end
      object GroupBox1: TGroupBox
        Left = 416
        Top = 0
        Width = 289
        Height = 129
        Caption = 'Transfer'#234'ncia'
        TabOrder = 8
        object Label2: TLabel
          Left = 9
          Top = 17
          Width = 76
          Height = 13
          Caption = 'Plano destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtPlano_Destino: TEdit
          Left = 58
          Top = 33
          Width = 217
          Height = 17
          Hint = 'Pressione F3 para consultar'
          BevelEdges = [beTop, beRight, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnKeyPress = EdtSubnivelKeyPress
        end
        object EdtCodigo_Plano_Destino: TEdit
          Left = 9
          Top = 33
          Width = 49
          Height = 17
          Hint = 'Pressione F3 para consultar'
          BevelEdges = [beLeft, beTop, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = clMenu
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnKeyDown = EdtCodigo_Plano_DestinoKeyDown
          OnKeyPress = EdtCodigo_SubNivelKeyPress
        end
        object RGItens: TRadioGroup
          Left = 9
          Top = 74
          Width = 94
          Height = 51
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Itens'
          Ctl3D = False
          ItemIndex = 1
          Items.Strings = (
            'Tudo'
            'Selecionado')
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
        end
        object Button1: TButton
          Left = 120
          Top = 100
          Width = 75
          Height = 25
          Caption = 'Transferir'
          TabOrder = 3
          OnClick = Button1Click
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
    ExplicitHeight = 258
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
  object qryconsulta_lancamento: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select LF.Codigo, LF.N_Documento, LF.Historico, LF.Data_Lancamen' +
        'to, LF.Valor_Cobrado, Cli.Nome from Lancamento_Financeiro LF'
      
        'left join Cadastro_Cliente Cli on (LF.Codigo_Cli_For = Cli.Codig' +
        'o)')
    Left = 418
    Top = 369
    object qryconsulta_lancamentoN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryconsulta_lancamentoHistorico: TStringField
      FieldName = 'Historico'
      Size = 70
    end
    object qryconsulta_lancamentoData_Lancamento: TDateTimeField
      FieldName = 'Data_Lancamento'
    end
    object qryconsulta_lancamentoValor_Cobrado: TFloatField
      FieldName = 'Valor_Cobrado'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_lancamentoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryconsulta_lancamentoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_lancamento
    Left = 450
    Top = 369
  end
end
