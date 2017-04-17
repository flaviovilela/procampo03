unit UChama_Agencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Agencia = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_agencia: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_agenciaCodigo_Agencia: TIntegerField;
    qrychama_agenciaNumero: TStringField;
    qrychama_agenciaCodigo_Banco: TIntegerField;
    qrychama_agenciaCodigo_Endereco: TIntegerField;
    qrychama_agenciaN: TStringField;
    qrychama_agenciaCodigo_Cidade: TIntegerField;
    qrychama_agenciaTelefone: TStringField;
    qrychama_agenciaContato: TStringField;
    qrychama_agenciaData_Cadastro: TDateTimeField;
    qrychama_agenciaBanco: TStringField;
    qrychama_agenciaLogradouro: TStringField;
    qrychama_agenciaCidade: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Agencia: TFrmChama_Agencia;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Cheque, UCadastro_Agencia, UCadastro_Conta_Corrente;

{$R *.dfm}

procedure TFrmChama_Agencia.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Agencia.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Agencia <> NIl) and (FrmCadastro_Agencia.ativo = true) then
  begin
    FrmCadastro_Agencia.EdtCodigo.Text:= qrychama_agenciaCodigo_Banco.AsString;
    FrmCadastro_Agencia.MEdtData_Cadastro.Text:= qrychama_agenciaData_Cadastro.AsString;
    FrmCadastro_Agencia.EdtNumero.Text:= qrychama_agenciaNumero.AsString;
    FrmCadastro_Agencia.EdtCodigo_Banco.Text:= qrychama_agenciaCodigo_Banco.AsString;
    FrmCadastro_Agencia.EdtBanco.Text:= qrychama_agenciaBanco.AsString;
    FrmCadastro_Agencia.EdtCodigo_Endereco.Text:= qrychama_agenciaCodigo_Endereco.AsString;
    FrmCadastro_Agencia.EdtEndereco.Text:= qrychama_agenciaLogradouro.AsString;
    FrmCadastro_Agencia.EdtN.Text:= qrychama_agenciaN.AsString;
    FrmCadastro_Agencia.EdtCodigo_Cidade.Text:= qrychama_agenciaCodigo_Cidade.AsString;
    FrmCadastro_Agencia.EdtCidade.Text:= qrychama_agenciaCidade.AsString;
    FrmCadastro_Agencia.MEdtTelefone.Text:= qrychama_agenciaTelefone.AsString;
    FrmCadastro_Agencia.EdtContato.Text:= qrychama_agenciaContato.AsString;

    FrmChama_Agencia.Close;

    FrmCadastro_Agencia.BBtnSalvar.Enabled:= true;
    FrmCadastro_Agencia.BBtnExcluir.Enabled:= true;
    FrmCadastro_Agencia.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Agencia.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Agencia);
    FrmCadastro_Agencia.achei:= true;
  end
  else if (FrmCadastro_Conta_Corrente <> NIl) and (FrmCadastro_Conta_Corrente.ativo = true) then
  begin
    FrmCadastro_Conta_Corrente.EdtCodigo_Agencia.Text:= qrychama_agenciaCodigo_Agencia.AsString;
    FrmCadastro_Conta_Corrente.EdtAgencia.Text:= qrychama_agenciaNumero.AsString;
    FrmCadastro_Conta_Corrente.EdtBanco.Text:= qrychama_agenciaBanco.AsString;
    FrmChama_Agencia.Close;
  end
  else if (FrmCadastro_Cheque <> NIl) and (FrmCadastro_Cheque.ativo = true) then
  begin
    FrmCadastro_Cheque.EdtCodigo_Agencia.Text:= qrychama_agenciaCodigo_Agencia.AsString;
    FrmCadastro_Cheque.EdtAgencia.Text:= qrychama_agenciaNumero.AsString;
    FrmCadastro_Cheque.EdtBanco.Text:= qrychama_agenciaBanco.AsString;
    FrmChama_Agencia.Close;
  end
end;

procedure TFrmChama_Agencia.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Agencia.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Agencia.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Agencia;
end;

procedure TFrmChama_Agencia.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Agencia.Release;
end;

procedure TFrmChama_Agencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Agencia.FormShow(Sender: TObject);
begin
  qrychama_agencia.Close;
  qrychama_agencia.Open;
end;

end.
