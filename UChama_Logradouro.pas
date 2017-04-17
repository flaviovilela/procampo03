unit UChama_Logradouro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Logradouro = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_logradouro: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_logradouroCodigo: TIntegerField;
    qrychama_logradouroLogradouro: TStringField;
    qrychama_logradouroCEP: TStringField;
    qrychama_logradouroTipo_Logradouro: TStringField;
    qrychama_logradouroData_Cadastro: TDateTimeField;
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
  FrmChama_Logradouro: TFrmChama_Logradouro;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Logradouro, UCadastro_Empresa, UCadastro_Cliente,
  UCadastro_Agencia;

{$R *.dfm}

procedure TFrmChama_Logradouro.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Logradouro.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Logradouro <> NIl) and (FrmCadastro_Logradouro.ativo = true) then
  begin
    FrmCadastro_Logradouro.EdtCodigo.Text:= qrychama_logradouroCodigo.AsString;
    FrmCadastro_Logradouro.EdtLogradouro.Text:= qrychama_logradouroLogradouro.AsString;
    FrmCadastro_Logradouro.EdtCEP.Text:= qrychama_logradouroCEP.AsString;
    FrmCadastro_Logradouro.CmbTipo_Logradouro.Text:= qrychama_logradouroTipo_Logradouro.AsString;
    FrmCadastro_Logradouro.MEdtData_Cadastro.Text:= qrychama_logradouroData_Cadastro.AsString;
    FrmChama_Logradouro.Close;

    FrmCadastro_Logradouro.BBtnSalvar.Enabled:= true;
    FrmCadastro_Logradouro.BBtnExcluir.Enabled:= true;
    FrmCadastro_Logradouro.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Logradouro.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Logradouro);
    FrmCadastro_Logradouro.achei:= true;
  end
  else if (FrmCadastro_Empresa <> NIl) and (FrmCadastro_Empresa.ativo = true) then
  begin
    FrmCadastro_Empresa.EdtCodigo_Endereco.Text:= qrychama_logradouroCodigo.AsString;
    FrmCadastro_Empresa.EdtEndereco.Text:= qrychama_logradouroLogradouro.AsString;
    FrmCadastro_Empresa.EdtCEP.Text:= qrychama_logradouroCEP.AsString;
    FrmCadastro_Empresa.EdtTipo_Logradouro.Text:= qrychama_logradouroTipo_Logradouro.AsString;
    FrmChama_Logradouro.Close;
  end
  else if (FrmCadastro_Cliente <> nil) and (FrmCadastro_Cliente.ativo) then
  begin
    FrmCadastro_Cliente.EdtCodigo_Endereco.Text:= qrychama_logradouroCodigo.AsString;
    FrmCadastro_Cliente.EdtEndereco.Text:= qrychama_logradouroLogradouro.AsString;
    FrmCadastro_Cliente.EdtTipo_Logradouro.Text:= qrychama_logradouroTipo_Logradouro.AsString;
    FrmCadastro_Cliente.EdtCEP.Text:= qrychama_logradouroCEP.AsString;
    FrmChama_Logradouro.Close;
  end
  else if (FrmCadastro_Agencia <> nil) and (FrmCadastro_Agencia.ativo) then
  begin
    FrmCadastro_Agencia.EdtCodigo_Endereco.Text:= qrychama_logradouroCodigo.AsString;
    FrmCadastro_Agencia.EdtEndereco.Text:= qrychama_logradouroLogradouro.AsString;
    FrmChama_Logradouro.Close;
  end;
end;

procedure TFrmChama_Logradouro.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Logradouro.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Logradouro.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Logradouro;
end;

procedure TFrmChama_Logradouro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Logradouro.Release;
end;

procedure TFrmChama_Logradouro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Logradouro.FormShow(Sender: TObject);
begin
  qrychama_logradouro.Open;
end;

end.
