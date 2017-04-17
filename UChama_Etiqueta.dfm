object FrmChama_Etiqueta: TFrmChama_Etiqueta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Etiquetas'
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
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
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
  object qrychama_etiqueta: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Cadastro_Etiqueta order by Descricao')
    Left = 496
    Top = 320
    object qrychama_etiquetaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_etiquetaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrychama_etiquetaMargem_Superior: TFloatField
      FieldName = 'Margem_Superior'
    end
    object qrychama_etiquetaMargem_Inferior: TFloatField
      FieldName = 'Margem_Inferior'
    end
    object qrychama_etiquetaMargem_Esquerda: TFloatField
      FieldName = 'Margem_Esquerda'
    end
    object qrychama_etiquetaMargem_Direita: TFloatField
      FieldName = 'Margem_Direita'
    end
    object qrychama_etiquetaDistancia_Vertical: TFloatField
      FieldName = 'Distancia_Vertical'
    end
    object qrychama_etiquetaDistancia_Horizontal: TFloatField
      FieldName = 'Distancia_Horizontal'
    end
    object qrychama_etiquetaAltura_Etiqueta: TFloatField
      FieldName = 'Altura_Etiqueta'
    end
    object qrychama_etiquetaLargura_Etiqueta: TFloatField
      FieldName = 'Largura_Etiqueta'
    end
    object qrychama_etiquetaTamanho_Fonte: TFloatField
      FieldName = 'Tamanho_Fonte'
    end
    object qrychama_etiquetaLargura_Pagina: TFloatField
      FieldName = 'Largura_Pagina'
    end
    object qrychama_etiquetaAltura_Pagina: TFloatField
      FieldName = 'Altura_Pagina'
    end
    object qrychama_etiquetaEtiqueta_Linha: TFloatField
      FieldName = 'Etiqueta_Linha'
    end
    object qrychama_etiquetaLinha_Pagina: TFloatField
      FieldName = 'Linha_Pagina'
    end
    object qrychama_etiquetaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_etiqueta
    Left = 496
    Top = 272
  end
end
