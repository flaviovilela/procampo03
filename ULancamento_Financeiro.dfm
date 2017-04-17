object FrmLancamento_Financeiro: TFrmLancamento_Financeiro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amentos Financeiros'
  ClientHeight = 388
  ClientWidth = 774
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
    Width = 649
    Height = 388
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
      object Label2: TLabel
        Left = 167
        Top = 17
        Width = 52
        Height = 13
        Caption = 'Cond. PG.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblMarca: TLabel
        Left = 55
        Top = 17
        Width = 65
        Height = 13
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 0
        Top = 57
        Width = 73
        Height = 13
        Caption = 'Cliente/Forn.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 280
        Top = 57
        Width = 51
        Height = 13
        Caption = 'Tipo Doc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 0
        Top = 98
        Width = 50
        Height = 13
        Caption = 'Hist'#243'rico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 280
        Top = 96
        Width = 42
        Height = 13
        Caption = 'Depart.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 0
        Top = 138
        Width = 67
        Height = 13
        Caption = 'Plano Finan.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 90
        Top = 183
        Width = 67
        Height = 13
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblValor_Total: TLabel
        Left = 493
        Top = 183
        Width = 79
        Height = 13
        Caption = 'Valor Cobrado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 0
        Top = 183
        Width = 70
        Height = 13
        Caption = 'Lan'#231'amento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 185
        Top = 183
        Width = 97
        Height = 13
        Caption = 'Valor Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 288
        Top = 200
        Width = 4
        Height = 13
        Caption = '-'
      end
      object Label11: TLabel
        Left = 298
        Top = 183
        Width = 66
        Height = 13
        Caption = 'Desc./Abat.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 383
        Top = 200
        Width = 8
        Height = 13
        Caption = '+'
      end
      object Label13: TLabel
        Left = 394
        Top = 183
        Width = 32
        Height = 13
        Caption = 'Multa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 480
        Top = 200
        Width = 8
        Height = 13
        Caption = '='
      end
      object LblObservacoes: TLabel
        Left = 0
        Top = 222
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
      object Label15: TLabel
        Left = 280
        Top = 138
        Width = 30
        Height = 13
        Caption = 'Safra'
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
      object EdtCondicao_Pagamento: TEdit
        Left = 227
        Top = 32
        Width = 219
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        OnKeyPress = EdtCondicao_PagamentoKeyPress
      end
      object EdtCodigo_Condicao_Pagamento: TEdit
        Left = 167
        Top = 32
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
        TabOrder = 2
        OnKeyDown = EdtCodigo_Condicao_PagamentoKeyDown
        OnKeyPress = EdtCodigo_Condicao_PagamentoKeyPress
      end
      object EdtDocumento: TEdit
        Left = 55
        Top = 32
        Width = 113
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object CBReplicar: TCheckBox
        Left = 451
        Top = 0
        Width = 189
        Height = 17
        Caption = 'Incrementar N'#250'mero de Documento'
        Checked = True
        State = cbChecked
        TabOrder = 24
      end
      object RGTipo: TRadioGroup
        Left = 452
        Top = 18
        Width = 107
        Height = 54
        Caption = 'Tipo de Opera'#231#227'o'
        ItemIndex = 1
        Items.Strings = (
          'Receber'
          'Pagar')
        TabOrder = 4
      end
      object EdtCli_Forn: TEdit
        Left = 60
        Top = 74
        Width = 221
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
        OnKeyPress = EdtCli_FornKeyPress
      end
      object EdtCodigo_Cli_Forn: TEdit
        Left = 0
        Top = 74
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
        TabOrder = 6
        OnKeyDown = EdtCodigo_Cli_FornKeyDown
        OnKeyPress = EdtCodigo_Cli_FornKeyPress
      end
      object EdtTipo_Documento: TEdit
        Left = 340
        Top = 74
        Width = 221
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 9
        OnKeyPress = EdtTipo_DocumentoKeyPress
      end
      object EdtCodigo_Tipo_Documento: TEdit
        Left = 280
        Top = 74
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
        TabOrder = 8
        OnKeyDown = EdtCodigo_Tipo_DocumentoKeyDown
        OnKeyPress = EdtCodigo_Tipo_DocumentoKeyPress
      end
      object EdtHistorico: TEdit
        Left = 0
        Top = 113
        Width = 281
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 10
      end
      object EdtDepartamento: TEdit
        Left = 340
        Top = 113
        Width = 221
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 12
        OnKeyPress = EdtDepartamentoKeyPress
      end
      object EdtCodigo_Departamento: TEdit
        Left = 280
        Top = 113
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
        OnKeyDown = EdtCodigo_DepartamentoKeyDown
        OnKeyPress = EdtCodigo_DepartamentoKeyPress
      end
      object EdtPlano: TEdit
        Left = 60
        Top = 155
        Width = 221
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 14
        OnKeyPress = EdtPlanoKeyPress
      end
      object EdtCodigo_Plano: TEdit
        Left = 0
        Top = 155
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
        OnKeyDown = EdtCodigo_PlanoKeyDown
        OnKeyPress = EdtCodigo_PlanoKeyPress
      end
      object MEdtData_Vencimento: TMaskEdit
        Left = 90
        Top = 198
        Width = 78
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 18
        Text = '  /  /    '
        OnEnter = MEdtData_VencimentoEnter
        OnExit = MEdtData_VencimentoExit
      end
      object EdtValor_Cobrado: TEdit
        Left = 493
        Top = 198
        Width = 106
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 22
        Text = '0,00'
        OnEnter = EdtValor_CobradoEnter
        OnExit = EdtValor_CobradoExit
        OnKeyPress = EdtValor_CobradoKeyPress
      end
      object MEdtData_Lancamento: TMaskEdit
        Left = 0
        Top = 198
        Width = 80
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 17
        Text = '  /  /    '
        OnEnter = MEdtData_LancamentoEnter
        OnExit = MEdtData_LancamentoExit
      end
      object EdtValor_Documento: TEdit
        Left = 185
        Top = 198
        Width = 97
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 19
        Text = '0,00'
        OnExit = EdtValor_DocumentoExit
        OnKeyPress = EdtValor_DocumentoKeyPress
      end
      object EdtDesconto: TEdit
        Left = 298
        Top = 198
        Width = 81
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 20
        Text = '0,00'
        OnExit = EdtDescontoExit
        OnKeyPress = EdtDescontoKeyPress
      end
      object EdtMulta: TEdit
        Left = 394
        Top = 198
        Width = 80
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 21
        Text = '0,00'
        OnExit = EdtMultaExit
        OnKeyPress = EdtMultaKeyPress
      end
      object MmoObservacoes: TMemo
        Left = 0
        Top = 237
        Width = 204
        Height = 113
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 800
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 23
        OnKeyPress = MmoObservacoesKeyPress
      end
      object EdtSafra: TEdit
        Left = 340
        Top = 155
        Width = 221
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 16
        OnKeyPress = EdtDepartamentoKeyPress
      end
      object EdtCodigo_Safra: TEdit
        Left = 280
        Top = 155
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
        TabOrder = 15
        OnKeyDown = EdtCodigo_SafraKeyDown
        OnKeyPress = EdtCodigo_DepartamentoKeyPress
      end
      object RGFiscal: TRadioGroup
        Left = 565
        Top = 18
        Width = 72
        Height = 54
        Caption = 'Fiscal'
        ItemIndex = 1
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 5
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 388
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
  object DBGrid1: TDBGrid
    Left = 343
    Top = 264
    Width = 423
    Height = 113
    BorderStyle = bsNone
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Documento'
        Title.Caption = 'N'#186' Documento'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Vencimento'
        Title.Caption = 'Vencimento'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Parcela'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Pagamento'
        Title.Caption = 'Pagamento'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Visible = False
      end>
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 40
    Top = 208
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 40
    Top = 288
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select PL.* from Parcelas_Lancamentos PL')
    Left = 40
    Top = 248
    object ADOQuery1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ADOQuery1N_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object ADOQuery1Data_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
      EditMask = '!99/99/9999;1;_'
    end
    object ADOQuery1Data_Pagamento: TDateTimeField
      FieldName = 'Data_Pagamento'
    end
    object ADOQuery1Parcela: TIntegerField
      FieldName = 'Parcela'
    end
    object ADOQuery1Status: TStringField
      FieldName = 'Status'
      Size = 8
    end
    object ADOQuery1Valor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
  end
end
