object FrmCadastro_Cheque: TFrmCadastro_Cheque
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Cheque'
  ClientHeight = 295
  ClientWidth = 713
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
    Width = 588
    Height = 295
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object LblCodigo: TLabel
        Left = 0
        Top = 5
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
      object LblEmitente: TLabel
        Left = 0
        Top = 48
        Width = 51
        Height = 13
        Caption = 'Emitente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblDono: TLabel
        Left = 0
        Top = 89
        Width = 69
        Height = 13
        Caption = 'Recebido de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 283
        Top = 89
        Width = 62
        Height = 13
        Caption = 'Favorecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblN_Cheque: TLabel
        Left = 194
        Top = 218
        Width = 58
        Height = 13
        Caption = 'N'#186' Cheque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblData_Entrada: TLabel
        Left = 0
        Top = 218
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
      object LblData_Vencimento: TLabel
        Left = 65
        Top = 218
        Width = 30
        Height = 13
        Caption = 'Venc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 345
        Top = 1
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
      object LblValor: TLabel
        Left = 274
        Top = 218
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
      object LblData_Saida: TLabel
        Left = 129
        Top = 218
        Width = 61
        Height = 13
        Caption = 'Data Saida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 363
        Top = 218
        Width = 57
        Height = 13
        Caption = 'Juros (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 430
        Top = 218
        Width = 58
        Height = 13
        Caption = 'Valor Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 242
        Top = 172
        Width = 33
        Height = 13
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 0
        Top = 172
        Width = 45
        Height = 13
        Caption = 'Ag'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtEmitente: TEdit
        Left = 0
        Top = 62
        Width = 337
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnKeyDown = EdtEmitenteKeyDown
      end
      object EdtCodigo: TEdit
        Left = 0
        Top = 23
        Width = 67
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 0
      end
      object EdtRecebido_De: TEdit
        Left = 0
        Top = 103
        Width = 284
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnKeyDown = EdtRecebido_DeKeyDown
      end
      object EdtEnviado_A: TEdit
        Left = 283
        Top = 103
        Width = 284
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnKeyDown = EdtEnviado_AKeyDown
      end
      object EdtN_Cheque: TEdit
        Left = 194
        Top = 233
        Width = 81
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 16
      end
      object MEdtData_Cadastro: TMaskEdit
        Left = 0
        Top = 233
        Width = 66
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 13
        Text = '  /  /    '
        OnEnter = MEdtData_CadastroEnter
      end
      object MEdtData_Vencimento: TMaskEdit
        Left = 65
        Top = 233
        Width = 65
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 14
        Text = '  /  /    '
        OnEnter = MEdtData_VencimentoEnter
        OnExit = MEdtData_VencimentoExit
      end
      object EdtValor: TEdit
        Left = 274
        Top = 233
        Width = 90
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 17
        OnExit = EdtValorExit
        OnKeyPress = EdtValorKeyPress
      end
      object MEdtData_Saida: TMaskEdit
        Left = 129
        Top = 233
        Width = 66
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 15
        Text = '  /  /    '
      end
      object MmoObservacoes: TMemo
        Left = 345
        Top = 20
        Width = 233
        Height = 59
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object Panel2: TPanel
        Left = 0
        Top = 136
        Width = 578
        Height = 26
        BorderStyle = bsSingle
        Caption = 'Dados do Cheque'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 20
      end
      object RadioGroup1: TRadioGroup
        Left = 97
        Top = -2
        Width = 104
        Height = 61
        Caption = 'Situa'#231#227'o Cheque'
        ItemIndex = 1
        Items.Strings = (
          'Emitido'
          'Recebido')
        TabOrder = 1
      end
      object EdtJuro: TEdit
        Left = 363
        Top = 233
        Width = 68
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 18
        OnExit = EdtJuroExit
        OnKeyPress = EdtJuroKeyPress
      end
      object EdtValor_Final: TEdit
        Left = 430
        Top = 233
        Width = 90
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 19
        OnEnter = EdtValor_FinalEnter
        OnExit = EdtValor_FinalExit
        OnKeyPress = EdtValor_FinalKeyPress
      end
      object RGStatus: TRadioGroup
        Left = 207
        Top = -2
        Width = 116
        Height = 61
        Caption = 'Status'
        ItemIndex = 0
        Items.Strings = (
          'Lan'#231'ado'
          'Prorrogado'
          'Devolvido')
        TabOrder = 2
      end
      object EdtCodigo_Conta: TEdit
        Left = 242
        Top = 189
        Width = 51
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clMenu
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnKeyDown = EdtCodigo_ContaKeyDown
        OnKeyPress = EdtCodigo_ContaKeyPress
      end
      object EdtConta: TEdit
        Left = 293
        Top = 189
        Width = 75
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 11
        OnKeyPress = EdtContaKeyPress
      end
      object EdtCodigo_Agencia: TEdit
        Left = 0
        Top = 189
        Width = 51
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clMenu
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnKeyDown = EdtCodigo_AgenciaKeyDown
        OnKeyPress = EdtCodigo_ContaKeyPress
      end
      object EdtAgencia: TEdit
        Left = 51
        Top = 189
        Width = 75
        Height = 17
        BevelEdges = [beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 8
        OnKeyPress = EdtAgenciaKeyPress
      end
      object RGTipo: TRadioGroup
        Left = 388
        Top = 162
        Width = 93
        Height = 50
        Caption = 'Tipo Cheque'
        ItemIndex = 1
        Items.Strings = (
          'A Vista'
          'A Prazo')
        TabOrder = 12
      end
      object EdtBanco: TEdit
        Left = 126
        Top = 189
        Width = 117
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 9
        OnKeyPress = EdtBancoKeyPress
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 295
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
    object BBtnProrrogar: TToolButton
      Left = 0
      Top = 38
      Caption = 'Prorr&ogar'
      Enabled = False
      ImageIndex = 9
      Wrap = True
      OnClick = BBtnProrrogarClick
    end
    object BBtnExcluir: TToolButton
      Left = 0
      Top = 76
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
      Top = 114
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
      Top = 152
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
      Top = 190
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
