object FrmConsulta_Extrato_Bancario: TFrmConsulta_Extrato_Bancario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Extrato Banc'#225'rio'
  ClientHeight = 483
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
  Visible = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 110
    Top = 18
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
  object Label5: TLabel
    Left = 499
    Top = 20
    Width = 56
    Height = 13
    Caption = 'Data Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblData_Cadastro: TLabel
    Left = 427
    Top = 20
    Width = 64
    Height = 13
    Caption = 'Data Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 110
    Top = 58
    Width = 834
    Height = 423
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'N_Documento'
        Title.Caption = 'Documento'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Valor'
        Width = 88
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Saldo_Anterior'
        Title.Caption = 'Saldo Anterior'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Saldo_Atual'
        Title.Caption = 'Saldo Atual'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Empresa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Conta_Corrente'
        Title.Caption = 'Conta'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Operacao'
        Title.Caption = 'Opera'#231#227'o'
        Width = 103
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
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Hist'#243'rico'
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Operacao'
        Title.Caption = 'Tipo'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Conta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Cheque'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Operacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Plano'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Status'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Conta_Transferencia'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Saldo_Anterior_Transferencia'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Saldo_Atual_Transferencia'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Numero_Cheque'
        Title.Caption = 'N'#186' Cheque'
        Visible = True
      end>
  end
  object EdtConsulta: TEdit
    Left = 159
    Top = 35
    Width = 269
    Height = 17
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    OnKeyDown = EdtConsultaKeyDown
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 102
    Height = 483
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 98
    Caption = 'ToolBar1'
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
    HotTrackColor = clMenu
    Images = DM.ImgImagens_Consulta
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 5
    ExplicitHeight = 536
    object BBtnFiltrar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para pesquisar'
      Caption = '&Pesquisar'
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnFiltrarClick
    end
    object BBtnLimpar: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para limpar a pesquisa realizada e iniciar outra'
      Caption = 'Li&mpar'
      Enabled = False
      ImageIndex = 2
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnLimparClick
    end
    object BBtnImprimir: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para imprimir a pesquisa realizada'
      Caption = 'Imp&rimir'
      Enabled = False
      ImageIndex = 3
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnImprimirClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Hint = 'Clique para fechar a janela'
      Caption = '&Fechar'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object EdtCodigo_Conta: TEdit
    Left = 110
    Top = 35
    Width = 50
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clBtnFace
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyDown = EdtCodigo_ContaKeyDown
    OnKeyPress = EdtCodigo_ContaKeyPress
  end
  object MEdtData_Final: TMaskEdit
    Left = 499
    Top = 35
    Width = 71
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 3
    Text = '  /  /    '
    OnEnter = MEdtData_FinalEnter
    OnExit = MEdtData_FinalExit
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 427
    Top = 35
    Width = 73
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '  /  /    '
    OnEnter = MEdtData_InicialEnter
    OnExit = MEdtData_InicialExit
  end
  object qryconsulta_saldo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select LB.*, CCC.Conta_Corrente, O.Operacao, O.Tipo as Tipo_Oper' +
        'acao, CC.Numero_Cheque '
      'from Lancamento_Banco LB'
      
        'left join Cadastro_Conta_Corrente CCC on (LB.Codigo_Conta = CCC.' +
        'Codigo_Conta_Corrente)'
      'left join Operacao_Bancaria O on (LB.Codigo_Operacao = O.Codigo)'
      
        'left join Cadastro_Cheque CC on (LB.Codigo_Cheque = CC.Codigo_Ch' +
        'eque)')
    Left = 460
    Top = 272
    object qryconsulta_saldoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryconsulta_saldoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryconsulta_saldoN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryconsulta_saldoData_Lancamento: TDateTimeField
      FieldName = 'Data_Lancamento'
    end
    object qryconsulta_saldoCodigo_Conta: TIntegerField
      FieldName = 'Codigo_Conta'
    end
    object qryconsulta_saldoCodigo_Cheque: TIntegerField
      FieldName = 'Codigo_Cheque'
    end
    object qryconsulta_saldoCodigo_Operacao: TIntegerField
      FieldName = 'Codigo_Operacao'
    end
    object qryconsulta_saldoCodigo_Plano: TIntegerField
      FieldName = 'Codigo_Plano'
    end
    object qryconsulta_saldoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryconsulta_saldoValor: TFloatField
      FieldName = 'Valor'
      currency = True
    end
    object qryconsulta_saldoStatus: TStringField
      FieldName = 'Status'
      Size = 30
    end
    object qryconsulta_saldoSaldo_Anterior: TFloatField
      FieldName = 'Saldo_Anterior'
      currency = True
    end
    object qryconsulta_saldoSaldo_Atual: TFloatField
      FieldName = 'Saldo_Atual'
      currency = True
    end
    object qryconsulta_saldoCodigo_Conta_Transferencia: TIntegerField
      FieldName = 'Codigo_Conta_Transferencia'
    end
    object qryconsulta_saldoSaldo_Anterior_Transferencia: TFloatField
      FieldName = 'Saldo_Anterior_Transferencia'
    end
    object qryconsulta_saldoSaldo_Atual_Transferencia: TFloatField
      FieldName = 'Saldo_Atual_Transferencia'
    end
    object qryconsulta_saldoConta_Corrente: TStringField
      FieldName = 'Conta_Corrente'
    end
    object qryconsulta_saldoOperacao: TStringField
      FieldName = 'Operacao'
      Size = 30
    end
    object qryconsulta_saldoTipo_Operacao: TStringField
      FieldName = 'Tipo_Operacao'
      Size = 7
    end
    object qryconsulta_saldoNumero_Cheque: TStringField
      FieldName = 'Numero_Cheque'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_saldo
    Left = 492
    Top = 272
  end
end
