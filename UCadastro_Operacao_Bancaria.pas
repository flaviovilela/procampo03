unit UCadastro_Operacao_Bancaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UUtilitarios, URegistro,
  ExtCtrls;

type
  TFrmCadastro_Operacao_Bancaria = class(TForm)
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
    LblMarca: TLabel;
    EdtOperacao: TEdit;
    BBtnPesquisar: TToolButton;
    RGTipo: TRadioGroup;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
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
  private
    Operacao: URegistro.TOperacao_Bancaria;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Operacao_Bancaria: TFrmCadastro_Operacao_Bancaria;
implementation

uses UDM, UChama_Operacao_Bancaria;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Operacao_Bancaria.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Operacao_Bancaria);
  Util.Desabilita_Campos(FrmCadastro_Operacao_Bancaria);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Operacao_Bancaria.BBtnExcluirClick(Sender: TObject);
begin
  if (Mensagem.Confirma_Exclusao) then
  BEGIN
    Operacao.Excluir(Operacao);
    Util.Insere_Historico(usuario, 'EXCLUIU OPERAÇÃO BANCÁRIA ' + EdtOperacao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Operacao_Bancaria);
  END;
end;

procedure TFrmCadastro_Operacao_Bancaria.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Operacao_Bancaria.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Operacao.Inserir(Operacao);
        Util.Insere_Historico(usuario, 'CADASTROU OPERAÇÃO BANCÁRIA ' + EdtOperacao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Operacao.Alterar(Operacao);
        Util.Insere_Historico(usuario, 'ALTEROU OPERAÇÃO BANCÁRIA ' + EdtOperacao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Operacao_Bancaria);
end;

function TFrmCadastro_Operacao_Bancaria.Confira: boolean;
begin
    Confira:= false;
    if EdtOperacao.Text = '' then
      begin
        Mensagem.Mensagem_Falta_Dados;
        EdtOperacao.SetFocus;
        abort;
      end;

      Confira:= true;
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Operacao_Bancaria.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Operacao_Bancaria.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Mensagem.Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Operacao_Bancaria.Free;
        FrmCadastro_Operacao_Bancaria:= Nil;
      end;
end;

procedure TFrmCadastro_Operacao_Bancaria.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Operacao_Bancaria);
  Util.Limpa_Campos(FrmCadastro_Operacao_Bancaria);
  Util.Desabilita_Campos(FrmCadastro_Operacao_Bancaria);
end;

procedure TFrmCadastro_Operacao_Bancaria.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Operacao_Bancaria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Operacao_Bancaria);
      Util.Limpa_Campos(FrmCadastro_Operacao_Bancaria);
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

procedure TFrmCadastro_Operacao_Bancaria.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Operacao_Bancaria.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Operacao_Bancaria.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Operacao_Bancaria, FrmChama_Operacao_Bancaria);
  FrmChama_Operacao_Bancaria.ShowModal;
  FrmChama_Operacao_Bancaria.Release;
end;

end.
