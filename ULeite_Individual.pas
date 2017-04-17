unit ULeite_Individual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios, DBClient, Provider;

type
  TFrmLeite_Individual = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Pesagem: TMaskEdit;
    LblData_Cadastro: TLabel;
    DBGrid2: TDBGrid;
    EdtPesquisa_Animal: TEdit;
    RGTipo_Pesquisa: TRadioGroup;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    EdtTotal_Litros: TEdit;
    EdtTotal_Animais: TEdit;
    EdtMedia: TEdit;
    Label11: TLabel;
    MMOObservacoes: TMemo;
    CBFinalizar_Ordenha: TCheckBox;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ADOQuery1Codigo_Registro: TAutoIncField;
    ADOQuery1Data_Pesagem: TDateTimeField;
    ADOQuery1Codigo_Animal: TIntegerField;
    ADOQuery1Animal: TStringField;
    ADOQuery1Ultima_Pesagem_Leite: TFloatField;
    ADOQuery1Codigo_Lote: TIntegerField;
    ADOQuery1Ordenha1: TFloatField;
    ADOQuery1Ordenha2: TFloatField;
    ADOQuery1Ordenha3: TFloatField;
    ADOQuery1Total: TFloatField;
    ClientDataSet1Codigo_Registro: TAutoIncField;
    ClientDataSet1Data_Pesagem: TDateTimeField;
    ClientDataSet1Codigo_Animal: TIntegerField;
    ClientDataSet1Animal: TStringField;
    ClientDataSet1Ultima_Pesagem_Leite: TFloatField;
    ClientDataSet1Codigo_Lote: TIntegerField;
    ClientDataSet1Ordenha1: TFloatField;
    ClientDataSet1Ordenha2: TFloatField;
    ClientDataSet1Ordenha3: TFloatField;
    ClientDataSet1Total: TFloatField;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_PesagemEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure MEdtData_PesagemExit(Sender: TObject);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtPesquisa_AnimalChange(Sender: TObject);
    procedure ClientDataSet1BeforeScroll(DataSet: TDataSet);
    procedure ClientDataSet1BeforeInsert(DataSet: TDataSet);
    procedure DataSetProvider1GetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: WideString);
  private
    Util: TUtil;
    Leite: TLeite_Individual;
    Itens_Leite: TItens_Leite_Individual;
    Mensagem: TMensagem;

    duplo_clique: Boolean;
    media, tanimal, o1, o2, o3, litrouni, total, resul: double;
    inc: integer;
    qAux, qAux_Animal: TADOQuery;
    iniciado: boolean;
    total_animais: integer;

    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    function Verifica_Pesagem_Lancada: boolean;
    procedure Insere_Animal;
    procedure Pega_Animal;
    procedure Atualiza_Dados;
    procedure Atualiza_Dados_Busca;
    procedure Salva_Leite;
    procedure Atualiza_Peso_Leite;
    procedure Limpa_Campos;
    procedure Calcula_Leite;
  public
    ativo, enderec, achei: boolean;
    qAux_Soma_Leite: TADOQuery;
  protected
  end;

var
  FrmLeite_Individual: TFrmLeite_Individual;
implementation

uses UDM, UChama_Setor, UPrincipal;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmLeite_Individual.Atualiza_Dados;
begin
  with ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.add('select ILI.Codigo_Registro, ILI.Data_Pesagem, CA.Codigo as Codigo_Animal, CA.Brinco + ' + QuotedStr(' - ') + ' + CA.Nome as Animal, CA.Ultima_Pesagem_Leite, CA.Codigo_Lote,');
    sql.add('ILI.Ordenha1, ILI.Ordenha2, ILI.Ordenha3, ILI.Total from Itens_Leite_Individual ILI');
    sql.add('left join Cadastro_Animal CA on (ILI.Codigo_Animal = CA.Codigo)');
    sql.add('where ILI.Data_Pesagem = :Data order by CA.Nome');
    Parameters.ParamByName('Data').Value:= StrToDateTime(MEdtData_Pesagem.Text);
    open;
  end;
  ClientDataSet1.Close;
  ClientDataSet1.Open;
  EdtPesquisa_Animal.Clear;
