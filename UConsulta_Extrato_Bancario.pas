unit UConsulta_Extrato_Bancario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UUtilitarios,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Extrato_Bancario = class(TForm)
    DBGrid1: TDBGrid;
    EdtConsulta: TEdit;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_saldo: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    EdtCodigo_Conta: TEdit;
    qryconsulta_saldoCodigo: TAutoIncField;
    qryconsulta_saldoCodigo_Empresa: TIntegerField;
    qryconsulta_saldoN_Documento: TIntegerField;
    qryconsulta_saldoData_Lancamento: TDateTimeField;
    qryconsulta_saldoCodigo_Conta: TIntegerField;
    qryconsulta_saldoCodigo_Cheque: TIntegerField;
    qryconsulta_saldoCodigo_Operacao: TIntegerField;
    qryconsulta_saldoCodigo_Plano: TIntegerField;
    qryconsulta_saldoDescricao: TStringField;
    qryconsulta_saldoValor: TFloatField;
    qryconsulta_saldoStatus: TStringField;
    qryconsulta_saldoSaldo_Anterior: TFloatField;
    qryconsulta_saldoSaldo_Atual: TFloatField;
    qryconsulta_saldoCodigo_Conta_Transferencia: TIntegerField;
    qryconsulta_saldoSaldo_Anterior_Transferencia: TFloatField;
    qryconsulta_saldoSaldo_Atual_Transferencia: TFloatField;
    qryconsulta_saldoConta_Corrente: TStringField;
    qryconsulta_saldoOperacao: TStringField;
    qryconsulta_saldoTipo_Operacao: TStringField;
    qryconsulta_saldoNumero_Cheque: TStringField;
    Label5: TLabel;
    LblData_Cadastro: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtCodigo_ContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_ContaKeyPress(Sender: TObject; var Key: Char);
    procedure qryconsulta_saldoData_AberturaGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure MEdtData_FinalExit(Sender: TObject);
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure MEdtData_InicialEnter(Sender: TObject);
    procedure MEdtData_FinalEnter(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Extrato_Bancario: TFrmConsulta_Extrato_Bancario;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Conta_Corrente, URel_Consulta_Extrato_Bancario;

{$R *.dfm}

procedure TFrmConsulta_Extrato_Bancario.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Extrato_Bancario.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Consulta_Extrato_Bancario;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Extrato_Bancario.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Extrato_Bancario:= TFrmRel_Consulta_Extrato_Bancario.Create(self);
  FrmRel_Consulta_Extrato_Bancario.Release;
  FrmRel_Consulta_Extrato_Bancario:= Nil;
end;

procedure TFrmConsulta_Extrato_Bancario.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_saldo.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtConsulta.SetFocus;
end;

procedure TFrmConsulta_Extrato_Bancario.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Extrato_Bancario.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qryconsulta_saldo, Column);
end;

procedure TFrmConsulta_Extrato_Bancario.EdtCodigo_ContaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
    FrmChama_Conta_Corrente.ShowModal;
    FrmChama_Conta_Corrente.Free;
  end;
end;

procedure TFrmConsulta_Extrato_Bancario.EdtCodigo_ContaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Extrato_Bancario.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Consulta_Saldo;
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Extrato_Bancario.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Extrato_Bancario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Extrato_Bancario.Free;
  FrmConsulta_Extrato_Bancario:= NIl;
end;

procedure TFrmConsulta_Extrato_Bancario.FormCreate(Sender: TObject);
begin
  qryconsulta_saldo.close;
  MEdtData_Final.Text:= DateToStr(date);
  MEdtData_Inicial.Text:= DateToStr(date);
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtConsulta.Clear;
end;

procedure TFrmConsulta_Extrato_Bancario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Extrato_Bancario.MEdtData_FinalEnter(Sender: TObject);
begin
  MEdtData_Final.Text:= DateToStr(date);
end;

procedure TFrmConsulta_Extrato_Bancario.MEdtData_FinalExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Final);
end;

procedure TFrmConsulta_Extrato_Bancario.MEdtData_InicialEnter(Sender: TObject);
begin
  MEdtData_Inicial.Text:= DateToStr(date);
end;

procedure TFrmConsulta_Extrato_Bancario.MEdtData_InicialExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Final);
end;

procedure TFrmConsulta_Extrato_Bancario.qryconsulta_saldoData_AberturaGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899 00:00:00') then
    Text := '';
end;

end.
