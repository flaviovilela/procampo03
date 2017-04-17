unit UChama_Produto_Compra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UCadastro_Cliente, DBClient, Provider, UUtilitarios;

type
  TFrmChama_Produto_Compra = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    ImgImagens: TImageList;
    LblMarca: TLabel;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_produto: TADOQuery;
    qrychama_produtoCodigo: TIntegerField;
    qrychama_produtoN_Pedido: TIntegerField;
    qrychama_produtoCodigo_Produto: TIntegerField;
    qrychama_produtoQtde: TFloatField;
    qrychama_produtoValor_Unitario: TFloatField;
    qrychama_produtoDesconto: TFloatField;
    qrychama_produtoTipo_Desconto: TStringField;
    qrychama_produtoSub_Total: TFloatField;
    qrychama_produtoCodigo_Produto_Int: TAutoIncField;
    qrychama_produtoDescricao: TStringField;
    qrychama_produtoSigla: TStringField;
    RGOrdena_Por: TRadioGroup;
    qrychama_produtoQtde_Recebida: TFloatField;
    qrychama_produtoQtde_Restante: TFloatField;
    qrychama_produtoStatus: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Produto_Compra: TFrmChama_Produto_Compra;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UConciliacao_Compra;

{$R *.dfm}

procedure TFrmChama_Produto_Compra.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Produto_Compra.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmConciliacao_Compra <> Nil) and (FrmConciliacao_Compra.ativo = true) then
  begin
    FrmConciliacao_Compra.EdtCodigo_Produto.Text:= qrychama_produtoCodigo_Produto_Int.AsString;
    FrmConciliacao_Compra.EdtProduto.Text:= qrychama_produtoDescricao.AsString;
    FrmConciliacao_Compra.EdtUnidade.Text:= qrychama_produtoSigla.AsString;
    FrmConciliacao_Compra.EdtQtde_Solicitada.Text:= qrychama_produtoQtde.AsString;
    FrmConciliacao_Compra.EdtQtde_Restante.Text:= qrychama_produtoQtde_Restante.AsString;
    FrmConciliacao_Compra.EdtValor_Unitario.Text:= qrychama_produtoValor_Unitario.AsString;
    FrmChama_Produto_Compra.Close;
  end;
end;

procedure TFrmChama_Produto_Compra.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Produto_Compra.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Produto_Compra.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Produto_Compra;
end;

procedure TFrmChama_Produto_Compra.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    Consulta.Chama_Produto_Compra;
end;

procedure TFrmChama_Produto_Compra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Produto_Compra.Release;
end;

procedure TFrmChama_Produto_Compra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
