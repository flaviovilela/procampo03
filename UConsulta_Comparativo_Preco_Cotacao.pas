unit UConsulta_Comparativo_Preco_Cotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Comparativo_Preco_Cotacao = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_cotacao: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    EdtCodigo: TEdit;
    EdtCotacao: TEdit;
    Label3: TLabel;
    qryconsulta_cotacaoCodigo: TIntegerField;
    qryconsulta_cotacaoN_Cotacao: TIntegerField;
    qryconsulta_cotacaoCodigo_Produto: TIntegerField;
    qryconsulta_cotacaoQtde: TFloatField;
    qryconsulta_cotacaoValor_Unitario: TFloatField;
    qryconsulta_cotacaoDesconto: TFloatField;
    qryconsulta_cotacaoTipo_Desconto: TStringField;
    qryconsulta_cotacaoSub_Total: TFloatField;
    qryconsulta_cotacaoCodigo_Fornecedor: TIntegerField;
    qryconsulta_cotacaoPrazo_Entrega: TIntegerField;
    qryconsulta_cotacaoDescricao: TStringField;
    qryconsulta_cotacaoSigla: TStringField;
    qryconsulta_cotacaoCond_Pag: TStringField;
    BBtnImprimir_Selecionado: TToolButton;
    BBtnAprovar: TToolButton;
    qryconsulta_cotacaoStatus: TStringField;
    RGStatus: TRadioGroup;
    BBtnEstorno: TToolButton;
    qryconsulta_cotacaoNome: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure RGConsulta_PorClick(Sender: TObject);
    procedure BBtnImprimir_SelecionadoClick(Sender: TObject);
    procedure BBtnAprovarClick(Sender: TObject);
    procedure BBtnEstornoClick(Sender: TObject);
  private
    { Private declarations }
    procedure Aprova(Status: Ansistring);
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Comparativo_Preco_Cotacao: TFrmConsulta_Comparativo_Preco_Cotacao;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Produto, URel_Consulta_Comparativo_Preco_Cotacao,
  URel_Consulta_Comparativo_Preco_Cotacao_Selecionado, UChama_Cliente;

{$R *.dfm}

procedure TFrmConsulta_Comparativo_Preco_Cotacao.Aprova(Status: Ansistring);
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Itens_Retorno_Cotacao_Preco set Status = :Status');
      add('where N_Cotacao = :N_Cotacao and ');
      add('Codigo_Produto = :Produto and Codigo = :Codigo');
      Parameters.ParamByName('Status').Value:= Status;
      Parameters.ParamByName('N_Cotacao').Value:= qryconsulta_cotacaoN_Cotacao.AsInteger;
      Parameters.ParamByName('Produto').Value:= qryconsulta_cotacaoCodigo_Produto.AsInteger;
      Parameters.ParamByName('Codigo').Value:= qryconsulta_cotacaoCodigo.AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.BBtnAprovarClick(
  Sender: TObject);
begin
  if (DBGrid1.SelectedRows.Count = 0) then
  begin
    //Item_Selecionado_DBGrid;
    abort;
  end;

  if (Mensagem.Confirma_Processo) then
  begin
    qryconsulta_cotacao.First;
    while not qryconsulta_cotacao.Eof do
    begin
      if (DBGrid1.SelectedRows.CurrentRowSelected) then
        Aprova('APROVADO')
      else
        Aprova('REPROVADO');

      qryconsulta_cotacao.Next;
    end;
    Mensagem.Processo_Concluido;
  end;

end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.BBtnEstornoClick(
  Sender: TObject);
begin
  if (DBGrid1.SelectedRows.Count = 0) then
  begin
    //Item_Selecionado_DBGrid;
    abort;
  end;

  if (Mensagem.Confirma_Processo) then
  begin
    qryconsulta_cotacao.First;
    while not qryconsulta_cotacao.Eof do
    begin
      if (DBGrid1.SelectedRows.CurrentRowSelected) then
        Aprova('PENDENTE');

      qryconsulta_cotacao.Next;
    end;
    Mensagem.Processo_Concluido;
  end;
end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Comparativo_Preco_Cotacao;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
  BBtnImprimir_Selecionado.Enabled:= true;
  BBtnAprovar.Enabled:= true;
  BBtnEstorno.Enabled:= true;
end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Comparativo_Preco_Cotacao:= TFrmRel_Consulta_Comparativo_Preco_Cotacao.create(self);
  FrmRel_Consulta_Comparativo_Preco_Cotacao.Release;
  FrmRel_Consulta_Comparativo_Preco_Cotacao:= Nil;
end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.BBtnImprimir_SelecionadoClick(
  Sender: TObject);
begin
  FrmRel_Consulta_Comparativo_Preco_Cotacao_Selecionado:= TFrmRel_Consulta_Comparativo_Preco_Cotacao_Selecionado.create(self);
  FrmRel_Consulta_Comparativo_Preco_Cotacao_Selecionado.Release;
  FrmRel_Consulta_Comparativo_Preco_Cotacao_Selecionado:= Nil;
end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_cotacao.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnImprimir_Selecionado.Enabled:= false;
  BBtnAprovar.Enabled:= false;
  BBtnEstorno.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
  EdtConsulta.SetFocus;
end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Comparativo_Preco_Cotacao.EdtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      if (RGConsulta_Por.ItemIndex = 1) then
      begin
        Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
        FrmChama_Produto.ShowModal;
        FrmChama_Produto.Free;
      end
      else if (RGConsulta_Por.ItemIndex = 2) then
      begin
        Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
        FrmChama_Cliente.ShowModal;
        FrmChama_Cliente.Free;
      end;
    end;
end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.EdtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Comparativo_Preco_Cotacao.Free;
  FrmConsulta_Comparativo_Preco_Cotacao:= NIl;
end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.FormCreate(Sender: TObject);
begin
  qryconsulta_cotacao.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnImprimir_Selecionado.Enabled:= false;
  BBtnAprovar.Enabled:= false;
  BBtnEstorno.Enabled:= false;
  EdtConsulta.Clear;
end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Comparativo_Preco_Cotacao.RGConsulta_PorClick(
  Sender: TObject);
begin
  if (RGConsulta_Por.ItemIndex = 1) then
    Label2.Caption:= 'Produto'
  else if (RGConsulta_Por.ItemIndex = 2) then
    Label2.Caption:= 'Fornecedor';
end;

end.
