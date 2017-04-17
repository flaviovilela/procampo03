object FrmChama_Plano_Financeiro: TFrmChama_Plano_Financeiro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Plano Financeiro'
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
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
        FieldName = 'Tipo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Width = 397
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sub_Nivel'
        Title.Caption = 'C'#243'digo Sub-N'#237'vel'
        Width = 211
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
  object qrychama_plano: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select PF.*, PF2.Descricao as Descricao2 from Cadastro_Plano_Fin' +
        'anceiro PF'
      
        'left join Cadastro_Plano_Financeiro PF2 on (PF.Codigo_SubNivel =' +
        ' PF2.Codigo)'
      'order by Descricao')
    Left = 464
    Top = 272
    object qrychama_planoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_planoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qrychama_planoTipo: TStringField
      FieldName = 'Tipo'
      Size = 7
    end
    object qrychama_planoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 300
    end
    object qrychama_planoCodigo_SubNivel: TIntegerField
      FieldName = 'Codigo_SubNivel'
    end
    object qrychama_planoData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_planoSub_Nivel: TStringField
      FieldName = 'Sub_Nivel'
      Size = 50
    end
    object qrychama_planoCodigo_Pai: TIntegerField
      FieldName = 'Codigo_Pai'
    end
    object qrychama_planoDescricao2: TStringField
      FieldName = 'Descricao2'
      Size = 300
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_plano
    Left = 496
    Top = 272
  end
end
