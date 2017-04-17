object FrmSecamento: TFrmSecamento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Secamento'
  ClientHeight = 525
  ClientWidth = 782
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
  Scaled = False
  Visible = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 125
    Top = 0
    Width = 657
    Height = 525
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object LblCodigo: TLabel
        Left = 0
        Top = 15
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 311
        Top = 60
        Width = 66
        Height = 13
        Caption = 'Diagn'#243'stico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 456
        Top = 99
        Width = 73
        Height = 13
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblAnimal: TLabel
        Left = 0
        Top = 60
        Width = 39
        Height = 13
        Caption = 'Animal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 55
        Top = 15
        Width = 64
        Height = 13
        Caption = 'Secamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 255
        Top = 125
        Width = 25
        Height = 13
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtCodigo: TEdit
        Left = 0
        Top = 32
        Width = 56
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 0
      end
      object MEdtData_Diagnostico: TMaskEdit
        Left = 311
        Top = 76
        Width = 66
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 4
        Text = '  /  /    '
        OnKeyPress = MEdtData_DiagnosticoKeyPress
      end
      object MMOObservacoes: TMemo
        Left = 456
        Top = 114
        Width = 176
        Height = 44
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ScrollBars = ssVertical
        TabOrder = 8
        OnExit = MMOObservacoesExit
      end
      object EdtAnimal: TEdit
        Left = 56
        Top = 76
        Width = 256
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 3
        OnKeyPress = EdtAnimalKeyPress
      end
      object EdtCodigo_Animal: TEdit
        Left = 0
        Top = 76
        Width = 56
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clBtnFace
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnKeyDown = EdtCodigo_AnimalKeyDown
        OnKeyPress = EdtCodigo_AnimalKeyPress
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 164
        Width = 632
        Height = 323
        Caption = 'Dados Animal'
        TabOrder = 9
        object DBGrid2: TDBGrid
          Left = 10
          Top = 19
          Width = 611
          Height = 293
          Hint = 
            'Pressione Delete para remover itens lan'#231'ados. Caso deseje remove' +
            'r um item j'#225' salvo, d'#234' duplo clique no registro desejado e cliqu' +
            'e no bot'#227'o Excluir'
          BorderStyle = bsNone
          DataSource = DataSource1
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyDown = DBGrid2KeyDown
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
              FieldName = 'Codigo_Animal'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Animal'
              Width = 218
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Codigo_Lote'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Lote'
              Width = 146
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Motivo'
              Width = 115
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Data_Secamento'
              Title.Caption = 'Secamento'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Observacao'
              Title.Caption = 'Obs.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Codigo_Categoria'
              Visible = False
            end>
        end
      end
      object MEdtData_Secamento: TMaskEdit
        Left = 55
        Top = 32
        Width = 66
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = MEdtData_SecamentoEnter
        OnExit = MEdtData_SecamentoExit
      end
      object RGMotivo: TRadioGroup
        Left = 0
        Top = 95
        Width = 247
        Height = 63
        Caption = 'Motivo'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Prenhes Confirmada'
          'Matriz Vazia'
          'Baixa Produ'#231#227'o'
          'Descarte'
          'Outros')
        TabOrder = 5
      end
      object EdtLote: TEdit
        Left = 311
        Top = 141
        Width = 139
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 7
        OnKeyPress = EdtLoteKeyPress
      end
      object EdtCodigo_Lote: TEdit
        Left = 255
        Top = 141
        Width = 56
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clBtnFace
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnKeyDown = EdtCodigo_LoteKeyDown
        OnKeyPress = EdtCodigo_LoteKeyPress
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 525
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 121
    DockSite = True
    DragCursor = crHandPoint
    DragKind = dkDock
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
    HideClippedButtons = True
    HotTrackColor = clMenu
    Images = DM.ImgComandos
    List = True
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = False
    TabOrder = 1
    object BBtnSalvar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para Salvar/Alterar o registro'
      Caption = '&Salvar'
      Enabled = False
      ImageIndex = 0
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnSalvarClick
    end
    object BBtnExcluir: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para Excluir o registro selecionado'
      Caption = '&Excluir'
      Enabled = False
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnExcluirClick
    end
    object BBtnPesquisar: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para pesquisar um registro desejado'
      Caption = '&Pesquisar'
      ImageIndex = 2
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnPesquisarClick
    end
    object BBtnCancelar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Hint = 'Clique para Cancelar a Inser'#231#227'o ou Altera'#231#227'o de um registro'
      Caption = '&Cancelar'
      Enabled = False
      ImageIndex = 3
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnCancelarClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 152
      Cursor = crHandPoint
      Hint = 'Clique para Fechar a Janela Ativa'
      Caption = '&Fechar Janela'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select S.*, CA.Brinco + '#39' - '#39' + CA.Nome as Animal, CA.Codigo_Cat' +
        'egoria, CL.Descricao as Lote from Secamento S'
      'left join Cadastro_Animal CA on (S.Codigo_Animal = CA.Codigo)'
      'left join Cadastro_Lote CL on (S.Codigo_Lote = CL.Codigo)'
      'order by CA.Nome')
    Left = 384
    Top = 264
    object ADOQuery1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ADOQuery1Codigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object ADOQuery1Codigo_Animal: TIntegerField
      FieldName = 'Codigo_Animal'
    end
    object ADOQuery1Codigo_Lote: TIntegerField
      FieldName = 'Codigo_Lote'
    end
    object ADOQuery1Motivo: TStringField
      FieldName = 'Motivo'
      Size = 30
    end
    object ADOQuery1Data_Secamento: TDateTimeField
      FieldName = 'Data_Secamento'
    end
    object ADOQuery1Observacao: TStringField
      FieldName = 'Observacao'
      Size = 300
    end
    object ADOQuery1Animal: TStringField
      FieldName = 'Animal'
      ReadOnly = True
      Size = 83
    end
    object ADOQuery1Codigo_Categoria: TIntegerField
      FieldName = 'Codigo_Categoria'
    end
    object ADOQuery1Lote: TStringField
      FieldName = 'Lote'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 416
    Top = 264
  end
  object qryconsulta_periodo_lactacao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CA.Codigo, CA.Nome, CA.Brinco, CA.Data_Ultima_Paricao, CA' +
        '.Data_Ultimo_Secamento, (sum(ILI.Total) / count(ILI.Codigo_Anima' +
        'l)), (datediff(day, CA.Data_Ultima_Paricao, getdate())),'
      
        '(sum(ILI.Total) / count(ILI.Codigo_Animal) * (datediff(day, CA.D' +
        'ata_Ultima_Paricao, getdate()))) from Cadastro_Animal CA'
      
        'inner join Itens_Leite_Individual ILI on(CA.Codigo = ILI.Codigo_' +
        'Animal)'
      ''
      
        'group by CA.Codigo, CA.Nome, CA.Brinco, CA.Data_Ultima_Paricao, ' +
        'CA.Data_Ultimo_Secamento')
    Left = 384
    Top = 336
    object qryconsulta_periodo_lactacaoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_periodo_lactacaoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryconsulta_periodo_lactacaoBrinco: TStringField
      FieldName = 'Brinco'
      Size = 30
    end
    object qryconsulta_periodo_lactacaoData_Ultima_Paricao: TDateTimeField
      FieldName = 'Data_Ultima_Paricao'
    end
    object qryconsulta_periodo_lactacaoData_Ultimo_Secamento: TDateTimeField
      FieldName = 'Data_Ultimo_Secamento'
    end
    object qryconsulta_periodo_lactacaoCOLUMN1: TFloatField
      FieldName = 'COLUMN1'
      ReadOnly = True
    end
    object qryconsulta_periodo_lactacaoCOLUMN2: TIntegerField
      FieldName = 'COLUMN2'
      ReadOnly = True
    end
    object qryconsulta_periodo_lactacaoCOLUMN3: TFloatField
      FieldName = 'COLUMN3'
      ReadOnly = True
    end
  end
  object qryperiodo_lactacao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from periodo_lactacao')
    Left = 432
    Top = 335
    object qryperiodo_lactacaoCodigo_Animal: TIntegerField
      FieldName = 'Codigo_Animal'
    end
    object qryperiodo_lactacaoCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qryperiodo_lactacaoPeriodo: TIntegerField
      FieldName = 'Periodo'
    end
    object qryperiodo_lactacaoUltimo_Paricao: TDateTimeField
      FieldName = 'Ultimo_Paricao'
    end
    object qryperiodo_lactacaoUltimo_Secamento: TDateTimeField
      FieldName = 'Ultimo_Secamento'
    end
    object qryperiodo_lactacaoMedia_Diaria: TFloatField
      FieldName = 'Media_Diaria'
    end
    object qryperiodo_lactacaoDias_Lactacao: TIntegerField
      FieldName = 'Dias_Lactacao'
    end
    object qryperiodo_lactacaoTotal_Litros: TFloatField
      FieldName = 'Total_Litros'
    end
  end
end
