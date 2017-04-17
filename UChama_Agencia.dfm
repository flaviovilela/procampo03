object FrmChama_Agencia: TFrmChama_Agencia
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Ag'#234'ncia'
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
        FieldName = 'Codigo_Agencia'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Numero'
        Title.Caption = 'Ag'#234'ncia'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Banco'
        Width = 341
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 0
    Top = 1
    Width = 121
    Height = 73
    Caption = 'Consulta por:'
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Ag'#234'ncia')
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
  object qrychama_agencia: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CA.*, CB.Numero_Banco + '#39' - '#39' + CB.Nome as Banco, CL.Logr' +
        'adouro, CC.Cidade from Cadastro_Agencia CA'
      
        'left join Cadastro_Banco CB on (CA.Codigo_Banco = CB.Codigo_Banc' +
        'o)'
      
        'left join Cadastro_Logradouro CL on (CA.Codigo_Endereco = CL.Cod' +
        'igo)'
      'left join Cadastro_Cidade CC on (CA.Codigo_Cidade = CC.Codigo)')
    Left = 496
    Top = 320
    object qrychama_agenciaCodigo_Agencia: TIntegerField
      FieldName = 'Codigo_Agencia'
    end
    object qrychama_agenciaNumero: TStringField
      FieldName = 'Numero'
    end
    object qrychama_agenciaCodigo_Banco: TIntegerField
      FieldName = 'Codigo_Banco'
    end
    object qrychama_agenciaCodigo_Endereco: TIntegerField
      FieldName = 'Codigo_Endereco'
    end
    object qrychama_agenciaN: TStringField
      FieldName = 'N'
    end
    object qrychama_agenciaCodigo_Cidade: TIntegerField
      FieldName = 'Codigo_Cidade'
    end
    object qrychama_agenciaTelefone: TStringField
      FieldName = 'Telefone'
    end
    object qrychama_agenciaContato: TStringField
      FieldName = 'Contato'
      Size = 50
    end
    object qrychama_agenciaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_agenciaBanco: TStringField
      FieldName = 'Banco'
      ReadOnly = True
      Size = 123
    end
    object qrychama_agenciaLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 100
    end
    object qrychama_agenciaCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_agencia
    Left = 496
    Top = 272
  end
end
