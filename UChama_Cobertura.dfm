object FrmChama_Cobertura: TFrmChama_Cobertura
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Cobertura'
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
        Visible = True
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
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Reprodutor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Reprodutor'
        Width = 278
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Cadastro'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Inseminacao'
        Title.Caption = 'Insemina'#231#227'o'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Inseminacao'
        Title.Caption = 'Tipo Cobertura'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dose'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Inseminador'
        Width = 224
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cio'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Hora_Cio'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Observacoes'
        Title.Caption = 'Observa'#231#245'es'
        Width = 578
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
      'Animal'
      'Data Cobertura')
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
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select C.*, CA1.Brinco + '#39' - '#39' + CA1.Nome as Animal, CA1.Codigo_' +
        'Categoria, CA2.Brinco + '#39' - '#39' + CA2.Nome as Reprodutor from Cobe' +
        'rtura C'
      'left join Cadastro_Animal CA1 on (C.Codigo_Animal = CA1.Codigo)'
      
        'left join Cadastro_Animal CA2 on (C.Codigo_Reprodutor = CA2.Codi' +
        'go)'
      'where C.Codigo_Propriedade = :Propriedade'
      'order by CA1.Nome')
    Left = 496
    Top = 320
    object qrychamaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychamaCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qrychamaCodigo_Animal: TIntegerField
      FieldName = 'Codigo_Animal'
    end
    object qrychamaCodigo_Reprodutor: TIntegerField
      FieldName = 'Codigo_Reprodutor'
    end
    object qrychamaTipo_Inseminacao: TStringField
      FieldName = 'Tipo_Inseminacao'
      Size = 30
    end
    object qrychamaDose: TIntegerField
      FieldName = 'Dose'
    end
    object qrychamaInseminador: TStringField
      FieldName = 'Inseminador'
      Size = 50
    end
    object qrychamaObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 500
    end
    object qrychamaData_Inseminacao: TDateTimeField
      FieldName = 'Data_Inseminacao'
    end
    object qrychamaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychamaHora: TStringField
      FieldName = 'Hora'
      Size = 6
    end
    object qrychamaData_Cio: TDateTimeField
      FieldName = 'Data_Cio'
    end
    object qrychamaHora_Cio: TStringField
      FieldName = 'Hora_Cio'
      Size = 10
    end
    object qrychamaAnimal: TStringField
      FieldName = 'Animal'
      ReadOnly = True
      Size = 81
    end
    object qrychamaReprodutor: TStringField
      FieldName = 'Reprodutor'
      ReadOnly = True
      Size = 81
    end
    object qrychamaCodigo_Categoria: TIntegerField
      FieldName = 'Codigo_Categoria'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama
    Left = 496
    Top = 272
  end
end
