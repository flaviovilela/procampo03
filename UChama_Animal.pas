unit UChama_Animal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Animal = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    RGSexo: TRadioGroup;
    RGLocal: TRadioGroup;
    RGOrdena_Por: TRadioGroup;
    RGChamar: TRadioGroup;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaCodigo_Propriedade_Anterior: TIntegerField;
    qrychamaLocalizacao: TStringField;
    qrychamaNome: TStringField;
    qrychamaBrinco: TStringField;
    qrychamaSexo: TStringField;
    qrychamaCodigo_Categoria_Inicial: TIntegerField;
    qrychamaCodigo_Categoria: TIntegerField;
    qrychamaCodigo_Pai: TIntegerField;
    qrychamaCodigo_Mae: TIntegerField;
    qrychamaGrau_Sangue: TStringField;
    qrychamaRaca1: TStringField;
    qrychamaCodigo_Raca1: TIntegerField;
    qrychamaSangue1: TIntegerField;
    qrychamaSangue11: TIntegerField;
    qrychamaRaca2: TStringField;
    qrychamaCodigo_Raca2: TIntegerField;
    qrychamaSangue2: TIntegerField;
    qrychamaSangue22: TIntegerField;
    qrychamaRaca3: TStringField;
    qrychamaCodigo_Raca3: TIntegerField;
    qrychamaSangue3: TIntegerField;
    qrychamaSangue33: TIntegerField;
    qrychamaRaca4: TStringField;
    qrychamaCodigo_Raca4: TIntegerField;
    qrychamaSangue4: TIntegerField;
    qrychamaSangue44: TIntegerField;
    qrychamaUltimo_Peso: TFloatField;
    qrychamaUltima_Altura: TFloatField;
    qrychamaIEP: TIntegerField;
    qrychamaPeso: TFloatField;
    qrychamaAltura: TFloatField;
    qrychamaPreco: TFloatField;
    qrychamaData_Entrada: TDateTimeField;
    qrychamaOrigem: TStringField;
    qrychamaCodigo_Cor: TIntegerField;
    qrychamaCodigo_Pelagem: TIntegerField;
    qrychamaCodigo_Lote_Anterior: TIntegerField;
    qrychamaCodigo_Lote: TIntegerField;
    qrychamaCodigo_Piquete_Anterior: TIntegerField;
    qrychamaCodigo_Piquete: TIntegerField;
    qrychamaCoberta: TStringField;
    qrychamaDiagnosticada: TStringField;
    qrychamaAbortada: TStringField;
    qrychamaSeca: TStringField;
    qrychamaParida: TStringField;
    qrychamaBaixada: TStringField;
    qrychamaVendida: TStringField;
    qrychamaN_Partos: TIntegerField;
    qrychamaN_Abortos: TIntegerField;
    qrychamaCrias_Vivas: TIntegerField;
    qrychamaCrias_Mortas: TIntegerField;
    qrychamaUltima_Pesagem_Leite: TFloatField;
    qrychamaPenultima_Pesagem_Leite: TFloatField;
    qrychamaMedia_Atual: TFloatField;
    qrychamaIdade_Primeiro_Parto: TFloatField;
    qrychamaCodigo_Ultimo_Reprodutor: TIntegerField;
    qrychamaCodigo_Descarte: TIntegerField;
    qrychamaData_Nascimento: TDateTimeField;
    qrychamaData_Cadastro: TDateTimeField;
    qrychamaData_Desmama: TDateTimeField;
    qrychamaData_Aptidao_Novilha: TDateTimeField;
    qrychamaData_Ultima_Cobertura: TDateTimeField;
    qrychamaData_Ultimo_Enxerto: TDateTimeField;
    qrychamaData_Ultimo_Aborto: TDateTimeField;
    qrychamaData_Ultimo_Secamento: TDateTimeField;
    qrychamaData_Ultima_Paricao: TDateTimeField;
    qrychamaData_Baixa: TDateTimeField;
    qrychamaData_Previsao_Secamento: TDateTimeField;
    qrychamaData_Previsao_Paricao: TDateTimeField;
    qrychamaData_Previsao_Cobertura: TDateTimeField;
    qrychamaData_Ultima_Pesagem: TDateTimeField;
    qrychamaData_Ultima_Medicao: TDateTimeField;
    qrychamaData_Venda: TDateTimeField;
    qrychamaObservacoes: TStringField;
    qrychamaCaminho_Foto: TStringField;
    qrychamaPai: TStringField;
    qrychamaMae: TStringField;
    qrychamaRaca1_1: TStringField;
    qrychamaRaca2_1: TStringField;
    qrychamaRaca3_1: TStringField;
    qrychamaRaca4_1: TStringField;
    qrychamaCor: TStringField;
    qrychamaPelagem: TStringField;
    qrychamaLote_Anterior: TStringField;
    qrychamaLote: TStringField;
    qrychamaPiquete_Anterior: TStringField;
    qrychamaPiquete: TStringField;
    qrychamaUltimo_Reproduto: TStringField;
    qrychamaBrinco_Ultimo_Reprodutor: TStringField;
    qrychamaCategoria_Inicial: TStringField;
    qrychamaCategoria: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure RGSexoClick(Sender: TObject);
  private
    { Private declarations }
    procedure Atualiza_Dados;
  public
    { Public declarations }
  end;

