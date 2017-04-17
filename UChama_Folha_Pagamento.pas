unit UChama_Folha_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Folha_Pagamento = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_folha: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_folhaCodigo: TIntegerField;
    qrychama_folhaCodigo_Funcionario: TIntegerField;
    qrychama_folhaCodigo_Propriedade: TIntegerField;
    qrychama_folhaMes_Ano: TStringField;
    qrychama_folhaData_Fechamento: TDateTimeField;
    qrychama_folhaEntradas: TFloatField;
    qrychama_folhaSaidas: TFloatField;
    qrychama_folhaComissao: TFloatField;
    qrychama_folhaDesconto: TFloatField;
    qrychama_folhaSalario: TFloatField;
    qrychama_folhaQuantidade_Itens: TIntegerField;
    qrychama_folhaObservacao: TStringField;
    qrychama_folhaNome: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Folha_Pagamento: TFrmChama_Folha_Pagamento;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UFolha_Pagamento;

{$R *.dfm}

procedure TFrmChama_Folha_Pagamento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Folha_Pagamento.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Folha;
end;

procedure TFrmChama_Folha_Pagamento.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmFolha_Pagamento <> NIL) and (FrmFolha_Pagamento.ativo = true) then
    begin
      FrmFolha_Pagamento.EdtCodigo.Text:= qrychama_folhaCodigo.AsString;
      FrmFolha_Pagamento.MEdtMes_Ano.Text:= qrychama_folhaMes_Ano.AsString;
      FrmFolha_Pagamento.MEdtData_Fechamento.Text:= qrychama_folhaData_Fechamento.AsString;
      FrmFolha_Pagamento.EdtCodigo_Funcionario.Text:= qrychama_folhaCodigo_Funcionario.AsString;
      FrmFolha_Pagamento.EdtFuncionario.Text:= qrychama_folhaNome.AsString;

      FrmFolha_Pagamento.MmoObservacao.Text:= qrychama_folhaObservacao.AsString;

      FrmFolha_Pagamento.EdtQuantidade_Itens.Text:= qrychama_folhaQuantidade_Itens.AsString;

      FrmFolha_Pagamento.EdtEntradas.Text:= FormatFloat('#0.0,0', qrychama_folhaEntradas.AsFloat);
      FrmFolha_Pagamento.EdtEntradas.Text:= StringReplace(FrmFolha_Pagamento.EdtEntradas.Text, ThousandSeparator, '', [rfReplaceAll]);

      FrmFolha_Pagamento.EdtSaidas.Text:= FormatFloat('#0.0,0', qrychama_folhaSaidas.AsFloat);
      FrmFolha_Pagamento.EdtSaidas.Text:= StringReplace(FrmFolha_Pagamento.EdtSaidas.Text, ThousandSeparator, '', [rfReplaceAll]);

      FrmFolha_Pagamento.EdtSalario.Text:= FormatFloat('#0.0,0', qrychama_folhaSalario.AsFloat);
      FrmFolha_Pagamento.EdtSalario.Text:= StringReplace(FrmFolha_Pagamento.EdtSalario.Text, ThousandSeparator, '', [rfReplaceAll]);

      FrmFolha_Pagamento.Atualiza_Dados;
      FrmChama_Folha_Pagamento.Close;
      FrmFolha_Pagamento.BBtnSalvar.Enabled:= true;
      FrmFolha_Pagamento.BBtnExcluir.Enabled:= true;
      FrmFolha_Pagamento.BBtnPesquisar.Enabled:= true;
      FrmFolha_Pagamento.BBtnCancelar.Enabled:= true;
      FrmFolha_Pagamento.BBtnImprimir.Enabled:= true;
      Util.Habilita_Campos(FrmFolha_Pagamento);
      FrmFolha_Pagamento.achei:= true;
    end;
end;

procedure TFrmChama_Folha_Pagamento.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Folha_Pagamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Folha_Pagamento.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qrychama_folha, Column);
end;

procedure TFrmChama_Folha_Pagamento.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Folha;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Folha_Pagamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Folha_Pagamento.Release;
end;

procedure TFrmChama_Folha_Pagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Folha_Pagamento.FormShow(Sender: TObject);
begin
  Consulta.Chama_Folha;
end;

end.
