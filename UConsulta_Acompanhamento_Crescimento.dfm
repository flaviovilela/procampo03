object FrmConsulta_Acompanhamento_Crescimento: TFrmConsulta_Acompanhamento_Crescimento
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Acompanhamento de Crescimento'
  ClientHeight = 536
  ClientWidth = 952
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  DesignSize = (
    952
    536)
  PixelsPerInch = 96
  TextHeight = 13
  object LblMarca: TLabel
    Left = 113
    Top = 502
    Width = 72
    Height = 13
    Caption = 'T.de Animais'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 113
    Top = 78
    Width = 838
    Height = 422
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
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
        FieldName = 'Animal'
        Width = 219
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Categoria'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Categoria'
        Width = 325
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Grau_Sangue'
        Title.Caption = 'Grau Sangue'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Nascimento'
        Title.Caption = 'Nascimento'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idade'
        Title.Caption = 'Idade(m)'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idade_dias'
        Title.Caption = 'Idade(d)'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Desmama'
        Title.Caption = 'Desmama'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dias_desmamado'
        Title.Caption = 'Dias Des.'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ultimo_Peso'
        Title.Caption = #218'ltimo Peso'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtde'
        Visible = False
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 108
    Height = 536
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 104
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
    Images = DM.ImgComandos
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 1
    object BBtnFiltrar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para pesquisar'
      Caption = '&Pesquisar'
      ImageIndex = 2
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnFiltrarClick
    end
    object BBtnMudar_Categoria: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Caption = '&Mudar Cat.'
      Enabled = False
      ImageIndex = 9
      Wrap = True
      OnClick = BBtnMudar_CategoriaClick
    end
    object BBtnLimpar: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para limpar a pesquisa realizada e iniciar outra'
      Caption = 'Li&mpar'
      Enabled = False
      ImageIndex = 7
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnLimparClick
    end
    object BBtnImprimir: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Hint = 'Clique para imprimir a pesquisa realizada'
      Caption = 'Imp&rimir'
      Enabled = False
      ImageIndex = 6
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnImprimirClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 152
      Cursor = crHandPoint
      Hint = 'Clique para fechar a janela'
      Caption = '&Fechar'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object RGCategoria: TRadioGroup
    Left = 209
    Top = 0
    Width = 121
    Height = 77
    Caption = 'Categorias a Consultar'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7')
    TabOrder = 2
  end
  object RGSexo: TRadioGroup
    Left = 113
    Top = 0
    Width = 90
    Height = 77
    Caption = 'Sexo'
    ItemIndex = 0
    Items.Strings = (
      'Macho'
      'F'#234'mea')
    TabOrder = 3
  end
  object RGAlterar: TRadioGroup
    Left = 336
    Top = 0
    Width = 121
    Height = 77
    Caption = 'Alterar categoria para:'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7')
    TabOrder = 4
  end
  object EdtTotal_Animais: TEdit
    Left = 113
    Top = 519
    Width = 79
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object qryconsulta: TADOQuery
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
      end
      item
        Name = 'Sexo'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'Nao'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 3
        Value = Null
      end
      item
        Name = 'Naoo'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 3
        Value = Null
      end
      item
        Name = 'Local'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end
      item
        Name = 'Categoria'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Propriedade2'
        Size = -1
        Value = Null
      end
      item
        Name = 'Sexo2'
        Size = -1
        Value = Null
      end
      item
        Name = 'Nao2'
        Size = -1
        Value = Null
      end
      item
        Name = 'Naoo2'
        Size = -1
        Value = Null
      end
      item
        Name = 'Local2'
        Size = -1
        Value = Null
      end
      item
        Name = 'Categoria2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select CA.Codigo, CA.Brinco + '#39' - '#39' + CA.Nome as Animal, CA.Codi' +
        'go_Categoria, CA.Data_Nascimento, datediff(month, CA.Data_Nascim' +
        'ento, getdate()) as idade, '
      
        'datediff(day, CA.Data_Nascimento, getdate()) as idade_dias, CA.D' +
        'ata_Desmama,'
      
        'datediff(day, CA.Data_Desmama, getdate()) as dias_desmamado, CA.' +
        'Ultimo_Peso, CA.Grau_Sangue, CC.Descricao as Categoria,'
      ''
      '(select count(*) from Cadastro_Animal CA'
      
        'where Codigo_Propriedade = :Propriedade and Sexo = :Sexo and Bai' +
        'xada = :Nao and Vendida = :Naoo and Localizacao = :Local and Cod' +
        'igo_Categoria = :Categoria) as Qtde '
      ''
      'from Cadastro_Animal CA '
      
        'left join Cadastro_Categoria CC on (CA.Codigo_Categoria = CC.Cod' +
        'igo)'
      
        'where Codigo_Propriedade = :Propriedade2 and Sexo = :Sexo2 and B' +
        'aixada = :Nao2 and Vendida = :Naoo2 and Localizacao = :Local2 an' +
        'd Codigo_Categoria = :Categoria2')
    Left = 469
    Top = 272
    object qryconsultaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsultaAnimal: TStringField
      FieldName = 'Animal'
      ReadOnly = True
      Size = 83
    end
    object qryconsultaCodigo_Categoria: TIntegerField
      FieldName = 'Codigo_Categoria'
    end
    object qryconsultaData_Nascimento: TDateTimeField
      FieldName = 'Data_Nascimento'
    end
    object qryconsultaidade: TIntegerField
      FieldName = 'idade'
      ReadOnly = True
    end
    object qryconsultaidade_dias: TIntegerField
      FieldName = 'idade_dias'
      ReadOnly = True
    end
    object qryconsultaData_Desmama: TDateTimeField
      FieldName = 'Data_Desmama'
    end
    object qryconsultadias_desmamado: TIntegerField
      FieldName = 'dias_desmamado'
      ReadOnly = True
    end
    object qryconsultaUltimo_Peso: TFloatField
      FieldName = 'Ultimo_Peso'
    end
    object qryconsultaGrau_Sangue: TStringField
      FieldName = 'Grau_Sangue'
      Size = 30
    end
    object qryconsultaQtde: TIntegerField
      FieldName = 'Qtde'
      ReadOnly = True
    end
    object qryconsultaCategoria: TStringField
      FieldName = 'Categoria'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta
    Left = 501
    Top = 272
  end
end
