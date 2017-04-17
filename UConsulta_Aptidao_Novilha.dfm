object FrmConsulta_Aptidao_Novilha: TFrmConsulta_Aptidao_Novilha
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Aptid'#227'o de Novilhas'
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
  object Label2: TLabel
    Left = 209
    Top = 48
    Width = 74
    Height = 13
    Caption = 'Data Aptid'#227'o'
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
        Width = 262
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Categoria'
        Width = 275
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Categoria'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Grau_Sangue'
        Title.Caption = 'Grau Sangue'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Nascimento'
        Title.Caption = 'Nascimento'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idade_meses'
        Title.Caption = 'Idade(m)'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idade_dias'
        Title.Caption = 'Idade(d)'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ultimo_Peso'
        Title.Caption = #218'ltimo Peso'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Desmama'
        Title.Caption = 'Desmama'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dias_crescimento'
        Title.Caption = 'Dias '
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COLUMN1'
        Visible = False
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 102
    Height = 536
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 98
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
    object BBtnAptidao: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Caption = '&Confirma'
      Enabled = False
      ImageIndex = 9
      Wrap = True
      OnClick = BBtnAptidaoClick
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
  object RGOpacao: TRadioGroup
    Left = 113
    Top = 2
    Width = 90
    Height = 77
    Caption = 'Tipo'
    ItemIndex = 0
    Items.Strings = (
      'Aptid'#227'o'
      'Estorno')
    TabOrder = 2
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
    TabOrder = 3
  end
  object MEdtData_Aptidao: TMaskEdit
    Left = 209
    Top = 62
    Width = 79
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
  end
  object qryconsulta: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Sexo'
        Size = -1
        Value = Null
      end
      item
        Name = 'Propriedade'
        Size = -1
        Value = Null
      end
      item
        Name = 'Nao'
        Size = -1
        Value = Null
      end
      item
        Name = 'Naoo'
        Size = -1
        Value = Null
      end
      item
        Name = 'Local'
        Size = -1
        Value = Null
      end
      item
        Name = 'li_min'
        Size = -1
        Value = Null
      end
      item
        Name = 'li_max'
        Size = -1
        Value = Null
      end
      item
        Name = 'Categoria'
        Size = -1
        Value = Null
      end
      item
        Name = 'Categoriaa'
        Size = -1
        Value = Null
      end
      item
        Name = 'Categoriaaa'
        Size = -1
        Value = Null
      end
      item
        Name = 'Categoriaaaa'
        Size = -1
        Value = Null
      end
      item
        Name = 'Categoriaaaaa'
        Size = -1
        Value = Null
      end
      item
        Name = 'Categoriaaaaaa'
        Size = -1
        Value = Null
      end
      item
        Name = 'Sexo2'
        Size = -1
        Value = Null
      end
      item
        Name = 'Propriedade2'
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
        Name = 'li_min2'
        Size = -1
        Value = Null
      end
      item
        Name = 'li_max2'
        Size = -1
        Value = Null
      end
      item
        Name = 'Categoria2'
        Size = -1
        Value = Null
      end
      item
        Name = 'Categoriaa2'
        Size = -1
        Value = Null
      end
      item
        Name = 'Categoriaaa2'
        Size = -1
        Value = Null
      end
      item
        Name = 'Categoriaaaa2'
        Size = -1
        Value = Null
      end
      item
        Name = 'Categoriaaaaa2'
        Size = -1
        Value = Null
      end
      item
        Name = 'Categoriaaaaaa2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select CA.Codigo, CA.Brinco + '#39' - '#39' + CA.Nome as Animal, CA.Grau' +
        '_Sangue, CA.Codigo_Categoria, CA.Data_Nascimento, datediff(month' +
        ', CA.Data_Nascimento, getdate()) as idade_meses, '
      
        'datediff(day, CA.Data_Nascimento, getdate()) as idade_dias, CA.U' +
        'ltimo_Peso, CA.Data_Desmama, datediff(day, CA.Data_Desmama, getd' +
        'ate()) as dias_crescimento, CC.Descricao as Categoria,'
      ''
      '(select count(*) from Cadastro_Animal CA'
      ''
      ''
      
        'where Sexo = :Sexo and Codigo_Propriedade = :Propriedade and Bai' +
        'xada = :Nao and Vendida = :Naoo and Localizacao = :Local and'
      
        '(Ultimo_Peso >= :li_min) and (Ultimo_Peso <= :li_max) and Codigo' +
        '_Categoria <> :Categoria and Codigo_Categoria <> :Categoriaa'
      
        'and Codigo_Categoria <> :Categoriaaa and Codigo_Categoria <> :Ca' +
        'tegoriaaaa and Codigo_Categoria<> :Categoriaaaaa and Codigo_Cate' +
        'goria <> :Categoriaaaaaa) as Qtde '
      'from Cadastro_Animal CA'
      
        'left join Cadastro_Categoria CC on (CA.Codigo_Categoria = CC.Cod' +
        'igo)'
      ''
      ''
      
        'where Sexo = :Sexo2 and Codigo_Propriedade = :Propriedade2 and B' +
        'aixada = :Nao2 and Vendida = :Naoo2 and Localizacao = :Local2 an' +
        'd'
      
        '(Ultimo_Peso >= :li_min2) and (Ultimo_Peso <= :li_max2) and Codi' +
        'go_Categoria <> :Categoria2 and Codigo_Categoria <> :Categoriaa2' +
        ' '
      
        'and Codigo_Categoria<> :Categoriaaa2 and Codigo_Categoria<> :Cat' +
        'egoriaaaa2 and Codigo_Categoria<> :Categoriaaaaa2 and Codigo_Cat' +
        'egoria<> :Categoriaaaaaa2')
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
    object qryconsultaGrau_Sangue: TStringField
      FieldName = 'Grau_Sangue'
      Size = 30
    end
    object qryconsultaCodigo_Categoria: TIntegerField
      FieldName = 'Codigo_Categoria'
    end
    object qryconsultaData_Nascimento: TDateTimeField
      FieldName = 'Data_Nascimento'
    end
    object qryconsultaidade_meses: TIntegerField
      FieldName = 'idade_meses'
      ReadOnly = True
    end
    object qryconsultaidade_dias: TIntegerField
      FieldName = 'idade_dias'
      ReadOnly = True
    end
    object qryconsultaUltimo_Peso: TFloatField
      FieldName = 'Ultimo_Peso'
    end
    object qryconsultaData_Desmama: TDateTimeField
      FieldName = 'Data_Desmama'
    end
    object qryconsultadias_crescimento: TIntegerField
      FieldName = 'dias_crescimento'
      ReadOnly = True
    end
    object qryconsultaCategoria: TStringField
      FieldName = 'Categoria'
      Size = 50
    end
    object qryconsultaQtde: TIntegerField
      FieldName = 'Qtde'
      ReadOnly = True
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta
    Left = 501
    Top = 272
  end
end