end;

procedure TFrmLeite_Individual.Atualiza_Dados_Busca;
begin
  if (RGTipo_Pesquisa.ItemIndex = 0) then
  begin
    with ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('select ILI.Codigo_Registro, ILI.Data_Pesagem, CA.Codigo as Codigo_Animal, CA.Brinco + ' + QuotedStr(' - ') + ' + CA.Nome as Animal, CA.Ultima_Pesagem_Leite, CA.Codigo_Lote,');
      sql.add('ILI.Ordenha1, ILI.Ordenha2, ILI.Ordenha3, ILI.Total from Itens_Leite_Individual ILI');
      sql.add('left join Cadastro_Animal CA on (ILI.Codigo_Animal = CA.Codigo)');
      sql.add('where ILI.Data_Pesagem = :Data and CA.Codigo like '''+ EdtPesquisa_Animal.Text + '%''order by CA.Nome');
      Parameters.ParamByName('Data').Value:= StrToDateTime(MEdtData_Pesagem.Text);
      open;
    end;
  end
  else if (RGTipo_Pesquisa.ItemIndex = 1) then
  begin
    with ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('select ILI.Codigo_Registro, ILI.Data_Pesagem, CA.Codigo as Codigo_Animal, CA.Brinco + ' + QuotedStr(' - ') + ' + CA.Nome as Animal, CA.Ultima_Pesagem_Leite, CA.Codigo_Lote,');
      sql.add('ILI.Ordenha1, ILI.Ordenha2, ILI.Ordenha3, ILI.Total from Itens_Leite_Individual ILI');
      sql.add('left join Cadastro_Animal CA on (ILI.Codigo_Animal = CA.Codigo)');
      sql.add('where ILI.Data_Pesagem = :Data and CA.Nome like '''+ EdtPesquisa_Animal.Text + '%''order by CA.Nome');
      Parameters.ParamByName('Data').Value:= StrToDateTime(MEdtData_Pesagem.Text);
      open;
    end;
  end
  else if (RGTipo_Pesquisa.ItemIndex = 2) then
  begin
    with ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('select ILI.Codigo_Registro, ILI.Data_Pesagem, CA.Codigo as Codigo_Animal, CA.Brinco + ' + QuotedStr(' - ') + ' + CA.Nome as Animal, CA.Ultima_Pesagem_Leite, CA.Codigo_Lote,');
      sql.add('ILI.Ordenha1, ILI.Ordenha2, ILI.Ordenha3, ILI.Total from Itens_Leite_Individual ILI');
      sql.add('left join Cadastro_Animal CA on (ILI.Codigo_Animal = CA.Codigo)');
      sql.add('where ILI.Data_Pesagem = :Data and CA.Brinco like '''+ EdtPesquisa_Animal.Text + '%''order by CA.Nome');
      Parameters.ParamByName('Data').Value:= StrToDateTime(MEdtData_Pesagem.Text);
      open;
    end;
  end;
  ClientDataSet1.Close;
  ClientDataSet1.Open;
end;

procedure TFrmLeite_Individual.Atualiza_Peso_Leite;
var
  total_litros, media, ordenha1, ordenha2, ordenha3, valor_total: double;
begin
  ClientDataSet1.Edit;
  ordenha1:= ClientDataSet1Ordenha1.AsFloat;
  ordenha2:= ClientDataSet1Ordenha2.AsFloat;
  ordenha3:= ClientDataSet1Ordenha3.AsFloat;

  valor_total:= ordenha1 + ordenha2 + ordenha3;
  ClientDataSet1Total.AsFloat:= valor_total;
  ClientDataSet1.Post;
  ClientDataSet1.ApplyUpdates(0);
  Calcula_Leite;
  if (EdtPesquisa_Animal.Text <> '') then
    Atualiza_Dados;
end;

