object FrmChama_Fechamento_Fornecimento_Leite: TFrmChama_Fechamento_Fornecimento_Leite
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Fechamento Fornecimento de Leite'
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
        FieldName = 'Data_Inicial'
        Title.Caption = 'Inicial'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Final'
        Title.Caption = 'Final'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Fechamento'
        Title.Caption = 'Fechamento'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Title.Caption = 'Qtde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Unitario'
        Title.Caption = 'Valor Unit'#225'rio'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Total'
        Title.Caption = 'Valor Total'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desconto'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Acrecimo'
        Title.Caption = 'Acr'#233'scimo'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Final'
        Title.Caption = 'Valor Final'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Title.Caption = 'Obs.'
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
      'Data Fechamento')
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
      'Select FF.* from Fechamento_Fornecimento FF'
      'where FF.Codigo_Propriedade = :Propriedade'
      'order by FF.Data_Fechamento')
    Left = 456
    Top = 272
    object qrychamaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychamaCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qrychamaData_Inicial: TDateTimeField
      FieldName = 'Data_Inicial'
    end
    object qrychamaData_Final: TDateTimeField
      FieldName = 'Data_Final'
    end
    object qrychamaData_Fechamento: TDateTimeField
      FieldName = 'Data_Fechamento'
    end
    object qrychamaQuantidade: TFloatField
      FieldName = 'Quantidade'
      DisplayFormat = '#0.0,0'
    end
    object qrychamaValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object qrychamaValor_Total: TFloatField
      FieldName = 'Valor_Total'
      DisplayFormat = '#0.0,0'
    end
    object qrychamaDesconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '#0.0,0'
    end
    object qrychamaAcrecimo: TFloatField
      FieldName = 'Acrecimo'
      DisplayFormat = '#0.0,0'
    end
    object qrychamaValor_Final: TFloatField
      FieldName = 'Valor_Final'
      DisplayFormat = '#0.0,0'
    end
    object qrychamaObservacao: TStringField
      FieldName = 'Observacao'
      Size = 300
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama
    Left = 496
    Top = 272
  end
end
