object FrmChama_Empresa: TFrmChama_Empresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Propriedade'
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
    Top = 79
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
        FieldName = 'Nome_Fantasia'
        Title.Caption = 'Nome'
        Width = 261
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Razao_Social'
        Title.Caption = 'Propriet'#225'rio'
        Width = 227
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Inscricao_Estadual'
        Title.Caption = 'Inscri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Inscricao_Municipal'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Endereco'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Numero'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Setor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'E_Mail'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Site'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Cidade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Celular'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Logradouro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Tipo_Logradouro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Visible = False
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
      'Nome')
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
  object qrychama_empresa: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CE.*, CL.Logradouro, CL.CEP, CL.Tipo_Logradouro,'
      'CCi.Cidade, CCi.UF, CS.Descricao from Cadastro_Empresa CE'
      
        'Left join Cadastro_Logradouro CL on (CE.Codigo_Endereco = CL.Cod' +
        'igo)'
      'Left join Cadastro_Cidade CCi on (CE.Codigo_Cidade = CCi.Codigo)'
      'Left join Cadastro_Setor CS on (CE.Codigo_Setor = CS.Codigo)')
    Left = 496
    Top = 320
    object qrychama_empresaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_empresaNome_Fantasia: TStringField
      FieldName = 'Nome_Fantasia'
      Size = 50
    end
    object qrychama_empresaRazao_Social: TStringField
      FieldName = 'Razao_Social'
      Size = 50
    end
    object qrychama_empresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 50
    end
    object qrychama_empresaInscricao_Estadual: TStringField
      FieldName = 'Inscricao_Estadual'
      Size = 15
    end
    object qrychama_empresaInscricao_Municipal: TStringField
      FieldName = 'Inscricao_Municipal'
      Size = 15
    end
    object qrychama_empresaCodigo_Endereco: TIntegerField
      FieldName = 'Codigo_Endereco'
    end
    object qrychama_empresaNumero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qrychama_empresaCodigo_Setor: TIntegerField
      FieldName = 'Codigo_Setor'
    end
    object qrychama_empresaE_Mail: TStringField
      FieldName = 'E_Mail'
      Size = 50
    end
    object qrychama_empresaSite: TStringField
      FieldName = 'Site'
      Size = 50
    end
    object qrychama_empresaCodigo_Cidade: TIntegerField
      FieldName = 'Codigo_Cidade'
    end
    object qrychama_empresaTelefone: TStringField
      FieldName = 'Telefone'
    end
    object qrychama_empresaCelular: TStringField
      FieldName = 'Celular'
    end
    object qrychama_empresaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_empresaLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 100
    end
    object qrychama_empresaCEP: TStringField
      FieldName = 'CEP'
      Size = 15
    end
    object qrychama_empresaTipo_Logradouro: TStringField
      FieldName = 'Tipo_Logradouro'
    end
    object qrychama_empresaCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qrychama_empresaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrychama_empresaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_empresa
    Left = 496
    Top = 272
  end
end