procedure TFrmLeite_Individual.BBtnCancelarClick(Sender: TObject);
begin
  if (achei = false) then
    Itens_Leite.Excluir;

  Limpa_Campos;
  Util.Desabilita_Campos(FrmLeite_Individual);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnCancelar.Enabled:= false;
  iniciado:= false;
end;

procedure TFrmLeite_Individual.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Leite.Excluir;
      Itens_Leite.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU PESAGEM DE LEITE DO DIA ' + MEdtData_Pesagem.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnCancelar.Enabled:= false;
    iniciado:= false;
    Util.Desabilita_Campos(FrmLeite_Individual);
  end;
end;

procedure TFrmLeite_Individual.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmLeite_Individual.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
  FrmChama_Setor.ShowModal;
  FrmChama_Setor.Free;
end;

procedure TFrmLeite_Individual.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        try
          Salva_Leite;
          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'LANÇOU PESAGEM DE LEITE DO DIA ' + MEdtData_Pesagem.Text + '.', TimeToStr(time), insercao, date);
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
        Salva_Leite;
        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU PESAGEM DE LEITE DO DIA ' + MEdtData_Pesagem.Text + '.', TimeToStr(time), alteracao, date);
      except
        Mensagem.Impossivel_Executar;
      end;
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnCancelar.Enabled:= false;
    iniciado:= false;
    Util.Desabilita_Campos(FrmLeite_Individual);

    if (achou_lote_1 = true) or (achou_lote_2 = true) or (achou_lote_3 = true) or
      (achou_lote_4 = true) or (achou_lote_5 = true) or (achou_lote_6 = true) or (achou_lote_7 = true) or
      (achou_lote_8 = true) or (achou_lote_9 = true) or (achou_lote_10 = true) then
    begin
      FrmPrincipal.Label1.Visible:= true;
      FrmPrincipal.Label2.Visible:= true;
    end;
end;

procedure TFrmLeite_Individual.Calcula_Leite;
var
  qAux: TADOQuery;
  media: double;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select ILI.Codigo, sum(Ordenha1 + Ordenha2 + Ordenha3) as Ordenha from Itens_Leite_Individual ILI');
      add('where ILI.Data_Pesagem = :Data group by ILI.Codigo');
      Parameters.ParamByName('Data').Value:= StrToDate(MEdtData_Pesagem.Text);
      open;
    end;
    EdtTotal_Litros.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Ordenha').AsFloat);
    EdtTotal_Litros.Text:= StringReplace(EdtTotal_Litros.Text, ThousandSeparator, '', [rfReplaceAll]);

    media:= StrToFloat(EdtTotal_Litros.Text) / StrToInt(EdtTotal_Animais.Text);

    EdtMedia.Text:= FormatFloat('0.00', media);
    EdtMedia.Text:= StringReplace(EdtMedia.Text, ThousandSeparator, '', [rfReplaceAll]);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmLeite_Individual.ClientDataSet1BeforeInsert(DataSet: TDataSet);
begin
  if (ClientDataSet1.Eof) then
  begin
    Atualiza_Dados;
    abort;
    //if (Application.MessageBox('Deseja inserir novos animais?', 'Atenção', MB_YESNO+MB_ICONQUESTION)) = idno then
      //abort;
  end;
end;

procedure TFrmLeite_Individual.ClientDataSet1BeforeScroll(DataSet: TDataSet);
begin
  Atualiza_Peso_Leite;
end;

function TFrmLeite_Individual.Confira: boolean;
begin
  Confira:= false;

  Confira:= true;
end;

procedure TFrmLeite_Individual.DataSetProvider1GetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: WideString);
begin
  //TableName:= 'Leite_Individual';
end;

procedure TFrmLeite_Individual.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLeite_Individual.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLeite_Individual.EdtPesquisa_AnimalChange(Sender: TObject);
begin
  if (iniciado = true) then
    Atualiza_Dados_Busca;
end;

procedure TFrmLeite_Individual.EdtSetorKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmLeite_Individual.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmLeite_Individual.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmLeite_Individual.Free;
        FrmLeite_Individual:= Nil;
      end;
end;

