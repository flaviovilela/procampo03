unit UChama_Item_Folha_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Item_Folha_Pagamento = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TAutoIncField;
    qrychamaDescricao: TStringField;
    qrychamaData_Cadastro: TDateTimeField;
    qrychamaNatureza: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Item_Folha_Pagamento: TFrmChama_Item_Folha_Pagamento;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Itens_Folha_Pagamento, UFolha_Pagamento;

{$R *.dfm}

procedure TFrmChama_Item_Folha_Pagamento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Item_Folha_Pagamento.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Itens_Folha_Pagamento <> Nil) and (FrmCadastro_Itens_Folha_Pagamento.ativo = true) then
  begin
    FrmCadastro_Itens_Folha_Pagamento.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Itens_Folha_Pagamento.EdtDescricao.Text:= qrychamaDescricao.AsString;

    if (qrychamaNatureza.AsString = 'ENTRADA') then
      FrmCadastro_Itens_Folha_Pagamento.RGNatureza.ItemIndex:= 0
    else
      FrmCadastro_Itens_Folha_Pagamento.RGNatureza.ItemIndex:= 1;

    FrmCadastro_Itens_Folha_Pagamento.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;
    FrmChama_Item_Folha_Pagamento.Close;
    FrmCadastro_Itens_Folha_Pagamento.BBtnSalvar.Enabled:= true;
    FrmCadastro_Itens_Folha_Pagamento.BBtnExcluir.Enabled:= true;
    FrmCadastro_Itens_Folha_Pagamento.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Itens_Folha_Pagamento.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Itens_Folha_Pagamento);
    FrmCadastro_Itens_Folha_Pagamento.achei:= true;
  end
  else if (FrmFolha_Pagamento <> nil) and (FrmFolha_Pagamento.ativo) then
  begin
    FrmFolha_Pagamento.EdtCodigo_Item.Text:= qrychamaCodigo.AsString;
    FrmFolha_Pagamento.EdtNatureza.Text:= qrychamaNatureza.AsString;
    FrmFolha_Pagamento.EdtItem.Text:= qrychamaDescricao.AsString;
    FrmChama_Item_Folha_Pagamento.Close;
  end;
end;

procedure TFrmChama_Item_Folha_Pagamento.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Item_Folha_Pagamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Item_Folha_Pagamento.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Itens_Folha_Pagamento;
end;

procedure TFrmChama_Item_Folha_Pagamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Item_Folha_Pagamento.Release;
end;

procedure TFrmChama_Item_Folha_Pagamento.FormCreate(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Open;
end;

procedure TFrmChama_Item_Folha_Pagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
