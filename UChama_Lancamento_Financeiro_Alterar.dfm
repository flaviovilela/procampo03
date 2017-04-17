object FrmChama_Lancamento_Financeiro_Alterar: TFrmChama_Lancamento_Financeiro_Alterar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Lan'#231'amentos Financeiros'
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
  OnCreate = FormCreate
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Historico'
        Title.Caption = 'Hist'#243'rico'
        Width = 266
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 245
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'N_Documento'
        Title.Caption = 'Documento'
        Width = 106
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
      'Documento'
      'Cli./Forn.')
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
  object qrychama_lancamento: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Empresa'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select LF.*, CP.Descricao as Condicao_Pagamento, Cli.Nome, TD.De' +
        'scricao as Tipo_Documento, D.Descricao as Departamento,'
      
        'PF.Descricao as Plano_Financeiro, CS.Descricao + '#39' '#39' + CC.Descri' +
        'cao as Safra from Lancamento_Financeiro LF'
      
        'left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = ' +
        'CP.Codigo)'
      
        'left join Cadastro_Cliente Cli on (LF.Codigo_Cli_For = Cli.Codig' +
        'o)'
      
        'left join Cadastro_Tipo_Documento TD on (LF.Codigo_Tipo_Document' +
        'o = TD.Codigo)'
      
        'left join Cadastro_Departamento D on (LF.Codigo_Departamento = D' +
        '.Codigo)'
      
        'left join Cadastro_Plano_Financeiro PF on (LF.Codigo_Plano = PF.' +
        'Codigo)'
      'left join Cadastro_Safra CS on (LF.Codigo_Safra = CS.Codigo)'
      
        'left join Cadastro_Cultura CC on (CS.Codigo_Tipo_Cultura = CC.Co' +
        'digo)'
      'where LF.Codigo_Empresa = :Empresa')
    Left = 464
    Top = 328
    object qrychama_lancamentoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_lancamentoTipo: TStringField
      FieldName = 'Tipo'
      Size = 7
    end
    object qrychama_lancamentoN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qrychama_lancamentoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qrychama_lancamentoCodigo_Forma_Pagamento: TIntegerField
      FieldName = 'Codigo_Forma_Pagamento'
    end
    object qrychama_lancamentoCodigo_Cli_For: TIntegerField
      FieldName = 'Codigo_Cli_For'
    end
    object qrychama_lancamentoCodigo_Tipo_Documento: TIntegerField
      FieldName = 'Codigo_Tipo_Documento'
    end
    object qrychama_lancamentoHistorico: TStringField
      FieldName = 'Historico'
      Size = 70
    end
    object qrychama_lancamentoCodigo_Departamento: TIntegerField
      FieldName = 'Codigo_Departamento'
    end
    object qrychama_lancamentoCodigo_Plano: TIntegerField
      FieldName = 'Codigo_Plano'
    end
    object qrychama_lancamentoData_Lancamento: TDateTimeField
      FieldName = 'Data_Lancamento'
    end
    object qrychama_lancamentoData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qrychama_lancamentoValor_Documento: TFloatField
      FieldName = 'Valor_Documento'
    end
    object qrychama_lancamentoDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qrychama_lancamentoMulta: TFloatField
      FieldName = 'Multa'
    end
    object qrychama_lancamentoValor_Cobrado: TFloatField
      FieldName = 'Valor_Cobrado'
    end
    object qrychama_lancamentoStatus: TStringField
      FieldName = 'Status'
      Size = 15
    end
    object qrychama_lancamentoCondicao_Pagamento: TStringField
      FieldName = 'Condicao_Pagamento'
      Size = 30
    end
    object qrychama_lancamentoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qrychama_lancamentoTipo_Documento: TStringField
      FieldName = 'Tipo_Documento'
      Size = 50
    end
    object qrychama_lancamentoDepartamento: TStringField
      FieldName = 'Departamento'
      Size = 30
    end
    object qrychama_lancamentoPlano_Financeiro: TStringField
      FieldName = 'Plano_Financeiro'
      Size = 100
    end
    object qrychama_lancamentoCodigo_Safra: TIntegerField
      FieldName = 'Codigo_Safra'
    end
    object qrychama_lancamentoSafra: TStringField
      FieldName = 'Safra'
      ReadOnly = True
      Size = 101
    end
    object qrychama_lancamentoFiscal: TIntegerField
      FieldName = 'Fiscal'
    end
    object qrychama_lancamentoObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 800
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_lancamento
    Left = 504
    Top = 328
  end
end
