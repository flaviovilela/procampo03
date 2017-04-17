unit Secamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmSecamento = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    BBtnPesquisar: TToolButton;
    Label2: TLabel;
    MEdtData_Diagnostico: TMaskEdit;
    Label11: TLabel;
    LblAnimal: TLabel;
    MMOObservacoes: TMemo;
    EdtAnimal: TEdit;
    EdtCodigo_Animal: TEdit;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label1: TLabel;
    MEdtData_Secamento: TMaskEdit;
    RGMotivo: TRadioGroup;
    Label3: TLabel;
    EdtLote: TEdit;
    EdtCodigo_Lote: TEdit;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Codigo_Propriedade: TIntegerField;
    ADOQuery1Codigo_Animal: TIntegerField;
    ADOQuery1Codigo_Lote: TIntegerField;
    ADOQuery1Motivo: TStringField;
    ADOQuery1Data_Secamento: TDateTimeField;
    ADOQuery1Observacao: TStringField;
    ADOQuery1Animal: TStringField;
    ADOQuery1Codigo_Categoria: TIntegerField;
    ADOQuery1Lote: TStringField;
    qryconsulta_periodo_lactacao: TADOQuery;
    qryconsulta_periodo_lactacaoCodigo: TIntegerField;
    qryconsulta_periodo_lactacaoNome: TStringField;
    qryconsulta_periodo_lactacaoBrinco: TStringField;
    qryconsulta_periodo_lactacaoData_Ultima_Paricao: TDateTimeField;
    qryconsulta_periodo_lactacaoData_Ultimo_Secamento: TDateTimeField;
    qryconsulta_periodo_lactacaoCOLUMN1: TFloatField;
    qryconsulta_periodo_lactacaoCOLUMN2: TIntegerField;
    qryconsulta_periodo_lactacaoCOLUMN3: TFloatField;
    qryperiodo_lactacao: TADOQuery;
    qryperiodo_lactacaoCodigo_Animal: TIntegerField;
    qryperiodo_lactacaoCodigo_Propriedade: TIntegerField;
    qryperiodo_lactacaoPeriodo: TIntegerField;
    qryperiodo_lactacaoUltimo_Paricao: TDateTimeField;
    qryperiodo_lactacaoUltimo_Secamento: TDateTimeField;
    qryperiodo_lactacaoMedia_Diaria: TFloatField;
    qryperiodo_lactacaoDias_Lactacao: TIntegerField;
    qryperiodo_lactacaoTotal_Litros: TFloatField;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtCodigo_AnimalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAnimalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_AnimalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MMOObservacoesExit(Sender: TObject);
    procedure MEdtData_CoberturaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_SecamentoEnter(Sender: TObject);
    procedure MEdtData_SecamentoExit(Sender: TObject);
    procedure EdtCodigo_LoteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLoteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_LoteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_DiagnosticoKeyPress(Sender: TObject; var Key: Char);
  private
    Util: TUtil;
    Secamento: TSecamento;
    Periodo: TPeriodo_Lactacao;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Atualiza_Dados;
    procedure Limpa_Menor;
  public
    ativo, enderec, achei: boolean;
    codigo_categoria_animal: integer;
    procedure Atualiza_Dados_Chama(Codigo: integer);
  protected
  end;

var
  FrmSecamento: TFrmSecamento;
implementation

uses UDM, UChama_Animal, UChama_Lote, UChama_Secamento;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmSecamento.Atualiza_Dados;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select S.*, CA.Brinco + ' + QuotedStr('-') + ' + CA.Nome as Animal, CA.Codigo_Categoria, CL.Descricao as Lote from Secamento S');
    add('left join Cadastro_Animal CA on (S.Codigo_Animal = CA.Codigo)');
    add('left join Cadastro_Lote CL on (S.Codigo_Lote = CL.Codigo)');
    add('where S.Codigo = :Codigo');
    add('order by CA.Nome');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmSecamento.Atualiza_Dados_Chama(Codigo: integer);
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select S.*, CA.Brinco + ' + QuotedStr('-') + ' + CA.Nome as Animal, CA.Codigo_Categoria, CL.Descricao as Lote from Secamento S');
    add('left join Cadastro_Animal CA on (S.Codigo_Animal = CA.Codigo)');
    add('left join Cadastro_Lote CL on (S.Codigo_Lote = CL.Codigo)');
    add('where S.Codigo = :Codigo');
    add('order by CA.Nome');
    Parameters.ParamByName('Codigo').Value:= Codigo;
    open;
  end;
