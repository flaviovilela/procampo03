object FrmChama_Grupo_Cliente: TFrmChama_Grupo_Cliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Grupo de Clientes'
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
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 332
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
      'Descri'#231#227'o')
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
  object qrychama_grupo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cadastro_grupo_cliente order by descricao')
    Left = 464
    Top = 272
    object qrychama_grupoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_grupoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 40
    end
    object qrychama_grupoData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_grupo
    Left = 496
    Top = 272
  end
end
