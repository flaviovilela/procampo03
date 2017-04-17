object FrmChama_Ingrediente_Produto: TFrmChama_Ingrediente_Produto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Ingrediente de Produtos'
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
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Produto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Ingrediente'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Produto'
        Width = 338
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ingrediente'
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Permissao'
        Title.Caption = 'Uso'
        Width = -1
        Visible = False
      end>
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
  object RGConsulta_Por: TRadioGroup
    Left = 0
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'Produto'
      'Ingrediente')
    TabOrder = 2
  end
  object qrychama_ingrediente: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select IP.*, CP.Descricao as Produto, CI.Descricao as Ingredient' +
        'e from Ingrediente_Produto IP'
      'left join Cadastro_Produto CP on (IP.Codigo_Produto = CP.Codigo)'
      
        'left join Cadastro_Ingrediente CI on (IP.Codigo_Ingrediente = CI' +
        '.Codigo)'
      'where IP.Permissao = '#39'SIM'#39
      'order by CP.Descricao')
    Left = 496
    Top = 320
    object qrychama_ingredienteCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_ingredienteCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qrychama_ingredienteCodigo_Ingrediente: TIntegerField
      FieldName = 'Codigo_Ingrediente'
    end
    object qrychama_ingredientePermissao: TStringField
      FieldName = 'Permissao'
      Size = 3
    end
    object qrychama_ingredienteProduto: TStringField
      FieldName = 'Produto'
      Size = 70
    end
    object qrychama_ingredienteIngrediente: TStringField
      FieldName = 'Ingrediente'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_ingrediente
    Left = 496
    Top = 272
  end
end
