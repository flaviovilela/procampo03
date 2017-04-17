object FrmParto: TFrmParto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Parto'
  ClientHeight = 384
  ClientWidth = 734
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
    Width = 609
    Height = 384
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object LblCodigo: TLabel
        Left = 0
        Top = 13
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
      object LblData_Cadastro: TLabel
        Left = 55
        Top = 13
        Width = 81
        Height = 13
        Caption = 'Data Cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblMarca: TLabel
        Left = 0
        Top = 61
        Width = 24
        Height = 13
        Caption = 'M'#227'e'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 0
        Top = 102
        Width = 17
        Height = 13
        Caption = 'Pai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 223
        Top = 237
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
      object MEdtData_Cadastro: TMaskEdit
        Left = 55
        Top = 32
        Width = 81
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = MEdtData_CadastroEnter
        OnExit = MEdtData_CadastroExit
      end
      object EdtMae: TEdit
        Left = 56
        Top = 76
        Width = 243
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 3
        OnKeyPress = EdtMaeKeyPress
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 140
        Width = 536
        Height = 98
        Caption = 'Dados do Parto'
        TabOrder = 6
        object Label1: TLabel
          Left = 13
          Top = 16
          Width = 61
          Height = 13
          Caption = 'Data Parto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 110
          Top = 16
          Width = 61
          Height = 13
          Caption = 'Crias Vivas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 190
          Top = 16
          Width = 63
          Height = 13
          Caption = 'Natimortos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 269
          Top = 16
          Width = 66
          Height = 13
          Caption = 'Peso Matriz'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 13
          Top = 57
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
        object MEdtData_Parto: TMaskEdit
          Left = 13
          Top = 35
          Width = 74
          Height = 17
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
          OnEnter = MEdtData_PartoEnter
          OnExit = MEdtData_PartoExit
        end
        object EdtN_Cria_Vivas: TEdit
          Left = 110
          Top = 35
          Width = 61
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object EdtNatimortos: TEdit
          Left = 190
          Top = 35
          Width = 63
          Height = 16
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 2
        end
        object CBRetencao: TCheckBox
          Left = 386
          Top = 39
          Width = 129
          Height = 17
          Caption = 'Reten'#231#227'o de Placenta?'
          TabOrder = 5
        end
        object CBParto_Normal: TCheckBox
          Left = 386
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Parto Normal?'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object EdtPeso_Matriz: TEdit
          Left = 269
          Top = 35
          Width = 66
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object EdtLote: TEdit
          Left = 69
          Top = 73
          Width = 184
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
          Left = 13
          Top = 73
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
      object EdtPai: TEdit
        Left = 56
        Top = 117
        Width = 243
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 5
        OnKeyPress = EdtPaiKeyPress
      end
      object EdtCodigo_Pai: TEdit
        Left = 0
        Top = 117
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
        TabOrder = 4
        OnKeyDown = EdtCodigo_PaiKeyDown
        OnKeyPress = EdtCodigo_PaiKeyPress
      end
      object EdtCodigo_Mae: TEdit
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
        OnKeyDown = EdtCodigo_MaeKeyDown
        OnKeyPress = EdtCodigo_MaeKeyPress
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 243
        Width = 217
        Height = 92
        Caption = 'Crias'
        TabOrder = 7
        object CmbCria1: TComboBox
          Left = 79
          Top = 13
          Width = 113
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 1
          Items.Strings = (
            'MACHO'
            'F'#202'MEA')
        end
        object CmbCria2: TComboBox
          Left = 79
          Top = 40
          Width = 113
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 3
          Items.Strings = (
            'MACHO'
            'F'#202'MEA')
        end
        object CmbCria3: TComboBox
          Left = 79
          Top = 67
          Width = 113
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 5
          Items.Strings = (
            'MACHO'
            'F'#202'MEA')
        end
        object CBCria1: TCheckBox
          Left = 24
          Top = 15
          Width = 52
          Height = 17
          Caption = 'Cria 1'
          TabOrder = 0
        end
        object CBCria2: TCheckBox
          Left = 24
          Top = 42
          Width = 52
          Height = 17
          Caption = 'Cria 2'
          TabOrder = 2
        end
        object CBCria3: TCheckBox
          Left = 24
          Top = 69
          Width = 52
          Height = 17
          Caption = 'Cria 3'
          TabOrder = 4
        end
      end
      object MMObservacao: TMemo
        Left = 223
        Top = 256
        Width = 274
        Height = 79
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Lines.Strings = (
          '')
        ScrollBars = ssVertical
        TabOrder = 8
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 384
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
      'select CA.* from Cadastro_Animal CA')
    Left = 488
    Top = 104
    object ADOQuery1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ADOQuery1Codigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object ADOQuery1Codigo_Propriedade_Anterior: TIntegerField
      FieldName = 'Codigo_Propriedade_Anterior'
    end
    object ADOQuery1Localizacao: TStringField
      FieldName = 'Localizacao'
      Size = 15
    end
    object ADOQuery1Nome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object ADOQuery1Brinco: TStringField
      FieldName = 'Brinco'
      Size = 30
    end
    object ADOQuery1Sexo: TStringField
      FieldName = 'Sexo'
      Size = 10
    end
    object ADOQuery1Codigo_Categoria_Inicial: TIntegerField
      FieldName = 'Codigo_Categoria_Inicial'
    end
    object ADOQuery1Codigo_Categoria: TIntegerField
      FieldName = 'Codigo_Categoria'
    end
    object ADOQuery1Codigo_Pai: TIntegerField
      FieldName = 'Codigo_Pai'
    end
    object ADOQuery1Codigo_Mae: TIntegerField
      FieldName = 'Codigo_Mae'
    end
    object ADOQuery1Grau_Sangue: TStringField
      FieldName = 'Grau_Sangue'
      Size = 30
    end
    object ADOQuery1Raca1: TStringField
      FieldName = 'Raca1'
      Size = 3
    end
    object ADOQuery1Codigo_Raca1: TIntegerField
      FieldName = 'Codigo_Raca1'
    end
    object ADOQuery1Sangue1: TIntegerField
      FieldName = 'Sangue1'
    end
    object ADOQuery1Sangue11: TIntegerField
      FieldName = 'Sangue11'
    end
    object ADOQuery1Raca2: TStringField
      FieldName = 'Raca2'
      Size = 3
    end
    object ADOQuery1Codigo_Raca2: TIntegerField
      FieldName = 'Codigo_Raca2'
    end
    object ADOQuery1Sangue2: TIntegerField
      FieldName = 'Sangue2'
    end
    object ADOQuery1Sangue22: TIntegerField
      FieldName = 'Sangue22'
    end
    object ADOQuery1Raca3: TStringField
      FieldName = 'Raca3'
      Size = 3
    end
    object ADOQuery1Codigo_Raca3: TIntegerField
      FieldName = 'Codigo_Raca3'
    end
    object ADOQuery1Sangue3: TIntegerField
      FieldName = 'Sangue3'
    end
    object ADOQuery1Sangue33: TIntegerField
      FieldName = 'Sangue33'
    end
    object ADOQuery1Raca4: TStringField
      FieldName = 'Raca4'
      Size = 3
    end
    object ADOQuery1Codigo_Raca4: TIntegerField
      FieldName = 'Codigo_Raca4'
    end
    object ADOQuery1Sangue4: TIntegerField
      FieldName = 'Sangue4'
    end
    object ADOQuery1Sangue44: TIntegerField
      FieldName = 'Sangue44'
    end
    object ADOQuery1Ultimo_Peso: TFloatField
      FieldName = 'Ultimo_Peso'
    end
    object ADOQuery1Ultima_Altura: TFloatField
      FieldName = 'Ultima_Altura'
    end
    object ADOQuery1IEP: TIntegerField
      FieldName = 'IEP'
    end
    object ADOQuery1Peso: TFloatField
      FieldName = 'Peso'
    end
    object ADOQuery1Altura: TFloatField
      FieldName = 'Altura'
    end
    object ADOQuery1Preco: TFloatField
      FieldName = 'Preco'
    end
    object ADOQuery1Data_Entrada: TDateTimeField
      FieldName = 'Data_Entrada'
    end
    object ADOQuery1Origem: TStringField
      FieldName = 'Origem'
    end
    object ADOQuery1Codigo_Cor: TIntegerField
      FieldName = 'Codigo_Cor'
    end
    object ADOQuery1Codigo_Pelagem: TIntegerField
      FieldName = 'Codigo_Pelagem'
    end
    object ADOQuery1Codigo_Lote_Anterior: TIntegerField
      FieldName = 'Codigo_Lote_Anterior'
    end
    object ADOQuery1Codigo_Lote: TIntegerField
      FieldName = 'Codigo_Lote'
    end
    object ADOQuery1Codigo_Piquete_Anterior: TIntegerField
      FieldName = 'Codigo_Piquete_Anterior'
    end
    object ADOQuery1Codigo_Piquete: TIntegerField
      FieldName = 'Codigo_Piquete'
    end
    object ADOQuery1Coberta: TStringField
      FieldName = 'Coberta'
      Size = 3
    end
    object ADOQuery1Diagnosticada: TStringField
      FieldName = 'Diagnosticada'
      Size = 3
    end
    object ADOQuery1Abortada: TStringField
      FieldName = 'Abortada'
      Size = 3
    end
    object ADOQuery1Seca: TStringField
      FieldName = 'Seca'
      Size = 3
    end
    object ADOQuery1Parida: TStringField
      FieldName = 'Parida'
      Size = 3
    end
    object ADOQuery1Baixada: TStringField
      FieldName = 'Baixada'
      Size = 3
    end
    object ADOQuery1Vendida: TStringField
      FieldName = 'Vendida'
      Size = 3
    end
    object ADOQuery1N_Partos: TIntegerField
      FieldName = 'N_Partos'
    end
    object ADOQuery1N_Abortos: TIntegerField
      FieldName = 'N_Abortos'
    end
    object ADOQuery1Crias_Vivas: TIntegerField
      FieldName = 'Crias_Vivas'
    end
    object ADOQuery1Crias_Mortas: TIntegerField
      FieldName = 'Crias_Mortas'
    end
    object ADOQuery1Ultima_Pesagem_Leite: TFloatField
      FieldName = 'Ultima_Pesagem_Leite'
    end
    object ADOQuery1Penultima_Pesagem_Leite: TFloatField
      FieldName = 'Penultima_Pesagem_Leite'
    end
    object ADOQuery1Media_Atual: TFloatField
      FieldName = 'Media_Atual'
    end
    object ADOQuery1Idade_Primeiro_Parto: TFloatField
      FieldName = 'Idade_Primeiro_Parto'
    end
    object ADOQuery1Codigo_Ultimo_Reprodutor: TIntegerField
      FieldName = 'Codigo_Ultimo_Reprodutor'
    end
    object ADOQuery1Codigo_Descarte: TIntegerField
      FieldName = 'Codigo_Descarte'
    end
    object ADOQuery1Data_Nascimento: TDateTimeField
      FieldName = 'Data_Nascimento'
    end
    object ADOQuery1Data_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object ADOQuery1Data_Desmama: TDateTimeField
      FieldName = 'Data_Desmama'
    end
    object ADOQuery1Data_Aptidao_Novilha: TDateTimeField
      FieldName = 'Data_Aptidao_Novilha'
    end
    object ADOQuery1Data_Ultima_Cobertura: TDateTimeField
      FieldName = 'Data_Ultima_Cobertura'
    end
    object ADOQuery1Data_Ultimo_Enxerto: TDateTimeField
      FieldName = 'Data_Ultimo_Enxerto'
    end
    object ADOQuery1Data_Ultimo_Aborto: TDateTimeField
      FieldName = 'Data_Ultimo_Aborto'
    end
    object ADOQuery1Data_Ultimo_Secamento: TDateTimeField
      FieldName = 'Data_Ultimo_Secamento'
    end
    object ADOQuery1Data_Ultima_Paricao: TDateTimeField
      FieldName = 'Data_Ultima_Paricao'
    end
    object ADOQuery1Data_Baixa: TDateTimeField
      FieldName = 'Data_Baixa'
    end
    object ADOQuery1Data_Previsao_Secamento: TDateTimeField
      FieldName = 'Data_Previsao_Secamento'
    end
    object ADOQuery1Data_Previsao_Paricao: TDateTimeField
      FieldName = 'Data_Previsao_Paricao'
    end
    object ADOQuery1Data_Previsao_Cobertura: TDateTimeField
      FieldName = 'Data_Previsao_Cobertura'
    end
    object ADOQuery1Data_Ultima_Pesagem: TDateTimeField
      FieldName = 'Data_Ultima_Pesagem'
    end
    object ADOQuery1Data_Ultima_Medicao: TDateTimeField
      FieldName = 'Data_Ultima_Medicao'
    end
    object ADOQuery1Data_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
    object ADOQuery1Observacoes: TStringField
      FieldName = 'Observacoes'
      Size = 500
    end
    object ADOQuery1Caminho_Foto: TStringField
      FieldName = 'Caminho_Foto'
      Size = 300
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CR.* from Cadastro_Raca CR')
    Left = 488
    Top = 56
    object ADOQuery2Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ADOQuery2Sigla: TStringField
      FieldName = 'Sigla'
      Size = 3
    end
    object ADOQuery2Descricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object ADOQuery2Data_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
  end
  object ADOQuery3: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select max(Codigo) as Cod from Cadastro_Animal')
    Left = 488
    Top = 8
    object ADOQuery3Cod: TIntegerField
      FieldName = 'Cod'
      ReadOnly = True
    end
  end
end
