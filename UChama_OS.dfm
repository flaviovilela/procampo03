object FrmChama_OS: TFrmChama_OS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta OS'
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
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Pedido'
        Title.Caption = 'Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Data Cadastro'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Previsao_Entrega'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Hora_Previsao_Entrega'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao_PC'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Cliente'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cliente'
        Width = 342
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Numero'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Complemento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Logradouro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Setor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Status'
        Width = 88
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
  object qrychama_os: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select OS.*, CC.Nome as Cliente, CC.Telefone, CC.Celular, CC.Num' +
        'ero, CC.Complemento, CL.Logradouro, CS.Descricao as Setor,'
      
        'CCi.Cidade, CP.Descricao as Condicao_Pagamento, CP.Parcela, CP.P' +
        'razo, CP.Tipo_Pagamento from OS OS'
      'left join Cadastro_Cliente CC on (OS.Codigo_Cliente = CC.Codigo)'
      
        'left join Cadastro_Logradouro CL on (CC.Codigo_Endereco = CL.Cod' +
        'igo)'
      'left join Cadastro_Setor CS on (CC.Codigo_Setor = CS.Codigo)'
      'left join Cadastro_Cidade CCi on (CC.Codigo_Cidade = CCi.Codigo)'
      
        'left join Condicao_Pagamento CP on (OS.Codigo_Condicao_Pagamento' +
        ' = CP.Codigo)')
    Left = 464
    Top = 272
    object qrychama_osCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_osN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 15
    end
    object qrychama_osData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_osData_Previsao_Entrega: TDateTimeField
      FieldName = 'Data_Previsao_Entrega'
    end
    object qrychama_osHora_Previsao_Entrega: TStringField
      FieldName = 'Hora_Previsao_Entrega'
      Size = 10
    end
    object qrychama_osDescricao_PC: TStringField
      FieldName = 'Descricao_PC'
      Size = 300
    end
    object qrychama_osObservacao: TStringField
      FieldName = 'Observacao'
      Size = 300
    end
    object qrychama_osCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object qrychama_osCliente: TStringField
      FieldName = 'Cliente'
      Size = 50
    end
    object qrychama_osTelefone: TStringField
      FieldName = 'Telefone'
    end
    object qrychama_osNumero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qrychama_osComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object qrychama_osLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 50
    end
    object qrychama_osSetor: TStringField
      FieldName = 'Setor'
      Size = 50
    end
    object qrychama_osCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qrychama_osQtde_Itens: TIntegerField
      FieldName = 'Qtde_Itens'
    end
    object qrychama_osTotal_Pedido: TFloatField
      FieldName = 'Total_Pedido'
    end
    object qrychama_osDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qrychama_osAcrescimo: TFloatField
      FieldName = 'Acrescimo'
    end
    object qrychama_osValor_Pagar: TFloatField
      FieldName = 'Valor_Pagar'
    end
    object qrychama_osCelular: TStringField
      FieldName = 'Celular'
    end
    object qrychama_osStatus: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object qrychama_osCodigo_Condicao_Pagamento: TIntegerField
      FieldName = 'Codigo_Condicao_Pagamento'
    end
    object qrychama_osCondicao_Pagamento: TStringField
      FieldName = 'Condicao_Pagamento'
      Size = 30
    end
    object qrychama_osParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object qrychama_osPrazo: TIntegerField
      FieldName = 'Prazo'
    end
    object qrychama_osTipo_Pagamento: TStringField
      FieldName = 'Tipo_Pagamento'
    end
    object qrychama_osValor_Recebido: TFloatField
      FieldName = 'Valor_Recebido'
    end
    object qrychama_osTroco: TFloatField
      FieldName = 'Troco'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_os
    Left = 496
    Top = 272
  end
end
