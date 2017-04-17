unit UConsulta_Saldo_Bancario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UUtilitarios,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Saldo_Bancario = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
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
    Label1: TLabel;
    EdtSaldo_Atual: TEdit;
    Label3: TLabel;
    EdtSaldo_Bloqueado: TEdit;
    Label4: TLabel;
    EdtSaldo_Previsto: TEdit;
    qryconsulta_saldoCodigo_Conta_Corrente: TIntegerField;
    qryconsulta_saldoConta_Corrente: TStringField;
    qryconsulta_saldoCodigo_Agencia: TIntegerField;
    qryconsulta_saldoNome_Correntista: TStringField;
    qryconsulta_saldoSaldo_Inicial: TFloatField;
    qryconsulta_saldoLimite: TFloatField;
    qryconsulta_saldoSaldo_Atual: TFloatField;
    qryconsulta_saldoData_Cadastro: TDateTimeField;
    qryconsulta_saldoNome: TStringField;
    qryconsulta_saldoNumero_Agencia: TStringField;
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
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Saldo_Bancario: TFrmConsulta_Saldo_Bancario;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Conta_Corrente, URel_Consulta_Saldo_Bancario;

{$R *.dfm}

procedure TFrmConsulta_Saldo_Bancario.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Saldo_Bancario.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Consulta_Saldo;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Saldo_Bancario.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Saldo_Bancario:= TFrmRel_Consulta_Saldo_Bancario.Create(self);
  FrmRel_Consulta_Saldo_Bancario.Release;
  FrmRel_Consulta_Saldo_Bancario:= Nil;
end;

procedure TFrmConsulta_Saldo_Bancario.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_saldo.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtConsulta.SetFocus;
end;

procedure TFrmConsulta_Saldo_Bancario.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Saldo_Bancario.EdtCodigo_ContaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
    FrmChama_Conta_Corrente.ShowModal;
    FrmChama_Conta_Corrente.Free;
  end;
end;

procedure TFrmConsulta_Saldo_Bancario.EdtCodigo_ContaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Saldo_Bancario.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmConsulta_Saldo_Bancario.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Saldo_Bancario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Saldo_Bancario.Free;
  FrmConsulta_Saldo_Bancario:= NIl;
end;

procedure TFrmConsulta_Saldo_Bancario.FormCreate(Sender: TObject);
begin
  qryconsulta_saldo.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtConsulta.Clear;
end;

procedure TFrmConsulta_Saldo_Bancario.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Saldo_Bancario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Saldo_Bancario.qryconsulta_saldoData_AberturaGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899 00:00:00') then
    Text := '';
end;

end.
