object FrmChama_Desmama: TFrmChama_Desmama
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Desmama'
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
        FieldName = 'Codigo_Destinacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Localidade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Lote'
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
        Width = 236
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Peso_Desmama'
        Title.Caption = 'Peso Desmama'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Desmama'
        Title.Caption = 'Desmama'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Cadastro'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Destinacao'
        Title.Caption = 'Destina'#231#227'o'
        Width = 176
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Piquete'
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lote'
        Width = 206
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Mae'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Mae_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mae'
        Title.Caption = 'M'#227'e'
        Width = 229
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacoes'
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
    ItemIndex = 1
    Items.Strings = (
      'Animal'
      'Data Desm.')
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
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select D.*, CD.Descricao as Destinacao, CP.Descricao as Piquete,' +
        ' CL.Descricao as Lote, '
      
        'CA.Brinco + '#39' - '#39' + CA.Nome as Animal, CA.Codigo_Mae, CA2.Codigo' +
        ' as Codigo_Mae, '
      'CA2.Brinco + '#39' - '#39' + CA2.Nome as Mae from Desmama D'
      
        'left join Cadastro_Destinacao CD on (D.Codigo_Destinacao = CD.Co' +
        'digo)'
      
        'left join Cadastro_Piquete CP on (D.Codigo_Localidade = CP.Codig' +
        'o)'
      'left join Cadastro_Lote CL on (D.Codigo_Lote = CL.Codigo)'
      'left join Cadastro_Animal CA on (D.Codigo_Animal = CA.Codigo)'
      'left join Cadastro_Animal CA2 on (CA.Codigo_Mae = CA2.Codigo)'
      'where Codigo_Propriedade = :Propriedade'
      'order by CA.Nome')
    Left = 464
    Top = 272
    object qrychamaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychamaCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qrychamaCodigo_Destinacao: TIntegerField
      FieldName = 'Codigo_Destinacao'
    end
    object qrychamaCodigo_Localidade: TIntegerField
      FieldName = 'Codigo_Localidade'
    end
    object qrychamaCodigo_Lote: TIntegerField
      FieldName = 'Codigo_Lote'
    end
    object qrychamaCodigo_Animal: TIntegerField
      FieldName = 'Codigo_Animal'
    end
    object qrychamaPeso_Desmama: TIntegerField
      FieldName = 'Peso_Desmama'
    end
    object qrychamaData_Desmama: TDateTimeField
      FieldName = 'Data_Desmama'
    end
    object qrychamaObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 500
    end
    object qrychamaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychamaDestinacao: TStringField
      FieldName = 'Destinacao'
      Size = 50
    end
    object qrychamaPiquete: TStringField
      FieldName = 'Piquete'
      Size = 50
    end
    object qrychamaLote: TStringField
      FieldName = 'Lote'
      Size = 50
    end
    object qrychamaAnimal: TStringField
      FieldName = 'Animal'
      ReadOnly = True
      Size = 83
    end
    object qrychamaCodigo_Mae: TIntegerField
      FieldName = 'Codigo_Mae'
    end
    object qrychamaCodigo_Mae_1: TIntegerField
      FieldName = 'Codigo_Mae_1'
    end
    object qrychamaMae: TStringField
      FieldName = 'Mae'
      ReadOnly = True
      Size = 83
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama
    Left = 496
    Top = 272
  end
end
