object FrmChama_Cliente: TFrmChama_Cliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Cliente'
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
    Left = 254
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Cliente'
        Title.Caption = 'Tipo Cliente'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 325
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Razao_Social'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RG'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Orgao_Expedidor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Emissao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Inscricao_Estadual'
        Visible = False
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
        FieldName = 'Ponto_Referencia'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Complemento'
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
        FieldName = 'Profissao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Nascimento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Estado_Civil'
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
        FieldName = 'Contato'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Telefone_Contato'
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
        Title.Caption = 'Endere'#231'o'
        Width = 293
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Numero'
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
      'Nome'
      'Endere'#231'o')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 254
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
  object RGTipo: TRadioGroup
    Left = 127
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Tipo'
    ItemIndex = 0
    Items.Strings = (
      'Cliente'
      'Fornecedor'
      'Funcion'#225'rio')
    TabOrder = 3
    OnClick = RGTipoClick
  end
  object qrychama_cliente: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CC.*, CL.Logradouro, CL.CEP, CL.Tipo_Logradouro, '
      'CCi.Cidade, CCi.UF, CS.Descricao from Cadastro_Cliente CC'
      
        'Left join Cadastro_Logradouro CL on (CC.Codigo_Endereco = CL.Cod' +
        'igo)'
      'Left join Cadastro_Cidade CCi on (CC.Codigo_Cidade = CCi.Codigo)'
      'Left join Cadastro_Setor CS on (CC.Codigo_Setor = CS.Codigo)'
      'order by CC.NOme')
    Left = 496
    Top = 320
    object qrychama_clienteCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_clienteTipo: TStringField
      FieldName = 'Tipo'
      Size = 15
    end
    object qrychama_clienteTipo_Cliente: TStringField
      FieldName = 'Tipo_Cliente'
      Size = 10
    end
    object qrychama_clienteNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qrychama_clienteRazao_Social: TStringField
      FieldName = 'Razao_Social'
      Size = 50
    end
    object qrychama_clienteCPF: TStringField
      FieldName = 'CPF'
    end
    object qrychama_clienteRG: TStringField
      FieldName = 'RG'
      Size = 15
    end
    object qrychama_clienteOrgao_Expedidor: TStringField
      FieldName = 'Orgao_Expedidor'
      Size = 50
    end
    object qrychama_clienteData_Emissao: TDateTimeField
      FieldName = 'Data_Emissao'
    end
    object qrychama_clienteCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 50
    end
    object qrychama_clienteInscricao_Estadual: TStringField
      FieldName = 'Inscricao_Estadual'
      Size = 15
    end
    object qrychama_clienteInscricao_Municipal: TStringField
      FieldName = 'Inscricao_Municipal'
      Size = 15
    end
    object qrychama_clienteCodigo_Endereco: TIntegerField
      FieldName = 'Codigo_Endereco'
    end
    object qrychama_clienteNumero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qrychama_clientePonto_Referencia: TStringField
      FieldName = 'Ponto_Referencia'
      Size = 50
    end
    object qrychama_clienteComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object qrychama_clienteCodigo_Setor: TIntegerField
      FieldName = 'Codigo_Setor'
    end
    object qrychama_clienteE_Mail: TStringField
      FieldName = 'E_Mail'
      Size = 50
    end
    object qrychama_clienteSite: TStringField
      FieldName = 'Site'
      Size = 50
    end
    object qrychama_clienteCodigo_Cidade: TIntegerField
      FieldName = 'Codigo_Cidade'
    end
    object qrychama_clienteProfissao: TStringField
      FieldName = 'Profissao'
      Size = 50
    end
    object qrychama_clienteData_Nascimento: TDateTimeField
      FieldName = 'Data_Nascimento'
    end
    object qrychama_clienteEstado_Civil: TStringField
      FieldName = 'Estado_Civil'
      Size = 50
    end
    object qrychama_clienteTelefone: TStringField
      FieldName = 'Telefone'
    end
    object qrychama_clienteCelular: TStringField
      FieldName = 'Celular'
    end
    object qrychama_clienteContato: TStringField
      FieldName = 'Contato'
      Size = 50
    end
    object qrychama_clienteTelefone_Contato: TStringField
      FieldName = 'Telefone_Contato'
    end
    object qrychama_clienteData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_clienteLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 50
    end
    object qrychama_clienteCEP: TStringField
      FieldName = 'CEP'
      Size = 50
    end
    object qrychama_clienteTipo_Logradouro: TStringField
      FieldName = 'Tipo_Logradouro'
      Size = 50
    end
    object qrychama_clienteCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qrychama_clienteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrychama_clienteDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_cliente
    Left = 496
    Top = 272
  end
end