var
  FrmChama_Animal: TFrmChama_Animal;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Animal, UCobertura, Diagnostico, Secamento, UParto, UAborto,
  UBaixa_Animal, UDesmama, USincronizacao_Cio, UColeta_Embriao;

{$R *.dfm}

procedure TFrmChama_Animal.Atualiza_Dados;
begin
  with qrychama, sql do
  begin
    close;
    clear;
    add('select CA.*, CA1.Nome as Pai, CA1.Brinco as Brinco_Pai, CA2.Nome as Mae, CA2.Brinco as Brinco_Mae,');
    add('CR1.Descricao as Raca1, CR2.Descricao as Raca2, CR3.Descricao as Raca3, CR4.Descricao as Raca4,');
    add('CC.Descricao as Cor, CPel.Descricao as Pelagem, CLAn.Descricao as Lote_Anterior, CL.Descricao as Lote,');
    add('CPiqAn.Descricao as Piquete_Anterior, CPiq.Descricao as Piquete, CA3.Nome as Ultimo_Reproduto,');
    add('CA3.Brinco as Brinco_Ultimo_Reprodutor, CCat.Descricao as Categoria_Inicial, CCat2.Descricao as Categoria from Cadastro_Animal CA');

    add('left join Cadastro_Animal CA1 on (CA.Codigo_Pai = CA1.Codigo)');
    add('left join Cadastro_Animal CA2 on (CA.Codigo_Mae = CA2.Codigo)');
    add('left join Cadastro_Raca CR1 on (CA.Codigo_Raca1 = CR1.Codigo)');
    add('left join Cadastro_Raca CR2 on (CA.Codigo_Raca2 = CR2.Codigo)');
    add('left join Cadastro_Raca CR3 on (CA.Codigo_Raca3 = CR3.Codigo)');
    add('left join Cadastro_Raca CR4 on (CA.Codigo_Raca4 = CR4.Codigo)');
    add('left join Cadastro_Cor CC on (CA.Codigo_Cor = CC.Codigo)');
    add('left join Cadastro_Pelagem CPel on (CA.Codigo_Pelagem = CPel.Codigo)');
    add('left join Cadastro_Lote CLAn on (CA.Codigo_Lote_Anterior = CLAn.Codigo)');
    add('left join Cadastro_Lote CL on (CA.Codigo_Lote = CL.Codigo)');
    add('left join Cadastro_Piquete CPiqAn on (CA.Codigo_Piquete_Anterior = CPiqAn.Codigo)');
    add('left join Cadastro_Piquete CPiq on (CA.Codigo_Piquete = CPiq.Codigo)');
    add('left join Cadastro_Animal CA3 on (CA.Codigo_Ultimo_Reprodutor = CA3.Codigo)');
    add('left join Cadastro_Categoria CCat on (CA.Codigo_Categoria_Inicial = CCat.Codigo)');
    add('left join Cadastro_Categoria CCat2 on (CA.Codigo_Categoria = CCat2.Codigo)');
    add('where CA.Codigo_Propriedade = :Propriedade and CA.Localizacao = :Localidade and ');
    add('CA.Sexo = :Sexo order by CA.Nome');
    Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
    Parameters.ParamByName('Localidade').Value:= 'PROPRIEDADE';
    Parameters.ParamByName('Sexo').Value:= 'FÊMEA';
    open;
  end;
end;

