object FrmChama_Bem_Patrimonio: TFrmChama_Bem_Patrimonio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Bem Patrimonial'
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
      end
      item
        Expanded = False
        FieldName = 'Identificacao'
        Title.Caption = 'Identifica'#231#227'o'
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
  object qrychama_bem: TADOQuery
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
      'select CBP.*, UM.Descricao as Unidade_Medida,'
      'CTBP.Tipo_Bem as Tipo_Bem from Cadastro_Bem_Patrimonial CBP'
      'left join Unidade_Medida UM on (CBP.Codigo_Unidade = UM.Codigo)'
      
        'left join Cadastro_Tipo_Bem_Patrimonial CTBP on (CBP.Codigo_Tipo' +
        '_Bem_Patrimonial = CTBP.Codigo)'
      'where Codigo_Propriedade = :Propriedade'
      'order by CBP.Descricao')
    Left = 496
    Top = 320
    object qrychama_bemCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_bemCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qrychama_bemIdentificacao: TStringField
      FieldName = 'Identificacao'
    end
    object qrychama_bemCodigo_Centro_Custo: TIntegerField
      FieldName = 'Codigo_Centro_Custo'
    end
    object qrychama_bemCodigo_Funcionario: TStringField
      FieldName = 'Codigo_Funcionario'
      Size = 50
    end
    object qrychama_bemDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrychama_bemCodigo_Tipo_Bem_Patrimonial: TIntegerField
      FieldName = 'Codigo_Tipo_Bem_Patrimonial'
    end
    object qrychama_bemCodigo_Unidade: TIntegerField
      FieldName = 'Codigo_Unidade'
    end
    object qrychama_bemPreco_RS: TFloatField
      FieldName = 'Preco_RS'
    end
    object qrychama_bemPreco_S: TFloatField
      FieldName = 'Preco_S'
    end
    object qrychama_bemQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object qrychama_bemTipo_Bem: TStringField
      FieldName = 'Tipo_Bem'
      Size = 8
    end
    object qrychama_bemData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_bemData_Compra: TDateTimeField
      FieldName = 'Data_Compra'
    end
    object qrychama_bemObservacao: TStringField
      FieldName = 'Observacao'
      Size = 300
    end
    object qrychama_bemDescricao_Detalhada: TStringField
      FieldName = 'Descricao_Detalhada'
      Size = 300
    end
    object qrychama_bemUnidade_Medida: TStringField
      FieldName = 'Unidade_Medida'
      Size = 50
    end
    object qrychama_bemTipo_Bem_1: TStringField
      FieldName = 'Tipo_Bem_1'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_bem
    Left = 496
    Top = 272
  end
end
