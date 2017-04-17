object FrmChama_Folha_Pagamento: TFrmChama_Folha_Pagamento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Folha de Pagamento'
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
    Left = 125
    Top = 39
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Funcionario'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Funcion'#225'rio'
        Width = 347
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Mes_Ano'
        Title.Caption = 'M'#234's/Ano'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Data_Fechamento'
        Title.Caption = 'Fechamento'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Entradas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Saidas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Comissao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Desconto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Salario'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Quantidade_Itens'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Visible = False
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
      'Funcion'#225'rio'
      'M'#234's/Ano')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 125
    Top = 55
    Width = 289
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    TabOrder = 0
    OnKeyDown = EdtConsultaKeyDown
  end
  object ToolBar1: TToolBar
    Left = 751
    Top = 31
    Width = 190
    Height = 42
    Align = alCustom
    ButtonHeight = 38
    ButtonWidth = 93
    Caption = 'ToolBar1'
    DrawingStyle = dsGradient
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esLowered
    EdgeOuter = esRaised
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    GradientEndColor = clWindow
    HotTrackColor = clMenu
    Images = DM.ImgChama
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 3
    object BBtnFiltrar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      AutoSize = True
      Caption = '&Localizar'
      ImageIndex = 0
      OnClick = BBtnFiltrarClick
    end
    object BBtnFechar: TToolButton
      Left = 97
      Top = 0
      Cursor = crHandPoint
      AutoSize = True
      Caption = '&Fechar'
      ImageIndex = 1
      OnClick = BBtnFecharClick
    end
  end
  object qrychama_folha: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select FP.*, Cli.Nome from Folha_Pagamento FP'
      
        'inner join Cadastro_Cliente Cli on (FP.Codigo_Funcionario = Cli.' +
        'Codigo)')
    Left = 464
    Top = 272
    object qrychama_folhaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_folhaCodigo_Funcionario: TIntegerField
      FieldName = 'Codigo_Funcionario'
    end
    object qrychama_folhaCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qrychama_folhaMes_Ano: TStringField
      FieldName = 'Mes_Ano'
      Size = 50
    end
    object qrychama_folhaData_Fechamento: TDateTimeField
      FieldName = 'Data_Fechamento'
    end
    object qrychama_folhaEntradas: TFloatField
      FieldName = 'Entradas'
    end
    object qrychama_folhaSaidas: TFloatField
      FieldName = 'Saidas'
    end
    object qrychama_folhaComissao: TFloatField
      FieldName = 'Comissao'
    end
    object qrychama_folhaDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qrychama_folhaSalario: TFloatField
      FieldName = 'Salario'
    end
    object qrychama_folhaQuantidade_Itens: TIntegerField
      FieldName = 'Quantidade_Itens'
    end
    object qrychama_folhaObservacao: TStringField
      FieldName = 'Observacao'
      Size = 300
    end
    object qrychama_folhaNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_folha
    Left = 496
    Top = 272
  end
end
