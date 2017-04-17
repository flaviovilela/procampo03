unit UChama_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Produto = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaDescricao: TStringField;
    qrychamaCodigo_Grupo: TIntegerField;
    qrychamaPreco: TFloatField;
    qrychamaQuantidade_Estoque: TFloatField;
    qrychamaCodigo_Unidade: TIntegerField;
    qrychamaCodigo_Unidade_Volume: TIntegerField;
    qrychamaVolume: TFloatField;
    qrychamaVolume_Total: TFloatField;
    qrychamaData_Cadastro: TDateTimeField;
    qrychamaData_Ultima_Compra: TDateTimeField;
    qrychamaData_Validade: TDateTimeField;
    qrychamaTipo_Produto: TStringField;
    qrychamaCodigo_Animal_Reprodutor: TIntegerField;
    qrychamaCarencia: TIntegerField;
    qrychamaGrupo_Produto: TStringField;
    qrychamaUnidade_Medida: TStringField;
    qrychamaUnidade_Volume: TStringField;
    qrychamaAnimal: TStringField;
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
  FrmChama_Produto: TFrmChama_Produto;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UConsulta_Comparativo_Preco_Cotacao, UCotacao_Preco_Produto, UCompra,
  UManutencao_Estoque;

{$R *.dfm}

procedure TFrmChama_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Produto.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCotacao_Preco_Produto <> nil) and (FrmCotacao_Preco_Produto.ativo) then
  begin
    FrmCotacao_Preco_Produto.EdtCodigo_Produto.Text:= qrychamaCodigo.AsString;
    FrmCotacao_Preco_Produto.EdtProduto.Text:= qrychamaDescricao.AsString;
  end
  else if (FrmConsulta_Comparativo_Preco_Cotacao <> nil) and (FrmConsulta_Comparativo_Preco_Cotacao.ativo) then
  begin
    FrmConsulta_Comparativo_Preco_Cotacao.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmConsulta_Comparativo_Preco_Cotacao.EdtConsulta.Text:= qrychamaDescricao.AsString;
  end
  else if (FrmCompra <> nil) and (FrmCompra.ativo) then
  begin
    FrmCompra.EdtCodigo_Produto.Text:= qrychamaCodigo.AsString;
    FrmCompra.EdtProduto.Text:= qrychamaDescricao.AsString;
    FrmCompra.EdtUnidade.Text:= qrychamaUnidade_Medida.AsString;
    FrmCompra.EdtValor_Unitario.Text:= qrychamaPreco.AsString;
  end
  else if (FrmManutencao_Estoque <> nil) and (FrmManutencao_Estoque.ativo) then
  begin
    FrmManutencao_Estoque.EdtCodigo_Produto.Text:= qrychamaCodigo.AsString;
    FrmManutencao_Estoque.estoque:= qrychamaQuantidade_Estoque.AsFloat;
    FrmManutencao_Estoque.volume:= qrychamaVolume.AsFloat;
    FrmManutencao_Estoque.EdtProduto.Text:= qrychamaDescricao.AsString;
  end;
    FrmChama_Produto.Close;

end;

procedure TFrmChama_Produto.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Produto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Produto.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Produto;
end;

procedure TFrmChama_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Produto.Release;
end;

procedure TFrmChama_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Produto.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
  qrychama.Open;
end;

end.
