unit Diagnostico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmDiagnostico = class(TForm)
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
    Label3: TLabel;
    Label11: TLabel;
    LblAnimal: TLabel;
    Label1: TLabel;
    CMBResultado: TComboBox;
    MMOObservacoes: TMemo;
    EdtAnimal: TEdit;
    MEdtData_Cobertura: TMaskEdit;
    EdtCodigo_Animal: TEdit;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Codigo_Propriedade: TIntegerField;
    ADOQuery1Codigo_Animal: TIntegerField;
    ADOQuery1Data_Cobertura: TDateTimeField;
    ADOQuery1Data_Diagnostico: TDateTimeField;
    ADOQuery1Resultado: TStringField;
    ADOQuery1Observacao: TStringField;
    ADOQuery1Animal: TStringField;
    ADOQuery1Codigo_Categoria: TIntegerField;
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
    procedure MEdtData_DiagnosticoEnter(Sender: TObject);
    procedure MEdtData_DiagnosticoExit(Sender: TObject);
    procedure MEdtData_CoberturaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Util: TUtil;
    Diagnostico: TDiagnostico;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Atualiza_Dados;
    procedure Atualiza_Categoria_Diagnostico;
    procedure Limpa_Menor;
  public
    ativo, enderec, achei: boolean;
    codigo_categoria_animal: integer;
    procedure Atualiza_Dados_Chama(Codigo: integer);
  protected
  end;

var
  FrmDiagnostico: TFrmDiagnostico;
implementation

uses UDM, UChama_Animal, UChama_Diagnostico;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmDiagnostico.Atualiza_Categoria_Diagnostico;
begin
  if (ADOQuery1Resultado.AsString = 'POSITIVO') then
    begin
    if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_coberta) then
        Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_seca_gestante)
      else if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_lac_coberta) then
        Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_lac_gestante)
      else if (ADOQuery1Codigo_Categoria.AsInteger = situacao_novilhas_cobertas) then
        Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_novilhas_gestantes)
    end
    else
    begin
      if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_coberta) then
        Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_seca_vazia)
      else if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_lac_coberta) then
        Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_lac_vazia_normal)
      else if (ADOQuery1Codigo_Categoria.AsInteger = situacao_novilhas_cobertas) then
        Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_novilhas_vazias)
    end;
end;

procedure TFrmDiagnostico.Atualiza_Dados;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select D.*, CA.Brinco + ' + QuotedStr('-') + ' + CA.Nome as Animal, CA.Codigo_Categoria from Diagnostico D');
    add('left join Cadastro_Animal CA on (D.Codigo_Animal = CA.Codigo)');
    add('where D.Codigo = :Codigo');
    add('order by CA.Nome');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmDiagnostico.Atualiza_Dados_Chama(Codigo: integer);
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select D.*, CA.Brinco + ' + QuotedStr('-') + ' + CA.Nome as Animal, CA.Codigo_Categoria from Diagnostico D');
    add('left join Cadastro_Animal CA on (D.Codigo_Animal = CA.Codigo)');
    add('where D.Codigo = :Codigo');
    add('order by CA.Nome');
    Parameters.ParamByName('Codigo').Value:= Codigo;
    open;
  end;
end;

procedure TFrmDiagnostico.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmDiagnostico);
  Util.Desabilita_Campos(FrmDiagnostico);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmDiagnostico.BBtnExcluirClick(Sender: TObject);
