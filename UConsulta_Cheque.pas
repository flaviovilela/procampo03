unit UConsulta_Cheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Cheque = class(TForm)
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_cheque: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label4: TLabel;
    LblData_Cadastro: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    RGConsulta_Por: TRadioGroup;
    EdtParametro: TEdit;
    RGStatus: TRadioGroup;
    RGSituacao: TRadioGroup;
    EdtCodigo_Conta: TEdit;
    ImgImagens: TImageList;
    EdtConta: TEdit;
    qryconsulta_chequeEmitente: TStringField;
    qryconsulta_chequeRecebido_De: TStringField;
    qryconsulta_chequeEnviado_A: TStringField;
    qryconsulta_chequeAgencia: TStringField;
    qryconsulta_chequeBanco: TStringField;
    qryconsulta_chequeConta_Corrente: TStringField;
    qryconsulta_chequeTipo_Cheque: TStringField;
    qryconsulta_chequeSituacao_Cheque: TStringField;
    qryconsulta_chequeNumero_Cheque: TStringField;
    qryconsulta_chequeValor: TFloatField;
    qryconsulta_chequeJuro: TFloatField;
    qryconsulta_chequeValor_Final: TFloatField;
    qryconsulta_chequeData_Entrada: TDateTimeField;
    qryconsulta_chequeData_Vencimento: TDateTimeField;
    qryconsulta_chequeData_Saida: TDateTimeField;
    qryconsulta_chequeObservacoes: TStringField;
    qryconsulta_chequeStatus: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_UsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_FinalExit(Sender: TObject);
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure EdtContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Cheque: TFrmConsulta_Cheque;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Usuario, UChama_Conta_Corrente, URel_Consulta_Cheque;

{$R *.dfm}

procedure TFrmConsulta_Cheque.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Cheque.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Cheque;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Cheque.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Cheque:= TFrmRel_Consulta_Cheque.create(self);
  FrmRel_Consulta_Cheque.Release;
  FrmRel_Consulta_Cheque:= Nil;
end;

procedure TFrmConsulta_Cheque.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_cheque.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Cheque.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Cheque.EdtCodigo_ContaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
      FrmChama_Conta_Corrente.ShowModal;
      FrmChama_Conta_Corrente.Free;
    end;
end;

procedure TFrmConsulta_Cheque.EdtCodigo_ContaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Cheque.EdtCodigo_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Cheque.EdtContaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Cheque.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Cheque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Cheque.Free;
  FrmConsulta_Cheque:= NIl;
end;

procedure TFrmConsulta_Cheque.FormCreate(Sender: TObject);
begin
  qryconsulta_cheque.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtParametro.Clear;
  EdtCodigo_Conta.Clear;
  EdtConta.Clear;
  MEdtData_Inicial.Text:= DateToStr(date);
  MEdtData_Final.Text:= DateToStr(date);
end;

procedure TFrmConsulta_Cheque.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Cheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Cheque.MEdtData_FinalExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Final);
end;

procedure TFrmConsulta_Cheque.MEdtData_InicialExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Inicial);
end;

end.
