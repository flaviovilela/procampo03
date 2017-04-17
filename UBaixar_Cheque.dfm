object FrmBaixar_Cheque: TFrmBaixar_Cheque
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Baixar Cheque'
  ClientHeight = 201
  ClientWidth = 540
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
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 201
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
    TabOrder = 0
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
  object RGDados: TGroupBox
    Left = 129
    Top = 0
    Width = 408
    Height = 200
    Caption = 'Dados Cheque'
    TabOrder = 1
    object LblNumero_Cheque: TLabel
      Left = 13
      Top = 24
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
    object LblValor: TLabel
      Left = 127
      Top = 24
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
      Left = 284
      Top = 24
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
    object LblData_Entrada: TLabel
      Left = 194
      Top = 24
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
    object Label3: TLabel
      Left = 13
      Top = 62
      Width = 57
      Height = 13
      Caption = 'Enviado a:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 14
      Top = 104
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
    object EdtCodigo_Cheque: TEdit
      Left = 13
      Top = 39
      Width = 44
      Height = 17
      Hint = 'Pressione F3 para consultar'
      BevelEdges = [beLeft, beTop, beBottom]
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = clMenu
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnKeyDown = EdtCodigo_ChequeKeyDown
      OnKeyPress = EdtCodigo_ChequeKeyPress
    end
    object EdtValor: TEdit
      Left = 127
      Top = 39
      Width = 68
      Height = 17
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 2
      OnKeyPress = EdtValorKeyPress
    end
    object MEdtData_Saida: TMaskEdit
      Left = 284
      Top = 39
      Width = 69
      Height = 17
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  /  /    '
      OnEnter = MEdtData_SaidaEnter
    end
    object MEdtData_Entrada: TMaskEdit
      Left = 194
      Top = 39
      Width = 91
      Height = 17
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
    end
    object EdtEnviado_A: TEdit
      Left = 13
      Top = 80
      Width = 380
      Height = 17
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object MmoObservacoes: TMemo
      Left = 13
      Top = 123
      Width = 380
      Height = 63
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ScrollBars = ssVertical
      TabOrder = 6
      OnKeyPress = MmoObservacoesKeyPress
    end
    object EdtCheque: TEdit
      Left = 57
      Top = 39
      Width = 71
      Height = 17
      BevelEdges = [beTop, beRight, beBottom]
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      OnKeyPress = EdtChequeKeyPress
    end
  end
end
