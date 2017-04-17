object FrmChama_Coleta_Embriao: TFrmChama_Coleta_Embriao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Coleta de Embri'#227'o'
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
    Top = 79
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
        FieldName = 'Data_Coleta'
        Title.Caption = 'Data Coleta'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Animal_Doadora'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Animal'
        Width = 232
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Animal_Macho'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Pai'
        Width = 227
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Funcionario'
        Title.Caption = 'Respons'#225'vel'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Estrutura_Viavel'
        Title.Caption = 'Vi'#225'vel'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Estrutura_Inviavel'
        Title.Caption = 'Invi'#225'vel'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Title.Caption = 'Obs.'
        Width = 236
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
      'Data Coleta')
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
      
        'select CE.*, CA.Brinco + '#39' - '#39' + CA.Nome as Animal, CA2.Brinco +' +
        ' '#39' - '#39' + CA2.Nome as Pai from Coleta_Embriao CE'
      
        'left join Cadastro_Animal CA on (CE.Codigo_Animal_Doadora = CA.C' +
        'odigo)'
      
        'left join Cadastro_Animal CA2 on (CE.Codigo_Animal_Macho = CA2.C' +
        'odigo)'
      'where CE.Codigo_Propriedade = :Propriedade order by CA.Nome')
    Left = 496
    Top = 320
    object qrychamaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychamaCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qrychamaData_Coleta: TDateTimeField
      FieldName = 'Data_Coleta'
    end
    object qrychamaCodigo_Animal_Doadora: TIntegerField
      FieldName = 'Codigo_Animal_Doadora'
    end
    object qrychamaCodigo_Animal_Macho: TIntegerField
      FieldName = 'Codigo_Animal_Macho'
    end
    object qrychamaEstrutura_Viavel: TIntegerField
      FieldName = 'Estrutura_Viavel'
    end
    object qrychamaEstrutura_Inviavel: TIntegerField
      FieldName = 'Estrutura_Inviavel'
    end
    object qrychamaObservacao: TStringField
      FieldName = 'Observacao'
      Size = 200
    end
    object qrychamaAnimal: TStringField
      FieldName = 'Animal'
      ReadOnly = True
      Size = 83
    end
    object qrychamaPai: TStringField
      FieldName = 'Pai'
      ReadOnly = True
      Size = 83
    end
    object qrychamaResponsavel: TStringField
      FieldName = 'Responsavel'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama
    Left = 496
    Top = 272
  end
end