begin
  if (ADOQuery1.IsEmpty = true) then
    Application.MessageBox('É necessário informar pelo menos um animal para excluir', 'FAV Sistemas', MB_OK+MB_ICONHAND)
  else
  begin
    if (Mensagem.Confirma_Exclusao) then
      begin
        ADOQuery1.First;
        while not ADOQuery1.Eof do
          begin
            if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_lac_gestante) or
               (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_gestante) or
               (ADOQuery1Codigo_Categoria.AsInteger = situacao_novilhas_gestantes) or
               (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_vazia) or
               (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_lac_vazia_normal) or
               (ADOQuery1Codigo_Categoria.AsInteger = situacao_novilhas_vazias) or
               (ADOQuery1Codigo_Categoria.AsInteger = situacao_novilhas_vazias_atrasadas) then
            begin
              Util.Atualiza_Diagnostico_Delete;
              if (ADOQuery1Resultado.AsString = 'POSITIVO') then
                begin
                if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_gestante) then
                  Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_seca_coberta)
                else if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_lac_gestante) then
                  Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_lac_coberta)
                else if (ADOQuery1Codigo_Categoria.AsInteger = situacao_novilhas_gestantes) then
                  Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_novilhas_cobertas);
                end
                else
                begin
                  if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_vazia) then
                    Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_seca_coberta)
                  else if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_lac_vazia_normal) then
                    Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_lac_coberta)
                  else if (ADOQuery1Codigo_Categoria.AsInteger = situacao_novilhas_vazias) then
                    Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_novilhas_cobertas)
                  else if (ADOQuery1Codigo_Categoria.AsInteger = situacao_novilhas_vazias_atrasadas) then
                    Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_novilhas_cobertas);
                end;
              Util.Insere_Historico(usuario, 'EXCLUIU DIAGNÓSTICO DO ANIMAL ' + ADOQuery1Animal.AsString + '.', TimeToStr(time), exclusao, date);
              ADOQuery1.Delete;
            end
            else
            begin
              Application.MessageBox(PChar('Não é possível excluir ' + #13 + 'Animal: ' + ADOQuery1Animal.AsString + #13 + #13 + 'Verifique sua categoria.'), 'Atenção', MB_OK+MB_ICONHAND);
              ADOQuery1.Next;
            end;
          end;

          Atualiza_Dados;
          Mensagem.Exclusao_Realizada;
          BBtnSalvar.Enabled:= false;
          BBtnExcluir.Enabled:= false;
          BBtnPesquisar.Enabled:= true;
          BBtnCancelar.Enabled:= false;
          Util.Desabilita_Campos(FrmDiagnostico);
      end;
  end;
  {if (Mensagem.Confirma_Exclusao = true) then
  begin
    try
      Diagnostico.Excluir;
      Mensagem.Exclusao_Realizada;
      Util.Insere_Historico(usuario, 'EXCLUIU SETOR ' + EdtAnimal.Text + '.', TimeToStr(time), exclusao, date);
    except
      Mensagem.Impossivel_Executar;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmDiagnostico);
  end;}
end;

procedure TFrmDiagnostico.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmDiagnostico.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Diagnostico, FrmChama_Diagnostico);
  FrmChama_Diagnostico.ShowModal;
  FrmChama_Diagnostico.Free;
end;

procedure TFrmDiagnostico.BBtnSalvarClick(Sender: TObject);
begin
  if (ADOQuery1.IsEmpty) then
  begin
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;

  ADOQuery1.First;
  while not ADOQuery1.Eof do
  begin
    Util.Atualiza_Diagnostico;
    Atualiza_Categoria_Diagnostico;
    ADOQuery1.Next;
  end;

  Mensagem.Confirma_Insercao;
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  Util.Desabilita_Campos(FrmDiagnostico);
end;

