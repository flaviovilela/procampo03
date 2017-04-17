unit UChama_Empresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Empresa = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_empresa: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_empresaCodigo: TIntegerField;
    qrychama_empresaNome_Fantasia: TStringField;
    qrychama_empresaRazao_Social: TStringField;
    qrychama_empresaCNPJ: TStringField;
    qrychama_empresaInscricao_Estadual: TStringField;
    qrychama_empresaInscricao_Municipal: TStringField;
    qrychama_empresaCodigo_Endereco: TIntegerField;
    qrychama_empresaNumero: TStringField;
    qrychama_empresaCodigo_Setor: TIntegerField;
    qrychama_empresaE_Mail: TStringField;
    qrychama_empresaSite: TStringField;
    qrychama_empresaCodigo_Cidade: TIntegerField;
    qrychama_empresaTelefone: TStringField;
    qrychama_empresaCelular: TStringField;
    qrychama_empresaData_Cadastro: TDateTimeField;
    qrychama_empresaLogradouro: TStringField;
    qrychama_empresaCEP: TStringField;
    qrychama_empresaTipo_Logradouro: TStringField;
    qrychama_empresaCidade: TStringField;
    qrychama_empresaUF: TStringField;
    qrychama_empresaDescricao: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Empresa: TFrmChama_Empresa;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Empresa, URecibo, UTransfere_Lancamento;

{$R *.dfm}

procedure TFrmChama_Empresa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Empresa.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Empresa;
end;

procedure TFrmChama_Empresa.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Empresa <> NIl) and (FrmCadastro_Empresa.ativo = true) then
  begin
    FrmCadastro_Empresa.EdtCodigo.Text:= qrychama_empresaCodigo.AsString;
    FrmCadastro_Empresa.EdtNome_Fantasia.Text:= qrychama_empresaNome_Fantasia.AsString;
    FrmCadastro_Empresa.EdtRazao_Social.Text:= qrychama_empresaRazao_Social.AsString;
    FrmCadastro_Empresa.EdtCNPJ.Text:= qrychama_empresaCNPJ.AsString;
    FrmCadastro_Empresa.EdtInsc_Estadual.Text:= qrychama_empresaInscricao_Estadual.AsString;
    FrmCadastro_Empresa.EdtInsc_Municipal.Text:= qrychama_empresaInscricao_Municipal.AsString;

    FrmCadastro_Empresa.EdtCodigo_Endereco.Text:= qrychama_empresaCodigo_Endereco.AsString;
    FrmCadastro_Empresa.EdtEndereco.Text:= qrychama_empresaLogradouro.AsString;
    FrmCadastro_Empresa.EdtTipo_Logradouro.Text:= qrychama_empresaTipo_Logradouro.AsString;
    FrmCadastro_Empresa.EdtCEP.Text:= qrychama_empresaCEP.AsString;

    FrmCadastro_Empresa.EdtNumero.Text:= qrychama_empresaNumero.AsString;

    FrmCadastro_Empresa.EdtCodigo_Setor.Text:= qrychama_empresaCodigo_Setor.AsString;
    FrmCadastro_Empresa.EdtSetor.Text:= qrychama_empresaDescricao.AsString;

    FrmCadastro_Empresa.EdtEmail.Text:= qrychama_empresaE_Mail.AsString;
    FrmCadastro_Empresa.EdtSite.Text:= qrychama_empresaSite.AsString;

    FrmCadastro_Empresa.EdtCodigo_Cidade.Text:= qrychama_empresaCodigo_Cidade.AsString;
    FrmCadastro_Empresa.EdtCidade.Text:= qrychama_empresaCidade.AsString;
    FrmCadastro_Empresa.EdtUF.Text:= qrychama_empresaUF.AsString;

    FrmCadastro_Empresa.MEdtTelefone.Text:= qrychama_empresaTelefone.AsString;
    FrmCadastro_Empresa.MEdtCelular.Text:= qrychama_empresaCelular.AsString;
    FrmCadastro_Empresa.MEdtData_Cadastro.Text:= qrychama_empresaData_Cadastro.AsString;

    FrmCadastro_Empresa.BBtnSalvar.Enabled:= true;
    FrmCadastro_Empresa.BBtnExcluir.Enabled:= true;
    FrmCadastro_Empresa.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Empresa.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Empresa);
    FrmCadastro_Empresa.achei:= true;
  end
  else if (FrmRecibo <> nil) and (FrmRecibo.ativo) then
  begin
    FrmRecibo.EdtEmitente.Text:= qrychama_empresaNome_Fantasia.AsString;
    FrmRecibo.EdtEndereco_Emitente.Text:= qrychama_empresaLogradouro.AsString;
    FrmRecibo.EdtNumero_Emitente.Text:= qrychama_empresaNumero.AsString;
    FrmRecibo.EdtCNPJ.Text:= qrychama_empresaInscricao_Estadual.AsString;
  end
  else if (FrmTransfere_Lancamento <> nil) and (FrmTransfere_Lancamento.ativo) then
  begin
    FrmTransfere_Lancamento.EdtCodigo_Propriedade.Text:= qrychama_empresaCodigo.AsString;
    FrmTransfere_Lancamento.EdtPropriedade.Text:= qrychama_empresaNome_Fantasia.AsString;
  end;
    FrmChama_Empresa.Close;

end;

procedure TFrmChama_Empresa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Empresa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Empresa.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Empresa;
end;

procedure TFrmChama_Empresa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Empresa.Release;
end;

procedure TFrmChama_Empresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Empresa.FormShow(Sender: TObject);
begin
  qrychama_empresa.Open;
end;

end.
