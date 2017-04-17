unit UCobertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UUtilitarios;

type
  TFrmCobertura = class(TForm)
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
    RGForma: TRadioGroup;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    MedtData_Inseminacao: TMaskEdit;
    MEdtHora: TMaskEdit;
    MMOObservacoes: TMemo;
    EdtTouro: TEdit;
    EdtCodigo_Touro_Doadora: TEdit;
    EdtDoses: TEdit;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    EdtAnimal: TEdit;
    EdtCodigo_Animal: TEdit;
    EdtInseminador: TEdit;
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
    procedure RGFormaClick(Sender: TObject);
    procedure EdtCodigo_Touro_DoadoraKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTouroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_AnimalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAnimalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_InseminadorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_AnimalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Touro_DoadoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure MedtData_InseminacaoEnter(Sender: TObject);
    procedure MedtData_InseminacaoExit(Sender: TObject);
  private
    Util: TUtil;
    Cobertura: TCobertura;
    Mensagem: TMensagem;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
    procedure Atualiza_Categoria;
    procedure Atualiza_Estoque;
    procedure Atualiza_Estoque_Delete;
    procedure Confere_Atualizacao_Estoque;
    procedure Verifica_Categoria_Animal_Alterar;
    procedure Verifica_Categoria_Animal_Inserir;
  public
    ativo, enderec, achei: boolean;
    animal, codigo_categoria_animal: integer;
    categoria_inicial_animal: AnsiString;
  protected
  end;

var
  FrmCobertura: TFrmCobertura;
implementation

uses UDM, UChama_Animal, UChama_Cobertura;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCobertura.Atualiza_Categoria;
begin
  if (codigo_categoria_animal = situacao_vaca_seca_vazia) or (codigo_categoria_animal = situacao_vaca_seca_vazia_atrasada) then
    Util.Atualiza_Categoria(StrToInt(EdtCodigo_Animal.Text), situacao_vaca_seca_coberta)
  else
  begin
    if (categoria_inicial_animal = 'MATRIZ') then
      Util.Atualiza_Categoria(StrToInt(EdtCodigo_Animal.Text), situacao_vaca_lac_coberta)
    else if (categoria_inicial_animal = 'NOVILHA') then
      Util.Atualiza_Categoria(StrToInt(EdtCodigo_Animal.Text), situacao_novilhas_cobertas);
  end;
end;

procedure TFrmCobertura.Atualiza_Estoque;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    if (EdtCodigo_Touro_Doadora.Text <> '') then
      begin
        with qAux, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('select CP.Codigo, CP.Quantidade_Estoque, CP.Codigo_Animal_Reprodutor from Cadastro_Produtos CP');
          add('where CP.Codigo_Animal_Reprodutor = :Reprodutor');
          Parameters.ParamByName('Reprodutor').Value:= StrToInt(EdtCodigo_Touro_Doadora.Text);
          open;
        end;

        if (qAux.IsEmpty = false) then
        begin
          Util.Atualiza_Estoque(qAux.FieldByName('Codigo').AsInteger, qAux.FieldByName('Quantidade_Estoque').AsFloat - StrToFloat(EdtDoses.Text));
        end;
      end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCobertura.Atualiza_Estoque_Delete;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    if (EdtCodigo_Touro_Doadora.Text <> '') then
      begin
        with qAux, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('select CP.Codigo, CP.Quantidade_Estoque, CP.Codigo_Animal_Reprodutor from Cadastro_Produtos CP');
          add('where CP.Codigo_Animal_Reprodutor = :Reprodutor');
          Parameters.ParamByName('Reprodutor').Value:= StrToInt(EdtCodigo_Touro_Doadora.Text);
          open;
        end;

        if (qAux.IsEmpty = false) then
        begin
          Util.Atualiza_Estoque(qAux.FieldByName('Codigo').AsInteger, qAux.FieldByName('Quantidade_Estoque').AsFloat + StrToFloat(EdtDoses.Text));
        end;
      end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCobertura.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCobertura);
  Util.Desabilita_Campos(FrmCobertura);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCobertura.BBtnExcluirClick(Sender: TObject);
