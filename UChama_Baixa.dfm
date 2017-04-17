object FrmChama_Baixa: TFrmChama_Baixa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Baixa'
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
        Width = 256
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Causa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Causa_Baixa'
        Title.Caption = 'Causa'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Responsavel'
        Title.Caption = 'Respons'#225'vel'
        Width = 187
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Baixa'
        Width = 78
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
    ItemIndex = 1
    Items.Strings = (
      'Animal'
      'Data Ba.')
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
      
        'select B.*, CA.Brinco + '#39' - '#39' + CA.Nome as Animal, CCB.Descricao' +
        ' as Causa_Baixa from Baixa B'
      'left join Cadastro_Animal CA on (B.Codigo_Animal = CA.Codigo)'
      
        'left join Cadastro_Causa_Baixa CCB on (B.Codigo_Causa = CCB.Codi' +
        'go)'
      'where B.Codigo_Propriedade = :Propriedade'
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
    object qrychamaCodigo_Causa: TIntegerField
      FieldName = 'Codigo_Causa'
    end
    object qrychamaResponsavel: TStringField
      FieldName = 'Responsavel'
      Size = 50
    end
    object qrychamaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
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
    object qrychamaCausa_Baixa: TStringField
      FieldName = 'Causa_Baixa'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama
    Left = 496
    Top = 272
  end
end
