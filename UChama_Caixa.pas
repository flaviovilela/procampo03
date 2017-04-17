unit UChama_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Caixa = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_caixa: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_caixaCodigo: TAutoIncField;
    qrychama_caixaDescricao: TStringField;
    qrychama_caixaCodigo_SubNivel: TIntegerField;
    qrychama_caixaCaixa: TStringField;
    qrychama_caixaData_Cadastro: TDateTimeField;
    qrychama_caixaCodigo_SubNivel_1: TIntegerField;
    qrychama_caixaCaixa_1: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtConsultaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Caixa: TFrmChama_Caixa;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Caixa, UAbertura_Caixa, UBaixar_Titulo,
  UConsulta_Acerto_Caixa;

{$R *.dfm}

procedure TFrmChama_Caixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Caixa.DBGrid1DblClick(Sender: TObject);
begin
    if (FrmCadastro_Caixa <> Nil) and (FrmCadastro_Caixa.ativo = true) and (FrmCadastro_Caixa.edit = true) then
    begin
      FrmCadastro_Caixa.EdtCodigo_SubNivel.Text:= qrychama_caixaCodigo.AsString;
      FrmCadastro_Caixa.EdtSubnivel.Text:= qrychama_caixaCaixa.AsString;
      FrmChama_Caixa.Close;
    end
    else if (FrmCadastro_Caixa <> NIL) and (FrmCadastro_Caixa.ativo = true) then
    begin
      FrmCadastro_Caixa.EdtCodigo.Text:= qrychama_caixaCodigo.AsString;
      FrmCadastro_Caixa.MEdtData_Cadastro.Text:= qrychama_caixaData_Cadastro.AsString;
      FrmCadastro_Caixa.EdtDescricao.Text:= qrychama_caixaDescricao.AsString;
      FrmCadastro_Caixa.EdtCaixa.Text:= qrychama_caixaCaixa.AsString;

      if (qrychama_caixaCodigo_SubNivel_1.AsString = '0') then
        begin
          FrmCadastro_Caixa.EdtCodigo_SubNivel.Text:= '';
          FrmCadastro_Caixa.EdtSubnivel.Text:= '';
        end
        else
        begin
          FrmCadastro_Caixa.EdtCodigo_SubNivel.Text:= qrychama_caixaCodigo.AsString;
          FrmCadastro_Caixa.EdtSubnivel.Text:= qrychama_caixaCaixa.AsString;
        end;

      FrmChama_Caixa.Close;
      FrmCadastro_Caixa.BBtnSalvar.Enabled:= true;
      FrmCadastro_Caixa.BBtnExcluir.Enabled:= true;
      FrmCadastro_Caixa.BBtnPesquisar.Enabled:= true;
      FrmCadastro_Caixa.BBtnCancelar.Enabled:= true;
      Util.Habilita_Campos(FrmCadastro_Caixa);
      FrmCadastro_Caixa.achei:= true;
    end
    else if (FrmAbertura_Caixa <> NIl) and (FrmAbertura_Caixa.ativo = true) then
    begin
      FrmAbertura_Caixa.EdtCodigo_Caixa.Text:= qrychama_caixaCodigo.AsString;
      FrmAbertura_Caixa.EdtCaixa.Text:= qrychama_caixaCaixa.AsString;
      FrmChama_Caixa.Close;
    {end
    else if (FrmBaixar_Titulo <> NIl) and (FrmBaixar_Titulo.ativo = true) then
    begin
      FrmBaixar_Titulo.EdtCodigo_Caixa.Text:= qrychama_caixaCodigo.AsString;
      FrmBaixar_Titulo.EdtCaixa.Text:= qrychama_caixaCaixa.AsString;
      FrmChama_Caixa.Close; }
    end
    else if (FrmConsulta_Acerto_Caixa <> NIl) and (FrmConsulta_Acerto_Caixa.ativo = true) then
    begin
      FrmConsulta_Acerto_Caixa.EdtCodigo.Text:= qrychama_caixaCodigo.AsString;
      FrmConsulta_Acerto_Caixa.EdtDescricao.Text:= qrychama_caixaCaixa.AsString;
      FrmChama_Caixa.Close;
    end;
end;

procedure TFrmChama_Caixa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Caixa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Caixa.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Caixa;
end;

procedure TFrmChama_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Caixa.Release;
end;

procedure TFrmChama_Caixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Caixa.FormShow(Sender: TObject);
begin
  qrychama_caixa.Open;
end;

end.
