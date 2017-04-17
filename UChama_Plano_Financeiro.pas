unit UChama_Plano_Financeiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Plano_Financeiro = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_plano: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_planoCodigo: TIntegerField;
    qrychama_planoCodigo_Empresa: TIntegerField;
    qrychama_planoTipo: TStringField;
    qrychama_planoDescricao: TStringField;
    qrychama_planoCodigo_SubNivel: TIntegerField;
    qrychama_planoData_Cadastro: TDateTimeField;
    qrychama_planoSub_Nivel: TStringField;
    qrychama_planoCodigo_Pai: TIntegerField;
    qrychama_planoDescricao2: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtConsultaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Plano_Financeiro: TFrmChama_Plano_Financeiro;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Plano_Financeiro, ULancamento_Financeiro,
  UConsulta_Lancamentos_Financeiros, ULancamento_Banco;

{$R *.dfm}

procedure TFrmChama_Plano_Financeiro.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Plano_Financeiro.DBGrid1DblClick(Sender: TObject);
begin
    if (FrmCadastro_Plano_Financeiro <> Nil) and (FrmCadastro_Plano_Financeiro.ativo = true) and (FrmCadastro_Plano_Financeiro.edit = 1) then
    begin
      FrmCadastro_Plano_Financeiro.EdtCodigo_SubNivel.Text:= qrychama_planoCodigo.AsString;
      FrmCadastro_Plano_Financeiro.EdtSubnivel.Text:= qrychama_planoDescricao.AsString;
      FrmCadastro_Plano_Financeiro.EdtDescricao.Text:= qrychama_planoDescricao.AsString + ' : ' + FrmCadastro_Plano_Financeiro.EdtDescricao.Text;
      FrmCadastro_Plano_Financeiro.codigo_pai:= qrychama_planoCodigo_Pai.AsInteger;

      if (qrychama_planoSub_Nivel.AsString <> '') then
        FrmCadastro_Plano_Financeiro.EdtSub_Grupo.Text:= qrychama_planoSub_Nivel.AsString + '.' + FrmCadastro_Plano_Financeiro.EdtSub_Grupo.Text
      else
        FrmCadastro_Plano_Financeiro.EdtSub_Grupo.Text:= FrmCadastro_Plano_Financeiro.EdtCodigo.Text;

      FrmChama_Plano_Financeiro.Close;
    end
    else if (FrmCadastro_Plano_Financeiro <> NIL) and (FrmCadastro_Plano_Financeiro.ativo = true) and (FrmCadastro_Plano_Financeiro.edit = 0) then
    begin
      FrmCadastro_Plano_Financeiro.EdtCodigo.Text:= qrychama_planoCodigo.AsString;
      FrmCadastro_Plano_Financeiro.MEdtData_Cadastro.Text:= qrychama_planoData_Cadastro.AsString;

      if (qrychama_planoTipo.AsString = 'RECEITA') then
        FrmCadastro_Plano_Financeiro.RGTipo.ItemIndex:= 0
      else
        FrmCadastro_Plano_Financeiro.RGTipo.ItemIndex:= 1;

      FrmCadastro_Plano_Financeiro.EdtDescricao.Text:= qrychama_planoDescricao.AsString;

      FrmCadastro_Plano_Financeiro.EdtCodigo_SubNivel.Text:= qrychama_planoCodigo_SubNivel.AsString;
      FrmCadastro_Plano_Financeiro.EdtSubnivel.Text:= qrychama_planoDescricao2.AsString;

      FrmCadastro_Plano_Financeiro.EdtSub_Grupo.Text:= qrychama_planoSub_Nivel.AsString;
      FrmCadastro_Plano_Financeiro.codigo_pai:= qrychama_planoCodigo_Pai.AsInteger;

      FrmCadastro_Plano_Financeiro.Atualiza_Lancamento_Plano;
      FrmChama_Plano_Financeiro.Close;
      FrmCadastro_Plano_Financeiro.BBtnSalvar.Enabled:= true;
      FrmCadastro_Plano_Financeiro.BBtnExcluir.Enabled:= true;
      FrmCadastro_Plano_Financeiro.BBtnPesquisar.Enabled:= true;
      FrmCadastro_Plano_Financeiro.BBtnCancelar.Enabled:= true;
      Util.Habilita_Campos(FrmCadastro_Plano_Financeiro);
      FrmCadastro_Plano_Financeiro.achei:= true;
    end
    else if (FrmCadastro_Plano_Financeiro <> NIL) and (FrmCadastro_Plano_Financeiro.ativo = true) and (FrmCadastro_Plano_Financeiro.edit = 2) then
    begin
      FrmCadastro_Plano_Financeiro.EdtCodigo_Plano_Destino.Text:= qrychama_planoCodigo.AsString;
      FrmCadastro_Plano_Financeiro.EdtPlano_Destino.Text:= qrychama_planoDescricao2.AsString;
      FrmChama_Plano_Financeiro.Close;
    end
    else if (FrmLancamento_Financeiro <> NIl) and (FrmLancamento_Financeiro.ativo = true) then
    begin
      FrmLancamento_Financeiro.EdtCodigo_Plano.Text:= qrychama_planoCodigo.AsString;
      FrmLancamento_Financeiro.EdtPlano.Text:= qrychama_planoDescricao.AsString;
      FrmChama_Plano_Financeiro.Close;
    end
    else if (FrmConsulta_Lancamentos_Financeiros <> NIl) and (FrmConsulta_Lancamentos_Financeiros.ativo = true) then
    begin
      FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text:= qrychama_planoCodigo.AsString;
      FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text:= qrychama_planoDescricao.AsString;
      FrmChama_Plano_Financeiro.Close;
    end
    else if (FrmLancamento_Banco <> NIl) and (FrmLancamento_Banco.ativo = true) then
    begin
      FrmLancamento_Banco.EdtCodigo_Plano.Text:= qrychama_planoCodigo.AsString;
      FrmLancamento_Banco.EdtPlano.Text:= qrychama_planoDescricao.AsString;
      FrmChama_Plano_Financeiro.Close;
    end
end;

procedure TFrmChama_Plano_Financeiro.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Plano_Financeiro.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Plano_Financeiro.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Plano_Financeiro;
end;

procedure TFrmChama_Plano_Financeiro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Plano_Financeiro.Release;
end;

procedure TFrmChama_Plano_Financeiro.FormCreate(Sender: TObject);
begin
  qrychama_plano.Close;
  qrychama_plano.Open;
end;

procedure TFrmChama_Plano_Financeiro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
