unit UChama_Configuracao_Sistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Configuracao_Sistema = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaLancamento_Financeiro: TStringField;
    qrychamaContas_Fixas: TStringField;
    qrychamaCheque_Vencer: TStringField;
    qrychamaProdutos_Vencidos: TStringField;
    qrychamaAniversario_Funcionario: TStringField;
    qrychamaAniversario_Cliente: TStringField;
    qrychamaDias_Aviso: TIntegerField;
    qrychamaBackup_Fechar_Sistema: TStringField;
    qrychamaAvisa_Conta_Menor: TIntegerField;
    qrychamaValor_Conta_Maior: TFloatField;
    qrychamaAvisa_Conta_Maior: TIntegerField;
    qrychamaValor_Conta_Menor: TFloatField;
    qrychamaLimite_Cheque: TIntegerField;
    qrychamaDias_Acrecimo_Cheque: TIntegerField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Pega_Dados;
  public
    { Public declarations }
  end;

var
  FrmChama_Configuracao_Sistema: TFrmChama_Configuracao_Sistema;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UConfiguracao_Sistema;

{$R *.dfm}

procedure TFrmChama_Configuracao_Sistema.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Configuracao_Sistema.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmConfiguracao_Sistema <> NIl) and (FrmConfiguracao_Sistema.ativo = true) then
  begin
    Pega_Dados;

    FrmConfiguracao_Sistema.BBtnSalvar.Enabled:= true;
    FrmConfiguracao_Sistema.BBtnExcluir.Enabled:= true;
    FrmConfiguracao_Sistema.BBtnPesquisar.Enabled:= true;
    FrmConfiguracao_Sistema.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmConfiguracao_Sistema);
    FrmConfiguracao_Sistema.achei:= true;
    FrmConfiguracao_Sistema.TabSheet1.Enabled:= true;
  end;

  FrmChama_Configuracao_Sistema.Close;
end;

procedure TFrmChama_Configuracao_Sistema.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Configuracao_Sistema.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Configuracao_Sistema.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Configuracao_Sistema.Release;
end;

procedure TFrmChama_Configuracao_Sistema.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Configuracao_Sistema.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Open;
end;

procedure TFrmChama_Configuracao_Sistema.Pega_Dados;
begin
  if (qrychamaLancamento_Financeiro.AsString = 'Sim') then
    FrmConfiguracao_Sistema.CBLancamento_Financeiro.Checked:= true
  else
    FrmConfiguracao_Sistema.CBLancamento_Financeiro.Checked:= false;

  if (qrychamaContas_Fixas.AsString = 'Sim') then
    FrmConfiguracao_Sistema.CBContas_Fixas.Checked:= true
  else
    FrmConfiguracao_Sistema.CBContas_Fixas.Checked:= false;

  if (qrychamaCheque_Vencer.AsString = 'Sim') then
    FrmConfiguracao_Sistema.CBCheque_Vencer.Checked:= true
  else
    FrmConfiguracao_Sistema.CBCheque_Vencer.Checked:= false;

  if (qrychamaProdutos_Vencidos.AsString = 'Sim') then
    FrmConfiguracao_Sistema.CBProduto_Vencido.Checked:= true
  else
    FrmConfiguracao_Sistema.CBProduto_Vencido.Checked:= false;

  if (qrychamaAniversario_Funcionario.AsString = 'Sim') then
    FrmConfiguracao_Sistema.CBAniversario_Funcionario.Checked:= true
  else
    FrmConfiguracao_Sistema.CBAniversario_Funcionario.Checked:= false;

  if (qrychamaAniversario_Cliente.AsString = 'Sim') then
    FrmConfiguracao_Sistema.CBAniversario_Cliente.Checked:= true
  else
    FrmConfiguracao_Sistema.CBAniversario_Cliente.Checked:= false;

  FrmConfiguracao_Sistema.EdtDias_Antecedencia.text:= qrychamaDias_Aviso.AsString;

  if (qrychamaBackup_Fechar_Sistema.AsString = 'Sim') then
    FrmConfiguracao_Sistema.CBBackup.Checked:= true
  else
    FrmConfiguracao_Sistema.CBBackup.Checked:= false;

  FrmConfiguracao_Sistema.EdtLimite_Cheque.Text:= qrychamaLimite_Cheque.AsString;
  FrmConfiguracao_Sistema.EdtDias_Acrecimo.Text:= qrychamaDias_Acrecimo_Cheque.AsString;

  if (qrychamaValor_Conta_Menor.AsString = '') then
    FrmConfiguracao_Sistema.EdtValor_Conta_Menor.Text:= ''
  else
    FrmConfiguracao_Sistema.EdtValor_Conta_Menor.Text:= qrychamaValor_Conta_Menor.AsString;

  if (qrychamaValor_Conta_Maior.AsString = '') then
    FrmConfiguracao_Sistema.EdtValor_Conta_Maior.Text:= ''
  else
    FrmConfiguracao_Sistema.EdtValor_Conta_Maior.Text:= qrychamaValor_Conta_Maior.AsString;

  if (qrychamaAvisa_Conta_Menor.AsString = '') then
    FrmConfiguracao_Sistema.EdtAvisa_Conta_Menor.Text:= ''
  else
    FrmConfiguracao_Sistema.EdtAvisa_Conta_Menor.Text:= qrychamaAvisa_Conta_Menor.AsString;

  if (qrychamaAvisa_Conta_Maior.AsString = '') then
    FrmConfiguracao_Sistema.EdtAvisa_Conta_Maior.Text:= ''
  else
    FrmConfiguracao_Sistema.EdtAvisa_Conta_Maior.Text:= qrychamaAvisa_Conta_Maior.AsString;
end;

end.
