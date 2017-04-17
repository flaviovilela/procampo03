object FrmChama_Animal: TFrmChama_Animal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Animal'
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
    Left = 672
    Top = 41
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
    Left = 2
    Top = 80
    Width = 941
    Height = 473
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 6
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
        FieldName = 'Codigo_Propriedade'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Propriedade_Anterior'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Localizacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 249
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Brinco'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sexo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Categoria_Inicial'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Categoria'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Pai'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Mae'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Grau_Sangue'
        Title.Caption = 'Sangue'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Raca1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Raca1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Sangue1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Sangue11'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Raca2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Raca2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Sangue2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Sangue22'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Raca3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Raca3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Sangue3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Sangue33'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Raca4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Raca4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Sangue4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Sangue44'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ultimo_Peso'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ultima_Altura'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IEP'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Peso'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Altura'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Preco'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Entrada'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Origem'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Cor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Pelagem'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Lote_Anterior'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Lote'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Piquete_Anterior'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Piquete'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Coberta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Diagnosticada'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Abortada'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Seca'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Parida'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Baixada'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Vendida'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Partos'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Abortos'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Crias_Vivas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Crias_Mortas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ultima_Pesagem_Leite'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Penultima_Pesagem_Leite'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Media_Atual'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Idade_Primeiro_Parto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Ultimo_Reprodutor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Descarte'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Nascimento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Desmama'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Aptidao_Novilha'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Ultima_Cobertura'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Ultimo_Enxerto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Ultimo_Aborto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Ultimo_Secamento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Ultima_Paricao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Baixa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Previsao_Secamento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Previsao_Paricao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Previsao_Cobertura'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Ultima_Pesagem'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Ultima_Medicao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Categoria'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacoes'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Caminho_Foto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Pai'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Brinco_Pai'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mae'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Brinco_Mae'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Raca1_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Raca2_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Raca3_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Raca4_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Cor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Pelagem'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Lote_Anterior'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Lote'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Piquete_Anterior'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Piquete'
        Visible = False
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 221
    Top = 1
    Width = 121
    Height = 73
    Caption = 'Consulta por - F4'
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Nome'
      'Brinco')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 671
    Top = 57
    Width = 249
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    TabOrder = 5
    OnChange = EdtConsultaChange
  end
  object RGSexo: TRadioGroup
    Left = 112
    Top = 1
    Width = 105
    Height = 73
    Caption = 'Sexo - F3'
    ItemIndex = 1
    Items.Strings = (
      'Macho'
      'F'#234'mea')
    TabOrder = 1
    OnClick = RGSexoClick
  end
  object RGLocal: TRadioGroup
    Left = 2
    Top = 1
    Width = 105
    Height = 73
    Caption = 'Local - F2'
    ItemIndex = 1
    Items.Strings = (
      'Externo'
      'Propriedade')
    TabOrder = 0
  end
  object RGOrdena_Por: TRadioGroup
    Left = 347
    Top = 1
    Width = 121
    Height = 73
    Caption = 'Ordena por - F5'
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Nome'
      'Brinco')
    TabOrder = 3
  end
  object RGChamar: TRadioGroup
    Left = 474
    Top = 1
    Width = 191
    Height = 73
    Caption = 'Chamar - F6'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Vazia'
      'Em Lacta'#231#227'o'
      'Coberta'
      'Diagn.'
      'Seca'
      'Seca / Diagn.')
    TabOrder = 4
  end
  object qrychama: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CA.*, CA1.Brinco + '#39' - '#39' + CA1.Nome as Pai, CA2.Brinco + ' +
        #39' - '#39' + CA2.Nome as Mae, '
      
        'CR1.Sigla as Raca1, CR2.Sigla as Raca2, CR3.Sigla as Raca3, CR4.' +
        'Sigla as Raca4, '
      
        'CC.Descricao as Cor, CPel.Descricao as Pelagem, CLAn.Descricao a' +
        's Lote_Anterior, CL.Descricao as Lote,'
      
        'CPiqAn.Descricao as Piquete_Anterior, CPiq.Descricao as Piquete,' +
        ' CA3.Nome as Ultimo_Reproduto, '
      
        'CA3.Brinco as Brinco_Ultimo_Reprodutor, CCat.Descricao as Catego' +
        'ria_Inicial, CCat2.Descricao as Categoria from Cadastro_Animal C' +
        'A'
      ''
      'left join Cadastro_Animal CA1 on (CA.Codigo_Pai = CA1.Codigo)'
      'left join Cadastro_Animal CA2 on (CA.Codigo_Mae = CA2.Codigo)'
      'left join Cadastro_Raca CR1 on (CA.Codigo_Raca1 = CR1.Codigo)'
      'left join Cadastro_Raca CR2 on (CA.Codigo_Raca2 = CR2.Codigo)'
      'left join Cadastro_Raca CR3 on (CA.Codigo_Raca3 = CR3.Codigo)'
      'left join Cadastro_Raca CR4 on (CA.Codigo_Raca4 = CR4.Codigo)'
      'left join Cadastro_Cor CC on (CA.Codigo_Cor = CC.Codigo)'
      
        'left join Cadastro_Pelagem CPel on (CA.Codigo_Pelagem = CPel.Cod' +
        'igo)'
      
        'left join Cadastro_Lote CLAn on (CA.Codigo_Lote_Anterior = CLAn.' +
        'Codigo)'
      'left join Cadastro_Lote CL on (CA.Codigo_Lote = CL.Codigo)'
      
        'left join Cadastro_Piquete CPiqAn on (CA.Codigo_Piquete_Anterior' +
        ' = CPiqAn.Codigo)'
      
        'left join Cadastro_Piquete CPiq on (CA.Codigo_Piquete = CPiq.Cod' +
        'igo)'
      
        'left join Cadastro_Animal CA3 on (CA.Codigo_Ultimo_Reprodutor = ' +
        'CA3.Codigo)'
      
        'left join Cadastro_Categoria CCat on (CA.Codigo_Categoria_Inicia' +
        'l = CCat.Codigo)'
      
        'left join Cadastro_Categoria CCat2 on (CA.Codigo_Categoria = CCa' +
        't2.Codigo)')
    Left = 496
    Top = 320
    object qrychamaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychamaCodigo_Propriedade: TIntegerField
      FieldName = 'Codigo_Propriedade'
    end
    object qrychamaCodigo_Propriedade_Anterior: TIntegerField
      FieldName = 'Codigo_Propriedade_Anterior'
    end
    object qrychamaLocalizacao: TStringField
      FieldName = 'Localizacao'
      Size = 15
    end
    object qrychamaNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qrychamaBrinco: TStringField
      FieldName = 'Brinco'
      Size = 30
    end
    object qrychamaSexo: TStringField
      FieldName = 'Sexo'
      Size = 10
    end
    object qrychamaCodigo_Categoria_Inicial: TIntegerField
      FieldName = 'Codigo_Categoria_Inicial'
    end
    object qrychamaCodigo_Categoria: TIntegerField
      FieldName = 'Codigo_Categoria'
    end
    object qrychamaCodigo_Pai: TIntegerField
      FieldName = 'Codigo_Pai'
    end
    object qrychamaCodigo_Mae: TIntegerField
      FieldName = 'Codigo_Mae'
    end
    object qrychamaGrau_Sangue: TStringField
      FieldName = 'Grau_Sangue'
      Size = 30
    end
    object qrychamaRaca1: TStringField
      FieldName = 'Raca1'
      Size = 3
    end
    object qrychamaCodigo_Raca1: TIntegerField
      FieldName = 'Codigo_Raca1'
    end
    object qrychamaSangue1: TIntegerField
      FieldName = 'Sangue1'
    end
    object qrychamaSangue11: TIntegerField
      FieldName = 'Sangue11'
    end
    object qrychamaRaca2: TStringField
      FieldName = 'Raca2'
      Size = 3
    end
    object qrychamaCodigo_Raca2: TIntegerField
      FieldName = 'Codigo_Raca2'
    end
    object qrychamaSangue2: TIntegerField
      FieldName = 'Sangue2'
    end
    object qrychamaSangue22: TIntegerField
      FieldName = 'Sangue22'
    end
    object qrychamaRaca3: TStringField
      FieldName = 'Raca3'
      Size = 3
    end
    object qrychamaCodigo_Raca3: TIntegerField
      FieldName = 'Codigo_Raca3'
    end
    object qrychamaSangue3: TIntegerField
      FieldName = 'Sangue3'
    end
    object qrychamaSangue33: TIntegerField
      FieldName = 'Sangue33'
    end
    object qrychamaRaca4: TStringField
      FieldName = 'Raca4'
      Size = 3
    end
    object qrychamaCodigo_Raca4: TIntegerField
      FieldName = 'Codigo_Raca4'
    end
    object qrychamaSangue4: TIntegerField
      FieldName = 'Sangue4'
    end
    object qrychamaSangue44: TIntegerField
      FieldName = 'Sangue44'
    end
    object qrychamaUltimo_Peso: TFloatField
      FieldName = 'Ultimo_Peso'
    end
    object qrychamaUltima_Altura: TFloatField
      FieldName = 'Ultima_Altura'
    end
    object qrychamaIEP: TIntegerField
      FieldName = 'IEP'
    end
    object qrychamaPeso: TFloatField
      FieldName = 'Peso'
    end
    object qrychamaAltura: TFloatField
      FieldName = 'Altura'
    end
    object qrychamaPreco: TFloatField
      FieldName = 'Preco'
    end
    object qrychamaData_Entrada: TDateTimeField
      FieldName = 'Data_Entrada'
    end
    object qrychamaOrigem: TStringField
      FieldName = 'Origem'
    end
    object qrychamaCodigo_Cor: TIntegerField
      FieldName = 'Codigo_Cor'
    end
    object qrychamaCodigo_Pelagem: TIntegerField
      FieldName = 'Codigo_Pelagem'
    end
    object qrychamaCodigo_Lote_Anterior: TIntegerField
      FieldName = 'Codigo_Lote_Anterior'
    end
    object qrychamaCodigo_Lote: TIntegerField
      FieldName = 'Codigo_Lote'
    end
    object qrychamaCodigo_Piquete_Anterior: TIntegerField
      FieldName = 'Codigo_Piquete_Anterior'
    end
    object qrychamaCodigo_Piquete: TIntegerField
      FieldName = 'Codigo_Piquete'
    end
    object qrychamaCoberta: TStringField
      FieldName = 'Coberta'
      Size = 3
    end
    object qrychamaDiagnosticada: TStringField
      FieldName = 'Diagnosticada'
      Size = 3
    end
    object qrychamaAbortada: TStringField
      FieldName = 'Abortada'
      Size = 3
    end
    object qrychamaSeca: TStringField
      FieldName = 'Seca'
      Size = 3
    end
    object qrychamaParida: TStringField
      FieldName = 'Parida'
      Size = 3
    end
    object qrychamaBaixada: TStringField
      FieldName = 'Baixada'
      Size = 3
    end
    object qrychamaVendida: TStringField
      FieldName = 'Vendida'
      Size = 3
    end
    object qrychamaN_Partos: TIntegerField
      FieldName = 'N_Partos'
    end
    object qrychamaN_Abortos: TIntegerField
      FieldName = 'N_Abortos'
    end
    object qrychamaCrias_Vivas: TIntegerField
      FieldName = 'Crias_Vivas'
    end
    object qrychamaCrias_Mortas: TIntegerField
      FieldName = 'Crias_Mortas'
    end
    object qrychamaUltima_Pesagem_Leite: TFloatField
      FieldName = 'Ultima_Pesagem_Leite'
    end
    object qrychamaPenultima_Pesagem_Leite: TFloatField
      FieldName = 'Penultima_Pesagem_Leite'
    end
    object qrychamaMedia_Atual: TFloatField
      FieldName = 'Media_Atual'
    end
    object qrychamaIdade_Primeiro_Parto: TFloatField
      FieldName = 'Idade_Primeiro_Parto'
    end
    object qrychamaCodigo_Ultimo_Reprodutor: TIntegerField
      FieldName = 'Codigo_Ultimo_Reprodutor'
    end
    object qrychamaCodigo_Descarte: TIntegerField
      FieldName = 'Codigo_Descarte'
    end
    object qrychamaData_Nascimento: TDateTimeField
      FieldName = 'Data_Nascimento'
    end
    object qrychamaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychamaData_Desmama: TDateTimeField
      FieldName = 'Data_Desmama'
    end
    object qrychamaData_Aptidao_Novilha: TDateTimeField
      FieldName = 'Data_Aptidao_Novilha'
    end
    object qrychamaData_Ultima_Cobertura: TDateTimeField
      FieldName = 'Data_Ultima_Cobertura'
    end
    object qrychamaData_Ultimo_Enxerto: TDateTimeField
      FieldName = 'Data_Ultimo_Enxerto'
    end
    object qrychamaData_Ultimo_Aborto: TDateTimeField
      FieldName = 'Data_Ultimo_Aborto'
    end
    object qrychamaData_Ultimo_Secamento: TDateTimeField
      FieldName = 'Data_Ultimo_Secamento'
    end
    object qrychamaData_Ultima_Paricao: TDateTimeField
      FieldName = 'Data_Ultima_Paricao'
    end
    object qrychamaData_Baixa: TDateTimeField
      FieldName = 'Data_Baixa'
    end
    object qrychamaData_Previsao_Secamento: TDateTimeField
      FieldName = 'Data_Previsao_Secamento'
    end
    object qrychamaData_Previsao_Paricao: TDateTimeField
      FieldName = 'Data_Previsao_Paricao'
    end
    object qrychamaData_Previsao_Cobertura: TDateTimeField
      FieldName = 'Data_Previsao_Cobertura'
    end
    object qrychamaData_Ultima_Pesagem: TDateTimeField
      FieldName = 'Data_Ultima_Pesagem'
    end
    object qrychamaData_Ultima_Medicao: TDateTimeField
      FieldName = 'Data_Ultima_Medicao'
    end
    object qrychamaData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
    object qrychamaObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 500
    end
    object qrychamaCaminho_Foto: TStringField
      FieldName = 'Caminho_Foto'
      Size = 300
    end
    object qrychamaPai: TStringField
      FieldName = 'Pai'
      ReadOnly = True
      Size = 83
    end
    object qrychamaMae: TStringField
      FieldName = 'Mae'
      ReadOnly = True
      Size = 83
    end
    object qrychamaRaca1_1: TStringField
      FieldName = 'Raca1_1'
      Size = 3
    end
    object qrychamaRaca2_1: TStringField
      FieldName = 'Raca2_1'
      Size = 3
    end
    object qrychamaRaca3_1: TStringField
      FieldName = 'Raca3_1'
      Size = 3
    end
    object qrychamaRaca4_1: TStringField
      FieldName = 'Raca4_1'
      Size = 3
    end
    object qrychamaCor: TStringField
      FieldName = 'Cor'
      Size = 50
    end
    object qrychamaPelagem: TStringField
      FieldName = 'Pelagem'
      Size = 50
    end
    object qrychamaLote_Anterior: TStringField
      FieldName = 'Lote_Anterior'
      Size = 50
    end
    object qrychamaLote: TStringField
      FieldName = 'Lote'
      Size = 50
    end
    object qrychamaPiquete_Anterior: TStringField
      FieldName = 'Piquete_Anterior'
      Size = 50
    end
    object qrychamaPiquete: TStringField
      FieldName = 'Piquete'
      Size = 50
    end
    object qrychamaUltimo_Reproduto: TStringField
      FieldName = 'Ultimo_Reproduto'
      Size = 50
    end
    object qrychamaBrinco_Ultimo_Reprodutor: TStringField
      FieldName = 'Brinco_Ultimo_Reprodutor'
      Size = 30
    end
    object qrychamaCategoria_Inicial: TStringField
      FieldName = 'Categoria_Inicial'
      Size = 50
    end
    object qrychamaCategoria: TStringField
      FieldName = 'Categoria'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama
    Left = 496
    Top = 272
  end
end
