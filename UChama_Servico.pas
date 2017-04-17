unit UChama_Servico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Servico = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_servico: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_servicoCodigo: TIntegerField;
    qrychama_servicoDescricao: TStringField;
    qrychama_servicoData_Cadastro: TDateTimeField;
    qrychama_servicoValor: TFloatField;
    qrychama_servicoDetalhe: TStringField;
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
  FrmChama_Servico: TFrmChama_Servico;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Servico, UOS;

{$R *.dfm}

procedure TFrmChama_Servico.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Servico.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Servico <> NIl) and (FrmCadastro_Servico.ativo = true) then
  begin
    FrmCadastro_Servico.EdtCodigo.Text:= qrychama_servicoCodigo.AsString;
    FrmCadastro_Servico.EdtDescricao.Text:= qrychama_servicoDescricao.AsString;
    FrmCadastro_Servico.MMODetalhe.Text:= qrychama_servicoDetalhe.AsString;

    FrmCadastro_Servico.EdtValor.Text:= FormatFloat('#0.0,0', qrychama_servicoValor.AsFloat);
    FrmCadastro_Servico.EdtValor.Text:= StringReplace(FrmCadastro_Servico.EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Servico.MEdtData_Cadastro.Text:= qrychama_servicoData_Cadastro.AsString;

    FrmChama_Servico.Close;

    FrmCadastro_Servico.BBtnSalvar.Enabled:= true;
    FrmCadastro_Servico.BBtnExcluir.Enabled:= true;
    FrmCadastro_Servico.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Servico.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Servico);
    FrmCadastro_Servico.achei:= true;
  end
  else if (FrmOS <> NIl) and (FrmOS.ativo = true) then
  begin
    FrmOS.EdtCodigo_Servico.Text:= qrychama_servicoCodigo.AsString;
    FrmOS.EdtServico.Text:= qrychama_servicoDescricao.AsString;

    FrmOS.EdtValor_Unitario.Text:= FormatFloat('#0.0,0', qrychama_servicoValor.AsFloat);
    FrmOS.EdtValor_Unitario.Text:= StringReplace(FrmOS.EdtValor_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmChama_Servico.Close;
  {end
  else if (FrmCadastro_Empresa <> NIl) and (FrmCadastro_Empresa.ativo = true) then
  begin
    FrmCadastro_Empresa.EdtCodigo_Setor.Text:= qrychama_setorCodigo.AsString;
    FrmCadastro_Empresa.EdtSetor.Text:= qrychama_setorDescricao.AsString;
    FrmChama_Setor.Close;}
  end
end;

procedure TFrmChama_Servico.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Servico.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Servico.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Servico;
end;

procedure TFrmChama_Servico.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Servico.Release;
end;

procedure TFrmChama_Servico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Servico.FormShow(Sender: TObject);
begin
  qrychama_servico.Close;
  qrychama_servico.Open;
end;

end.
