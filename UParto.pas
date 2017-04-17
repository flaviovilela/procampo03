unit UParto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmParto = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Cadastro: TMaskEdit;
    LblData_Cadastro: TLabel;
    BBtnPesquisar: TToolButton;
    LblMarca: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    EdtMae: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MEdtData_Parto: TMaskEdit;
    EdtN_Cria_Vivas: TEdit;
    EdtNatimortos: TEdit;
    CBRetencao: TCheckBox;
    CBParto_Normal: TCheckBox;
    EdtPeso_Matriz: TEdit;
    EdtPai: TEdit;
    EdtCodigo_Pai: TEdit;
    EdtCodigo_Mae: TEdit;
    GroupBox2: TGroupBox;
    CmbCria1: TComboBox;
    CmbCria2: TComboBox;
    CmbCria3: TComboBox;
    CBCria1: TCheckBox;
    CBCria2: TCheckBox;
    CBCria3: TCheckBox;
    MMObservacao: TMemo;
    Label4: TLabel;
    EdtLote: TEdit;
    EdtCodigo_Lote: TEdit;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Codigo_Propriedade: TIntegerField;
    ADOQuery1Codigo_Propriedade_Anterior: TIntegerField;
    ADOQuery1Localizacao: TStringField;
    ADOQuery1Nome: TStringField;
    ADOQuery1Brinco: TStringField;
    ADOQuery1Sexo: TStringField;
    ADOQuery1Codigo_Categoria_Inicial: TIntegerField;
    ADOQuery1Codigo_Categoria: TIntegerField;
    ADOQuery1Codigo_Pai: TIntegerField;
    ADOQuery1Codigo_Mae: TIntegerField;
    ADOQuery1Grau_Sangue: TStringField;
    ADOQuery1Raca1: TStringField;
    ADOQuery1Codigo_Raca1: TIntegerField;
    ADOQuery1Sangue1: TIntegerField;
    ADOQuery1Sangue11: TIntegerField;
    ADOQuery1Raca2: TStringField;
    ADOQuery1Codigo_Raca2: TIntegerField;
    ADOQuery1Sangue2: TIntegerField;
    ADOQuery1Sangue22: TIntegerField;
    ADOQuery1Raca3: TStringField;
    ADOQuery1Codigo_Raca3: TIntegerField;
    ADOQuery1Sangue3: TIntegerField;
    ADOQuery1Sangue33: TIntegerField;
    ADOQuery1Raca4: TStringField;
    ADOQuery1Codigo_Raca4: TIntegerField;
    ADOQuery1Sangue4: TIntegerField;
    ADOQuery1Sangue44: TIntegerField;
    ADOQuery1Ultimo_Peso: TFloatField;
    ADOQuery1Ultima_Altura: TFloatField;
    ADOQuery1IEP: TIntegerField;
    ADOQuery1Peso: TFloatField;
    ADOQuery1Altura: TFloatField;
    ADOQuery1Preco: TFloatField;
    ADOQuery1Data_Entrada: TDateTimeField;
    ADOQuery1Origem: TStringField;
    ADOQuery1Codigo_Cor: TIntegerField;
    ADOQuery1Codigo_Pelagem: TIntegerField;
    ADOQuery1Codigo_Lote_Anterior: TIntegerField;
    ADOQuery1Codigo_Lote: TIntegerField;
    ADOQuery1Codigo_Piquete_Anterior: TIntegerField;
    ADOQuery1Codigo_Piquete: TIntegerField;
    ADOQuery1Coberta: TStringField;
    ADOQuery1Diagnosticada: TStringField;
    ADOQuery1Abortada: TStringField;
    ADOQuery1Seca: TStringField;
    ADOQuery1Parida: TStringField;
    ADOQuery1Baixada: TStringField;
    ADOQuery1Vendida: TStringField;
    ADOQuery1N_Partos: TIntegerField;
    ADOQuery1N_Abortos: TIntegerField;
    ADOQuery1Crias_Vivas: TIntegerField;
    ADOQuery1Crias_Mortas: TIntegerField;
    ADOQuery1Ultima_Pesagem_Leite: TFloatField;
    ADOQuery1Penultima_Pesagem_Leite: TFloatField;
    ADOQuery1Media_Atual: TFloatField;
    ADOQuery1Idade_Primeiro_Parto: TFloatField;
    ADOQuery1Codigo_Ultimo_Reprodutor: TIntegerField;
    ADOQuery1Codigo_Descarte: TIntegerField;
    ADOQuery1Data_Nascimento: TDateTimeField;
    ADOQuery1Data_Cadastro: TDateTimeField;
    ADOQuery1Data_Desmama: TDateTimeField;
    ADOQuery1Data_Aptidao_Novilha: TDateTimeField;
    ADOQuery1Data_Ultima_Cobertura: TDateTimeField;
    ADOQuery1Data_Ultimo_Enxerto: TDateTimeField;
    ADOQuery1Data_Ultimo_Aborto: TDateTimeField;
    ADOQuery1Data_Ultimo_Secamento: TDateTimeField;
    ADOQuery1Data_Ultima_Paricao: TDateTimeField;
    ADOQuery1Data_Baixa: TDateTimeField;
    ADOQuery1Data_Previsao_Secamento: TDateTimeField;
    ADOQuery1Data_Previsao_Paricao: TDateTimeField;
    ADOQuery1Data_Previsao_Cobertura: TDateTimeField;
    ADOQuery1Data_Ultima_Pesagem: TDateTimeField;
    ADOQuery1Data_Ultima_Medicao: TDateTimeField;
    ADOQuery1Data_Venda: TDateTimeField;
    ADOQuery1Observacoes: TStringField;
    ADOQuery1Caminho_Foto: TStringField;
    ADOQuery2: TADOQuery;
    ADOQuery2Codigo: TIntegerField;
    ADOQuery2Sigla: TStringField;
    ADOQuery2Descricao: TStringField;
    ADOQuery2Data_Cadastro: TDateTimeField;
    ADOQuery3: TADOQuery;
    ADOQuery3Cod: TIntegerField;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtCodigo_MaeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMaeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PaiKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPaiKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_MaeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_PaiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtLoteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_LoteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_LoteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_PartoEnter(Sender: TObject);
    procedure MEdtData_PartoExit(Sender: TObject);
  private
    Util: TUtil;
    Parto: TParto;
    Animal: TAnimal;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Calcula_Sangue_Filho;
  public
    ativo, enderec, achei: boolean;
    mae, codigo_categoria_animal, codigo_categoria_animal_inicial, crias_vivas, crias_mortas, n_partos, iep: integer;
    ultima_paricao, nascimento: TDate;

    sp: array[1..4] of integer;
    sm: array[1..4] of integer;

    rp: array[1..4] of string;
    rm: array[1..4] of string;

    sfp: array[1..4] of integer;
    sfm: array[1..4] of integer;

    sangue_pai: array[1..4, 1..2] of integer;
    sangue_mae: array[1..4, 1..2] of integer;

    rest_pai: array[1..4] of string;
    rest_mae: array[1..4] of string;
    filho: array[1..8, 1..3] of string;
    sangue_final: string;


    r2_pai:array[1..4] of integer;
    r3_pai:array[1..4] of integer;
    r2_mae:array[1..4] of integer;
    r3_mae:array[1..4] of integer;

    ordena: array[1..8, 1..3] of integer;
    ordena_aux: double;
    ordena_aux2: double;
    aux: array[1..3] of integer;

    codigo_raca_pai1, codigo_raca_pai2, codigo_raca_pai3, codigo_raca_pai4, codigo_raca_mae1, codigo_raca_mae2,
    codigo_raca_mae3, codigo_raca_mae4,
    sangue1_pai, sangue11_pai, sangue2_pai, sangue22_pai, sangue3_pai, sangue33_pai, sangue4_pai, sangue44_pai,
    sangue1_mae, sangue11_mae, sangue2_mae, sangue22_mae, sangue3_mae, sangue33_mae, sangue4_mae, sangue44_mae,
    mmc, r1, sangue1_filho, sangue11_filho, sangue2_filho, sangue22_filho, sangue3_filho, sangue33_filho,
    sangue4_filho, sangue44_filho, z: integer;
    raca_pai1, raca_pai2, raca_pai3, raca_pai4, raca_mae1, raca_mae2, raca_mae3, raca_mae4: string;
  protected
  end;

