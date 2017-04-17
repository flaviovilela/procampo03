object FrmChama_Produto: TFrmChama_Produto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Produtos'
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Propriedade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 247
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Grupo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Grupo_Produto'
        Title.Caption = 'Grupo'
        Width = 208
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Preco'
        Title.Caption = 'Pre'#231'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade_Estoque'
        Title.Caption = 'Qtde. Est.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Animal'
        Width = 244
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Unidade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Unidade_Medida'
        Title.Caption = 'Un. Medida'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Unidade_Volume'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Unidade_Volume'
        Title.Caption = 'Un. Volume'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Volume'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Volume_Total'
        Title.Caption = 'Volume Total'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Ultima_Compra'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Validade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Tipo_Produto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Animal_Reprodutor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Carencia'
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
      
        'select P.*, CGP.Descricao as Grupo_Produto, UM.Sigla as Unidade_' +
        'Medida, UMV.Sigla as Unidade_Volume,'
      'CA.Brinco + '#39' - '#39' + CA.Nome as Animal from Cadastro_Produtos P'
      
        'left join Cadastro_Grupo_Produtos CGP on (P.Codigo_Grupo = CGP.C' +
        'odigo)'
      'left join Unidade_Medida UM on (P.Codigo_Unidade = UM.Codigo)'
      
        'left join Unidade_Medida UMV on (P.Codigo_Unidade_Volume = UMV.C' +
        'odigo)'
      
        'left join Cadastro_Animal CA on (P.Codigo_Animal_Reprodutor = CA' +
        '.Codigo)'
      'where P.Codigo_Propriedade = :Propriedade order by P.Descricao')
    Left = 496
    Top = 320
    object qrychamaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychamaCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qrychamaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrychamaCodigo_Grupo: TIntegerField
      FieldName = 'Codigo_Grupo'
    end
    object qrychamaPreco: TFloatField
      FieldName = 'Preco'
      DisplayFormat = '#0.0,0'
    end
    object qrychamaQuantidade_Estoque: TFloatField
      FieldName = 'Quantidade_Estoque'
      DisplayFormat = '#0.0,0'
    end
    object qrychamaCodigo_Unidade: TIntegerField
      FieldName = 'Codigo_Unidade'
    end
    object qrychamaCodigo_Unidade_Volume: TIntegerField
      FieldName = 'Codigo_Unidade_Volume'
    end
    object qrychamaVolume: TFloatField
      FieldName = 'Volume'
      DisplayFormat = '#0.0,0'
    end
    object qrychamaVolume_Total: TFloatField
      FieldName = 'Volume_Total'
      DisplayFormat = '#0.0,0'
    end
    object qrychamaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychamaData_Ultima_Compra: TDateTimeField
      FieldName = 'Data_Ultima_Compra'
    end
    object qrychamaData_Validade: TDateTimeField
      FieldName = 'Data_Validade'
    end
    object qrychamaTipo_Produto: TStringField
      FieldName = 'Tipo_Produto'
      Size = 30
    end
    object qrychamaCodigo_Animal_Reprodutor: TIntegerField
      FieldName = 'Codigo_Animal_Reprodutor'
    end
    object qrychamaCarencia: TIntegerField
      FieldName = 'Carencia'
    end
    object qrychamaGrupo_Produto: TStringField
      FieldName = 'Grupo_Produto'
      Size = 50
    end
    object qrychamaUnidade_Medida: TStringField
      FieldName = 'Unidade_Medida'
      Size = 2
    end
    object qrychamaUnidade_Volume: TStringField
      FieldName = 'Unidade_Volume'
      Size = 2
    end
    object qrychamaAnimal: TStringField
      FieldName = 'Animal'
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