begin
  if (codigo_categoria_animal = situacao_vaca_lac_coberta) or
     (codigo_categoria_animal = situacao_novilhas_cobertas) or
     (codigo_categoria_animal = situacao_vaca_seca_coberta) then
  begin
    if (Mensagem.Confirma_Exclusao) then
      begin
        Cobertura.Excluir;
        Util.Atualiza_Cobertura_Delete;

        if (codigo_categoria_animal = situacao_vaca_seca_coberta) then
          Util.Atualiza_Categoria(StrToInt(EdtCodigo_Animal.Text), situacao_vaca_seca_vazia)
        else if (codigo_categoria_animal = situacao_vaca_lac_coberta) or (IntToStr(codigo_categoria_animal) = '') then
          Util.Atualiza_Categoria(StrToInt(EdtCodigo_Animal.Text), situacao_vaca_lac_vazia_normal)
        else if (codigo_categoria_animal = situacao_novilhas_cobertas) then
          Util.Atualiza_Categoria(StrToInt(EdtCodigo_Animal.Text), situacao_novilhas_vazias);

        Atualiza_Estoque_Delete;
        Mensagem.Exclusao_Realizada;
        Util.Insere_Historico(usuario, 'EXCLUIU COBERTURA DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), exclusao, date);
        BBtnSalvar.Enabled:= false;
        BBtnExcluir.Enabled:= false;
        BBtnPesquisar.Enabled:= true;
        BBtnCancelar.Enabled:= false;
        Util.Desabilita_Campos(FrmCobertura);
      end;
  end
  else
  begin
    Mensagem.Cobertura_Invalida;
    abort;
  end;
end;

procedure TFrmCobertura.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Mensagem.Cancele;
    end
  else
    Close;
end;

procedure TFrmCobertura.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cobertura, FrmChama_Cobertura);
  FrmChama_Cobertura.ShowModal;
  FrmChama_Cobertura.Free;
end;

procedure TFrmCobertura.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Cobertura.Inserir;
          Util.Atualiza_Cobertura;
          Atualiza_Categoria;
          Atualiza_Estoque;

          Mensagem.Confirma_Insercao;
          Util.Insere_Historico(usuario, 'LANÇOU COBERTURA DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), insercao, date);
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
        Verifica_Categoria_Animal_Alterar;
        Cobertura.Alterar;
        Util.Atualiza_Cobertura;
        Atualiza_Categoria;
        //Atualiza_Estoque;

        Mensagem.Alteracao_Realizada;
        Util.Insere_Historico(usuario, 'ALTEROU COBERTURA DO ANIMAL ' + EdtAnimal.Text + '.', TimeToStr(time), alteracao, date);
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
    Util.Desabilita_Campos(FrmCobertura);
end;

procedure TFrmCobertura.Confere_Atualizacao_Estoque;
var
  qAux: TADOQuery;
  qtde, res: double;
begin
  qAux:= TADOQuery.Create(self);
  try
    if (RGForma.ItemIndex = 1) or (RGForma.ItemIndex = 2) then
      begin
        with qAux, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('select CP.Codigo, CP.Quantidade_Estoque, CP.Codigo_Animal_Reprodutor from Cadastro_Produtos CP');
          add('where CP.Codigo_Animal_Reprodutor = :Reprodutor');
          Parameters.ParamByName('Reprodutor').Value:= StrToInt(EdtCodigo_Touro_Doadora.Text);
          open;
        end;

        if (qAux.IsEmpty) then
            Mensagem.Animal_Nao_Encontrado
        else
        begin
          qtde:= qAux.FieldByName('Quantidade_Estoque').AsFloat;
          res:= qtde - StrToFloat(EdtDoses.Text);
          if (res < 0) then
            Mensagem.Quantidade_Estoque_Semen_Invalido
        end;
      end;
  finally
    FreeAndNil(qAux);
  end;
end;

function TFrmCobertura.Confira: boolean;
begin
  Confira:= false;

  if (achei = false) then
    Verifica_Categoria_Animal_Inserir
  else
    Verifica_Categoria_Animal_Alterar;

  if (RGForma.ItemIndex = 1) or (RGForma.ItemIndex = 2) then
    begin
      if (EdtCodigo_Touro_Doadora.Text = '') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtCodigo_Touro_Doadora.SetFocus;
        abort;
      end;

      if (EdtDoses.Text = '') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtDoses.SetFocus;
        abort;
      end;
    end;

  if (MedtData_Inseminacao.Text = '  /  /    ') then
    begin
      Mensagem.Mensagem_Falta_Dados;
      MedtData_Inseminacao.SetFocus;
      abort;
    end;

  if (EdtCodigo_Animal.Text = '') then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtCodigo_Animal.SetFocus;
      abort;
    end;

  Confere_Atualizacao_Estoque;

  Confira:= true;
end;

procedure TFrmCobertura.EdtAnimalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCobertura.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCobertura.EdtCodigo_AnimalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    animal:= 2;
    Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
    FrmChama_Animal.ShowModal;
    FrmChama_Animal.Free;
  end;
end;

procedure TFrmCobertura.EdtCodigo_AnimalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCobertura.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCobertura.EdtCodigo_InseminadorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCobertura.EdtCodigo_Touro_DoadoraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    animal:= 1;
    Application.CreateForm(TFrmChama_Animal, FrmChama_Animal);
    FrmChama_Animal.ShowModal;
    FrmChama_Animal.Free;
  end;
end;

procedure TFrmCobertura.EdtCodigo_Touro_DoadoraKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCobertura.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCobertura.EdtTouroKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmCobertura.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCobertura.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCobertura.Free;
        FrmCobertura:= Nil;
      end;
end;

procedure TFrmCobertura.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCobertura);
  Util.Limpa_Campos(FrmCobertura);
  Util.Desabilita_Campos(FrmCobertura);
