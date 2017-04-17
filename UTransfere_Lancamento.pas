unit UTransfere_Lancamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, ComCtrls,
  ImgList, ToolWin, ADODB, UUtilitarios;

type
  TFrmTransfere_Lancamento = class(TForm)
    Timer1: TTimer;
    ImgImagens_Cadastros: TImageList;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnImprimir: TToolButton;
    BBtnFechar: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    EdtN_Documento: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EdtPropriedade: TEdit;
    EdtCodigo_Propriedade: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_PropriedadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnImprimirClick(Sender: TObject);
  private
    var
    achou: boolean;
    Util: TUtil;
    Mensagem: TMensagem;
    { Private declarations }
    procedure Limpa_Campos;
    procedure Verifica_Documento;
    procedure Atualiza_Documento;
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmTransfere_Lancamento: TFrmTransfere_Lancamento;
  codigo: integer;
implementation

uses UDM, UPrincipal, UChama_Empresa;

{$R *.dfm}

procedure TFrmTransfere_Lancamento.Atualiza_Documento;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Lancamento_Financeiro set');
      add('Codigo_Empresa = :Codigo_Empresa');
      add('where N_Documento = :Documento');

      Parameters.ParamByName('Codigo_Empresa').Value:= StrToInt(EdtCodigo_Propriedade.Text);
      Parameters.ParamByName('Documento').Value:= EdtN_Documento.Text;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmTransfere_Lancamento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmTransfere_Lancamento.BBtnImprimirClick(Sender: TObject);
begin
  if (EdtN_Documento.Text = '') then
  begin
    EdtN_Documento.SetFocus;
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;

  if (EdtCodigo_Propriedade.Text = '') then
  begin
    EdtCodigo_Propriedade.SetFocus;
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;

  Verifica_Documento;

  if (Mensagem.Confirma_Processo) then
  begin
    Atualiza_Documento;
    Mensagem.Processo_Concluido;
    EdtN_Documento.Clear;
    EdtN_Documento.SetFocus;
  end;
end;

procedure TFrmTransfere_Lancamento.BBtnLimparClick(Sender: TObject);
var Cont: integer;
begin
  for Cont := 0 to componentcount - 1 do
    begin
      if Components[Cont] is TEdit then
        TEdit(Components[Cont]).Text:='';
      if Components[Cont] is TMaskEdit then
        TMaskEdit(Components[Cont]).Text:= '';
      if Components[Cont] is TMemo then
        TMemo(Components[Cont]).Text:='';
      end;
end;

procedure TFrmTransfere_Lancamento.BBtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmTransfere_Lancamento.EdtCodigo_PropriedadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Empresa, FrmChama_Empresa);
    FrmChama_Empresa.ShowModal;
    FrmChama_Empresa.Free;
  end;
end;

procedure TFrmTransfere_Lancamento.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmTransfere_Lancamento.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FrmTransfere_Lancamento.Free;
  FrmTransfere_Lancamento:= Nil;
end;

procedure TFrmTransfere_Lancamento.FormCreate(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
  Limpa_Campos;
end;

procedure TFrmTransfere_Lancamento.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmTransfere_Lancamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmTransfere_Lancamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
    key:=#0; //anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmTransfere_Lancamento.Limpa_Campos;
begin
  EdtN_Documento.Clear;
  EdtCodigo_Propriedade.Clear;
  EdtPropriedade.Clear;
end;

procedure TFrmTransfere_Lancamento.Verifica_Documento;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select LF.N_Documento from Lancamento_Financeiro LF');
      add('where LF.N_Documento = :Documento and LF.Codigo_Empresa = :Empresa');
      Parameters.ParamByName('Documento').Value:= EdtN_Documento.Text;
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      open;

      if (IsEmpty = true) then
      begin
        Mensagem.Filme_Encontrado;
        EdtN_Documento.SetFocus;
        abort;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

end.
