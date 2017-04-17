object FrmChama_Agenda_Telefonica: TFrmChama_Agenda_Telefonica
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Contatos Telef'#244'nicos'
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 401
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone1'
        Title.Caption = 'Telefone 1'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone2'
        Title.Caption = 'Telefone 2'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone3'
        Title.Caption = 'Telefone 3'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Data Cadastro'
        Width = 87
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
      'Descri'#231#227'o')
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
  object qrychama_agenda: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Agenda_Telefonica order by Nome')
    Left = 528
    Top = 272
    object qrychama_agendaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_agendaNome: TStringField
      FieldName = 'Nome'
      Size = 70
    end
    object qrychama_agendaTelefone1: TStringField
      FieldName = 'Telefone1'
    end
    object qrychama_agendaTelefone2: TStringField
      FieldName = 'Telefone2'
    end
    object qrychama_agendaTelefone3: TStringField
      FieldName = 'Telefone3'
    end
    object qrychama_agendaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_agenda
    Left = 496
    Top = 272
  end
end