end;

procedure TFrmSecamento.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmSecamento);
  Util.Desabilita_Campos(FrmSecamento);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmSecamento.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao) then
    begin
      ADOQuery1.First;
      while not ADOQuery1.Eof do
      begin
        if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_vazia) or
           (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_gestante) or
           (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_descarte) then
        begin
          Util.Atualiza_Secamento_Delete;
          Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_lac_gestante);
          //Secamento.Excluir;
          Periodo.Excluir;
          Util.Insere_Historico(usuario, 'EXCLUIU SECAMENTO DO ANIMAL ' + ADOQuery1Animal.AsString + '.', TimeToStr(time), exclusao, date);
          ADOQuery1.Delete;
        end
        else
        begin
          Application.MessageBox(PChar('Não é possível excluir ' + #13 + 'Animal: ' + ADOQuery1Animal.AsString + #13 + #13 + 'Verifique sua situação.'), 'Atenção', MB_OK+MB_ICONHAND);
          ADOQuery1.Next;
        end;
      end;
    end;

    Mensagem.Exclusao_Realizada;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmSecamento);
end;

procedure TFrmSecamento.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmSecamento.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Secamento, FrmChama_Secamento);
  FrmChama_Secamento.ShowModal;
  FrmChama_Secamento.Free;
end;

procedure TFrmSecamento.BBtnSalvarClick(Sender: TObject);
begin
  if (ADOQuery1.IsEmpty) then
  begin
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;

    qryperiodo_lactacao.close;
    qryperiodo_lactacao.open;
    ADOQuery1.First;
    while not ADOQuery1.EOF do
    begin
      with qryconsulta_periodo_lactacao do
        begin
          close;
          sql.clear;
          sql.add('select CA.Codigo, CA.Nome, CA.Brinco, CA.Data_Ultima_Paricao, CA.Data_Ultimo_Secamento, (sum(ILI.Total) / count(ILI.Codigo_Animal)), (datediff(day, CA.Data_Ultima_Paricao, :Data_Sec)),');
          sql.add('(sum(ILI.Total) / count(ILI.Codigo_Animal) * (datediff(day, CA.Data_Ultima_Paricao, :Data_Seca))) from Cadastro_Animal CA');
          sql.add('inner join Itens_Leite_Individual ILI on(CA.Codigo = ILI.Codigo_Animal)');
          sql.add('where ILI.Data_Pesagem between CA.Data_Ultima_Paricao and :DF and CA.Codigo = :Animal');// and Codigo_Animal = :Animal');
          sql.add('group by CA.Codigo, CA.Nome, CA.Brinco, CA.Data_Ultima_Paricao, CA.Data_Ultimo_Secamento');
          Parameters.ParamByName('Animal').Value:= ADOQuery1Codigo_Animal.AsInteger;
          Parameters.ParamByName('DF').Value:= MedtData_Secamento.Text;
          Parameters.ParamByName('Data_Sec').Value:= MedtData_Secamento.Text;
          Parameters.ParamByName('Data_Seca').Value:= MedtData_Secamento.Text;
          open;
        end;

        if (ADOQuery1Motivo.AsString = 'PRENHES CONFIRMADA') or (ADOQuery1Motivo.AsString = 'BAIXA PRODUÇÃO') or (ADOQuery1Motivo.AsString = 'OUTROS') then
          begin
            Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_seca_gestante);
            Util.Atualiza_Secamento;
          end
          else
          begin
            if (ADOQuery1Motivo.AsString = 'MATRIZ VAZIA') then
              begin
                Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_seca_vazia);
                Util.Atualiza_Secamento_Matriz_Vazia;
              end
              else
              begin
                if (ADOQuery1Motivo.AsString = 'DESCARTE') then
                  begin
                    Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_seca_descarte);
                    Util.Atualiza_Secamento_Matriz_Descarte;
                  end;
              end;
          end;

          if (finalizar_periodo_lactacao = 'Sim') then
            begin
              if (achei = false) then
                Periodo.Inserir
              else
                Periodo.Alterar;
            end;

          if (ADOQuery1Codigo_Lote.AsString <> '') then
            Util.Atualiza_Lote(ADOQuery1Codigo_Animal.AsInteger, ADOQuery1Codigo_Lote.AsInteger);

      ADOQuery1.Next;
    end;

  Mensagem.Confirma_Insercao;
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  Util.Desabilita_Campos(FrmSecamento);
end;