procedure TFrmLeite_Individual.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmLeite_Individual);
  Limpa_Campos;
  Util.Desabilita_Campos(FrmLeite_Individual);
end;

procedure TFrmLeite_Individual.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmLeite_Individual.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      if (iniciado = false) then
      begin
        Util.Habilita_Campos(FrmLeite_Individual);
        Limpa_Campos;
        BBtnSalvar.Enabled:= true;
        BBtnExcluir.Enabled:= false;
        BBtnCancelar.Enabled:= true;
        achei:= false;
        Gera_Codigo;
        CBFinalizar_Ordenha.Checked:= false;
        MEdtData_Pesagem.SetFocus;
        iniciado:= true;
      end;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmLeite_Individual.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmLeite_Individual.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Leite_Individual');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmLeite_Individual.Insere_Animal;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    qAux_Animal.First;
    while not qAux_Animal.Eof do
    begin
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('Insert Into Itens_Leite_Individual (Codigo, Data_Pesagem, Codigo_Animal, Ordenha1, Ordenha2, Ordenha3, Total) values');
        add('(:Codigo, :Data_Pesagem, :Codigo_Animal, :Ordenha1, :Ordenha2, :Ordenha3, :Total)');
        Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
        Parameters.ParamByName('Data_Pesagem').Value:= StrToDateTime(MEdtData_Pesagem.Text);
        Parameters.ParamByName('Codigo_Animal').Value:= qAux_Animal.FieldByName('Codigo').AsInteger;
        Parameters.ParamByName('Ordenha1').Value:= 0;
        Parameters.ParamByName('Ordenha2').Value:= 0;
        Parameters.ParamByName('Ordenha3').Value:= 0;
        Parameters.ParamByName('Total').Value:= 0;
        ExecSQL;
      end;
      total_animais:= StrToInt(EdtTotal_Animais.Text) + 1;
      EdtTotal_Animais.Text:= IntToStr(total_animais);
      qAux_Animal.Next;
    end;
  finally
    FreeAndNil(qAux);
    FreeAndNil(qAux_Animal);
  end;
end;

procedure TFrmLeite_Individual.Limpa_Campos;
var
  x: integer;
begin
  for x := 0 to FrmLeite_Individual.ComponentCount - 1 do
    if FrmLeite_Individual.Components[x] is TEdit then
      TEdit(FrmLeite_Individual.Components[x]).Clear
    else if FrmLeite_Individual.Components[x] is TComboBox then
      TComboBox(FrmLeite_Individual.Components[x]).ItemIndex:= -1
    else if FrmLeite_Individual.Components[x] is TMemo then
      TMemo(FrmLeite_Individual.Components[x]).Clear
    else if FrmLeite_Individual.Components[x] is TCheckBox then
      TCheckBox(FrmLeite_Individual.Components[x]).Checked:= true;
end;

procedure TFrmLeite_Individual.MEdtData_PesagemEnter(Sender: TObject);
begin
  MEdtData_Pesagem.Text:= DateToStr(date);
end;

procedure TFrmLeite_Individual.MEdtData_PesagemExit(Sender: TObject);
var
  qAux2: TADOQuery;
begin
  if (MEdtData_Pesagem.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Pesagem);

  if (Verifica_Pesagem_Lancada = false) then
  begin
    Mensagem.Pesagem_Nao_Encontrada;
    achei := false;
    duplo_clique:= false;
    ClientDataSet1.Close;
    EdtTotal_Litros.Text:= '0,00';
    EdtTotal_Animais.Text:= '0';
    EdtMedia.Text:= '0,00';
    MMOObservacoes.Clear;
    BBtnCancelar.Enabled:= true;
    BBtnExcluir.Enabled:= false;

    Pega_Animal;
    Insere_Animal;
    Atualiza_Dados;
  end
  else
  begin
    Mensagem.Pesagem_Encontrada;
    achei:= true;
    EdtCodigo.Text:= qAux.FieldByName('Codigo').AsString;
    EdtMedia.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Media').AsFloat);
    EdtMedia.Text:= StringReplace(EdtMedia.Text, ThousandSeparator, '', [rfReplaceAll]);
    EdtTotal_Litros.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Total_Litros').AsFloat);
    EdtTotal_Litros.Text:= StringReplace(EdtTotal_Litros.Text, ThousandSeparator, '', [rfReplaceAll]);
    EdtTotal_Animais.Text:= qAux.FieldByName('Total_Animais').AsString;
    MMOObservacoes.Text:= qAux.FieldByName('Observacao').AsString;

    Atualiza_Dados;
    ClientDataSet1.First;

    BBtnCancelar.Enabled:= false;
    BBtnExcluir.Enabled:= true;
    EdtPesquisa_Animal.SetFocus;

  end;
