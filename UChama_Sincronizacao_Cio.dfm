object FrmChama_Sincronizacao_Cio: TFrmChama_Sincronizacao_Cio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Sincroniza'#231#227'o de Cio'
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LblMarca: TLabel
    Left = 127
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
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Propriedade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Sincronizacao'
        Title.Caption = 'Data Sincroniza'#231#227'o'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora_Cobertura'
        Title.Caption = 'Hora Cobertura'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cobertura'
        Title.Caption = 'Data Cobertura'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total_Animais'
        Title.Caption = 'Total Animais'
        Width = 83
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 0
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'Data Sincr.')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 127
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
  end
  object qrychama: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Propriedade'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select SC.* from Sincronizacao_Cio SC'
      'where SC.Codigo_Propriedade = :Propriedade')
    Left = 496
    Top = 320
    object qrychamaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychamaCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qrychamaData_Sincronizacao: TDateTimeField
      FieldName = 'Data_Sincronizacao'
    end
    object qrychamaHora: TStringField
      FieldName = 'Hora'
      Size = 6
    end
    object qrychamaHora_Cobertura: TStringField
      FieldName = 'Hora_Cobertura'
      Size = 6
    end
    object qrychamaData_Cobertura: TDateTimeField
      FieldName = 'Data_Cobertura'
    end
    object qrychamaTotal_Animais: TIntegerField
      FieldName = 'Total_Animais'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama
    Left = 496
    Top = 272
  end
end
