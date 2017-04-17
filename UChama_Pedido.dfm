object FrmChama_Pedido: TFrmChama_Pedido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Pedidos'
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
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Pedido'
        Title.Caption = 'Pedido'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cliente'
        Width = 356
        Visible = True
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
      'Pedido'
      'Cliente')
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
  object qrychama_pedido: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.*, CP.Descricao as Condicao_Pagamento, CP.Prazo, CP.Par' +
        'cela, CP.Tipo_Pagamento, CM.Descricao as Mesa, '
      
        'CC1.Nome as Cliente, CC1.Telefone, CC1.Celular, CC1.Numero, CL.L' +
        'ogradouro, CS.Descricao as Setor,'
      'CC2.Nome as Atendente from Pedido P'
      
        'left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento ' +
        '= CP.Codigo)'
      'left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)'
      
        'left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo' +
        ')'
      
        'left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codi' +
        'go)'
      
        'left join Cadastro_Logradouro CL on (CC1.Codigo_Endereco = CL.Co' +
        'digo)'
      'left join Cadastro_Setor CS on (CC1.Codigo_Setor = CS.Codigo)')
    Left = 496
    Top = 320
    object qrychama_pedidoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_pedidoN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 15
    end
    object qrychama_pedidoData_Movimento: TDateTimeField
      FieldName = 'Data_Movimento'
    end
    object qrychama_pedidoTipo: TStringField
      FieldName = 'Tipo'
      Size = 15
    end
    object qrychama_pedidoCodigo_Mesa: TIntegerField
      FieldName = 'Codigo_Mesa'
    end
    object qrychama_pedidoCodigo_Atendente: TIntegerField
      FieldName = 'Codigo_Atendente'
    end
    object qrychama_pedidoCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object qrychama_pedidoCodigo_Condicao_Pagamento: TIntegerField
      FieldName = 'Codigo_Condicao_Pagamento'
    end
    object qrychama_pedidoObservacao: TStringField
      FieldName = 'Observacao'
      Size = 500
    end
    object qrychama_pedidoQuantidade_Itens: TIntegerField
      FieldName = 'Quantidade_Itens'
    end
    object qrychama_pedidoTotal_Pedido: TFloatField
      FieldName = 'Total_Pedido'
    end
    object qrychama_pedidoTaxa_Entrega: TFloatField
      FieldName = 'Taxa_Entrega'
    end
    object qrychama_pedidoDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qrychama_pedidoAcrescimo: TFloatField
      FieldName = 'Acrescimo'
    end
    object qrychama_pedidoValor_Pagar: TFloatField
      FieldName = 'Valor_Pagar'
    end
    object qrychama_pedidoValor_Recebido: TFloatField
      FieldName = 'Valor_Recebido'
    end
    object qrychama_pedidoTroco: TFloatField
      FieldName = 'Troco'
    end
    object qrychama_pedidoCondicao_Pagamento: TStringField
      FieldName = 'Condicao_Pagamento'
      Size = 30
    end
    object qrychama_pedidoMesa: TStringField
      FieldName = 'Mesa'
      Size = 50
    end
    object qrychama_pedidoCliente: TStringField
      FieldName = 'Cliente'
      Size = 50
    end
    object qrychama_pedidoAtendente: TStringField
      FieldName = 'Atendente'
      Size = 50
    end
    object qrychama_pedidoTelefone: TStringField
      FieldName = 'Telefone'
    end
    object qrychama_pedidoCelular: TStringField
      FieldName = 'Celular'
    end
    object qrychama_pedidoLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 50
    end
    object qrychama_pedidoSetor: TStringField
      FieldName = 'Setor'
      Size = 50
    end
    object qrychama_pedidoNumero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qrychama_pedidoPrazo: TIntegerField
      FieldName = 'Prazo'
    end
    object qrychama_pedidoParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object qrychama_pedidoTipo_Pagamento: TStringField
      FieldName = 'Tipo_Pagamento'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_pedido
    Left = 496
    Top = 272
  end
end