function TFrmDiagnostico.Confira: boolean;
begin
  Confira:= false;

  if (EdtCodigo_Animal.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtCodigo_Animal.SetFocus;
    abort;
  end;

  if (CMBResultado.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    CMBResultado.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmDiagnostico.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_delete) then
    begin
      if (achei = false) then
        begin
          if (Mensagem.Confirma_Exclusao) then
            begin
              Diagnostico.Excluir;
              Mensagem.Exclusao_Realizada;
              Atualiza_Dados;
              Limpa_Menor;
              EdtCodigo_Animal.SetFocus
            end;
        end
        else
        begin
          if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_lac_gestante) or
             (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_gestante) or
             (ADOQuery1Codigo_Categoria.AsInteger = situacao_novilhas_gestantes) or
             (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_vazia) or
             (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_lac_vazia_normal) or
             (ADOQuery1Codigo_Categoria.AsInteger = situacao_novilhas_vazias) or
             (ADOQuery1Codigo_Categoria.AsInteger = situacao_novilhas_vazias_atrasadas) then
          begin
          if (Mensagem.Confirma_Exclusao) then
            begin
              Util.Atualiza_Diagnostico_Delete;

              if (ADOQuery1Resultado.AsString = 'POSITIVO') then
                begin
                  if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_gestante) then
                    Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_seca_coberta)
                  else if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_lac_gestante) then
                    Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_lac_coberta)
                  else if (ADOQuery1Codigo_Categoria.AsInteger = situacao_novilhas_gestantes) then
                    Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_novilhas_cobertas);
                end
                else
                begin
                  if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_seca_vazia) then
                    Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_seca_coberta)
                  else if (ADOQuery1Codigo_Categoria.AsInteger = situacao_vaca_lac_vazia_normal) then
                    Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_vaca_lac_coberta)
                  else if (ADOQuery1Codigo_Categoria.AsInteger = situacao_novilhas_vazias) then
                    Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_novilhas_cobertas)
                  else if (ADOQuery1Codigo_Categoria.AsInteger = situacao_novilhas_vazias_atrasadas) then
                    Util.Atualiza_Categoria(ADOQuery1Codigo_Animal.AsInteger, situacao_novilhas_cobertas);
                end;

                Diagnostico.Excluir;
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

procedure TFrmDiagnostico.EdtAnimalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDiagnostico.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDiagnostico.EdtCodigo_AnimalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
    FrmChama_Animal.ShowModal;
    FrmChama_Animal.Free;
  end;
end;

procedure TFrmDiagnostico.EdtCodigo_AnimalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDiagnostico.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDiagnostico.EdtSetorKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmDiagnostico.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmDiagnostico.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmDiagnostico.Free;
        FrmDiagnostico:= Nil;
      end;
end;

procedure TFrmDiagnostico.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmDiagnostico);
  Util.Limpa_Campos(FrmDiagnostico);
  Util.Desabilita_Campos(FrmDiagnostico);
end;

procedure TFrmDiagnostico.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmDiagnostico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmDiagnostico);
      Util.Limpa_Campos(FrmDiagnostico);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      Gera_Codigo;
      MEdtData_Diagnostico.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmDiagnostico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmDiagnostico.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Diagnostico');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmDiagnostico.Limpa_Menor;
begin
  EdtCodigo_Animal.Clear;
  EdtAnimal.Clear;
  MEdtData_Cobertura.Clear;
  MMOObservacoes.Clear;
  CMBResultado.ItemIndex:= -1;
  MEdtData_Diagnostico.SetFocus;
end;

procedure TFrmDiagnostico.MEdtData_CoberturaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmDiagnostico.MEdtData_DiagnosticoEnter(Sender: TObject);
begin
  MEdtData_Diagnostico.Text:= DateToStr(Date);
end;

procedure TFrmDiagnostico.MEdtData_DiagnosticoExit(Sender: TObject);
begin
  if (MEdtData_Diagnostico.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Diagnostico);
end;

procedure TFrmDiagnostico.MMOObservacoesExit(Sender: TObject);
begin
  if (Confira = true) then
  begin
    try
      Diagnostico.Inserir;
      Mensagem.Confirma_Insercao;
      Atualiza_Dados;
      Util.Insere_Historico(usuario, 'LANÇOU DIAGNÓSTICO DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), insercao, date);
    except
      Mensagem.Impossivel_Executar;
    end;
  end
  else
    exit;
end;

end.