function TFrmSecamento.Confira: boolean;
begin
  Confira:= false;

  if (EdtCodigo_Animal.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Animal.SetFocus;
    abort;
  end;

  if (MedtData_Secamento.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    MedtData_Secamento.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmSecamento.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_delete) then
    begin
      if (achei = false) then
        begin
          if (Mensagem.Confirma_Exclusao) then
            begin
              Secamento.Excluir;
              Mensagem.Exclusao_Realizada;
              Atualiza_Dados;
              Limpa_Menor;
              EdtCodigo_Animal.SetFocus
            end;
        end
        else
        begin
          if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_vazia) or
             (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_gestante) or
             (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_descarte) then
          begin
          if (Mensagem.Confirma_Exclusao) then
            begin
              Util.Atualiza_Secamento_Delete;
              Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_lac_gestante);
              Secamento.Excluir;
              Periodo.Excluir;
              Mensagem.Exclusao_Realizada;
              Atualiza_Dados;
              Limpa_Menor;
              EdtCodigo_Animal.SetFocus;
            end;
          end
          else
          begin
            Mensagem.Cobertura_Invalida;
            abort;
          end;
        end;
    end;
end;

procedure TFrmSecamento.EdtAnimalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmSecamento.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmSecamento.EdtCodigo_AnimalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
    FrmChama_Animal.ShowModal;
    FrmChama_Animal.Free;
  end;
end;

procedure TFrmSecamento.EdtCodigo_AnimalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmSecamento.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmSecamento.EdtCodigo_LoteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Lote, FrmChama_Lote);
    FrmChama_Lote.ShowModal;
    FrmChama_Lote.Free;
  end;
end;

procedure TFrmSecamento.EdtCodigo_LoteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmSecamento.EdtLoteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmSecamento.EdtSetorKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmSecamento.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmSecamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmSecamento.Free;
        FrmSecamento:= Nil;
      end;
end;

procedure TFrmSecamento.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmSecamento);
  Util.Limpa_Campos(FrmSecamento);
  Util.Desabilita_Campos(FrmSecamento);
end;

procedure TFrmSecamento.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmSecamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmSecamento);
      Util.Limpa_Campos(FrmSecamento);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      Gera_Codigo;
      MEdtData_Secamento.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmSecamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmSecamento.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Secamento');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmSecamento.Limpa_Menor;
begin
  EdtCodigo_Animal.Clear;
  EdtAnimal.Clear;
  MEdtData_Diagnostico.Clear;
  MMOObservacoes.Clear;
  EdtCodigo_Lote.Clear;
  EdtLote.Clear
end;

procedure TFrmSecamento.MEdtData_CoberturaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmSecamento.MEdtData_DiagnosticoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmSecamento.MEdtData_SecamentoEnter(Sender: TObject);
begin
  MEdtData_Secamento.Text:= DateToStr(Date);
end;

procedure TFrmSecamento.MEdtData_SecamentoExit(Sender: TObject);
begin
  if (MEdtData_Secamento.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Secamento);
end;

procedure TFrmSecamento.MMOObservacoesExit(Sender: TObject);
begin
  if (Confira = true) then
  begin
    try
      Secamento.Inserir;
      Mensagem.Confirma_Insercao;
    except
      Mensagem.Impossivel_Executar;
    end;
      Atualiza_Dados;
      Util.Insere_Historico(usuario, 'LANÇOU SECAMENTO DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), insercao, date);
  end
  else
    exit;
end;

end.
