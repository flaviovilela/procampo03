object FrmChama_Maquina: TFrmChama_Maquina
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta M'#225'quinas'
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
        FieldName = 'Placa'
        Width = 76
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
    Top = 1
    Width = 121
    Height = 73
    Caption = 'Consulta por:'
    ItemIndex = 1
    Items.Strings = (
      'Placa'
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
  object qrychama_maquina: TADOQuery
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
      'select CM.*, CMM.Descricao as Marca, CGM.Descricao as Grupo'
      'from Cadastro_Maquina CM'
      'left join Cadastro_Marca CMM on (CM.Codigo_Marca = CMM.Codigo)'
      
        'left join Cadastro_Grupo_Maquina CGM on (CM.Codigo_Grupo = CGM.C' +
        'odigo)'
      'where CM.Codigo_Propriedade = :Propriedade order by Descricao')
    Left = 496
    Top = 320
    object qrychama_maquinaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_maquinaCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qrychama_maquinaStatus: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object qrychama_maquinaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrychama_maquinaCodigo_Marca: TIntegerField
      FieldName = 'Codigo_Marca'
    end
    object qrychama_maquinaCodigo_Grupo: TIntegerField
      FieldName = 'Codigo_Grupo'
    end
    object qrychama_maquinaPlaca: TStringField
      FieldName = 'Placa'
      Size = 10
    end
    object qrychama_maquinaNumero_Chassi: TStringField
      FieldName = 'Numero_Chassi'
      Size = 50
    end
    object qrychama_maquinaNumero_Motor: TStringField
      FieldName = 'Numero_Motor'
      Size = 50
    end
    object qrychama_maquinaData_Entrada: TDateTimeField
      FieldName = 'Data_Entrada'
    end
    object qrychama_maquinaData_Saida: TDateTimeField
      FieldName = 'Data_Saida'
    end
    object qrychama_maquinaValor: TFloatField
      FieldName = 'Valor'
    end
    object qrychama_maquinaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_maquinaObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 300
    end
    object qrychama_maquinaMarca: TStringField
      FieldName = 'Marca'
      Size = 50
    end
    object qrychama_maquinaGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_maquina
    Left = 496
    Top = 272
  end
end
