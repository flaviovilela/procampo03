object FrmChama_Cheque: TFrmChama_Cheque
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Cheque'
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
        FieldName = 'Codigo_Cheque'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Empresa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Numero_Cheque'
        Title.Caption = 'Cheque'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Emitente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Recebido_De'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Enviado_A'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Agencia'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Conta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Tipo_Cheque'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Situacao_Cheque'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Juro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Final'
        Title.Caption = 'Valor Final'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Entrada'
        Title.Caption = 'Entrada'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Vencimento'
        Title.Caption = 'Vencimento'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Saida'
        Title.Caption = 'Saida'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacoes'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Status'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Numero'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Banco'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Conta_Corrente'
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
      'N'#250'mero'
      'Emitente'
      'Valor')
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
  object qrychama_cheque: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Empresa'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select CC.*, CA.Numero, (CB.Numero_Banco + '#39' - '#39' + CB.Nome) as B' +
        'anco, '
      'CCC.Conta_Corrente from Cadastro_Cheque CC'
      
        'left join Cadastro_Agencia CA on (CC.Codigo_Agencia = CA.Codigo_' +
        'Agencia)'
      
        'left join Cadastro_Banco CB on (CA.Codigo_Banco = CB.Codigo_Banc' +
        'o)'
      
        'left join Cadastro_Conta_Corrente CCC on (CC.Codigo_Conta = CCC.' +
        'Codigo_Conta_Corrente)'
      'where Codigo_Empresa = :Empresa order by CC.Numero_Cheque')
    Left = 496
    Top = 320
    object qrychama_chequeCodigo_Cheque: TIntegerField
      FieldName = 'Codigo_Cheque'
    end
    object qrychama_chequeCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qrychama_chequeEmitente: TStringField
      FieldName = 'Emitente'
      Size = 50
    end
    object qrychama_chequeRecebido_De: TStringField
      FieldName = 'Recebido_De'
      Size = 50
    end
    object qrychama_chequeEnviado_A: TStringField
      FieldName = 'Enviado_A'
      Size = 50
    end
    object qrychama_chequeCodigo_Agencia: TIntegerField
      FieldName = 'Codigo_Agencia'
    end
    object qrychama_chequeCodigo_Conta: TIntegerField
      FieldName = 'Codigo_Conta'
    end
    object qrychama_chequeTipo_Cheque: TStringField
      FieldName = 'Tipo_Cheque'
      Size = 30
    end
    object qrychama_chequeSituacao_Cheque: TStringField
      FieldName = 'Situacao_Cheque'
      Size = 30
    end
    object qrychama_chequeNumero_Cheque: TStringField
      FieldName = 'Numero_Cheque'
    end
    object qrychama_chequeValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_chequeJuro: TFloatField
      FieldName = 'Juro'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_chequeValor_Final: TFloatField
      FieldName = 'Valor_Final'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_chequeData_Entrada: TDateTimeField
      FieldName = 'Data_Entrada'
    end
    object qrychama_chequeData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qrychama_chequeData_Saida: TDateTimeField
      FieldName = 'Data_Saida'
    end
    object qrychama_chequeObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 200
    end
    object qrychama_chequeStatus: TStringField
      FieldName = 'Status'
    end
    object qrychama_chequeNumero: TStringField
      FieldName = 'Numero'
    end
    object qrychama_chequeBanco: TStringField
      FieldName = 'Banco'
      ReadOnly = True
      Size = 123
    end
    object qrychama_chequeConta_Corrente: TStringField
      FieldName = 'Conta_Corrente'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_cheque
    Left = 496
    Top = 272
  end
end
