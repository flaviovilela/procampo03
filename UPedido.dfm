object FrmPedido: TFrmPedido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amento de Pedidos'
  ClientHeight = 521
  ClientWidth = 910
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
    Left = 127
    Top = 0
    Width = 778
    Height = 521
    ActivePage = TabSheet1
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 845
      ExplicitHeight = 514
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
        Visible = False
      end
      object LblData_Cadastro: TLabel
        Left = 81
        Top = 15
        Width = 57
        Height = 13
        Caption = 'Data Mov.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 0
        Top = 58
        Width = 24
        Height = 13
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 97
        Top = 58
        Width = 30
        Height = 13
        Caption = 'Mesa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 221
        Top = 58
        Width = 60
        Height = 13
        Caption = 'Atendente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 0
        Top = 15
        Width = 38
        Height = 13
        Caption = 'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 517
        Top = 58
        Width = 58
        Height = 13
        Caption = 'Cond. Pag.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 543
        Top = 99
        Width = 67
        Height = 13
        Caption = 'Observa'#231#227'o'
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
        Visible = False
      end
      object MEdtData_Movimento: TMaskEdit
        Left = 81
        Top = 32
        Width = 79
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
        OnEnter = MEdtData_MovimentoEnter
        OnExit = MEdtData_MovimentoExit
      end
      object CmbTipo: TComboBox
        Left = 0
        Top = 75
        Width = 97
        Height = 21
        BevelInner = bvNone
        BevelKind = bkFlat
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Items.Strings = (
          'BALC'#195'O'
          'ENTREGA'
          'MESA')
      end
      object EdtMesa: TEdit
        Left = 157
        Top = 76
        Width = 65
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
        OnKeyPress = EdtMesaKeyPress
      end
      object EdtCodigo_Mesa: TEdit
        Left = 97
        Top = 76
        Width = 60
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clCream
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnKeyPress = EdtCodigo_MesaKeyPress
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 101
        Width = 537
        Height = 116
        Caption = 'Dados do Cliente'
        TabOrder = 10
        object Label1: TLabel
          Left = 10
          Top = 27
          Width = 39
          Height = 13
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblMarca: TLabel
          Left = 244
          Top = 27
          Width = 52
          Height = 13
          Caption = 'Endere'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 10
          Top = 68
          Width = 31
          Height = 13
          Caption = 'Setor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 216
          Top = 68
          Width = 49
          Height = 13
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 295
          Top = 68
          Width = 39
          Height = 13
          Caption = 'Celular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtCodigo_Cliente: TEdit
          Left = 10
          Top = 42
          Width = 39
          Height = 17
          Hint = 'Pressione F3 para consultar'
          BevelEdges = [beLeft, beTop, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = clCream
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnExit = EdtCodigo_ClienteExit
          OnKeyDown = EdtCodigo_ClienteKeyDown
          OnKeyPress = EdtCodigo_ClienteKeyPress
        end
        object EdtCliente: TEdit
          Left = 49
          Top = 42
          Width = 196
          Height = 17
          BevelEdges = [beTop, beRight, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          OnKeyPress = EdtClienteKeyPress
        end
        object EdtEndereco: TEdit
          Left = 244
          Top = 42
          Width = 211
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 2
          OnKeyPress = EdtEnderecoKeyPress
        end
        object EdtNumero: TEdit
          Left = 454
          Top = 42
          Width = 45
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 3
          OnKeyPress = EdtNumeroKeyPress
        end
        object EdtSetor: TEdit
          Left = 10
          Top = 82
          Width = 207
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 4
          OnKeyPress = EdtSetorKeyPress
        end
        object MEdtTelefone: TMaskEdit
          Left = 216
          Top = 82
          Width = 80
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditMask = '!\(99\)9999-9999;1;_'
          MaxLength = 13
          TabOrder = 5
          Text = '(  )    -    '
          OnKeyPress = MEdtTelefoneKeyPress
        end
        object MEdtCelular: TMaskEdit
          Left = 295
          Top = 82
          Width = 80
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditMask = '!\(99\)9999-9999;1;_'
          MaxLength = 13
          TabOrder = 6
          Text = '(  )    -    '
          OnKeyPress = MEdtCelularKeyPress
        end
      end
      object EdtAtendente: TEdit
        Left = 281
        Top = 76
        Width = 237
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
        OnKeyPress = EdtAtendenteKeyPress
      end
      object EdtCodigo_Atendente: TEdit
        Left = 221
        Top = 76
        Width = 60
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clCream
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnKeyDown = EdtCodigo_AtendenteKeyDown
        OnKeyPress = EdtCodigo_AtendenteKeyPress
      end
      object EdtN_Pedido: TEdit
        Left = 0
        Top = 32
        Width = 82
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 1
        OnKeyPress = EdtEnderecoKeyPress
      end
      object EdtCondicao_Pagamento: TEdit
        Left = 577
        Top = 76
        Width = 129
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 9
        OnKeyPress = EdtAtendenteKeyPress
      end
      object EdtCodigo_Condicao_Pagamento: TEdit
        Left = 517
        Top = 76
        Width = 60
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clCream
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnKeyDown = EdtCodigo_Condicao_PagamentoKeyDown
        OnKeyPress = EdtCodigo_Condicao_PagamentoKeyPress
      end
      object MMOObservacao: TMemo
        Left = 543
        Top = 116
        Width = 174
        Height = 101
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ScrollBars = ssVertical
        TabOrder = 11
      end
      object EdtTotal_Pedido: TEdit
        Left = 76
        Top = 473
        Width = 77
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 14
        Text = '0,00'
      end
      object EdtTaxa_Entrega: TEdit
        Left = 152
        Top = 473
        Width = 77
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 15
        Text = '0,00'
        OnExit = EdtTaxa_EntregaExit
        OnKeyPress = EdtTaxa_EntregaKeyPress
      end
      object EdtDesconto_Total: TEdit
        Left = 228
        Top = 473
        Width = 67
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 16
        Text = '0,00'
        OnExit = EdtDesconto_TotalExit
        OnKeyPress = EdtDesconto_TotalKeyPress
      end
      object EdtAcrescimo: TEdit
        Left = 294
        Top = 473
        Width = 69
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 17
        Text = '0,00'
        OnExit = EdtAcrescimoExit
        OnKeyPress = EdtAcrescimoKeyPress
      end
      object EdtValor_Pagar: TEdit
        Left = 362
        Top = 473
        Width = 77
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 18
        Text = '0,00'
        OnEnter = EdtValor_PagarEnter
      end
      object Edit7: TEdit
        Left = 76
        Top = 457
        Width = 77
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 24
        Text = 'Total Pedido'
      end
      object Edit1: TEdit
        Left = 152
        Top = 457
        Width = 77
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 25
        Text = 'Tx. Entrega'
      end
      object Edit2: TEdit
        Left = 228
        Top = 457
        Width = 67
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 26
        Text = 'Desconto'
      end
      object Edit3: TEdit
        Left = 294
        Top = 457
        Width = 69
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 27
        Text = 'Acr'#233'scimo'
      end
      object Edit4: TEdit
        Left = 362
        Top = 457
        Width = 77
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 28
        Text = 'Valor Pagar'
      end
      object EdtQuantidade_Itens: TEdit
        Left = 0
        Top = 473
        Width = 77
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 13
        Text = '0'
      end
      object Edit9: TEdit
        Left = 0
        Top = 457
        Width = 77
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 29
        Text = 'Qtde. Itens'
      end
      object CBFechar_Caixa: TCheckBox
        Left = 180
        Top = 32
        Width = 97
        Height = 17
        Caption = 'Fechar Pedido'
        TabOrder = 30
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 223
        Width = 845
        Height = 232
        Cursor = crHandPoint
        ActivePage = TabSheet2
        Style = tsFlatButtons
        TabOrder = 12
        object TabSheet2: TTabSheet
          Caption = 'Produtos'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 221
          object Label5: TLabel
            Left = 0
            Top = 0
            Width = 45
            Height = 13
            Caption = 'Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 196
            Top = 0
            Width = 53
            Height = 13
            Caption = 'Tamanho'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 278
            Top = 0
            Width = 33
            Height = 13
            Caption = 'Borda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblNumero: TLabel
            Left = 399
            Top = 0
            Width = 39
            Height = 13
            Caption = 'V. Unit.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 452
            Top = 0
            Width = 27
            Height = 13
            Caption = 'Qtde'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 492
            Top = 0
            Width = 42
            Height = 13
            Caption = 'S. Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 544
            Top = 0
            Width = 30
            Height = 13
            Caption = 'Desc.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 596
            Top = 0
            Width = 48
            Height = 13
            Caption = 'V. Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 664
            Top = 0
            Width = 24
            Height = 13
            Caption = 'Obs.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 319
            Top = 0
            Width = 69
            Height = 13
            Caption = 'Sabor Borda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 61
            Width = 761
            Height = 140
            Hint = 'Pressione Delete para remover o item selecionado'
            BorderStyle = bsNone
            DataSource = DataSource1
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = DBGrid1KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'Codigo'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'N_Pedido'
                Title.Caption = 'Pedido'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Codigo_Produto'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Title.Caption = 'Descri'#231#227'o'
                Width = 223
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Tamanho'
                Width = 78
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Borda'
                Width = 37
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Sabor_Borda'
                Title.Caption = 'S. Borda'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Valor_Unitario'
                Title.Caption = 'Valor Unit.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Quantidade'
                Title.Caption = 'Qtde.'
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Sub_Total'
                Title.Caption = 'Sub Total'
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Desconto'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Valor_Venda'
                Title.Caption = 'Valor Venda'
                Width = 86
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Observacao'
                Title.Caption = 'Obs.'
                Visible = True
              end>
          end
          object EdtProduto: TEdit
            Left = 39
            Top = 18
            Width = 159
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            OnKeyPress = EdtProdutoKeyPress
          end
          object CmbTamanho: TComboBox
            Left = 197
            Top = 18
            Width = 82
            Height = 21
            BevelInner = bvNone
            BevelKind = bkFlat
            CharCase = ecUpperCase
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            Items.Strings = (
              'MINI'
              'PEQUENO'
              'M'#201'DIO'
              'GRANDE'
              'GIGANTE'
              'FAM'#205'LIA')
          end
          object EdtBorda: TEdit
            Left = 278
            Top = 18
            Width = 42
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 1
            TabOrder = 3
          end
          object EdtValor_Unitario: TEdit
            Left = 400
            Top = 18
            Width = 53
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 5
            Text = '0,00'
            OnEnter = EdtValor_UnitarioEnter
            OnExit = EdtValor_UnitarioExit
            OnKeyPress = EdtValor_UnitarioKeyPress
          end
          object EdtQuantidade: TEdit
            Left = 452
            Top = 18
            Width = 41
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 6
            OnExit = EdtQuantidadeExit
            OnKeyPress = EdtQuantidadeKeyPress
          end
          object EdtSub_Total: TEdit
            Left = 492
            Top = 18
            Width = 53
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 7
            Text = '0,00'
            OnEnter = EdtSub_TotalEnter
            OnExit = EdtSub_TotalExit
            OnKeyPress = EdtSub_TotalKeyPress
          end
          object EdtDesconto: TEdit
            Left = 544
            Top = 18
            Width = 53
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 8
            Text = '0,00'
            OnExit = EdtDescontoExit
            OnKeyPress = EdtDescontoKeyPress
          end
          object EdtValor_Venda: TEdit
            Left = 596
            Top = 18
            Width = 69
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 9
            Text = '0,00'
            OnEnter = EdtValor_VendaEnter
            OnExit = EdtValor_VendaExit
            OnKeyPress = EdtValor_VendaKeyPress
          end
          object Memo1: TMemo
            Left = 664
            Top = 18
            Width = 97
            Height = 40
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ScrollBars = ssVertical
            TabOrder = 10
            OnKeyDown = Memo1KeyDown
          end
          object EdtCodigo_Produto: TEdit
            Left = 0
            Top = 18
            Width = 39
            Height = 17
            Hint = 'Pressione F3 para consultar'
            BevelEdges = [beLeft, beTop, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            Color = clCream
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnKeyDown = EdtCodigo_ProdutoKeyDown
            OnKeyPress = EdtCodigo_ProdutoKeyPress
          end
          object EdtSabor_Borda: TEdit
            Left = 319
            Top = 18
            Width = 82
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 20
            TabOrder = 4
          end
        end
      end
      object EdtDinheiro: TEdit
        Left = 448
        Top = 473
        Width = 65
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 19
        Text = '0,00'
        OnExit = EdtDinheiroExit
        OnKeyPress = EdtDinheiroKeyPress
      end
      object EdtCheque_a_Vista: TEdit
        Left = 512
        Top = 473
        Width = 65
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 20
        Text = '0,00'
        OnExit = EdtCheque_a_VistaExit
        OnKeyPress = EdtCheque_a_VistaKeyPress
      end
      object EdtCheque_a_Prazo: TEdit
        Left = 576
        Top = 473
        Width = 65
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 21
        Text = '0,00'
        OnExit = EdtCheque_a_PrazoExit
        OnKeyPress = EdtCheque_a_PrazoKeyPress
      end
      object Edit8: TEdit
        Left = 448
        Top = 457
        Width = 65
        Height = 17
        TabStop = False
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 31
        Text = 'Dinheiro'
      end
      object Edit10: TEdit
        Left = 512
        Top = 457
        Width = 65
        Height = 17
        TabStop = False
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 32
        Text = 'Ch. Vista'
      end
      object Edit11: TEdit
        Left = 576
        Top = 457
        Width = 65
        Height = 17
        TabStop = False
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 33
        Text = 'Ch. Prazo'
      end
      object EdtValor_Recebido: TEdit
        Left = 640
        Top = 473
        Width = 65
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 22
        Text = '0,00'
        OnEnter = EdtValor_RecebidoEnter
        OnExit = EdtValor_RecebidoExit
        OnKeyPress = EdtValor_RecebidoKeyPress
      end
      object EdtTroco: TEdit
        Left = 704
        Top = 473
        Width = 65
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 23
        Text = '0,00'
        OnEnter = EdtTrocoEnter
      end
      object Edit5: TEdit
        Left = 640
        Top = 457
        Width = 65
        Height = 17
        TabStop = False
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 34
        Text = 'Valor Rec.'
      end
      object Edit6: TEdit
        Left = 704
        Top = 457
        Width = 65
        Height = 17
        TabStop = False
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 35
        Text = 'Troco'
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 521
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
    object BBtnImprimir: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Caption = '&Imprimir'
      Enabled = False
      ImageIndex = 6
      Wrap = True
      OnClick = BBtnImprimirClick
    end
    object BBtnCancelar: TToolButton
      Left = 0
      Top = 152
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
      Top = 190
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
      'select IP.*, CP.Descricao, CP.Cozinha from Itens_Pedido IP'
      
        'inner join Cadastro_Produto CP on (IP.Codigo_Produto = CP.Codigo' +
        ')')
    Left = 824
    Top = 48
    object ADOQuery1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ADOQuery1N_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 15
    end
    object ADOQuery1Codigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object ADOQuery1Tamanho: TStringField
      FieldName = 'Tamanho'
    end
    object ADOQuery1Borda: TStringField
      FieldName = 'Borda'
      Size = 1
    end
    object ADOQuery1Valor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object ADOQuery1Quantidade: TFloatField
      FieldName = 'Quantidade'
      DisplayFormat = '#0.0,0'
    end
    object ADOQuery1Sub_Total: TFloatField
      FieldName = 'Sub_Total'
      DisplayFormat = '#0.0,0'
    end
    object ADOQuery1Desconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '#0.0,0'
    end
    object ADOQuery1Valor_Venda: TFloatField
      FieldName = 'Valor_Venda'
      DisplayFormat = '#0.0,0'
    end
    object ADOQuery1Descricao: TStringField
      FieldName = 'Descricao'
      Size = 70
    end
    object ADOQuery1Observacao: TStringField
      FieldName = 'Observacao'
      Size = 500
    end
    object ADOQuery1Cozinha: TStringField
      FieldName = 'Cozinha'
      Size = 3
    end
    object ADOQuery1Sabor_Borda: TStringField
      FieldName = 'Sabor_Borda'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 856
    Top = 48
  end
end
