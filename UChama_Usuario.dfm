object FrmChama_Usuario: TFrmChama_Usuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Usu'#225'rio'
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
    Left = 252
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Login'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Senha'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
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
      'Descri'#231#227'o')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 252
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
  object RGOrdena_Por: TRadioGroup
    Left = 127
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    TabOrder = 3
  end
  object qrychama_usuario: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CU.*, CPU.Perfil from Cadastro_Usuario CU'
      
        'left join Cadastro_Perfil_Usuario CPU on (CU.Codigo_Perfil = CPU' +
        '.Codigo)')
    Left = 496
    Top = 320
    object qrychama_usuarioCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_usuarioNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qrychama_usuarioLogin: TStringField
      FieldName = 'Login'
      Size = 50
    end
    object qrychama_usuarioSenha: TStringField
      FieldName = 'Senha'
      Size = 10
    end
    object qrychama_usuarioData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_usuarioCodigo_Perfil: TIntegerField
      FieldName = 'Codigo_Perfil'
    end
    object qrychama_usuarioPerfil: TStringField
      FieldName = 'Perfil'
      Size = 30
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_usuario
    Left = 496
    Top = 272
  end
end