end;

procedure TFrmCobertura.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCobertura.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCobertura);
      Util.Limpa_Campos(FrmCobertura);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      MEdtData_Cadastro.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCobertura.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCobertura.Gera_Codigo;
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
      add('select max(Codigo) as codigo from Cobertura');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCobertura.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCobertura.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCobertura.MedtData_InseminacaoEnter(Sender: TObject);
begin
  MedtData_Inseminacao.Text:= DateToStr(date);
end;

procedure TFrmCobertura.MedtData_InseminacaoExit(Sender: TObject);
begin
  if (MedtData_Inseminacao.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MedtData_Inseminacao);
end;

procedure TFrmCobertura.RGFormaClick(Sender: TObject);
begin
  if (RGForma.ItemIndex = 0) then
  begin
    EdtInseminador.Enabled:= false;
    MEdtHora.Enabled:= false;
  end
  else
  begin
    EdtInseminador.Enabled:= true;
    MEdtHora.Enabled:= true;
  end;
end;

procedure TFrmCobertura.Verifica_Categoria_Animal_Alterar;
begin
  if     (codigo_categoria_animal <> situacao_vaca_lac_coberta) and
         (codigo_categoria_animal <> situacao_novilhas_cobertas) and
         (codigo_categoria_animal <> situacao_vaca_seca_coberta) then
  begin
    Mensagem.Cobertura_Invalida;
    abort;
  end;

end;

procedure TFrmCobertura.Verifica_Categoria_Animal_Inserir;
begin
  if     (codigo_categoria_animal <> situacao_vaca_lac_vazia_normal) and
         (codigo_categoria_animal <> situacao_vaca_lac_vazia_atrasada) and
         (codigo_categoria_animal <> situacao_novilhas_aptas) and
         (codigo_categoria_animal <> situacao_novilhas_vazias) and
         (codigo_categoria_animal <> situacao_vaca_seca_vazia) and
         (codigo_categoria_animal <> situacao_vaca_seca_vazia_atrasada) and
         (codigo_categoria_animal <> situacao_novilhas_aptas_atrasadas) and
         (codigo_categoria_animal <> situacao_novilhas_vazias_atrasadas) then
  begin
    Mensagem.Cobertura_Invalida;
    abort;
  end;
end;

end.
