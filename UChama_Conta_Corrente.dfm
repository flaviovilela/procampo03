object FrmChama_Conta_Corrente: TFrmChama_Conta_Corrente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Conta Corrente'
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
        FieldName = 'Codigo_Conta_Corrente'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Conta_Corrente'
        Title.Caption = 'Conta'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Banco'
        Width = 253
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Agencia'
        Title.Caption = 'Ag'#234'ncia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Saldo_Atual'
        Title.Caption = 'Saldo Atual'
        Width = 116
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
      'C'#243'digo'
      'Conta')
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
  object qrychama_conta: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CCC.*, CA.Numero as Agencia, CB.Nome as Banco from Cadast' +
        'ro_Conta_Corrente CCC'
      
        'left join Cadastro_Agencia CA on (CCC.Codigo_Agencia = CA.Codigo' +
        '_Agencia)'
      
        'left join Cadastro_Banco CB on (CA.Codigo_Banco = CB.Codigo_Banc' +
        'o)'
      'order by CCC.Conta_Corrente')
    Left = 496
    Top = 320
    object qrychama_contaCodigo_Conta_Corrente: TIntegerField
      FieldName = 'Codigo_Conta_Corrente'
    end
    object qrychama_contaConta_Corrente: TStringField
      FieldName = 'Conta_Corrente'
    end
    object qrychama_contaCodigo_Agencia: TIntegerField
      FieldName = 'Codigo_Agencia'
    end
    object qrychama_contaNome_Correntista: TStringField
      FieldName = 'Nome_Correntista'
      Size = 50
    end
    object qrychama_contaSaldo_Inicial: TFloatField
      FieldName = 'Saldo_Inicial'
    end
    object qrychama_contaLimite: TFloatField
      FieldName = 'Limite'
    end
    object qrychama_contaSaldo_Atual: TFloatField
      FieldName = 'Saldo_Atual'
      currency = True
    end
    object qrychama_contaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_contaAgencia: TStringField
      FieldName = 'Agencia'
    end
    object qrychama_contaBanco: TStringField
      FieldName = 'Banco'
      Size = 100
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_conta
    Left = 496
    Top = 272
  end
end