procedure TFrmChama_Animal.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Animal.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Animal <> nil) and (FrmCadastro_Animal.ativo = true) and (FrmCadastro_Animal.pai = 1) then
  begin
    FrmCadastro_Animal.EdtCodigo_Pai.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Animal.EdtPai.Text:= qrychamaBrinco.AsString + ' ' + qrychamaNome.AsString;
    FrmChama_Animal.Close;
  end
  else if (FrmCadastro_Animal <> nil) and (FrmCadastro_Animal.ativo = true) and (FrmCadastro_Animal.pai = 2) then
  begin
    FrmCadastro_Animal.EdtCodigo_Mae.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Animal.EdtMae.Text:= qrychamaBrinco.AsString + ' ' + qrychamaNome.AsString;
    FrmChama_Animal.Close;
  end
  else if (FrmCadastro_Animal <> NIl) and (FrmCadastro_Animal.ativo = true) then
  begin
    FrmCadastro_Animal.EdtCodigo.Text:= qrychamaCodigo.AsString;

    if (qrychamaLocalizacao.AsString = 'PROPRIEDADE') then
      FrmCadastro_Animal.RGLocalizacao.ItemIndex:= 0
    else
      FrmCadastro_Animal.RGLocalizacao.ItemIndex:= 1;

    FrmCadastro_Animal.EdtNome.Text:= qrychamaNome.AsString;
    FrmCadastro_Animal.EdtBrinco.Text:= qrychamaBrinco.AsString;
    FrmCadastro_Animal.CmbSexo.Text:= qrychamaSexo.AsString;
    if (qrychamaCodigo_Ultimo_Reprodutor.AsString <> '') then
      FrmCadastro_Animal.Cod_Rep:= qrychamaCodigo_Ultimo_Reprodutor.AsInteger;

  if (qrychamaSexo.AsString = 'MACHO') then
    begin
      FrmCadastro_Animal.CmbCategoria.Clear;
      with FrmCadastro_Animal.ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_lactante_macho;
        open;
      end;
      FrmCadastro_Animal.CmbCategoria.Items.Add(FrmCadastro_Animal.ADOQuery1.FieldByName('Descricao').AsString);

      with FrmCadastro_Animal.ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_em_crescimento_macho;
        open;
      end;
      FrmCadastro_Animal.CmbCategoria.Items.Add(FrmCadastro_Animal.ADOQuery1.FieldByName('Descricao').AsString);

      with FrmCadastro_Animal.ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_reprodutor;
        open;
      end;
      FrmCadastro_Animal.CmbCategoria.Items.Add(FrmCadastro_Animal.ADOQuery1.FieldByName('Descricao').AsString);

      with FrmCadastro_Animal.ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_rufiao;
        open;
      end;
      FrmCadastro_Animal.CmbCategoria.Items.Add(FrmCadastro_Animal.ADOQuery1.FieldByName('Descricao').AsString);

      with FrmCadastro_Animal.ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_boi_carreiro;
        open;
      end;
      FrmCadastro_Animal.CmbCategoria.Items.Add(FrmCadastro_Animal.ADOQuery1.FieldByName('Descricao').AsString);
    end
    else
    begin
      FrmCadastro_Animal.CmbCategoria.Clear;
      FrmCadastro_Animal.CmbCategoria.ItemIndex:= -1;
      with FrmCadastro_Animal.ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_lactante;
        open;
      end;
      FrmCadastro_Animal.CmbCategoria.Items.Add(FrmCadastro_Animal.ADOQuery1.FieldByName('Descricao').AsString);

      with FrmCadastro_Animal.ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_em_crescimento;
        open;
      end;
      FrmCadastro_Animal.CmbCategoria.Items.Add(FrmCadastro_Animal.ADOQuery1.FieldByName('Descricao').AsString);

      with FrmCadastro_Animal.ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_novilha;
        open;
      end;
      FrmCadastro_Animal.CmbCategoria.Items.Add(FrmCadastro_Animal.ADOQuery1.FieldByName('Descricao').AsString);

      with FrmCadastro_Animal.ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('select * from Cadastro_Categoria CC');
        sql.add('where CC.Codigo = :Situacao');
        Parameters.ParamByName('Situacao').Value:= situacao_ini_matriz;
        open;
      end;
      FrmCadastro_Animal.CmbCategoria.Items.Add(FrmCadastro_Animal.ADOQuery1.FieldByName('Descricao').AsString);
    end;

    FrmCadastro_Animal.ADOQuery1.Locate('Codigo', qrychamaCodigo_Categoria_Inicial.AsInteger, []);
    FrmCadastro_Animal.CmbCategoria.Text:= FrmCadastro_Animal.ADOQuery1Descricao.AsString;

    FrmCadastro_Animal.EdtCodigo_Pai.Text:= qrychamaCodigo_Pai.AsString;
    FrmCadastro_Animal.EdtPai.Text:= qrychamaPai.AsString;

    FrmCadastro_Animal.EdtCodigo_Mae.Text:= qrychamaCodigo_Mae.AsString;
    FrmCadastro_Animal.EdtMae.Text:= qrychamaMae.AsString;

    if (qrychamaRaca1.AsString = 'SIM') then
    begin
      FrmCadastro_Animal.CBRaca1.Enabled:= true;
      FrmCadastro_Animal.EdtCodigo_Raca1.Enabled:= true;
      FrmCadastro_Animal.EdtRaca1.Enabled:= true;
      FrmCadastro_Animal.EdtSangue1.Enabled:= true;
      FrmCadastro_Animal.EdtSangue11.Enabled:= true;

      FrmCadastro_Animal.CBRaca1.Checked:= true;
      FrmCadastro_Animal.EdtCodigo_Raca1.Text:= qrychamaCodigo_Raca1.AsString;
      FrmCadastro_Animal.EdtRaca1.Text:= qrychamaRaca1_1.AsString;
      FrmCadastro_Animal.EdtSangue1.Text:= qrychamaSangue1.AsString;
      FrmCadastro_Animal.EdtSangue11.Text:= qrychamaSangue11.AsString;
    end
    else
    begin
      //FrmCadastro_Animal.CBRaca1.Enabled:= false;
      FrmCadastro_Animal.EdtCodigo_Raca1.Enabled:= false;
      FrmCadastro_Animal.EdtRaca1.Enabled:= false;
      FrmCadastro_Animal.EdtSangue1.Enabled:= false;
      FrmCadastro_Animal.EdtSangue11.Enabled:= false;

      FrmCadastro_Animal.CBRaca1.Checked:= false;
      FrmCadastro_Animal.EdtCodigo_Raca1.Text:= '';
      FrmCadastro_Animal.EdtRaca1.Text:= '';
      FrmCadastro_Animal.EdtSangue1.Text:= '';
      FrmCadastro_Animal.EdtSangue11.Text:= '';
    end;

    if (qrychamaRaca2.AsString = 'SIM') then
    begin
      FrmCadastro_Animal.CBRaca2.Enabled:= true;
      FrmCadastro_Animal.EdtCodigo_Raca2.Enabled:= true;
      FrmCadastro_Animal.EdtRaca2.Enabled:= true;
      FrmCadastro_Animal.EdtSangue2.Enabled:= true;
      FrmCadastro_Animal.EdtSangue22.Enabled:= true;

      FrmCadastro_Animal.CBRaca2.Checked:= true;
      FrmCadastro_Animal.EdtCodigo_Raca2.Text:= qrychamaCodigo_Raca2.AsString;
      FrmCadastro_Animal.EdtRaca2.Text:= qrychamaRaca2_1.AsString;
      FrmCadastro_Animal.EdtSangue2.Text:= qrychamaSangue2.AsString;
      FrmCadastro_Animal.EdtSangue22.Text:= qrychamaSangue22.AsString;
    end
    else
    begin
      //FrmCadastro_Animal.CBRaca2.Enabled:= false;
      FrmCadastro_Animal.EdtCodigo_Raca2.Enabled:= false;
      FrmCadastro_Animal.EdtRaca2.Enabled:= false;
      FrmCadastro_Animal.EdtSangue2.Enabled:= false;
      FrmCadastro_Animal.EdtSangue22.Enabled:= false;

      FrmCadastro_Animal.CBRaca2.Checked:= false;
      FrmCadastro_Animal.EdtCodigo_Raca2.Text:= '';
      FrmCadastro_Animal.EdtRaca2.Text:= '';
      FrmCadastro_Animal.EdtSangue2.Text:= '';
      FrmCadastro_Animal.EdtSangue22.Text:= '';
    end;

    if (qrychamaRaca3.AsString = 'SIM') then
    begin
      FrmCadastro_Animal.CBRaca3.Enabled:= true;
      FrmCadastro_Animal.EdtCodigo_Raca3.Enabled:= true;
      FrmCadastro_Animal.EdtRaca3.Enabled:= true;
      FrmCadastro_Animal.EdtSangue3.Enabled:= true;
      FrmCadastro_Animal.EdtSangue33.Enabled:= true;

      FrmCadastro_Animal.CBRaca3.Checked:= true;
      FrmCadastro_Animal.EdtCodigo_Raca3.Text:= qrychamaCodigo_Raca3.AsString;
      FrmCadastro_Animal.EdtRaca3.Text:= qrychamaRaca3_1.AsString;
      FrmCadastro_Animal.EdtSangue3.Text:= qrychamaSangue3.AsString;
      FrmCadastro_Animal.EdtSangue33.Text:= qrychamaSangue33.AsString;
    end
    else
    begin
      //FrmCadastro_Animal.CBRaca3.Enabled:= false;
      FrmCadastro_Animal.EdtCodigo_Raca3.Enabled:= false;
      FrmCadastro_Animal.EdtRaca3.Enabled:= false;
      FrmCadastro_Animal.EdtSangue3.Enabled:= false;
      FrmCadastro_Animal.EdtSangue33.Enabled:= false;

      FrmCadastro_Animal.CBRaca3.Checked:= false;
      FrmCadastro_Animal.EdtCodigo_Raca3.Text:= '';
      FrmCadastro_Animal.EdtRaca3.Text:= '';
      FrmCadastro_Animal.EdtSangue3.Text:= '';
      FrmCadastro_Animal.EdtSangue33.Text:= '';
    end;

    if (qrychamaRaca4.AsString = 'SIM') then
    begin
      FrmCadastro_Animal.CBRaca4.Enabled:= true;
      FrmCadastro_Animal.EdtCodigo_Raca4.Enabled:= true;
      FrmCadastro_Animal.EdtRaca4.Enabled:= true;
      FrmCadastro_Animal.EdtSangue4.Enabled:= true;
      FrmCadastro_Animal.EdtSangue44.Enabled:= true;

      FrmCadastro_Animal.CBRaca4.Checked:= true;
      FrmCadastro_Animal.EdtCodigo_Raca4.Text:= qrychamaCodigo_Raca4.AsString;
      FrmCadastro_Animal.EdtRaca4.Text:= qrychamaRaca4_1.AsString;
      FrmCadastro_Animal.EdtSangue4.Text:= qrychamaSangue4.AsString;
      FrmCadastro_Animal.EdtSangue44.Text:= qrychamaSangue44.AsString;
    end
    else
    begin
      //FrmCadastro_Animal.CBRaca4.Enabled:= false;
      FrmCadastro_Animal.EdtCodigo_Raca4.Enabled:= false;
      FrmCadastro_Animal.EdtRaca4.Enabled:= false;
      FrmCadastro_Animal.EdtSangue4.Enabled:= false;
      FrmCadastro_Animal.EdtSangue44.Enabled:= false;

      FrmCadastro_Animal.CBRaca4.Checked:= false;
      FrmCadastro_Animal.EdtCodigo_Raca4.Text:= '';
      FrmCadastro_Animal.EdtRaca4.Text:= '';
      FrmCadastro_Animal.EdtSangue4.Text:= '';
      FrmCadastro_Animal.EdtSangue44.Text:= '';
    end;


    FrmCadastro_Animal.EdtUltimo_Peso.Text:= qrychamaUltimo_Peso.AsString;
    FrmCadastro_Animal.EdtUltima_Altura.Text:= qrychamaUltima_Altura.AsString;
    FrmCadastro_Animal.EdtIEP.Text:= qrychamaIEP.AsString;
    FrmCadastro_Animal.EdtPeso.Text:= qrychamaPeso.AsString;
    FrmCadastro_Animal.EdtAltura.Text:= qrychamaAltura.AsString;
    FrmCadastro_Animal.EdtPreco.Text:= qrychamaPreco.AsString;
    FrmCadastro_Animal.MEdtData_Entrada.Text:= qrychamaData_Entrada.AsString;
    FrmCadastro_Animal.CMBOrigem.Text:= qrychamaOrigem.AsString;
    FrmCadastro_Animal.LblComposicao.Visible:= true;
    FrmCadastro_Animal.LblComposicao.Caption:= qrychamaGrau_Sangue.AsString;

    FrmCadastro_Animal.EdtCodigo_Cor.Text:= qrychamaCodigo_Cor.AsString;
    FrmCadastro_Animal.EdtCor.Text:= qrychamaCor.AsString;
    FrmCadastro_Animal.EdtCodigo_Pelagem.Text:= qrychamaCodigo_Pelagem.AsString;
    FrmCadastro_Animal.EdtPelagem.Text:= qrychamaPelagem.AsString;
    FrmCadastro_Animal.EdtCodigo_Lote_Anterior.Text:= qrychamaCodigo_Lote_Anterior.AsString;
    FrmCadastro_Animal.EdtLote_Anterior.Text:= qrychamaLote_Anterior.AsString;
    FrmCadastro_Animal.EdtCodigo_Lote.Text:= qrychamaCodigo_Lote.AsString;
    FrmCadastro_Animal.EdtLote.Text:= qrychamaLote.AsString;
    FrmCadastro_Animal.EdtCodigo_Piquete_Anterior.Text:= qrychamaCodigo_Piquete_Anterior.AsString;
    FrmCadastro_Animal.EdtPiquete_Anterior.Text:= qrychamaPiquete_Anterior.AsString;
    FrmCadastro_Animal.EdtCodigo_Piquete.Text:= qrychamaCodigo_Piquete.AsString;
    FrmCadastro_Animal.EdtPiquete.Text:= qrychamaPiquete.AsString;

    if (qrychamaDiagnosticada.AsString = 'Sim') then
      FrmCadastro_Animal.CBDiagnosticada.Checked := true
    else
      FrmCadastro_Animal.CBDiagnosticada.Checked:= false;

    if (qrychamaCoberta.AsString = 'Sim') then
      FrmCadastro_Animal.CBCoberta.Checked:= true
    else
      FrmCadastro_Animal.CBCoberta.Checked:= false;

    if (qrychamaParida.AsString = 'Sim') then
      FrmCadastro_Animal.CBParida.Checked:= true
    else
      FrmCadastro_Animal.CBParida.Checked:= false;

    if (qrychamaSeca.AsString = 'Sim') then
      FrmCadastro_Animal.CBSeca.Checked:= true
    else
      FrmCadastro_Animal.CBSeca.Checked:= false;

    if (qrychamaAbortada.AsString = 'Sim') then
      FrmCadastro_Animal.CBAbortada.Checked:= true
    else
      FrmCadastro_Animal.CBAbortada.Checked:= false;

    if (qrychamaBaixada.AsString = 'Sim') then
      FrmCadastro_Animal.CBBaixada.Checked:= true
    else
      FrmCadastro_Animal.CBBaixada.Checked:= false;

    if (qrychamaVendida.AsString = 'Sim') then
      FrmCadastro_Animal.CBVendida.Checked:= true
    else
      FrmCadastro_Animal.CBVendida.Checked:= false;

    FrmCadastro_Animal.EdtN_Abortos.Text:= qrychamaN_Abortos.AsString;
    FrmCadastro_Animal.EdtN_Partos.Text:= qrychamaN_Partos.AsString;
    FrmCadastro_Animal.EdtCrias_Vivas.Text:= qrychamaCrias_Vivas.AsString;
    FrmCadastro_Animal.EdtCrias_Mortas.Text:= qrychamaCrias_Mortas.AsString;
    FrmCadastro_Animal.EdtUltima_Pesagem_Leite.Text:= FormatFloat('#0.0,0', qrychamaUltima_Pesagem_Leite.AsFloat);
    FrmCadastro_Animal.EdtPenultima_Pesagem_Leite.Text:= FormatFloat('#0.0,0', qrychamaPenultima_Pesagem_Leite.AsFloat);
    FrmCadastro_Animal.EdtMedia_Atual.Text:= FormatFloat('#0.0,0', qrychamaMedia_Atual.AsFloat);
    FrmCadastro_Animal.EdtIdade_Primeiro_Parto.Text:= qrychamaIdade_Primeiro_Parto.AsString;

    FrmCadastro_Animal.EdtCodigo_Ultimo_Reprodutor.Text:= qrychamaCodigo_Ultimo_Reprodutor.AsString;
    FrmCadastro_Animal.EdtUltimo_Reprodutor.Text:= qrychamaUltimo_Reproduto.AsString;
    FrmCadastro_Animal.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;

    FrmCadastro_Animal.MEdtData_Nascimento.Text:= qrychamaData_Nascimento.AsString;
    FrmCadastro_Animal.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;
    FrmCadastro_Animal.MEdtData_Desmama.Text:= qrychamaData_Desmama.AsString;
    FrmCadastro_Animal.MEdtNovilha_Apta.Text:= qrychamaData_Aptidao_Novilha.AsString;
    FrmCadastro_Animal.MedtData_Cobertura.Text:= qrychamaData_Ultima_Cobertura.AsString;
    FrmCadastro_Animal.MEdtData_Enxerto.Text:= qrychamaData_Ultimo_Enxerto.AsString;
    FrmCadastro_Animal.MedtData_Aborto.Text:= qrychamaData_Ultimo_Aborto.AsString;
    FrmCadastro_Animal.MEdtData_Ultimo_Secamento.Text:= qrychamaData_Ultimo_Secamento.AsString;
    FrmCadastro_Animal.MEdtData_Paricao.Text:= qrychamaData_Ultima_Paricao.AsString;
    FrmCadastro_Animal.MEdtData_Baixa.Text:= qrychamadata_baixa.AsString;
    FrmCadastro_Animal.MEdtData_Secamento.Text:= qrychamaData_Previsao_Secamento.AsString;
    FrmCadastro_Animal.MEdtData_Previsao_Paricao.Text:= qrychamaData_Previsao_Paricao.AsString;
    FrmCadastro_Animal.MEdtData_Previsao_Cobertura.Text:= qrychamaData_Previsao_Cobertura.AsString;
    FrmCadastro_Animal.MEdtData_Ultima_Pesagem.Text:= qrychamaData_Ultima_Pesagem.AsString;
    FrmCadastro_Animal.MEdtData_Ultima_Medicao.Text:= qrychamaData_Ultima_Medicao.AsString;
    FrmCadastro_Animal.MmoObservacoes.Text:= qrychamaObservacoes.AsString;

    FrmCadastro_Animal.BBtnSalvar.Enabled:= true;
    FrmCadastro_Animal.BBtnExcluir.Enabled:= true;
    FrmCadastro_Animal.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Animal.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Animal);
    FrmCadastro_Animal.achei:= true;
    FrmCadastro_Animal.PageControl1.TabIndex:= 0;
    FrmCadastro_Animal.PageControl2.TabIndex:= 0;
    FrmCadastro_Animal.TabSheet1.Enabled:= true;
  end
  else if (FrmCobertura <> nil) and (FrmCobertura.ativo = true) and (FrmCobertura.animal = 1) then
  begin
    FrmCobertura.EdtCodigo_Touro_Doadora.Text:= qrychamaCodigo.AsString;
    FrmCobertura.EdtTouro.Text:= qrychamaBrinco.AsString + ' ' + qrychamaNome.AsString;
  end
  else if (FrmCobertura <> nil) and (FrmCobertura.ativo = true) and (FrmCobertura.animal = 2) then
  begin
    FrmCobertura.EdtCodigo_Animal.Text:= qrychamaCodigo.AsString;
    FrmCobertura.EdtAnimal.Text:= qrychamaBrinco.AsString + ' ' + qrychamaNome.AsString;
    FrmCobertura.codigo_categoria_animal:= qrychamaCodigo_Categoria.AsInteger;
    FrmCobertura.categoria_inicial_animal:= qrychamaCategoria_Inicial.AsString;
  end
  else if (FrmDiagnostico <> nil) and (FrmDiagnostico.ativo = true) then
  begin
    FrmDiagnostico.EdtCodigo_Animal.Text:= qrychamaCodigo.AsString;
    FrmDiagnostico.EdtAnimal.Text:= qrychamaBrinco.AsString + ' ' + qrychamaNome.AsString;
    FrmDiagnostico.codigo_categoria_animal:= qrychamaCodigo_Categoria.AsInteger;
    FrmDiagnostico.MEdtData_Cobertura.Text:= qrychamaData_Ultima_Cobertura.AsString;
  end
  else if (FrmSecamento <> nil) and (FrmSecamento.ativo = true) then
  begin
    FrmSecamento.EdtCodigo_Animal.Text:= qrychamaCodigo.AsString;
    FrmSecamento.EdtAnimal.Text:= qrychamaBrinco.AsString + ' ' + qrychamaNome.AsString;
    FrmSecamento.codigo_categoria_animal:= qrychamaCodigo_Categoria.AsInteger;
    FrmSecamento.MEdtData_Diagnostico.Text:= qrychamaData_Ultimo_Enxerto.AsString;
  end
  else if (FrmParto <> nil) and (FrmParto.ativo = true) and (FrmParto.mae = 1) then
  begin
    FrmParto.EdtCodigo_Mae.Text:= qrychamaCodigo.AsString;
    FrmParto.EdtMae.Text:= qrychamaBrinco.AsString + ' ' + qrychamaNome.AsString;
    FrmParto.codigo_categoria_animal:= qrychamaCodigo_Categoria.AsInteger;
    FrmParto.codigo_categoria_animal_inicial:= qrychamaCodigo_Categoria_Inicial.AsInteger;
    FrmParto.ultima_paricao:= qrychamaData_Ultima_Paricao.AsDateTime;
    FrmParto.nascimento:= qrychamaData_Nascimento.AsDateTime;
    FrmParto.crias_vivas:= qrychamaCrias_Vivas.AsInteger;
    FrmParto.crias_mortas:= qrychamaCrias_Mortas.AsInteger;
    FrmParto.n_partos:= qrychamaN_Partos.AsInteger;
    //FrmCobertura.categoria_inicial_animal:= qrychamaCategoria_Inicial.AsString;
  end
  else if (FrmParto <> nil) and (FrmParto.ativo = true) and (FrmParto.mae = 2) then
  begin
    FrmParto.EdtCodigo_Pai.Text:= qrychamaCodigo.AsString;
    FrmParto.EdtPai.Text:= qrychamaBrinco.AsString + ' ' + qrychamaNome.AsString;
    FrmParto.codigo_categoria_animal:= qrychamaCodigo_Categoria.AsInteger;
    //FrmCobertura.categoria_inicial_animal:= qrychamaCategoria_Inicial.AsString;
  end
  else if (FrmAborto <> nil) and (FrmAborto.ativo = true) then
  begin
    FrmAborto.EdtCodigo_Animal.Text:= qrychamaCodigo.AsString;
    FrmAborto.EdtAnimal.Text:= qrychamaBrinco.AsString + ' ' + qrychamaNome.AsString;
    FrmAborto.codigo_categoria_animal:= qrychamaCodigo_Categoria.AsInteger;
    FrmAborto.crias_vivas:= qrychamaCrias_Vivas.AsInteger;
    FrmAborto.crias_mortas:= qrychamaCrias_Mortas.AsInteger;
    FrmAborto.n_abortos:= qrychamaN_Abortos.AsInteger;
    //FrmSecamento.MEdtData_Diagnostico.Text:= qrychamaData_Ultimo_Enxerto.AsString;
  end
  else if (FrmBaixa_Animal <> nil) and (FrmBaixa_Animal.ativo = true) then
  begin
    FrmBaixa_Animal.EdtCodigo_Animal.Text:= qrychamaCodigo.AsString;
    FrmBaixa_Animal.EdtAnimal.Text:= qrychamaBrinco.AsString + ' ' + qrychamaNome.AsString;
    FrmBaixa_Animal.codigo_categoria_animal:= qrychamaCodigo_Categoria.AsInteger;
    //FrmCobertura.categoria_inicial_animal:= qrychamaCategoria_Inicial.AsString;
  end
  else if (FrmDesmama <> nil) and (FrmDesmama.ativo = true) then
  begin
    FrmDesmama.EdtCodigo_Animal.Text:= qrychamaCodigo.AsString;
    FrmDesmama.EdtAnimal.Text:= qrychamaBrinco.AsString + ' ' + qrychamaNome.AsString;
    FrmDesmama.EdtCodigo_Mae.Text:= qrychamaCodigo_Mae.AsString;
    FrmDesmama.EdtMae.Text:= qrychamaMae.AsString;
    FrmDesmama.sexo:= qrychamaSexo.AsString;
    //FrmBaixa_Animal.codigo_categoria_animal:= qrychamaCodigo_Categoria.AsInteger;
    //FrmCobertura.categoria_inicial_animal:= qrychamaCategoria_Inicial.AsString;
  end
  else if (FrmSincronizacao_Cio <> nil) and (FrmSincronizacao_Cio.ativo = true) then
  begin
    FrmSincronizacao_Cio.EdtCodigo_Animal.Text:= qrychamaCodigo.AsString;
    FrmSincronizacao_Cio.EdtAnimal.Text:= qrychamaBrinco.AsString + ' ' + qrychamaNome.AsString;
  end
  else if (FrmColega_Embriao <> nil) and (FrmColega_Embriao.ativo = true) and (FrmColega_Embriao.mae = 1) then
  begin
    FrmColega_Embriao.EdtCodigo_Animal.Text:= qrychamaCodigo.AsString;
    FrmColega_Embriao.EdtAnimal.Text:= qrychamaBrinco.AsString + ' ' + qrychamaNome.AsString;
  end
  else if (FrmColega_Embriao <> nil) and (FrmColega_Embriao.ativo = true) and (FrmColega_Embriao.mae = 2) then
  begin
    FrmColega_Embriao.EdtCodigo_Pai.Text:= qrychamaCodigo.AsString;
    FrmColega_Embriao.EdtPai.Text:= qrychamaBrinco.AsString + ' ' + qrychamaNome.AsString;
  end;
  FrmChama_Animal.Close;
