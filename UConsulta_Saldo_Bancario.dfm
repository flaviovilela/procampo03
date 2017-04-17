object FrmConsulta_Saldo_Bancario: TFrmConsulta_Saldo_Bancario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Saldo Banc'#225'rio'
  ClientHeight = 536
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
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 257
    Top = 33
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
  object Label1: TLabel
    Left = 114
    Top = 502
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
  object Label3: TLabel
    Left = 201
    Top = 502
    Width = 59
    Height = 13
    Caption = 'Bloqueado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 288
    Top = 502
    Width = 49
    Height = 13
    Caption = 'Previs'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 114
    Top = 73
    Width = 834
    Height = 423
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Empresa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Data Cadastro'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Numero_Agencia'
        Title.Caption = 'Ag'#234'ncia'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Conta_Corrente'
        Title.Caption = 'Conta'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Banco'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Banco'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Nome_Correntista'
        Title.Caption = 'Correntista'
        Width = 201
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Saldo_Inicial'
        Title.Caption = 'Saldo Inicial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Limite'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Saldo_Atual'
        Title.Caption = 'Saldo Atual'
        Width = 82
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 114
    Top = 0
    Width = 137
    Height = 67
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Conta')
    TabOrder = 6
  end
  object EdtConsulta: TEdit
    Left = 306
    Top = 50
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
    Height = 536
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
    TabOrder = 7
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
    Left = 257
    Top = 50
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
  object EdtSaldo_Atual: TEdit
    Left = 114
    Top = 518
    Width = 81
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    Text = '0,00'
  end
  object EdtSaldo_Bloqueado: TEdit
    Left = 201
    Top = 518
    Width = 81
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
    Text = '0,00'
  end
  object EdtSaldo_Previsto: TEdit
    Left = 288
    Top = 518
    Width = 81
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
    Text = '0,00'
  end
  object qryconsulta_saldo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CC.*, CA.Numero as Numero_Agencia, B.Nome from Cadastro_C' +
        'onta_Corrente CC'
      
        'left join Cadastro_Agencia CA on (CC.Codigo_Agencia = CA.Codigo_' +
        'Agencia)'
      'left join Cadastro_Banco B on (CA.Codigo_Banco = B.Codigo_Banco)')
    Left = 460
    Top = 272
    object qryconsulta_saldoCodigo_Conta_Corrente: TIntegerField
      FieldName = 'Codigo_Conta_Corrente'
    end
    object qryconsulta_saldoConta_Corrente: TStringField
      FieldName = 'Conta_Corrente'
    end
    object qryconsulta_saldoCodigo_Agencia: TIntegerField
      FieldName = 'Codigo_Agencia'
    end
    object qryconsulta_saldoNome_Correntista: TStringField
      FieldName = 'Nome_Correntista'
      Size = 50
    end
    object qryconsulta_saldoSaldo_Inicial: TFloatField
      FieldName = 'Saldo_Inicial'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_saldoLimite: TFloatField
      FieldName = 'Limite'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_saldoSaldo_Atual: TFloatField
      FieldName = 'Saldo_Atual'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_saldoData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qryconsulta_saldoNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object qryconsulta_saldoNumero_Agencia: TStringField
      FieldName = 'Numero_Agencia'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_saldo
    Left = 492
    Top = 272
  end
end