var
  FrmParto: TFrmParto;
implementation

uses UDM, UChama_Setor, UChama_Animal, UChama_Lote;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmParto.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmParto);
  Util.Desabilita_Campos(FrmParto);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmParto.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Parto.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU SETOR ' + EdtMae.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmParto);
  end;
end;

procedure TFrmParto.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmParto.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
  FrmChama_Setor.ShowModal;
  FrmChama_Setor.Free;
end;

procedure TFrmParto.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        iep:= 0;
        Gera_Codigo;
        try
          Parto.Inserir;
          Util.Atualiza_Parto;
          Util.Atualiza_Parto_Previsao;
          
          if (codigo_categoria_animal_inicial = situacao_ini_novilha) then
          begin
            Util.Atualiza_Parto_Idade_Primeiro_Parto_Novilha;
            Util.Atualiza_Categoria_Inicial(StrToInt(EdtCodigo_Mae.Text), situacao_ini_matriz);
          end;

          Util.Atualiza_Categoria(StrToInt(EdtCodigo_Mae.Text), situacao_vaca_lac_vazia_normal);
          Calcula_Sangue_Filho;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'LANÇOU PARTO DO ANIMAL ' + EdtMae.Text + '.', TimeToStr(time), insercao, date);
        except
          Mensagem.Impossivel_Executar;
        end;
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
      try
        Parto.Alterar;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU SETOR ' + EdtMae.Text + '.', TimeToStr(time), alteracao, date);
      except
        Mensagem.Impossivel_Executar;
      end;
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmParto);
end;

procedure TFrmParto.Calcula_Sangue_Filho;
var
  x, y, ord, w: integer;