end;

procedure TFrmLeite_Individual.Pega_Animal;
begin
  qAux_Animal:= TADOQuery.Create(self);
  with qAux_Animal do
  begin
    close;
    Connection:= dm.ADOConnection1;
    sql.clear;
    sql.add('select CA.Codigo, CA.Parida from Cadastro_Animal CA');
    sql.add('where CA.Parida = :Sim');
    Parameters.ParamByName('Sim').Value:= 'Sim';
    open;
  end;
end;

procedure TFrmLeite_Individual.Salva_Leite;
begin
  conta_lote_1:= 0;
  conta_lote_2:= 0;
  conta_lote_3:= 0;
  conta_lote_4:= 0;
  conta_lote_5:= 0;
  conta_lote_6:= 0;
  conta_lote_7:= 0;
  conta_lote_8:= 0;
  conta_lote_9:= 0;
  conta_lote_10:= 0;

  achou_lote_1:= false;
  achou_lote_2:= false;
  achou_lote_3:= false;
  achou_lote_4:= false;
  achou_lote_5:= false;
  achou_lote_6:= false;
  achou_lote_7:= false;
  achou_lote_8:= false;
  achou_lote_9:= false;
  achou_lote_10:= false;

  animal_lote_1:= '';
  animal_lote_2:= '';
  animal_lote_3:= '';
  animal_lote_4:= '';
  animal_lote_5:= '';
  animal_lote_6:= '';
  animal_lote_7:= '';
  animal_lote_8:= '';
  animal_lote_9:= '';
  animal_lote_10:= '';

  if (achei = false) then
    begin
      Leite.Inserir;

      if (CBFinalizar_Ordenha.Checked = true) then
      begin
        ClientDataSet1.First;
        while not ClientDataSet1.Eof do
        begin
          qAux_Soma_Leite:= TADOQuery.Create(self);
          with qAux_Soma_Leite, sql do
          begin
            close;
            Connection:= dm.ADOConnection1;
            Clear;
            add('select (sum(ILI.Total) / count(ILI.Codigo_Animal)) as media from Itens_Leite_Individual ILI');
            add('inner join Cadastro_Animal CA on (ILI.Codigo_Animal = CA.Codigo)');
            add('where ILI.Codigo_Animal = :Nome and ILI.Data_Pesagem between CA.Data_Ultima_Paricao and getdate()');
            Parameters.ParamByName('Nome').Value:= ClientDataSet1Codigo_Animal.AsInteger;
            open;
          end;

          Util.Atualiza_Dados_Leite;

          if (avisa_lote_1 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsFloat >= de_lote_1) and (ClientDataSet1Total.AsFloat <= ate_lote_1) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote1) then
            begin
              achou_lote_1:= true;
              animal_lote_1:= animal_lote_1 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_1 = 'Sim') then
              begin
                conta_lote_1:= conta_lote_1 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote1);
              end;
            end;
          end;

          if (avisa_lote_2 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_2) and (ClientDataSet1Total.AsInteger <= ate_lote_2) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote2) then
            begin
              achou_lote_2:= true;
              animal_lote_2:= animal_lote_2 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_2 = 'Sim') then
              begin
                conta_lote_2:= conta_lote_2 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote2);
              end;
            end;
          end;

          if (avisa_lote_3 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_3) and (ClientDataSet1Total.AsInteger <= ate_lote_3) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote3) then
            begin
              achou_lote_3:= true;
              animal_lote_3:= animal_lote_3 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_3 = 'Sim') then
              begin
                conta_lote_3:= conta_lote_3 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote3);
              end;
            end;
          end;

          if (avisa_lote_4 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_4) and (ClientDataSet1Total.AsInteger <= ate_lote_4) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote4) then
            begin
              achou_lote_4:= true;
              animal_lote_4:= animal_lote_4 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_4 = 'Sim') then
              begin
                conta_lote_4:= conta_lote_4 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote4);
              end;
            end;
          end;

          if (avisa_lote_5 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_5) and (ClientDataSet1Total.AsInteger <= ate_lote_5) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote5) then
            begin
              achou_lote_5:= true;
              animal_lote_5:= animal_lote_5 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_5 = 'Sim') then
              begin
                conta_lote_5:= conta_lote_5 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote5);
              end;
            end;
          end;

          if (avisa_lote_6 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_6) and (ClientDataSet1Total.AsInteger <= ate_lote_6) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote6) then
            begin
              achou_lote_6:= true;
              animal_lote_6:= animal_lote_6 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_6 = 'Sim') then
              begin
                conta_lote_6:= conta_lote_6 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote6);
              end;
            end;
          end;

          if (avisa_lote_7 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_7) and (ClientDataSet1Total.AsInteger <= ate_lote_7) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote7) then
            begin
              achou_lote_7:= true;
              animal_lote_7:= animal_lote_7 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_7 = 'Sim') then
              begin
                conta_lote_7:= conta_lote_7 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote7);
              end;
            end;
          end;

          if (avisa_lote_8 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_8) and (ClientDataSet1Total.AsInteger <= ate_lote_8) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote8) then
            begin
              achou_lote_8:= true;
              animal_lote_8:= animal_lote_8 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_8 = 'Sim') then
              begin
                conta_lote_8:= conta_lote_8 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote8);
              end;
            end;
          end;

          if (avisa_lote_9 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_9) and (ClientDataSet1Total.AsInteger <= ate_lote_9) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote9) then
            begin
              achou_lote_9:= true;
              animal_lote_9:= animal_lote_9 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_9 = 'Sim') then
              begin
                conta_lote_9:= conta_lote_9 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote9);
              end;
            end;
          end;

          if (avisa_lote_10 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_10) and (ClientDataSet1Total.AsInteger <= ate_lote_10) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote10) then
            begin
              achou_lote_10:= true;
              animal_lote_10:= animal_lote_10 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_10 = 'Sim') then
              begin
                conta_lote_10:= conta_lote_10 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote10);
              end;
            end;
          end;
          ClientDataSet1.Next;
        end;
      end;
    end
    else
    begin
      Leite.Alterar;

      if (CBFinalizar_Ordenha.Checked = true) then
      begin
        ClientDataSet1.First;
        while not ClientDataSet1.Eof do
        begin
          qAux_Soma_Leite:= TADOQuery.Create(self);
          with qAux_Soma_Leite, sql do
          begin
            close;
            Connection:= dm.ADOConnection1;
            Clear;
            add('select (sum(ILI.Total) / count(ILI.Codigo_Animal)) as media from Itens_Leite_Individual ILI');
            add('inner join Cadastro_Animal CA on (ILI.Codigo_Animal = CA.Codigo)');
            add('where ILI.Codigo_Animal = :Nome and ILI.Data_Pesagem between CA.Data_Ultima_Paricao and getdate()');
            Parameters.ParamByName('Nome').Value:= ClientDataSet1Codigo_Animal.AsInteger;
            open;
          end;

          Util.Atualiza_Dados_Leite;

          if (avisa_lote_1 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsFloat >= de_lote_1) and (ClientDataSet1Total.AsFloat <= ate_lote_1) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote1) then
            begin
              achou_lote_1:= true;
              animal_lote_1:= animal_lote_1 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_1 = 'Sim') then
              begin
                conta_lote_1:= conta_lote_1 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote1);
              end;
            end;
          end;

          if (avisa_lote_2 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_2) and (ClientDataSet1Total.AsInteger <= ate_lote_2) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote2) then
            begin
              achou_lote_2:= true;
              animal_lote_2:= animal_lote_2 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_2 = 'Sim') then
              begin
                conta_lote_2:= conta_lote_2 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote2);
              end;
            end;
          end;

          if (avisa_lote_3 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_3) and (ClientDataSet1Total.AsInteger <= ate_lote_3) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote3) then
            begin
              achou_lote_3:= true;
              animal_lote_3:= animal_lote_3 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_3 = 'Sim') then
              begin
                conta_lote_3:= conta_lote_3 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote3);
              end;
            end;
          end;

          if (avisa_lote_4 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_4) and (ClientDataSet1Total.AsInteger <= ate_lote_4) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote4) then
            begin
              achou_lote_4:= true;
              animal_lote_4:= animal_lote_4 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_4 = 'Sim') then
              begin
                conta_lote_4:= conta_lote_4 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote4);
              end;
            end;
          end;

          if (avisa_lote_5 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_5) and (ClientDataSet1Total.AsInteger <= ate_lote_5) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote5) then
            begin
              achou_lote_5:= true;
              animal_lote_5:= animal_lote_5 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_5 = 'Sim') then
              begin
                conta_lote_5:= conta_lote_5 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote5);
              end;
            end;
          end;

          if (avisa_lote_6 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_6) and (ClientDataSet1Total.AsInteger <= ate_lote_6) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote6) then
            begin
              achou_lote_6:= true;
              animal_lote_6:= animal_lote_6 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_6 = 'Sim') then
              begin
                conta_lote_6:= conta_lote_6 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote6);
              end;
            end;
          end;

          if (avisa_lote_7 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_7) and (ClientDataSet1Total.AsInteger <= ate_lote_7) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote7) then
            begin
              achou_lote_7:= true;
              animal_lote_7:= animal_lote_7 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_7 = 'Sim') then
              begin
                conta_lote_7:= conta_lote_7 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote7);
              end;
            end;
          end;

          if (avisa_lote_8 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_8) and (ClientDataSet1Total.AsInteger <= ate_lote_8) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote8) then
            begin
              achou_lote_8:= true;
              animal_lote_8:= animal_lote_8 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_8 = 'Sim') then
              begin
                conta_lote_8:= conta_lote_8 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote8);
              end;
            end;
          end;

          if (avisa_lote_9 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_9) and (ClientDataSet1Total.AsInteger <= ate_lote_9) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote9) then
            begin
              achou_lote_9:= true;
              animal_lote_9:= animal_lote_9 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_9 = 'Sim') then
              begin
                conta_lote_9:= conta_lote_9 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote9);
              end;
            end;
          end;

          if (avisa_lote_10 = 'Sim') then
          begin
            if (ClientDataSet1Total.AsInteger >= de_lote_10) and (ClientDataSet1Total.AsInteger <= ate_lote_10) and
               (ClientDataSet1Codigo_Lote.AsInteger <> sit_lote10) then
            begin
              achou_lote_10:= true;
              animal_lote_10:= animal_lote_10 + ClientDataSet1Animal.AsString + ', ';
              if (mu_aut_lote_10 = 'Sim') then
              begin
                conta_lote_10:= conta_lote_10 + 1;
                Util.Atualiza_Lote(ClientDataSet1Codigo_Animal.AsInteger, sit_lote10);
              end;
            end;
          end;
          ClientDataSet1.Next;
        end;
      end;
    end;
end;

function TFrmLeite_Individual.Verifica_Pesagem_Lancada: boolean;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select LI.* from Leite_Individual LI');
      add('where LI.Codigo_Propriedade = :Propriedade and LI.Data_Pesagem = :Data');
      Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
      Parameters.ParamByName('Data').Value:= StrToDateTime(MEdtData_Pesagem.Text);
      open;

      if (IsEmpty = false) then
        Result:= true
      else
        Result:= false;
    end;
  finally
  end;
end;

end.
