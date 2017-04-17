object FrmBaixar_Titulo: TFrmBaixar_Titulo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Baixar T'#237'tulos a Pagar/Receber'
  ClientHeight = 341
  ClientWidth = 637
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object LblValor: TLabel
    Left = 281
    Top = 39
    Width = 74
    Height = 13
    Caption = 'Valor Parcela'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblN_Nota_Fiscal: TLabel
    Left = 142
    Top = 38
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
  object LblData_Vencimento: TLabel
    Left = 378
    Top = 38
    Width = 60
    Height = 13
    Caption = 'Data Venc.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblParcela: TLabel
    Left = 222
    Top = 39
    Width = 42
    Height = 13
    Caption = 'Parcela'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblData_Pagamento: TLabel
    Left = 442
    Top = 38
    Width = 54
    Height = 13
    Caption = 'Data Pag.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 374
    Top = 82
    Width = 96
    Height = 13
    Caption = 'Juros/Acrecimos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 395
    Top = 129
    Width = 75
    Height = 13
    Caption = 'Valor a Pagar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 176
    Top = 82
    Width = 47
    Height = 13
    Caption = 'Dinheiro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 140
    Top = 106
    Width = 83
    Height = 13
    Caption = 'Cheque a Vista'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 185
    Top = 152
    Width = 38
    Height = 13
    Caption = 'Cart'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 136
    Top = 128
    Width = 87
    Height = 13
    Caption = 'Cheque a Prazo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 411
    Top = 106
    Width = 59
    Height = 13
    Caption = 'Descontos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label47: TLabel
    Left = 142
    Top = 171
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
  object Label8: TLabel
    Left = 140
    Top = 270
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
  object Label10: TLabel
    Left = 261
    Top = 270
    Width = 42
    Height = 13
    Caption = 'Cheque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 140
    Top = 308
    Width = 54
    Height = 13
    Caption = 'Opera'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 259
    Top = 172
    Width = 21
    Height = 13
    Caption = '253'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label12: TLabel
    Left = 402
    Top = 305
    Width = 64
    Height = 13
    Caption = 'Saldo Atual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 490
    Top = 305
    Width = 62
    Height = 13
    Caption = 'Novo Saldo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 361
    Top = 190
    Width = 75
    Height = 13
    Caption = 'Lan. Banc'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 571
    Top = 190
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
  object EdtValor_Parcela: TEdit
    Left = 281
    Top = 54
    Width = 98
    Height = 17
    TabStop = False
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    ReadOnly = True
    TabOrder = 3
    OnExit = EdtValor_ParcelaExit
  end
  object EdtN_Documento: TEdit
    Left = 142
    Top = 54
    Width = 81
    Height = 17
    TabStop = False
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    ReadOnly = True
    TabOrder = 1
  end
  object MEdtData_Vencimento: TMaskEdit
    Left = 378
    Top = 54
    Width = 65
    Height = 17
    TabStop = False
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    ReadOnly = True
    TabOrder = 4
    Text = '  /  /    '
  end
  object EdtParcela: TEdit
    Left = 222
    Top = 54
    Width = 60
    Height = 17
    TabStop = False
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    ReadOnly = True
    TabOrder = 2
  end
  object MEdtData_Pagamento: TMaskEdit
    Left = 442
    Top = 54
    Width = 69
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 5
    Text = '  /  /    '
    OnEnter = MEdtData_PagamentoEnter
  end
  object EdtJuros: TEdit
    Left = 478
    Top = 80
    Width = 113
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
    TabOrder = 10
    Text = '0,00'
    OnExit = EdtJurosExit
    OnKeyPress = EdtJurosKeyPress
  end
  object EdtValor_Pagar: TEdit
    Left = 478
    Top = 126
    Width = 113
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
    TabOrder = 12
    Text = '0,00'
    OnEnter = EdtValor_PagarEnter
    OnExit = EdtValor_PagarExit
    OnKeyPress = EdtValor_PagarKeyPress
  end
  object EdtDinheiro: TEdit
    Left = 229
    Top = 80
    Width = 123
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 6
    Text = '0,00'
    OnExit = EdtDinheiroExit
    OnKeyPress = EdtDinheiroKeyPress
  end
  object EdtCheque_a_Vista: TEdit
    Left = 229
    Top = 103
    Width = 123
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 7
    Text = '0,00'
    OnExit = EdtCheque_a_VistaExit
    OnKeyPress = EdtCheque_a_VistaKeyPress
  end
  object EdtCartao: TEdit
    Left = 229
    Top = 149
    Width = 123
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 9
    Text = '0,00'
    OnExit = EdtCartaoExit
    OnKeyPress = EdtCartaoKeyPress
  end
  object EdtCheque_a_Prazo: TEdit
    Left = 229
    Top = 126
    Width = 123
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 8
    Text = '0,00'
    OnExit = EdtCheque_a_PrazoExit
    OnKeyPress = EdtCheque_a_PrazoKeyPress
  end
  object EdtDesconto: TEdit
    Left = 478
    Top = 103
    Width = 113
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
    TabOrder = 11
    Text = '0,00'
    OnExit = EdtDescontoExit
    OnKeyPress = EdtDescontoKeyPress
  end
  object MmoObservacoes: TMemo
    Left = 142
    Top = 188
    Width = 213
    Height = 34
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    ScrollBars = ssVertical
    TabOrder = 13
    OnKeyPress = MmoObservacoesKeyPress
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 341
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
    TabOrder = 27
    object BBtnSalvar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para Salvar o registro'
      Caption = '&Salvar'
      ImageIndex = 0
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnSalvarClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para Fechar a Janela Ativa'
      Caption = '&Fechar Janela'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object EdtOperacao_Bancaria: TEdit
    Left = 192
    Top = 322
    Width = 122
    Height = 17
    TabStop = False
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 23
    OnKeyPress = EdtOperacao_BancariaKeyPress
  end
  object EdtTipo_Operacao: TEdit
    Left = 314
    Top = 322
    Width = 89
    Height = 17
    TabStop = False
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    TabOrder = 24
    OnKeyPress = EdtTipo_OperacaoKeyPress
  end
  object EdtConta: TEdit
    Left = 192
    Top = 285
    Width = 70
    Height = 17
    TabStop = False
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 19
  end
  object RGStatus: TRadioGroup
    Left = 140
    Top = 225
    Width = 175
    Height = 47
    Caption = 'Status'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Bloqueado'
      'Liberado')
    TabOrder = 17
  end
  object EdtCheque: TEdit
    Left = 314
    Top = 285
    Width = 125
    Height = 17
    TabStop = False
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
  end
  object EdtCodigo_Conta: TEdit
    Left = 140
    Top = 285
    Width = 53
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
    TabOrder = 18
    OnKeyDown = EdtCodigo_ContaKeyDown
    OnKeyPress = EdtCodigo_ContaKeyPress
  end
  object EdtCodigo_Cheque: TEdit
    Left = 261
    Top = 285
    Width = 53
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
    TabOrder = 20
    OnKeyDown = EdtCodigo_ChequeKeyDown
    OnKeyPress = EdtCodigo_ChequeKeyPress
  end
  object EdtCodigo_Operacao: TEdit
    Left = 140
    Top = 322
    Width = 53
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
    TabOrder = 22
    OnKeyDown = EdtCodigo_OperacaoKeyDown
    OnKeyPress = EdtCodigo_OperacaoKeyPress
  end
  object CBBanco: TCheckBox
    Left = 142
    Top = 8
    Width = 97
    Height = 17
    Caption = 'Banco'
    Checked = True
    State = cbChecked
    TabOrder = 0
    OnClick = CBBancoClick
  end
  object EdtSaldo_Atual: TEdit
    Left = 402
    Top = 322
    Width = 89
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
    TabOrder = 25
    Text = '0,00'
    OnExit = EdtSaldo_AtualExit
    OnKeyPress = EdtSaldo_AtualKeyPress
  end
  object EdtNovo_Saldo: TEdit
    Left = 490
    Top = 322
    Width = 89
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
    TabOrder = 26
    Text = '0,00'
    OnEnter = EdtNovo_SaldoEnter
    OnExit = EdtNovo_SaldoExit
    OnKeyPress = EdtNovo_SaldoKeyPress
  end
  object EdtLancamento_Bancario: TEdit
    Left = 421
    Top = 205
    Width = 151
    Height = 17
    Hint = 
      'Por exemplo: a conta que est'#225' sendo baixada foi paga em dinheiro' +
      ' proveniente de um saque.'#13#10'Deve-se escolher qual o lan'#231'amento ba' +
      'nc'#225'rio que foi efetuado para pagar essa conta.'
    TabStop = False
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 15
    OnKeyPress = EdtLancamento_BancarioKeyPress
  end
  object EdtCodigo_Lancamento_Bancario: TEdit
    Left = 361
    Top = 205
    Width = 60
    Height = 17
    Hint = 
      'Pressione F3 para consultar'#13#10#13#10'Por exemplo: a conta que est'#225' sen' +
      'do baixada foi paga em dinheiro proveniente de um saque.'#13#10'Deve-s' +
      'e escolher qual o lan'#231'amento banc'#225'rio que foi efetuado para paga' +
      'r essa conta.'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clBtnFace
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnKeyDown = EdtCodigo_Lancamento_BancarioKeyDown
    OnKeyPress = EdtCodigo_Lancamento_BancarioKeyPress
  end
  object EdtValor_Operacao_Bancaria: TEdit
    Left = 571
    Top = 205
    Width = 61
    Height = 17
    Hint = 
      'Por exemplo: a conta que est'#225' sendo baixada foi paga em dinheiro' +
      ' proveniente de um saque.'#13#10'Deve-se escolher qual o lan'#231'amento ba' +
      'nc'#225'rio que foi efetuado para pagar essa conta.'
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 16
    Text = '0,00'
    OnEnter = EdtNovo_SaldoEnter
    OnExit = EdtNovo_SaldoExit
    OnKeyPress = EdtNovo_SaldoKeyPress
  end
  object SPAtualiza_Status_Conta: TADOStoredProc
    Connection = DM.ADOConnection1
    ProcedureName = 'Atualiza_Status_Contas;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Codigo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Parcela'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Status'
        Attributes = [paNullable]
        DataType = ftString
        Size = 8
        Value = Null
      end
      item
        Name = '@Data_Pagamento'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Cheque'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = Null
      end
      item
        Name = '@Conta'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = Null
      end>
    Left = 548
    Top = 16
  end
  object SPAtualiza_Status_Conta_Tudo: TADOStoredProc
    Connection = DM.ADOConnection1
    ProcedureName = 'Atualiza_Status_Contas_Tudo;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Codigo_Cli_For'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Status'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@Data_Pagamento'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 572
    Top = 8
  end
  object SPAtualiza_Saldo_Bancario: TADOStoredProc
    Connection = DM.ADOConnection1
    ProcedureName = 'Atualiza_Saldo_Bancario;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Codigo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Saldo_Atual'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 352
    Top = 8
  end
end