begin
  ord:= 1;
  if (CBCria1.Checked = true) then
    begin
      ADOQuery1.close;
      ADOQuery1.open;
      ADOQuery2.close;
      ADOQuery2.open;
      ADOQuery1.Locate('Codigo_Animal', EdtCodigo_Mae.Text, []);
      codigo_raca_mae1:= ADOQuery1Codigo_Raca1.AsInteger;
      ADOQuery2.Locate('Codigo_raca', codigo_raca_mae1, []);
      raca_mae1:= ADOQuery2Sigla.AsString;

      sangue_mae[1][1]:= ADOQuery1Sangue1.AsInteger;
      sangue_mae[1][2]:= ADOQuery1Sangue11.AsInteger;
      codigo_raca_mae2:= ADOQuery1Codigo_Raca2.AsInteger;
      ADOQuery2.Locate('Codigo_raca', codigo_raca_mae2, []);
      raca_mae2:= ADOQuery2Sigla.AsString;

      sangue_mae[2][1]:= ADOQuery1Sangue2.AsInteger;
      sangue_mae[2][2]:= ADOQuery1Sangue22.AsInteger;
      codigo_raca_mae3:= ADOQuery1Codigo_Raca3.AsInteger;
      ADOQuery2.Locate('Codigo_raca', codigo_raca_mae3, []);
      raca_mae3:= ADOQuery2Sigla.AsString;

      sangue_mae[3][1]:= ADOQuery1Sangue3.AsInteger;
      sangue_mae[3][2]:= ADOQuery1Sangue33.AsInteger;
      codigo_raca_mae4:= ADOQuery1Codigo_Raca4.AsInteger;
      ADOQuery2.Locate('Codigo_raca', codigo_raca_mae4, []);
      raca_mae4:= ADOQuery2Sigla.AsString;

      sangue_mae[4][1]:= ADOQuery1Sangue4.AsInteger;
      sangue_mae[4][2]:= ADOQuery1Sangue44.AsInteger;
      sm[1]:= codigo_raca_mae1;
      sm[2]:= codigo_raca_mae2;
      sm[3]:= codigo_raca_mae3;
      sm[4]:= codigo_raca_mae4;

      rm[1]:= raca_mae1;
      rm[2]:= raca_mae2;
      rm[3]:= raca_mae3;
      rm[4]:= raca_mae4;

      ADOQuery1.close;
      ADOQuery1.open;
      ADOQuery1.Locate('Codigo_Animal', EdtCodigo_Pai.Text, []);
      codigo_raca_pai1:= ADOQuery1Codigo_Raca1.AsInteger;
      ADOQuery2.Locate('Codigo_Raca', codigo_raca_pai1, []);
      raca_pai1:= ADOQuery2Sigla.AsString;

      sangue_pai[1][1]:= ADOQuery1Sangue1.AsInteger;
      sangue_pai[1][2]:= ADOQuery1Sangue11.AsInteger;
      codigo_raca_pai2:= ADOQuery1Codigo_Raca2.AsInteger;
      ADOQuery2.Locate('Codigo_Raca', codigo_raca_pai2, []);
      raca_pai2:= ADOQuery2Sigla.AsString;

      sangue_pai[2][1]:= ADOQuery1Sangue2.AsInteger;
      sangue_pai[2][2]:= ADOQuery1Sangue22.AsInteger;
      codigo_raca_pai3:= ADOQuery1Codigo_Raca3.AsInteger;
      ADOQuery2.Locate('Codigo_Raca', codigo_raca_pai3, []);
      raca_pai3:= ADOQuery2Sigla.AsString;

      sangue_pai[3][1]:= ADOQuery1Sangue3.AsInteger;
      sangue_pai[3][2]:= ADOQuery1Sangue33.AsInteger;
      codigo_raca_pai4:= ADOQuery1Codigo_Raca4.AsInteger;
      ADOQuery2.Locate('Codigo_Raca', codigo_raca_pai4, []);
      raca_pai4:= ADOQuery2Sigla.AsString;

      sangue_pai[4][1]:= ADOQuery1Sangue4.AsInteger;
      sangue_pai[4][2]:= ADOQuery1Sangue44.AsInteger;
      sp[1]:= codigo_raca_pai1;
      sp[2]:= codigo_raca_pai2;
      sp[3]:= codigo_raca_pai3;
      sp[4]:= codigo_raca_pai4;

      rp[1]:= raca_pai1;
      rp[2]:= raca_pai2;
      rp[3]:= raca_pai3;
      rp[4]:= raca_pai4;


      //usar método bubble sort para ordenar dados
      for x := 1 to 4 do
        begin
          if (sp[x] <> Null) and (sp[x] > 0) then
            begin
              for y := 1 to 4 do
                begin
                  if sp[x] = sm[y] then  //verificando raças iguais
                    begin
                      //ADOQuery2.Locate('Codigo_Raca', sp[x], []);
                      //rp[x]:= ADOQuery2Sigla.AsString;
                      mmc:= Util.Calcula_MMC(sangue_pai[x][2], sangue_mae[y][2]);
                      r1:= mmc;
                      sangue_pai[x][1]:= (mmc div sangue_pai[x][2]) * sangue_pai[x][1];
                      sangue_mae[y][1]:= (mmc div sangue_mae[y][2]) * sangue_mae[y][1];
                      r2_pai[x]:= sangue_pai[x][1] + sangue_mae[y][1]; //numerador
                      r3_pai[x]:= r1 * 2; //denominador
                      //rest_pai[x]:= IntToStr(r2_pai[x]) + '/' + IntToStr(r3_pai[x]) + ', ' + rp[x];

                      ordena[x][1]:= sp[x];
                      ordena[x][2]:= r2_pai[x];
                      ordena[x][3]:= r3_pai[x];
                      Break;
                    end;

                    if (y = 4) then
                      begin
                        //ADOQuery2.Locate('Codigo_Raca', sp[x], []);
                        //rp[x]:= ADOQuery2Sigla.AsString;
                        r2_pai[x]:= sangue_pai[x][1];
                        r3_pai[x]:= sangue_pai[x][2] * 2;
                        //rest_pai[x]:= IntToStr(r2_pai[x]) + '/' + IntToStr(r3_pai[x]) + ', ' + rp[x];

                        ordena[x][1]:= sp[x];
                        ordena[x][2]:= r2_pai[x];
                        ordena[x][3]:= r3_pai[x];
                        Break;
                      end;
                end;
            end;
        end;
    //end;

    {mae}
    w:= 5;
    for y := 1 to 4 do
      begin
        if (sm[y] <> Null) and (sm[y] > 0) then
          begin
            for x := 1 to 4 do
              begin
                if sm[y] = sp[x] then
                  begin
                    Inc(w);
                    Break;
                  end;

                  if (x = 4) then
                    begin
                      //ADOQuery2.Locate('Codigo_Raca', sm[y], []);
                      //rm[y]:= ADOQuery2Sigla.AsString;
                      r2_mae[y]:= sangue_mae[y][1];
                      r3_mae[y]:= sangue_mae[y][2] * 2;
                      //rest_mae[y]:= IntToStr(r2_mae[y]) + '/' + IntToStr(r3_mae[y]) + ', ' + rm[y];
                      ordena[w][1]:= sm[y];
                      ordena[w][2]:= r2_mae[y];
                      ordena[w][3]:= r3_mae[y];
                      inc(w);
                      Break;
                    end;
                    //inc(w);
              end;
          end;
      end;

      //colocando os valores que estavam espalhados no vetor, em ordem (independente da ordem Asc ou Desc)
      for x := 2 to 8 do
        begin
          if (ordena[x-1][2] = Null) or (ordena[x-1][2] = 0) then
            begin
              w:= x-1;
              for y := w to 8 do
                begin
                  if (ordena[y][2] <> Null) and (ordena[y][2] > 0) then
                    begin
                      ordena[w][1]:= ordena[y][1];
                      ordena[w][2]:= ordena[y][2];
                      ordena[w][3]:= ordena[y][3];
                      ordena[y][1]:= 0;
                      ordena[y][2]:= 0;
                      ordena[y][3]:= 0;
                      break;
                    end;
                end;
            end;
        end;

        //ordenando os valores
       for x := 1 to 7 do
         for ord := 1 to 6 do
          begin
            if (ordena[ord][1] <> Null) and (ordena[ord][1] > 0) and
                (ordena[ord + 1][1] <> Null) and (ordena[ord + 1][1] > 0) then
              begin
                ordena_aux:= ((ordena[ord][2] / ordena[ord][3]));
                ordena_aux2:= ((ordena[ord + 1][2] / ordena[ord + 1][3]));
                if (ordena_aux < ordena_aux2) then
                  begin
                    for w := 1 to 3 do
                      begin
                        aux[w]:= ordena[ord][w];
                        ordena[ord][w]:= ordena[ord + 1][w];
                        ordena[ord + 1][w]:= aux[w];
                        //filho[ord][w]:= IntToStr(ordena[ord][w]);
                      end;
                  end;
              end;
          end;

      sangue_final:= '';
      {ADOQuery1.close;
      ADOQuery1.open;
      ADOQuery1.Last;}
      with ADOQuery3 do
      begin
        close;
        sql.clear;
        sql.add('select max(Codigo) as Cod from Cadastro_Animal');
        open;
      end;
      Animal.Inserir_Parto(CmbCria1.Text);
    end;

  if (CBCria2.Checked = true) then
    begin
      ADOQuery1.close;
      ADOQuery1.open;
      ADOQuery2.close;
      ADOQuery2.open;
      ADOQuery1.Locate('Codigo_Animal', EdtCodigo_Mae.Text, []);
      codigo_raca_mae1:= ADOQuery1Codigo_Raca1.AsInteger;
      ADOQuery2.Locate('Codigo_raca', codigo_raca_mae1, []);
      raca_mae1:= ADOQuery2Sigla.AsString;

      sangue_mae[1][1]:= ADOQuery1Sangue1.AsInteger;
      sangue_mae[1][2]:= ADOQuery1Sangue11.AsInteger;
      codigo_raca_mae2:= ADOQuery1Codigo_Raca2.AsInteger;
      ADOQuery2.Locate('Codigo_raca', codigo_raca_mae2, []);
      raca_mae2:= ADOQuery2Sigla.AsString;

      sangue_mae[2][1]:= ADOQuery1Sangue2.AsInteger;
      sangue_mae[2][2]:= ADOQuery1Sangue22.AsInteger;
      codigo_raca_mae3:= ADOQuery1Codigo_Raca3.AsInteger;
      ADOQuery2.Locate('Codigo_raca', codigo_raca_mae3, []);
      raca_mae3:= ADOQuery2Sigla.AsString;

      sangue_mae[3][1]:= ADOQuery1Sangue3.AsInteger;
      sangue_mae[3][2]:= ADOQuery1Sangue33.AsInteger;
      codigo_raca_mae4:= ADOQuery1Codigo_Raca4.AsInteger;
      ADOQuery2.Locate('Codigo_raca', codigo_raca_mae4, []);
      raca_mae4:= ADOQuery2Sigla.AsString;

      sangue_mae[4][1]:= ADOQuery1Sangue4.AsInteger;
      sangue_mae[4][2]:= ADOQuery1Sangue44.AsInteger;
      sm[1]:= codigo_raca_mae1;
      sm[2]:= codigo_raca_mae2;
      sm[3]:= codigo_raca_mae3;
      sm[4]:= codigo_raca_mae4;

      rm[1]:= raca_mae1;
      rm[2]:= raca_mae2;
      rm[3]:= raca_mae3;
      rm[4]:= raca_mae4;

      ADOQuery1.close;
      ADOQuery1.open;
      ADOQuery1.Locate('Codigo_Animal', EdtCodigo_Pai.Text, []);
      codigo_raca_pai1:= ADOQuery1Codigo_Raca1.AsInteger;
      ADOQuery2.Locate('Codigo_Raca', codigo_raca_pai1, []);
      raca_pai1:= ADOQuery2Sigla.AsString;

      sangue_pai[1][1]:= ADOQuery1Sangue1.AsInteger;
      sangue_pai[1][2]:= ADOQuery1Sangue11.AsInteger;
      codigo_raca_pai2:= ADOQuery1Codigo_Raca2.AsInteger;
      ADOQuery2.Locate('Codigo_Raca', codigo_raca_pai2, []);
      raca_pai2:= ADOQuery2Sigla.AsString;

      sangue_pai[2][1]:= ADOQuery1Sangue2.AsInteger;
      sangue_pai[2][2]:= ADOQuery1Sangue22.AsInteger;
      codigo_raca_pai3:= ADOQuery1Codigo_Raca3.AsInteger;
      ADOQuery2.Locate('Codigo_Raca', codigo_raca_pai3, []);
      raca_pai3:= ADOQuery2Sigla.AsString;

      sangue_pai[3][1]:= ADOQuery1Sangue3.AsInteger;
      sangue_pai[3][2]:= ADOQuery1Sangue33.AsInteger;
      codigo_raca_pai4:= ADOQuery1Codigo_Raca4.AsInteger;
      ADOQuery2.Locate('Codigo_Raca', codigo_raca_pai4, []);
      raca_pai4:= ADOQuery2Sigla.AsString;

      sangue_pai[4][1]:= ADOQuery1Sangue4.AsInteger;
      sangue_pai[4][2]:= ADOQuery1Sangue44.AsInteger;
      sp[1]:= codigo_raca_pai1;
      sp[2]:= codigo_raca_pai2;
      sp[3]:= codigo_raca_pai3;
      sp[4]:= codigo_raca_pai4;

      rp[1]:= raca_pai1;
      rp[2]:= raca_pai2;
      rp[3]:= raca_pai3;
      rp[4]:= raca_pai4;


      //usar método bubble sort para ordenar dados
      for x := 1 to 4 do
        begin
          if (sp[x] <> Null) and (sp[x] > 0) then
            begin
              for y := 1 to 4 do
                begin
                  if sp[x] = sm[y] then  //verificando raças iguais
                    begin
                      //ADOQuery2.Locate('Codigo_Raca', sp[x], []);
                      //rp[x]:= ADOQuery2Sigla.AsString;
                      mmc:= Util.Calcula_MMC(sangue_pai[x][2], sangue_mae[y][2]);
                      r1:= mmc;
                      sangue_pai[x][1]:= (mmc div sangue_pai[x][2]) * sangue_pai[x][1];
                      sangue_mae[y][1]:= (mmc div sangue_mae[y][2]) * sangue_mae[y][1];
                      r2_pai[x]:= sangue_pai[x][1] + sangue_mae[y][1]; //numerador
                      r3_pai[x]:= r1 * 2; //denominador
                      //rest_pai[x]:= IntToStr(r2_pai[x]) + '/' + IntToStr(r3_pai[x]) + ', ' + rp[x];

                      ordena[x][1]:= sp[x];
                      ordena[x][2]:= r2_pai[x];
                      ordena[x][3]:= r3_pai[x];
                      Break;
                    end;

                    if (y = 4) then
                      begin
                        //ADOQuery2.Locate('Codigo_Raca', sp[x], []);
                        //rp[x]:= ADOQuery2Sigla.AsString;
                        r2_pai[x]:= sangue_pai[x][1];
                        r3_pai[x]:= sangue_pai[x][2] * 2;
                        //rest_pai[x]:= IntToStr(r2_pai[x]) + '/' + IntToStr(r3_pai[x]) + ', ' + rp[x];

                        ordena[x][1]:= sp[x];
                        ordena[x][2]:= r2_pai[x];
                        ordena[x][3]:= r3_pai[x];
                        Break;
                      end;
                end;
            end;
        end;
    //end;

    {mae}
    w:= 5;
    for y := 1 to 4 do
      begin
        if (sm[y] <> Null) and (sm[y] > 0) then
          begin
            for x := 1 to 4 do
              begin
                if sm[y] = sp[x] then
                  begin
                    Inc(w);
                    Break;
                  end;

                  if (x = 4) then
                    begin
                      //ADOQuery2.Locate('Codigo_Raca', sm[y], []);
                      //rm[y]:= ADOQuery2Sigla.AsString;
                      r2_mae[y]:= sangue_mae[y][1];
                      r3_mae[y]:= sangue_mae[y][2] * 2;
                      //rest_mae[y]:= IntToStr(r2_mae[y]) + '/' + IntToStr(r3_mae[y]) + ', ' + rm[y];
                      ordena[w][1]:= sm[y];
                      ordena[w][2]:= r2_mae[y];
                      ordena[w][3]:= r3_mae[y];
                      inc(w);
                      Break;
                    end;
                    //inc(w);
              end;
          end;
      end;

      //colocando os valores que estavam espalhados no vetor, em ordem (independente da ordem Asc ou Desc)
      for x := 2 to 8 do
        begin
          if (ordena[x-1][2] = Null) or (ordena[x-1][2] = 0) then
            begin
              w:= x-1;
              for y := w to 8 do
                begin
                  if (ordena[y][2] <> Null) and (ordena[y][2] > 0) then
                    begin
                      ordena[w][1]:= ordena[y][1];
                      ordena[w][2]:= ordena[y][2];
                      ordena[w][3]:= ordena[y][3];
                      ordena[y][1]:= 0;
                      ordena[y][2]:= 0;
                      ordena[y][3]:= 0;
                      break;
                    end;
                end;
            end;
        end;

        //ordenando os valores
       for x := 1 to 7 do
         for ord := 1 to 6 do
          begin
            if (ordena[ord][1] <> Null) and (ordena[ord][1] > 0) and
                (ordena[ord + 1][1] <> Null) and (ordena[ord + 1][1] > 0) then
              begin
                ordena_aux:= ((ordena[ord][2] / ordena[ord][3]));
                ordena_aux2:= ((ordena[ord + 1][2] / ordena[ord + 1][3]));
                if (ordena_aux < ordena_aux2) then
                  begin
                    for w := 1 to 3 do
                      begin
                        aux[w]:= ordena[ord][w];
                        ordena[ord][w]:= ordena[ord + 1][w];
                        ordena[ord + 1][w]:= aux[w];
                        //filho[ord][w]:= IntToStr(ordena[ord][w]);
                      end;
                  end;
              end;
          end;

      sangue_final:= '';
      with ADOQuery3 do
      begin
        close;
        sql.clear;
        sql.add('select max(Codigo) as Cod from Cadastro_Animal');
        open;
      end;
      Animal.Inserir_Parto(CmbCria2.Text);
    end;

  if (CBCria3.Checked = true) then
    begin
      ADOQuery1.close;
      ADOQuery1.open;
      ADOQuery2.close;
      ADOQuery2.open;
      ADOQuery1.Locate('Codigo_Animal', EdtCodigo_Mae.Text, []);
      codigo_raca_mae1:= ADOQuery1Codigo_Raca1.AsInteger;
      ADOQuery2.Locate('Codigo_raca', codigo_raca_mae1, []);
      raca_mae1:= ADOQuery2Sigla.AsString;

      sangue_mae[1][1]:= ADOQuery1Sangue1.AsInteger;
      sangue_mae[1][2]:= ADOQuery1Sangue11.AsInteger;
      codigo_raca_mae2:= ADOQuery1Codigo_Raca2.AsInteger;
      ADOQuery2.Locate('Codigo_raca', codigo_raca_mae2, []);
      raca_mae2:= ADOQuery2Sigla.AsString;

      sangue_mae[2][1]:= ADOQuery1Sangue2.AsInteger;
      sangue_mae[2][2]:= ADOQuery1Sangue22.AsInteger;
      codigo_raca_mae3:= ADOQuery1Codigo_Raca3.AsInteger;
      ADOQuery2.Locate('Codigo_raca', codigo_raca_mae3, []);
      raca_mae3:= ADOQuery2Sigla.AsString;

      sangue_mae[3][1]:= ADOQuery1Sangue3.AsInteger;
      sangue_mae[3][2]:= ADOQuery1Sangue33.AsInteger;
      codigo_raca_mae4:= ADOQuery1Codigo_Raca4.AsInteger;
      ADOQuery2.Locate('Codigo_raca', codigo_raca_mae4, []);
      raca_mae4:= ADOQuery2Sigla.AsString;

      sangue_mae[4][1]:= ADOQuery1Sangue4.AsInteger;
      sangue_mae[4][2]:= ADOQuery1Sangue44.AsInteger;
      sm[1]:= codigo_raca_mae1;
      sm[2]:= codigo_raca_mae2;
      sm[3]:= codigo_raca_mae3;
      sm[4]:= codigo_raca_mae4;

      rm[1]:= raca_mae1;
      rm[2]:= raca_mae2;
      rm[3]:= raca_mae3;
      rm[4]:= raca_mae4;

      ADOQuery1.close;
      ADOQuery1.open;
      ADOQuery1.Locate('Codigo_Animal', EdtCodigo_Pai.Text, []);
      codigo_raca_pai1:= ADOQuery1Codigo_Raca1.AsInteger;
      ADOQuery2.Locate('Codigo_Raca', codigo_raca_pai1, []);
      raca_pai1:= ADOQuery2Sigla.AsString;

      sangue_pai[1][1]:= ADOQuery1Sangue1.AsInteger;
      sangue_pai[1][2]:= ADOQuery1Sangue11.AsInteger;
      codigo_raca_pai2:= ADOQuery1Codigo_Raca2.AsInteger;
      ADOQuery2.Locate('Codigo_Raca', codigo_raca_pai2, []);
      raca_pai2:= ADOQuery2Sigla.AsString;

      sangue_pai[2][1]:= ADOQuery1Sangue2.AsInteger;
      sangue_pai[2][2]:= ADOQuery1Sangue22.AsInteger;
      codigo_raca_pai3:= ADOQuery1Codigo_Raca3.AsInteger;
      ADOQuery2.Locate('Codigo_Raca', codigo_raca_pai3, []);
      raca_pai3:= ADOQuery2Sigla.AsString;

      sangue_pai[3][1]:= ADOQuery1Sangue3.AsInteger;
      sangue_pai[3][2]:= ADOQuery1Sangue33.AsInteger;
      codigo_raca_pai4:= ADOQuery1Codigo_Raca4.AsInteger;
      ADOQuery2.Locate('Codigo_Raca', codigo_raca_pai4, []);
      raca_pai4:= ADOQuery2Sigla.AsString;

      sangue_pai[4][1]:= ADOQuery1Sangue4.AsInteger;
      sangue_pai[4][2]:= ADOQuery1Sangue44.AsInteger;
      sp[1]:= codigo_raca_pai1;
      sp[2]:= codigo_raca_pai2;
      sp[3]:= codigo_raca_pai3;
      sp[4]:= codigo_raca_pai4;

      rp[1]:= raca_pai1;
      rp[2]:= raca_pai2;
      rp[3]:= raca_pai3;
      rp[4]:= raca_pai4;


      //usar método bubble sort para ordenar dados
      for x := 1 to 4 do
        begin
          if (sp[x] <> Null) and (sp[x] > 0) then
            begin
              for y := 1 to 4 do
                begin
                  if sp[x] = sm[y] then  //verificando raças iguais
                    begin
                      //ADOQuery2.Locate('Codigo_Raca', sp[x], []);
                      //rp[x]:= ADOQuery2Sigla.AsString;
                      mmc:= Util.Calcula_MMC(sangue_pai[x][2], sangue_mae[y][2]);
                      r1:= mmc;
                      sangue_pai[x][1]:= (mmc div sangue_pai[x][2]) * sangue_pai[x][1];
                      sangue_mae[y][1]:= (mmc div sangue_mae[y][2]) * sangue_mae[y][1];
                      r2_pai[x]:= sangue_pai[x][1] + sangue_mae[y][1]; //numerador
                      r3_pai[x]:= r1 * 2; //denominador
                      //rest_pai[x]:= IntToStr(r2_pai[x]) + '/' + IntToStr(r3_pai[x]) + ', ' + rp[x];

                      ordena[x][1]:= sp[x];
                      ordena[x][2]:= r2_pai[x];
                      ordena[x][3]:= r3_pai[x];
                      Break;
                    end;

                    if (y = 4) then
                      begin
                        //ADOQuery2.Locate('Codigo_Raca', sp[x], []);
                        //rp[x]:= ADOQuery2Sigla.AsString;
                        r2_pai[x]:= sangue_pai[x][1];
                        r3_pai[x]:= sangue_pai[x][2] * 2;
                        //rest_pai[x]:= IntToStr(r2_pai[x]) + '/' + IntToStr(r3_pai[x]) + ', ' + rp[x];

                        ordena[x][1]:= sp[x];
                        ordena[x][2]:= r2_pai[x];
                        ordena[x][3]:= r3_pai[x];
                        Break;
                      end;
                end;
            end;
        end;
    //end;

    {mae}
    w:= 5;
    for y := 1 to 4 do
      begin
        if (sm[y] <> Null) and (sm[y] > 0) then
          begin
            for x := 1 to 4 do
              begin
                if sm[y] = sp[x] then
                  begin
                    Inc(w);
                    Break;
                  end;

                  if (x = 4) then
                    begin
                      //ADOQuery2.Locate('Codigo_Raca', sm[y], []);
                      //rm[y]:= ADOQuery2Sigla.AsString;
                      r2_mae[y]:= sangue_mae[y][1];
                      r3_mae[y]:= sangue_mae[y][2] * 2;
                      //rest_mae[y]:= IntToStr(r2_mae[y]) + '/' + IntToStr(r3_mae[y]) + ', ' + rm[y];
                      ordena[w][1]:= sm[y];
                      ordena[w][2]:= r2_mae[y];
                      ordena[w][3]:= r3_mae[y];
                      inc(w);
                      Break;
                    end;
                    //inc(w);
              end;
          end;
      end;

      //colocando os valores que estavam espalhados no vetor, em ordem (independente da ordem Asc ou Desc)
      for x := 2 to 8 do
        begin
          if (ordena[x-1][2] = Null) or (ordena[x-1][2] = 0) then
            begin
              w:= x-1;
              for y := w to 8 do
                begin
                  if (ordena[y][2] <> Null) and (ordena[y][2] > 0) then
                    begin
                      ordena[w][1]:= ordena[y][1];
                      ordena[w][2]:= ordena[y][2];
                      ordena[w][3]:= ordena[y][3];
                      ordena[y][1]:= 0;
                      ordena[y][2]:= 0;
                      ordena[y][3]:= 0;
                      break;
                    end;
                end;
            end;
        end;

        //ordenando os valores
       for x := 1 to 7 do
         for ord := 1 to 6 do
          begin
            if (ordena[ord][1] <> Null) and (ordena[ord][1] > 0) and
                (ordena[ord + 1][1] <> Null) and (ordena[ord + 1][1] > 0) then
              begin
                ordena_aux:= ((ordena[ord][2] / ordena[ord][3]));
                ordena_aux2:= ((ordena[ord + 1][2] / ordena[ord + 1][3]));
                if (ordena_aux < ordena_aux2) then
                  begin
                    for w := 1 to 3 do
                      begin
                        aux[w]:= ordena[ord][w];
                        ordena[ord][w]:= ordena[ord + 1][w];
                        ordena[ord + 1][w]:= aux[w];
                        //filho[ord][w]:= IntToStr(ordena[ord][w]);
                      end;
                  end;
              end;
          end;

      sangue_final:= '';
      with ADOQuery3 do
      begin
        close;
        sql.clear;
        sql.add('select max(Codigo) as Cod from Cadastro_Animal');
        open;
      end;
      Animal.Inserir_Parto(CmbCria3.Text);
    end;
