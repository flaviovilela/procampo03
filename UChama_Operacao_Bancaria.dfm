object FrmChama_Operacao_Bancaria: TFrmChama_Operacao_Bancaria
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Opera'#231#227'o Banc'#225'ria'
  ClientHeight = 553
  ClientWidth = 942
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object LblMarca: TLabel
    Left = 252
    Top = 40
    Width = 61
    Height = 13
    Caption = 'Par'#226'metro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 80
    Width = 941
    Height = 473
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Operacao'
        Title.Caption = 'Opera'#231#227'o'
        Width = 356
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Visible = False
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 0
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Consulta por:'
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Opera'#231#227'o')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 252
    Top = 56
    Width = 289
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    TabOrder = 0
    OnChange = EdtConsultaChange
    OnKeyDown = EdtConsultaKeyDown
  end
  object RGOrdena_Por: TRadioGroup
    Left = 127
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Opera'#231#227'o')
    TabOrder = 3
  end
  object ToolBar1: TToolBar
    Left = 751
    Top = 31
    Width = 190
    Height = 42
    Align = alCustom
    ButtonHeight = 38
    ButtonWidth = 93
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
    Images = DM.ImgChama
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 4
    object BBtnFiltrar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      AutoSize = True
      Caption = '&Localizar'
      ImageIndex = 1
    end
    object BBtnFechar: TToolButton
      Left = 97
      Top = 0
      Cursor = crHandPoint
      AutoSize = True
      Caption = '&Fechar'
      ImageIndex = 0
      OnClick = BBtnFecharClick
    end
  end
  object qrychama_operacao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from operacao_bancaria')
    Left = 464
    Top = 272
    object qrychama_operacaoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_operacaoOperacao: TStringField
      FieldName = 'Operacao'
      Size = 30
    end
    object qrychama_operacaoTipo: TStringField
      FieldName = 'Tipo'
      Size = 7
    end
    object qrychama_operacaoData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_operacao
    Left = 496
    Top = 272
  end
end
