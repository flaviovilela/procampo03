object FrmOS: TFrmOS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ordem de Servi'#231'o'
  ClientHeight = 502
  ClientWidth = 927
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
    Left = 128
    Top = 0
    Width = 801
    Height = 503
    ActivePage = TabSheet1
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
        Visible = False
      end
      object LblData_Cadastro: TLabel
        Left = 81
        Top = 15
        Width = 70
        Height = 13
        Caption = 'Lan'#231'amento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 0
        Top = 58
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
      object Label2: TLabel
        Left = 167
        Top = 15
        Width = 76
        Height = 13
        Caption = 'Prev. Entrega'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 291
        Top = 15
        Width = 72
        Height = 13
        Caption = 'Descri'#231#227'o PC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 0
        Top = 163
        Width = 42
        Height = 13
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblNumero: TLabel
        Left = 303
        Top = 163
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
        Left = 356
        Top = 163
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
        Left = 396
        Top = 163
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
        Left = 448
        Top = 163
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
        Left = 500
        Top = 163
        Width = 42
        Height = 13
        Caption = 'V. Serv.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 495
        Top = 15
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
      object Label6: TLabel
        Left = 251
        Top = 15
        Width = 27
        Height = 13
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblDescricao: TLabel
        Left = 433
        Top = 90
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Restante: 70'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblObs: TLabel
        Left = 637
        Top = 90
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Restante: 70'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 0
        Top = 95
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
      object MEdtData_Cadastro: TMaskEdit
        Left = 81
        Top = 32
        Width = 87
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
        OnEnter = MEdtData_CadastroEnter
        OnExit = MEdtData_CadastroExit
      end
      object EdtCliente: TEdit
        Left = 60
        Top = 72
        Width = 232
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 6
        OnKeyPress = EdtClienteKeyPress
      end
      object EdtCodigo_Cliente: TEdit
        Left = 0
        Top = 72
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
        TabOrder = 5
        OnKeyDown = EdtCodigo_ClienteKeyDown
        OnKeyPress = EdtCodigo_ClienteKeyPress
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
      end
      object MEdtData_Previsao_Entrega: TMaskEdit
        Left = 167
        Top = 32
        Width = 85
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
        OnEnter = MEdtData_Previsao_EntregaEnter
        OnExit = MEdtData_Previsao_EntregaExit
      end
      object MMODescricao_PC: TMemo
        Left = 291
        Top = 32
        Width = 205
        Height = 57
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 70
        ScrollBars = ssVertical
        TabOrder = 9
        OnChange = MMODescricao_PCChange
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 193
        Width = 785
        Height = 240
        Hint = 'Pressione Delete para remover o registro selecionado'
        DataSource = DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 29
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
            FieldName = 'Codigo_Servico'
            Title.Caption = 'Codigo'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Servi'#231'o'
            Width = 310
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Unitario'
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Title.Caption = 'Qtde.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sub_Total'
            Title.Caption = 'Sub Total'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Desconto'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Servico'
            Title.Caption = 'Valor Servi'#231'o'
            Width = 81
            Visible = True
          end>
      end
      object EdtServico: TEdit
        Left = 60
        Top = 177
        Width = 245
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 12
        OnKeyPress = EdtServicoKeyPress
      end
      object EdtCodigo_Servico: TEdit
        Left = 0
        Top = 177
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
        TabOrder = 11
        OnKeyDown = EdtCodigo_ServicoKeyDown
        OnKeyPress = EdtCodigo_ServicoKeyPress
      end
      object Panel1: TPanel
        Left = 0
        Top = 135
        Width = 793
        Height = 24
        BorderStyle = bsSingle
        Caption = 'Servi'#231'os'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 30
      end
      object EdtValor_Unitario: TEdit
        Left = 304
        Top = 177
        Width = 53
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 13
        Text = '0,00'
        OnExit = EdtValor_UnitarioExit
        OnKeyPress = EdtValor_UnitarioKeyPress
      end
      object EdtQuantidade: TEdit
        Left = 356
        Top = 177
        Width = 41
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 14
        OnExit = EdtQuantidadeExit
        OnKeyPress = EdtQuantidadeKeyPress
      end
      object EdtSub_Total: TEdit
        Left = 396
        Top = 177
        Width = 53
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 15
        Text = '0,00'
        OnEnter = EdtSub_TotalEnter
        OnExit = EdtSub_TotalExit
        OnKeyPress = EdtSub_TotalKeyPress
      end
      object EdtDesconto: TEdit
        Left = 448
        Top = 177
        Width = 53
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        ParentShowHint = False
        ShowHint = False
        TabOrder = 16
        Text = '0,00'
        OnExit = EdtDescontoExit
        OnKeyPress = EdtDescontoKeyPress
      end
      object EdtValor_Servico: TEdit
        Left = 500
        Top = 177
        Width = 69
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 17
        Text = '0,00'
        OnEnter = EdtValor_ServicoEnter
        OnExit = EdtValor_ServicoExit
        OnKeyDown = EdtValor_ServicoKeyDown
        OnKeyPress = EdtValor_ServicoKeyPress
      end
      object MMOObservacao: TMemo
        Left = 495
        Top = 32
        Width = 205
        Height = 57
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 70
        ScrollBars = ssVertical
        TabOrder = 10
        OnChange = MMOObservacaoChange
      end
      object MEdtHora: TMaskEdit
        Left = 251
        Top = 32
        Width = 41
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 4
        Text = '  :  '
      end
      object EdtTotal_Pedido: TEdit
        Left = 76
        Top = 455
        Width = 77
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 19
        Text = '0,00'
      end
      object Edit7: TEdit
        Left = 76
        Top = 439
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
        TabOrder = 31
        Text = 'Total Pedido'
      end
      object EdtQuantidade_Itens: TEdit
        Left = 0
        Top = 455
        Width = 77
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 18
        Text = '0'
      end
      object Edit9: TEdit
        Left = 0
        Top = 439
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
        TabOrder = 32
        Text = 'Qtde. Itens'
      end
      object EdtDesconto_Total: TEdit
        Left = 162
        Top = 455
        Width = 67
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 20
        Text = '0,00'
        OnExit = EdtDesconto_TotalExit
        OnKeyPress = EdtDesconto_TotalKeyPress
      end
      object EdtAcrescimo: TEdit
        Left = 228
        Top = 455
        Width = 69
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 21
        Text = '0,00'
        OnExit = EdtAcrescimoExit
        OnKeyPress = EdtAcrescimoKeyPress
      end
      object EdtValor_Pagar: TEdit
        Left = 296
        Top = 455
        Width = 77
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 22
        Text = '0,00'
        OnEnter = EdtValor_PagarEnter
      end
      object Edit2: TEdit
        Left = 162
        Top = 439
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
        TabOrder = 33
        Text = 'Desconto'
      end
      object Edit3: TEdit
        Left = 228
        Top = 439
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
        TabOrder = 34
        Text = 'Acr'#233'scimo'
      end
      object Edit4: TEdit
        Left = 296
        Top = 439
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
        TabOrder = 35
        Text = 'Valor Pagar'
      end
      object EdtDinheiro: TEdit
        Left = 382
        Top = 455
        Width = 65
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 23
        Text = '0,00'
        OnExit = EdtDinheiroExit
        OnKeyPress = EdtDinheiroKeyPress
      end
      object EdtCheque_a_Vista: TEdit
        Left = 446
        Top = 455
        Width = 65
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 24
        Text = '0,00'
        OnExit = EdtCheque_a_VistaExit
        OnKeyPress = EdtCheque_a_VistaKeyPress
      end
      object EdtCheque_a_Prazo: TEdit
        Left = 510
        Top = 455
        Width = 65
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 25
        Text = '0,00'
        OnExit = EdtCheque_a_PrazoExit
        OnKeyPress = EdtCheque_a_PrazoKeyPress
      end
      object Edit8: TEdit
        Left = 382
        Top = 439
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
        TabOrder = 36
        Text = 'Dinheiro'
      end
      object Edit10: TEdit
        Left = 446
        Top = 439
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
        TabOrder = 37
        Text = 'Ch. Vista'
      end
      object Edit11: TEdit
        Left = 510
        Top = 439
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
        TabOrder = 38
        Text = 'Ch. Prazo'
      end
      object EdtValor_Recebido: TEdit
        Left = 574
        Top = 455
        Width = 65
        Height = 17
        Alignment = taCenter
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 26
        Text = '0,00'
        OnEnter = EdtValor_RecebidoEnter
        OnExit = EdtValor_RecebidoExit
        OnKeyPress = EdtValor_RecebidoKeyPress
      end
      object EdtTroco: TEdit
        Left = 638
        Top = 455
        Width = 65
        Height = 17
        Alignment = taCenter
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
        TabOrder = 27
        Text = '0,00'
        OnEnter = EdtTrocoEnter
        OnKeyPress = EdtTrocoKeyPress
      end
      object Edit5: TEdit
        Left = 574
        Top = 439
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
        TabOrder = 39
        Text = 'Valor Rec.'
      end
      object Edit6: TEdit
        Left = 638
        Top = 439
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
        TabOrder = 40
        Text = 'Troco'
      end
      object CBFechar_Caixa: TCheckBox
        Left = 304
        Top = 112
        Width = 97
        Height = 17
        Caption = 'Fechar Pedido'
        TabOrder = 28
      end
      object EdtCondicao_Pagamento: TEdit
        Left = 60
        Top = 109
        Width = 232
        Height = 17
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 8
        OnKeyPress = EdtCondicao_PagamentoKeyPress
      end
      object EdtCodigo_Condicao_Pagamento: TEdit
        Left = 0
        Top = 109
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
        TabOrder = 7
        OnKeyDown = EdtCodigo_Condicao_PagamentoKeyDown
        OnKeyPress = EdtCodigo_Condicao_PagamentoKeyPress
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 502
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
      'select IOS.*, CS.Descricao from Itens_OS IOS'
      
        'left join Cadastro_Servico CS on (IOS.Codigo_Servico = CS.Codigo' +
        ')')
    Left = 472
    Top = 384
    object ADOQuery1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ADOQuery1Codigo_Servico: TIntegerField
      FieldName = 'Codigo_Servico'
    end
    object ADOQuery1Valor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object ADOQuery1Quantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object ADOQuery1Sub_Total: TFloatField
      FieldName = 'Sub_Total'
      DisplayFormat = '#0.0,0'
    end
    object ADOQuery1Desconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '#0.0,0'
    end
    object ADOQuery1Valor_Servico: TFloatField
      FieldName = 'Valor_Servico'
      DisplayFormat = '#0.0,0'
    end
    object ADOQuery1Descricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 504
    Top = 384
  end
end