end;

function TFrmParto.Confira: boolean;
begin
  Confira:= false;

  if (EdtCodigo_Mae.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Mae.SetFocus;
    abort;
  end;

  if (EdtCodigo_Pai.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Pai.SetFocus;
    abort;
  end;

  if (EdtN_Cria_Vivas.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtN_Cria_Vivas.SetFocus;
    abort;
  end;

  if (EdtNatimortos.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtNatimortos.SetFocus;
    abort;
  end;

  if (EdtPeso_Matriz.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtPeso_Matriz.SetFocus;
    abort;
  end;

  if (MEdtData_Parto.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MEdtData_Parto.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmParto.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmParto.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmParto.EdtCodigo_LoteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Lote, FrmChama_Lote);
    FrmChama_Lote.ShowModal;
    FrmChama_Lote.Free;
  end;
end;

procedure TFrmParto.EdtCodigo_LoteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmParto.EdtCodigo_MaeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    mae:= 1;
    Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
    FrmChama_Animal.ShowModal;
    FrmChama_Animal.Free;
  end;
end;

procedure TFrmParto.EdtCodigo_MaeKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmParto.EdtCodigo_PaiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    mae:= 2;
    Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
    FrmChama_Animal.ShowModal;
    FrmChama_Animal.Free;
  end;
end;

procedure TFrmParto.EdtCodigo_PaiKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmParto.EdtLoteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmParto.EdtMaeKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmParto.EdtPaiKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmParto.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmParto.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmParto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmParto.Free;
        FrmParto:= Nil;
      end;
end;

procedure TFrmParto.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmParto);
  Util.Limpa_Campos(FrmParto);
  Util.Desabilita_Campos(FrmParto);
end;

procedure TFrmParto.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmParto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmParto);
      Util.Limpa_Campos(FrmParto);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      EdtN_Cria_Vivas.Text:= '0';
      EdtNatimortos.Text:= '0';
      EdtPeso_Matriz.Text:= '0';
      MEdtData_Cadastro.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmParto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmParto.Gera_Codigo;
var
  qAux: TADOQuery;
  codigo: integer;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(Codigo) as codigo from Parto');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmParto.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmParto.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmParto.MEdtData_PartoEnter(Sender: TObject);
begin
  MEdtData_Parto.Text:= DateToStr(date);
end;

procedure TFrmParto.MEdtData_PartoExit(Sender: TObject);
begin
  if (MEdtData_Parto.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Parto);
end;

end.