end;

procedure TFrmChama_Animal.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmChama_Animal.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Animal.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Animal;
end;

procedure TFrmChama_Animal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Animal.Release;
end;

procedure TFrmChama_Animal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    if (RGLocal.ItemIndex = 0) then
      RGLocal.ItemIndex:= 1
    else if (RGLocal.ItemIndex = 1) then
      RGLocal.ItemIndex:= 0;
    Consulta.Chama_Animal;
  end;

  if (key = vk_f3) then
  begin
    if (RGSexo.ItemIndex = 0) then
    begin
      RGChamar.Enabled:= true;
      RGSexo.ItemIndex:= 1;
    end
    else if (RGSexo.ItemIndex = 1) then
    begin
      RGChamar.Enabled:= false;
      RGSexo.ItemIndex:= 0;
    end;
    Consulta.Chama_Animal;
  end;

  if (key = vk_f4) then
  begin
    if (RGConsulta_Por.ItemIndex = 0) then
      RGConsulta_Por.ItemIndex:= 1
    else if (RGConsulta_Por.ItemIndex = 1) then
      RGConsulta_Por.ItemIndex:= 2
    else if (RGConsulta_Por.ItemIndex = 2) then
      RGConsulta_Por.ItemIndex:= 0;
    Consulta.Chama_Animal;
  end;

  if (key = vk_f5) then
  begin
    if (RGOrdena_Por.ItemIndex = 0) then
      RGOrdena_Por.ItemIndex:= 1
    else if (RGOrdena_Por.ItemIndex = 1) then
      RGOrdena_Por.ItemIndex:= 2
    else if (RGOrdena_Por.ItemIndex = 2) then
      RGOrdena_Por.ItemIndex:= 0;
    Consulta.Chama_Animal;
  end;

  if (key = vk_f6) then
  begin
    if (RGChamar.Enabled = true) then
    begin
      if (RGChamar.ItemIndex = 0) then
        RGChamar.ItemIndex:= 1
      else if (RGChamar.ItemIndex = 1) then
        RGChamar.ItemIndex:= 2
      else if (RGChamar.ItemIndex = 2) then
        RGChamar.ItemIndex:= 3
      else if (RGChamar.ItemIndex = 3) then
        RGChamar.ItemIndex:= 4
      else if (RGChamar.ItemIndex = 4) then
        RGChamar.ItemIndex:= 5
      else if (RGChamar.ItemIndex = 5) then
        RGChamar.ItemIndex:= 6
      else if (RGChamar.ItemIndex = 6) then
        RGChamar.ItemIndex:= 0;
      Consulta.Chama_Animal;
    end;
  end;

end;

procedure TFrmChama_Animal.FormShow(Sender: TObject);
begin
  Atualiza_Dados;
end;

procedure TFrmChama_Animal.RGSexoClick(Sender: TObject);
begin
  {if (RGSexo.ItemIndex = 0) then
  begin
    RGChamar.Enabled:= true;
    RGSexo.ItemIndex:= 1;
  end
  else if (RGSexo.ItemIndex = 1) then
  begin
    RGChamar.Enabled:= false;
    RGSexo.ItemIndex:= 0;
  end;}
end;

end.
