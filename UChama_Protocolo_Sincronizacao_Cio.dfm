object FrmChama_Protocolo_Sincronizacao_Cio: TFrmChama_Protocolo_Sincronizacao_Cio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Protocolo de Sincroniza'#231#227'o de Cio'
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
        FieldName = 'Produto'
        Width = 232
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unidade'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Protocolo'
        Title.Caption = 'Data Protocolo'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hora_Protocolo'
        Title.Caption = 'Hora Protocolo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Produto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Unidade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Responsavel'
        Title.Caption = 'Respons'#225'vel'
        Width = 201
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Title.Caption = 'Obs.'
        Width = 500
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
      'Data Prot.')
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
      
        'select PSS.*, UM.Descricao as Unidade, CP.Descricao as Produto f' +
        'rom Protocolo_Sincronizacao PSS'
      'left join Unidade_Medida UM on (PSS.Codigo_Unidade = UM.Codigo)'
      
        'left join Cadastro_Produtos CP on (PSS.Codigo_Produto = CP.Codig' +
        'o)'
      'where PSS.Codigo_Propriedade = :Propriedade')
    Left = 496
    Top = 320
    object qrychamaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychamaCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qrychamaData_Protocolo: TDateTimeField
      FieldName = 'Data_Protocolo'
    end
    object qrychamaHora_Protocolo: TStringField
      FieldName = 'Hora_Protocolo'
      Size = 6
    end
    object qrychamaCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qrychamaQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object qrychamaCodigo_Unidade: TIntegerField
      FieldName = 'Codigo_Unidade'
    end
    object qrychamaResponsavel: TStringField
      FieldName = 'Responsavel'
      Size = 50
    end
    object qrychamaObservacao: TStringField
      FieldName = 'Observacao'
      Size = 200
    end
    object qrychamaUnidade: TStringField
      FieldName = 'Unidade'
      Size = 50
    end
    object qrychamaProduto: TStringField
      FieldName = 'Produto'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama
    Left = 496
    Top = 272
  end
end
