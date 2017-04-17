object FrmConsulta_Lancamentos_Financeiros: TFrmConsulta_Lancamentos_Financeiros
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Contas Pagas/Recebidas'
  ClientHeight = 523
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
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 102
    Height = 523
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
    TabOrder = 0
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
    object BBtnLimpar: TToolButton
      Left = 0
      Top = 38
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
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para imprimir o relat'#243'rio'
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
      Top = 114
      Cursor = crHandPoint
      Hint = 'Clique para fechar a janela'
      Caption = '&Fechar'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object PageControl1: TPageControl
    Left = 102
    Top = 0
    Width = 850
    Height = 523
    Cursor = crHandPoint
    ActivePage = TabSheet3
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    object TabSheet3: TTabSheet
      Caption = 'Config. Rel.'
      ImageIndex = 2
      object Label7: TLabel
        Left = 596
        Top = 115
        Width = 20
        Height = 13
        Caption = 'Fim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 532
        Top = 115
        Width = 31
        Height = 13
        Caption = 'Inicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 191
        Top = 113
        Width = 72
        Height = 13
        Caption = 'Cli./Forn./P.F'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 3
        Top = 113
        Width = 30
        Height = 13
        Caption = 'Safra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 3
        Top = 153
        Width = 75
        Height = 13
        Caption = 'Lan. Banc'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RGConsulta_Lancamento: TRadioGroup
        Left = 237
        Top = 16
        Width = 140
        Height = 89
        Caption = 'Consulta Lan'#231'amentos'
        ItemIndex = 0
        Items.Strings = (
          'Tudo'
          'Documento'
          'Cli./Forn.'
          'Plano Financeiro')
        TabOrder = 3
        OnClick = RGConsulta_LancamentoClick
      end
      object EdtConsulta: TEdit
        Left = 252
        Top = 128
        Width = 281
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 9
      end
      object RGData: TRadioGroup
        Left = 383
        Top = 16
        Width = 86
        Height = 89
        Caption = 'Datas'
        ItemIndex = 0
        Items.Strings = (
          'Lan'#231'amento'
          'Vencimento'
          'Pagamento')
        TabOrder = 4
      end
      object RGTipo_Conta: TRadioGroup
        Left = 85
        Top = 16
        Width = 82
        Height = 89
        Caption = 'Tipo de Conta'
        ItemIndex = 0
        Items.Strings = (
          'Pagar'
          'Receber')
        TabOrder = 1
        OnClick = RGTipo_ContaClick
      end
      object MEdtData_Final: TMaskEdit
        Left = 596
        Top = 128
        Width = 63
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 11
        Text = '  /  /    '
      end
      object MEdtData_Inicial: TMaskEdit
        Left = 532
        Top = 128
        Width = 65
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 10
        Text = '  /  /    '
      end
      object EdtCodigo_Cli_For: TEdit
        Left = 191
        Top = 128
        Width = 62
        Height = 17
        Hint = 
          'Pressione F3 para consultar Cliente ou Fornecedor. Os demais par' +
          #226'metros, digite-os.'
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clMenu
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnKeyDown = EdtCodigo_Cli_ForKeyDown
        OnKeyPress = EdtCodigo_Cli_ForKeyPress
      end
      object RGTipo: TRadioGroup
        Left = 3
        Top = 16
        Width = 78
        Height = 89
        Caption = 'Tipo'
        ItemIndex = 0
        Items.Strings = (
          'Sint'#233'tico'
          'Pagar/Rec.'
          'Agrupado'
          'Sint'#233'tico 2')
        TabOrder = 0
        OnClick = RGTipoClick
      end
      object RGStatus: TRadioGroup
        Left = 475
        Top = 16
        Width = 79
        Height = 89
        Caption = 'Status'
        ItemIndex = 0
        Items.Strings = (
          'Pago'
          'Pendente')
        TabOrder = 5
      end
      object RGFiscal: TRadioGroup
        Left = 170
        Top = 16
        Width = 64
        Height = 89
        Caption = 'Fiscal'
        ItemIndex = 0
        Items.Strings = (
          'Tudo'
          'Sim'
          'N'#227'o')
        TabOrder = 2
      end
      object EdtSafra: TEdit
        Left = 64
        Top = 128
        Width = 128
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
      end
      object EdtCodigo_Safra: TEdit
        Left = 3
        Top = 128
        Width = 62
        Height = 17
        Hint = 
          'Pressione F3 para consultar Cliente ou Fornecedor. Os demais par' +
          #226'metros, digite-os.'
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clMenu
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnKeyDown = EdtCodigo_SafraKeyDown
        OnKeyPress = EdtCodigo_Cli_ForKeyPress
      end
      object RGOrdena_Por: TRadioGroup
        Left = 679
        Top = 16
        Width = 121
        Height = 89
        Caption = 'Ordena Por'
        ItemIndex = 0
        Items.Strings = (
          'C'#243'digo'
          'Nome'
          'Data Lan'#231'amento'
          'Data Vencimento'
          'Data Pagamento'
          'Plano Financeiro')
        TabOrder = 14
      end
      object RGAgrupa_Impressao: TRadioGroup
        Left = 560
        Top = 16
        Width = 114
        Height = 89
        Caption = 'Agrupar Impress'#227'o'
        ItemIndex = 0
        Items.Strings = (
          'Normal'
          'Plano Financeiro')
        TabOrder = 15
        OnClick = RGAgrupa_ImpressaoClick
      end
      object EdtLancamento_Bancario: TEdit
        Left = 64
        Top = 168
        Width = 469
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 13
        OnKeyPress = EdtLancamento_BancarioKeyPress
      end
      object EdtCodigo_Lancamento_Bancario: TEdit
        Left = 3
        Top = 168
        Width = 62
        Height = 17
        Hint = 
          'Pressione F3 para consultar Cliente ou Fornecedor. Os demais par' +
          #226'metros, digite-os.'
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clMenu
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnKeyDown = EdtCodigo_Lancamento_BancarioKeyDown
        OnKeyPress = EdtCodigo_Cli_ForKeyPress
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Sint'#233'tico'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 827
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Lan'#231'amento(s)'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 26
        Width = 827
        Height = 466
        Hint = 
          'Clique na linha de um determinado registro para verificar suas p' +
          'arcelas'
        BorderStyle = bsNone
        DataSource = DataSource1
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'N_Documento'
            Title.Caption = 'Documento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Tipo'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Codigo_Cli_For'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Historico'
            Title.Caption = 'Hist'#243'rico'
            Width = 174
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Lancamento'
            Title.Caption = 'Lan'#231'amento'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Vencimento'
            Title.Caption = 'Vencimento'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Pagamento'
            Title.Caption = 'Pagamento'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cheque'
            Title.Caption = 'N'#186' Cheque'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Conta'
            Title.Caption = 'N'#186' Conta'
            Visible = True
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Pagar/Receber'
      ImageIndex = 3
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 827
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Pagas/A Pagar'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid4: TDBGrid
        Left = 0
        Top = 28
        Width = 827
        Height = 215
        Hint = 
          'Clique na linha de um determinado registro para verificar suas p' +
          'arcelas'
        BorderStyle = bsNone
        DataSource = DataSource2
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'N_Documento'
            Title.Caption = 'Documento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Caption = 'Fornecedor'
            Width = 223
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Codigo_Empresa'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Tipo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Historico'
            Title.Caption = 'Hist'#243'rico'
            Width = 191
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Vencimento'
            Title.Caption = 'Vencimento'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Pagamento'
            Title.Caption = 'Pagamento'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Status'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Cheque'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Conta'
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 0
        Top = 249
        Width = 827
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Recebidas / A Receber'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object DBGrid5: TDBGrid
        Left = 0
        Top = 276
        Width = 827
        Height = 215
        Hint = 
          'Clique na linha de um determinado registro para verificar suas p' +
          'arcelas'
        BorderStyle = bsNone
        DataSource = DataSource3
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'N_Documento'
            Title.Caption = 'Documento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Caption = 'Cliente'
            Width = 224
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Codigo_Empresa'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Tipo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Historico'
            Title.Caption = 'Hist'#243'rico'
            Width = 187
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Vencimento'
            Title.Caption = 'Vencimento'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Pagamento'
            Title.Caption = 'Pagamento'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Status'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Cheque'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Conta'
            Visible = True
          end>
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Agrupado'
      ImageIndex = 3
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 842
        Height = 492
        ActivePage = TabSheet6
        Style = tsFlatButtons
        TabOrder = 0
        object TabSheet5: TTabSheet
          Caption = 'Cliente/Fornecedor'
          object DBGrid2: TDBGrid
            Left = 0
            Top = 0
            Width = 834
            Height = 461
            Hint = 
              'Clique na linha de um determinado registro para verificar suas p' +
              'arcelas'
            BorderStyle = bsNone
            DataSource = DataSource5
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = DBGrid1CellClick
            OnDrawColumnCell = DBGrid1DrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'Mes'
                Title.Caption = 'M'#234's'
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Nome'
                Width = 415
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Valor_Total'
                Title.Caption = 'Valor Total'
                Width = 110
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Percentual'
                Title.Caption = '%'
                Width = 54
                Visible = True
              end>
          end
          object BitBtn2: TBitBtn
            Left = 727
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Imprimir'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E6E6DCCFCED5C4C6B4AF
              B1E2E4E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DCDBDBB5B5B4BB
              BABAD3C8C5E1C9B8E3E3B2A9CD93A390848A7274C8C4C6FFFFFFFFFFFFFFFFFF
              F3F3F3D9D8D8D1D0D0D8D7D7B0B0AF8C7872DEAD94E6C8B45CAE6F41BF5C80D4
              84CECAA9BCA59DEDEAE9FFFEFEDDDDDCCFCECDE2E1E1F5F4F4F1F0F0CACACAAD
              8E827F63582A67932890D97BAB967DC462E3E8BCFFEBDFF6F2EFF0EFEFDDDCDB
              F7F7F7F5F4F4ECEAEBE7E6E5D9D8D8C1BAB79C8D895C5F6A79717AD4A993ECC2
              B0F5E5E0FEFDFDFFFFFFECECEBE4E3E2F0EFEFE8E6E6E1E0DFE3E1E1DEDEDED2
              D8DACDD1D2C2B3ACAF8A7B7E605B8A8382E9ECEDFFFFFFFFFFFFEDEDECDCDADA
              E6E5E4DDDBDADCDBDAEBEEEDDDD3D1C9917ECDB9B1D2DADDC6C9CAABA4A49D9C
              9BE7E6E6FFFFFFFFFFFFF5F5F5D5D3D2DFDDDCE0DEDDECECF2E8EAF4EEB5A0DE
              643AC65A34C58C78D1CBC9D2D7D6B3B1B0E5E4E4FFFFFFFFFFFFFFFFFFC8C7C6
              CACACAE5EAE6E7ECE8EBCCC5FEB48DFCA17CF0845FD55E35C3603ECEACA1BFC1
              C1EDEDEDFFFFFFFFFFFFFFFFFFD0D1D1CCBBB5CEB7A9E0B090FFC299FFCCA5FE
              C39DFEB18CFA9B76E9744AD19E8CC6CACBFDFDFDFFFFFFFFFFFFFFFFFFF1F3F4
              EFC5B2F9D7C2E5C4AFDDA78CF3B08DFFC9A0FFCBA2FFBB92FDC5ADCCCAC9E5E6
              E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD8C5FEE9DAFFF2E1F3DCC7DEB9A4E1
              A68AF3BC9AF3D9C2DADAD8DEE0E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FEE4D1FEE8D7FFF9F3FFF4E8FFEEDCDAC4B8D8D0CEDADBDDEDEDEEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8FFEAD9FEE5D1FFF2E7FFF8F2E6
              D6CDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFF5EDFFE7D2FFE7D4E9DACFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEFE3FC
              F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            TabOrder = 1
            OnClick = BitBtn2Click
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'Plano Financeiro'
          ImageIndex = 1
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 834
            Height = 461
            Hint = 
              'Clique na linha de um determinado registro para verificar suas p' +
              'arcelas'
            BorderStyle = bsNone
            DataSource = DataSource4
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = DBGrid1CellClick
            OnDrawColumnCell = DBGrid1DrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'Mes'
                Title.Caption = 'M'#234's/Ano'
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Title.Caption = 'Plano'
                Width = 415
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Valor_Total'
                Title.Caption = 'Valor Total'
                Width = 110
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Percentual'
                Title.Caption = '%'
                Width = 54
                Visible = True
              end>
          end
          object BitBtn1: TBitBtn
            Left = 727
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Imprimir'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E6E6DCCFCED5C4C6B4AF
              B1E2E4E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DCDBDBB5B5B4BB
              BABAD3C8C5E1C9B8E3E3B2A9CD93A390848A7274C8C4C6FFFFFFFFFFFFFFFFFF
              F3F3F3D9D8D8D1D0D0D8D7D7B0B0AF8C7872DEAD94E6C8B45CAE6F41BF5C80D4
              84CECAA9BCA59DEDEAE9FFFEFEDDDDDCCFCECDE2E1E1F5F4F4F1F0F0CACACAAD
              8E827F63582A67932890D97BAB967DC462E3E8BCFFEBDFF6F2EFF0EFEFDDDCDB
              F7F7F7F5F4F4ECEAEBE7E6E5D9D8D8C1BAB79C8D895C5F6A79717AD4A993ECC2
              B0F5E5E0FEFDFDFFFFFFECECEBE4E3E2F0EFEFE8E6E6E1E0DFE3E1E1DEDEDED2
              D8DACDD1D2C2B3ACAF8A7B7E605B8A8382E9ECEDFFFFFFFFFFFFEDEDECDCDADA
              E6E5E4DDDBDADCDBDAEBEEEDDDD3D1C9917ECDB9B1D2DADDC6C9CAABA4A49D9C
              9BE7E6E6FFFFFFFFFFFFF5F5F5D5D3D2DFDDDCE0DEDDECECF2E8EAF4EEB5A0DE
              643AC65A34C58C78D1CBC9D2D7D6B3B1B0E5E4E4FFFFFFFFFFFFFFFFFFC8C7C6
              CACACAE5EAE6E7ECE8EBCCC5FEB48DFCA17CF0845FD55E35C3603ECEACA1BFC1
              C1EDEDEDFFFFFFFFFFFFFFFFFFD0D1D1CCBBB5CEB7A9E0B090FFC299FFCCA5FE
              C39DFEB18CFA9B76E9744AD19E8CC6CACBFDFDFDFFFFFFFFFFFFFFFFFFF1F3F4
              EFC5B2F9D7C2E5C4AFDDA78CF3B08DFFC9A0FFCBA2FFBB92FDC5ADCCCAC9E5E6
              E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD8C5FEE9DAFFF2E1F3DCC7DEB9A4E1
              A68AF3BC9AF3D9C2DADAD8DEE0E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FEE4D1FEE8D7FFF9F3FFF4E8FFEEDCDAC4B8D8D0CEDADBDDEDEDEEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8FFEAD9FEE5D1FFF2E7FFF8F2E6
              D6CDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFF5EDFFE7D2FFE7D4E9DACFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEFE3FC
              F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            TabOrder = 1
            OnClick = BitBtn1Click
          end
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Sint'#233'tico 2'
      ImageIndex = 4
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 827
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Lan'#231'amento(s)'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid6: TDBGrid
        Left = 0
        Top = 26
        Width = 827
        Height = 466
        Hint = 
          'Clique na linha de um determinado registro para verificar suas p' +
          'arcelas'
        BorderStyle = bsNone
        DataSource = DataSource6
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Tipo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'N_Documento_1'
            Title.Caption = 'N'#186' Documento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'N_Documento'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Caption = 'Cliente'
            Width = 232
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Codigo_Empresa'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Codigo_Forma_Pagamento'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Codigo_Cli_For'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Codigo_Tipo_Documento'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Historico'
            Width = 175
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Codigo_Departamento'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Codigo_Plano'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Codigo_Safra'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Data_Lancamento'
            Title.Caption = 'Lan'#231'amento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Vencimento'
            Title.Caption = 'Vencimento'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Valor_Documento'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Desconto'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Multa'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Valor_Cobrado'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Status'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Fiscal'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Codigo_1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Data_Vencimento_1'
            Title.Caption = 'Vencimento'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Pagamento'
            Title.Caption = 'Pagamento'
            Width = 65
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Parcela'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Status_1'
            Title.Caption = 'Status'
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Valor'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cheque'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Conta'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Codigo_Lancamento_Bancario'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Observacoes'
            Title.Caption = 'Observa'#231#245'es'
            Width = 300
            Visible = True
          end>
      end
    end
  end
  object qryconsulta_lancamento: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select LF.*, PL.*, Cli.Nome, CP.Descricao, TD.Descricao, D.Descr' +
        'icao, PF.Plano'
      'from Lancamento_Financeiro LF'
      
        'left join Parcelas_Lancamentos PL on (LF.N_Documento = PL.N_Docu' +
        'mento)'
      
        'left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo' +
        ')'
      
        'left join Condicao_Pagamento CP on(LF.Codigo_Forma_Pagamento = C' +
        'P.Codigo)'
      
        'left join Cadastro_Tipo_Documento TD on(LF.Codigo_Tipo_Documento' +
        ' = TD.Codigo)'
      
        'left join Cadastro_Departamento D on(LF.Codigo_Departamento = D.' +
        'Codigo)'
      
        'left join Cadastro_Plano_Financeiro PF on(LF.Codigo_Plano = PF.C' +
        'odigo)')
    Left = 418
    Top = 369
    object qryconsulta_lancamentoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_lancamentoTipo: TStringField
      FieldName = 'Tipo'
      Size = 7
    end
    object qryconsulta_lancamentoN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryconsulta_lancamentoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryconsulta_lancamentoCodigo_Forma_Pagamento: TIntegerField
      FieldName = 'Codigo_Forma_Pagamento'
    end
    object qryconsulta_lancamentoCodigo_Cli_For: TIntegerField
      FieldName = 'Codigo_Cli_For'
    end
    object qryconsulta_lancamentoCodigo_Tipo_Documento: TIntegerField
      FieldName = 'Codigo_Tipo_Documento'
    end
    object qryconsulta_lancamentoHistorico: TStringField
      FieldName = 'Historico'
      Size = 70
    end
    object qryconsulta_lancamentoCodigo_Departamento: TIntegerField
      FieldName = 'Codigo_Departamento'
    end
    object qryconsulta_lancamentoCodigo_Plano: TIntegerField
      FieldName = 'Codigo_Plano'
    end
    object qryconsulta_lancamentoCodigo_Safra: TIntegerField
      FieldName = 'Codigo_Safra'
    end
    object qryconsulta_lancamentoData_Lancamento: TDateTimeField
      FieldName = 'Data_Lancamento'
    end
    object qryconsulta_lancamentoData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qryconsulta_lancamentoValor_Documento: TFloatField
      FieldName = 'Valor_Documento'
    end
    object qryconsulta_lancamentoDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qryconsulta_lancamentoMulta: TFloatField
      FieldName = 'Multa'
    end
    object qryconsulta_lancamentoValor_Cobrado: TFloatField
      FieldName = 'Valor_Cobrado'
    end
    object qryconsulta_lancamentoStatus: TStringField
      FieldName = 'Status'
      Size = 15
    end
    object qryconsulta_lancamentoFiscal: TIntegerField
      FieldName = 'Fiscal'
    end
    object qryconsulta_lancamentoCodigo_1: TIntegerField
      FieldName = 'Codigo_1'
    end
    object qryconsulta_lancamentoN_Documento_1: TIntegerField
      FieldName = 'N_Documento_1'
    end
    object qryconsulta_lancamentoData_Vencimento_1: TDateTimeField
      FieldName = 'Data_Vencimento_1'
    end
    object qryconsulta_lancamentoData_Pagamento: TDateTimeField
      FieldName = 'Data_Pagamento'
    end
    object qryconsulta_lancamentoParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object qryconsulta_lancamentoStatus_1: TStringField
      FieldName = 'Status_1'
      Size = 8
    end
    object qryconsulta_lancamentoValor: TFloatField
      FieldName = 'Valor'
    end
    object qryconsulta_lancamentoCheque: TStringField
      FieldName = 'Cheque'
      Size = 15
    end
    object qryconsulta_lancamentoConta: TStringField
      FieldName = 'Conta'
      Size = 15
    end
    object qryconsulta_lancamentoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryconsulta_lancamentoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object qryconsulta_lancamentoDescricao_1: TStringField
      FieldName = 'Descricao_1'
      Size = 50
    end
    object qryconsulta_lancamentoDescricao_2: TStringField
      FieldName = 'Descricao_2'
      Size = 30
    end
    object qryconsulta_lancamentoPlano: TStringField
      FieldName = 'Plano'
      Size = 100
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_lancamento
    Left = 450
    Top = 369
  end
  object ds_qry_consulta_parcelas: TDataSource
    DataSet = qryconsulta_parcelas
    Left = 450
    Top = 416
  end
  object qryconsulta_parcelas: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select PL.*, MC.Dinheiro, MC.Cheque_Vista, MC.Cheque_Prazo, MC.C' +
        'artao, MC.Juros, MC.Desconto from Parcelas_Lancamentos PL '
      
        'left join Movimento_Caixa MC on (PL.N_Documento = MC.N_Documento' +
        ')')
    Left = 418
    Top = 416
    object qryconsulta_parcelasCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_parcelasN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryconsulta_parcelasData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qryconsulta_parcelasData_Pagamento: TDateTimeField
      FieldName = 'Data_Pagamento'
    end
    object qryconsulta_parcelasParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object qryconsulta_parcelasStatus: TStringField
      FieldName = 'Status'
      Size = 8
    end
    object qryconsulta_parcelasValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_parcelasDinheiro: TFloatField
      FieldName = 'Dinheiro'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_parcelasCheque_Vista: TFloatField
      FieldName = 'Cheque_Vista'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_parcelasCheque_Prazo: TFloatField
      FieldName = 'Cheque_Prazo'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_parcelasCartao: TFloatField
      FieldName = 'Cartao'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_parcelasJuros: TFloatField
      FieldName = 'Juros'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_parcelasDesconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_parcelasCheque: TStringField
      FieldName = 'Cheque'
      Size = 15
    end
    object qryconsulta_parcelasConta: TStringField
      FieldName = 'Conta'
      Size = 15
    end
  end
  object DataSource1: TDataSource
    DataSet = qryconsulta_lancamento_sintetico
    Left = 386
    Top = 417
  end
  object QRCompositeReport1: TQRCompositeReport
    Options = []
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrinterSettings.Orientation = poPortrait
    PrinterSettings.PaperSize = Letter
    PageCount = 0
    Left = 808
  end
  object DataSource2: TDataSource
    DataSet = qrypagar_agrupado
    Left = 850
    Top = 185
  end
  object qrypagar_agrupado: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select PL.Codigo, PL.N_Documento, LF.Codigo_Empresa, LF.Tipo, LF' +
        '.Historico, PL.Data_Vencimento, PL.Data_Pagamento, PL.Valor, '
      
        'PL.Status, PL.Cheque, PL.Conta, Cli.Nome from Lancamento_Finance' +
        'iro LF'
      
        'left join Parcelas_Lancamentos PL on (LF.N_Documento = PL.N_Docu' +
        'mento)'
      
        'left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo' +
        ')')
    Left = 818
    Top = 185
    object qrypagar_agrupadoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrypagar_agrupadoN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qrypagar_agrupadoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qrypagar_agrupadoTipo: TStringField
      FieldName = 'Tipo'
      Size = 7
    end
    object qrypagar_agrupadoHistorico: TStringField
      FieldName = 'Historico'
      Size = 70
    end
    object qrypagar_agrupadoData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qrypagar_agrupadoData_Pagamento: TDateTimeField
      FieldName = 'Data_Pagamento'
    end
    object qrypagar_agrupadoValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object qrypagar_agrupadoStatus: TStringField
      FieldName = 'Status'
      Size = 8
    end
    object qrypagar_agrupadoCheque: TStringField
      FieldName = 'Cheque'
      Size = 30
    end
    object qrypagar_agrupadoConta: TStringField
      FieldName = 'Conta'
      Size = 30
    end
    object qrypagar_agrupadoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object qryreceber_agrupado: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select PL.Codigo, PL.N_Documento, LF.Codigo_Empresa, LF.Tipo, LF' +
        '.Historico, PL.Data_Vencimento, PL.Data_Pagamento, PL.Valor, '
      
        'PL.Status, PL.Cheque, PL.Conta, Cli.Nome from Lancamento_Finance' +
        'iro LF'
      
        'left join Parcelas_Lancamentos PL on (LF.N_Documento = PL.N_Docu' +
        'mento)'
      
        'left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo' +
        ')')
    Left = 866
    Top = 369
    object IntegerField1: TIntegerField
      FieldName = 'Codigo'
    end
    object IntegerField2: TIntegerField
      FieldName = 'N_Documento'
    end
    object IntegerField3: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object StringField1: TStringField
      FieldName = 'Tipo'
      Size = 7
    end
    object StringField2: TStringField
      FieldName = 'Historico'
      Size = 70
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'Data_Pagamento'
    end
    object FloatField1: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object StringField3: TStringField
      FieldName = 'Status'
      Size = 8
    end
    object qryreceber_agrupadoCheque: TStringField
      FieldName = 'Cheque'
      Size = 30
    end
    object qryreceber_agrupadoConta: TStringField
      FieldName = 'Conta'
      Size = 30
    end
    object qryreceber_agrupadoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object DataSource3: TDataSource
    DataSet = qryreceber_agrupado
    Left = 858
    Top = 401
  end
  object qryagrupado_plano: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Y.Mes,'
      '       Y.Descricao,'
      #9'   Y.Valor_Total,'
      #9'   (Y.Valor_Total / Y.Total_Geral) * 100 as Percentual'
      'from('
      #9'   select'
      #9'   case when grouping(PF.Descricao) = 0 then PF.Descricao '
      #9#9#9'when grouping(PF.Descricao) = 1  then '#39'TOTAL------>'#39' '
      #9'   end as Descricao, '
      ''
      '       sum(tip.Valor) as Valor_Total,'
      
        #9'   convert(varchar(2),month(tip.Data_Vencimento)) + '#39'/'#39' + conve' +
        'rt(varchar(4),year(tip.Data_Vencimento)) as Mes,'
      '      (select sum(tip.Valor) from Parcelas_Lancamentos tip'
      
        '      left join Lancamento_Financeiro t on (tip.Codigo = t.Codig' +
        'o)'
      
        '      where tip.Data_Vencimento between '#39'01/01/2012'#39' and '#39'31/05/' +
        '2013'#39' and tip.Status = '#39'PENDENTE'#39' and t.Tipo = '#39'RECEBER'#39') as Tot' +
        'al_Geral '
      '       '
      '        from Parcelas_Lancamentos tip'
      'left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)'
      
        'left join Cadastro_Plano_Financeiro PF on (t.Codigo_Plano = PF.C' +
        'odigo)'
      
        'where tip.Data_Vencimento between '#39'01/01/2012'#39' and '#39'31/05/2013'#39' ' +
        'and tip.Status = '#39'PENDENTE'#39' and t.Tipo = '#39'RECEBER'#39
      
        'group by convert(varchar(2),month(tip.Data_Vencimento)) + '#39'/'#39' + ' +
        'convert(varchar(4),year(tip.Data_Vencimento)), PF.Codigo_SubNive' +
        'l, PF.Descricao'
      'with RollUP) Y ')
    Left = 887
    Top = 145
    object qryagrupado_planoMes: TStringField
      FieldName = 'Mes'
      ReadOnly = True
      Size = 7
    end
    object qryagrupado_planoDescricao: TStringField
      FieldName = 'Descricao'
      ReadOnly = True
      Size = 300
    end
    object qryagrupado_planoValor_Total: TFloatField
      FieldName = 'Valor_Total'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryagrupado_planoPercentual: TFloatField
      FieldName = 'Percentual'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
  end
  object DataSource4: TDataSource
    DataSet = qryagrupado_plano
    Left = 783
    Top = 145
  end
  object qryagrupado_cli_forn: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Y.Mes,'
      '       Y.Nome,'
      #9'   Y.Valor_Total,'
      #9'   (Y.Valor_Total / Y.Total_Geral) * 100 as Percentual'
      'from('
      #9'   select'
      #9#9'case when (t.Tipo = '#39'PAGAR'#39') then'
      
        #9#9'(select Forn.Nome_Fantasia from Fornecedores Forn where t.Codi' +
        'go_Cli_For = Forn.Codigo)'
      #9#9'when (t.Tipo = '#39'RECEBER'#39') then'
      
        #9#9'(select Cli.Nome from Cadastro_Cliente Cli where t.Codigo_Cli_' +
        'For = Cli.Codigo) end as Nome,'
      #9'   '
      '       sum(tip.Valor) as Valor_Total,'
      
        #9'   convert(varchar(2),month(tip.Data_Vencimento)) + '#39'/'#39' + conve' +
        'rt(varchar(4),year(tip.Data_Vencimento)) as Mes,'
      '      (select sum(tip.Valor) from Parcelas_Lancamentos tip'
      
        '      left join Lancamento_Financeiro t on (tip.Codigo = t.Codig' +
        'o)'
      
        '      where tip.Data_Vencimento between '#39'01/01/2012'#39' and '#39'31/05/' +
        '2013'#39' and tip.Status = '#39'PENDENTE'#39' and t.Tipo = '#39'RECEBER'#39') as Tot' +
        'al_Geral '
      '       '
      '        from Parcelas_Lancamentos tip'
      'left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)'
      
        'left join Cadastro_Plano_Financeiro PF on (t.Codigo_Plano = PF.C' +
        'odigo)'
      
        'where tip.Data_Vencimento between '#39'01/01/2012'#39' and '#39'31/05/2013'#39' ' +
        'and tip.Status = '#39'PENDENTE'#39' and t.Tipo = '#39'RECEBER'#39
      
        'group by t.Tipo, convert(varchar(2),month(tip.Data_Vencimento)) ' +
        '+ '#39'/'#39' + convert(varchar(4),year(tip.Data_Vencimento)), t.Codigo_' +
        'Cli_For'
      'with rollup ) Y ')
    Left = 847
    Top = 145
    object qryagrupado_cli_fornMes: TStringField
      FieldName = 'Mes'
      ReadOnly = True
      Size = 7
    end
    object qryagrupado_cli_fornNome: TStringField
      FieldName = 'Nome'
      ReadOnly = True
      Size = 50
    end
    object qryagrupado_cli_fornValor_Total: TFloatField
      FieldName = 'Valor_Total'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryagrupado_cli_fornPercentual: TFloatField
      FieldName = 'Percentual'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
  end
  object DataSource5: TDataSource
    DataSet = qryagrupado_cli_forn
    Left = 727
    Top = 145
  end
  object qryconsulta_lancamento_sintetico: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'declare @P varchar(1)'
      'set @P = '#39'3'#39
      ''
      
        'select PL.Codigo, PL.N_Documento, LF.Observacoes, LF.Codigo_Empr' +
        'esa, LF.Tipo, LF.Codigo_Cli_For, '
      
        'LF.Historico, LF.Data_Lancamento, PL.Data_Vencimento, PL.Data_Pa' +
        'gamento, PL.Valor, PL.Status, '
      'PL.Cheque, PL.Conta, Cli.Nome from Lancamento_Financeiro LF'
      'left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)'
      
        'left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo' +
        ')'
      ''
      ''
      
        'where PL.Status = '#39'PENDENTE'#39' and LF.Codigo_Empresa = '#39'1'#39' and LF.' +
        'Data_Lancamento between '#39'01/01/2012'#39' and '#39'01/07/2013'#39' and LF.Tip' +
        'o = '#39'PAGAR'#39
      'order by '
      '(case when @P = 0 then PL.Codigo end),'
      '(case when @P = 1 then Cli.Nome end),'
      '(case when @P = 2 then LF.Data_Lancamento end),'
      '(case when @P = 3 then PL.Data_Vencimento end),'
      '(case when @P = 4 then PL.Data_Pagamento end)')
    Left = 352
    Top = 416
    object qryconsulta_lancamento_sinteticoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_lancamento_sinteticoN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryconsulta_lancamento_sinteticoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryconsulta_lancamento_sinteticoTipo: TStringField
      FieldName = 'Tipo'
      Size = 7
    end
    object qryconsulta_lancamento_sinteticoCodigo_Cli_For: TIntegerField
      FieldName = 'Codigo_Cli_For'
    end
    object qryconsulta_lancamento_sinteticoHistorico: TStringField
      FieldName = 'Historico'
      Size = 70
    end
    object qryconsulta_lancamento_sinteticoData_Lancamento: TDateTimeField
      FieldName = 'Data_Lancamento'
    end
    object qryconsulta_lancamento_sinteticoData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qryconsulta_lancamento_sinteticoData_Pagamento: TDateTimeField
      FieldName = 'Data_Pagamento'
    end
    object qryconsulta_lancamento_sinteticoValor: TFloatField
      FieldName = 'Valor'
    end
    object qryconsulta_lancamento_sinteticoStatus: TStringField
      FieldName = 'Status'
      Size = 8
    end
    object qryconsulta_lancamento_sinteticoCheque: TStringField
      FieldName = 'Cheque'
      Size = 30
    end
    object qryconsulta_lancamento_sinteticoConta: TStringField
      FieldName = 'Conta'
      Size = 30
    end
    object qryconsulta_lancamento_sinteticoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryconsulta_lancamento_sinteticoObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 800
    end
  end
  object qryconsulta_sintetico_2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select LF.*, PL.*, Cli.Nome, CP.Descricao'
      'from Lancamento_Financeiro LF'
      'left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)'
      
        'left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo' +
        ')'
      
        'left join Condicao_Pagamento CP on(LF.Codigo_Forma_Pagamento = C' +
        'P.Codigo)'
      '')
    Left = 650
    Top = 329
    object qryconsulta_sintetico_2Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_sintetico_2Tipo: TStringField
      FieldName = 'Tipo'
      Size = 7
    end
    object qryconsulta_sintetico_2N_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryconsulta_sintetico_2Codigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryconsulta_sintetico_2Codigo_Forma_Pagamento: TIntegerField
      FieldName = 'Codigo_Forma_Pagamento'
    end
    object qryconsulta_sintetico_2Codigo_Cli_For: TIntegerField
      FieldName = 'Codigo_Cli_For'
    end
    object qryconsulta_sintetico_2Codigo_Tipo_Documento: TIntegerField
      FieldName = 'Codigo_Tipo_Documento'
    end
    object qryconsulta_sintetico_2Historico: TStringField
      FieldName = 'Historico'
      Size = 70
    end
    object qryconsulta_sintetico_2Codigo_Departamento: TIntegerField
      FieldName = 'Codigo_Departamento'
    end
    object qryconsulta_sintetico_2Codigo_Plano: TIntegerField
      FieldName = 'Codigo_Plano'
    end
    object qryconsulta_sintetico_2Codigo_Safra: TIntegerField
      FieldName = 'Codigo_Safra'
    end
    object qryconsulta_sintetico_2Data_Lancamento: TDateTimeField
      FieldName = 'Data_Lancamento'
    end
    object qryconsulta_sintetico_2Data_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qryconsulta_sintetico_2Valor_Documento: TFloatField
      FieldName = 'Valor_Documento'
    end
    object qryconsulta_sintetico_2Desconto: TFloatField
      FieldName = 'Desconto'
    end
    object qryconsulta_sintetico_2Multa: TFloatField
      FieldName = 'Multa'
    end
    object qryconsulta_sintetico_2Valor_Cobrado: TFloatField
      FieldName = 'Valor_Cobrado'
    end
    object qryconsulta_sintetico_2Observacoes: TStringField
      FieldName = 'Observacoes'
      Size = 800
    end
    object qryconsulta_sintetico_2Status: TStringField
      FieldName = 'Status'
      Size = 15
    end
    object qryconsulta_sintetico_2Fiscal: TIntegerField
      FieldName = 'Fiscal'
    end
    object qryconsulta_sintetico_2Codigo_1: TIntegerField
      FieldName = 'Codigo_1'
    end
    object qryconsulta_sintetico_2N_Documento_1: TIntegerField
      FieldName = 'N_Documento_1'
    end
    object qryconsulta_sintetico_2Data_Vencimento_1: TDateTimeField
      FieldName = 'Data_Vencimento_1'
    end
    object qryconsulta_sintetico_2Data_Pagamento: TDateTimeField
      FieldName = 'Data_Pagamento'
    end
    object qryconsulta_sintetico_2Parcela: TIntegerField
      FieldName = 'Parcela'
    end
    object qryconsulta_sintetico_2Status_1: TStringField
      FieldName = 'Status_1'
      Size = 8
    end
    object qryconsulta_sintetico_2Valor: TFloatField
      FieldName = 'Valor'
      currency = True
    end
    object qryconsulta_sintetico_2Cheque: TStringField
      FieldName = 'Cheque'
      Size = 30
    end
    object qryconsulta_sintetico_2Conta: TStringField
      FieldName = 'Conta'
      Size = 30
    end
    object qryconsulta_sintetico_2Codigo_Lancamento_Bancario: TIntegerField
      FieldName = 'Codigo_Lancamento_Bancario'
    end
    object qryconsulta_sintetico_2Nome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryconsulta_sintetico_2Descricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
  end
  object DataSource6: TDataSource
    DataSet = qryconsulta_sintetico_2
    Left = 682
    Top = 329
  end
end
