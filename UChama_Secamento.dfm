object FrmChama_Secamento: TFrmChama_Secamento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Secamento'
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
        FieldName = 'Codigo_Animal'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Animal'
        Width = 261
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Lote'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Lote'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Motivo'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Secamento'
        Title.Caption = 'Secamento'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Title.Caption = 'Obs.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Categoria'
        Visible = False
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
      'Animal'
      'Data Sec.')
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
      
        'select S.*, CA.Brinco + '#39' - '#39' + CA.Nome as Animal, CA.Codigo_Cat' +
        'egoria, CL.Descricao as Lote from Secamento S'
      'left join Cadastro_Animal CA on (S.Codigo_Animal = CA.Codigo)'
      'left join Cadastro_Lote CL on (S.Codigo_Lote = CL.Codigo)'
      'where S.Codigo_Propriedade = :Propriedade'
      'order by CA.Nome')
    Left = 464
    Top = 272
    object qrychamaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychamaCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qrychamaCodigo_Animal: TIntegerField
      FieldName = 'Codigo_Animal'
    end
    object qrychamaCodigo_Lote: TIntegerField
      FieldName = 'Codigo_Lote'
    end
    object qrychamaMotivo: TStringField
      FieldName = 'Motivo'
      Size = 30
    end
    object qrychamaData_Secamento: TDateTimeField
      FieldName = 'Data_Secamento'
    end
    object qrychamaObservacao: TStringField
      FieldName = 'Observacao'
      Size = 300
    end
    object qrychamaAnimal: TStringField
      FieldName = 'Animal'
      ReadOnly = True
      Size = 83
    end
    object qrychamaCodigo_Categoria: TIntegerField
      FieldName = 'Codigo_Categoria'
    end
    object qrychamaLote: TStringField
      FieldName = 'Lote'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama
    Left = 496
    Top = 272
  end
end
