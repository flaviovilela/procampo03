unit UChama_Bem_Patrimonio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Bem_Patrimonio = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_bem: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_bemCodigo: TIntegerField;
    qrychama_bemCodigo_Propriedade: TIntegerField;
    qrychama_bemIdentificacao: TStringField;
    qrychama_bemCodigo_Centro_Custo: TIntegerField;
    qrychama_bemCodigo_Funcionario: TStringField;
    qrychama_bemDescricao: TStringField;
    qrychama_bemCodigo_Tipo_Bem_Patrimonial: TIntegerField;
    qrychama_bemCodigo_Unidade: TIntegerField;
    qrychama_bemPreco_RS: TFloatField;
    qrychama_bemPreco_S: TFloatField;
    qrychama_bemQuantidade: TFloatField;
    qrychama_bemTipo_Bem: TStringField;
    qrychama_bemData_Cadastro: TDateTimeField;
    qrychama_bemData_Compra: TDateTimeField;
    qrychama_bemObservacao: TStringField;
    qrychama_bemDescricao_Detalhada: TStringField;
    qrychama_bemUnidade_Medida: TStringField;
    qrychama_bemTipo_Bem_1: TStringField;
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
  FrmChama_Bem_Patrimonio: TFrmChama_Bem_Patrimonio;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Bem_Patrimonio;

{$R *.dfm}

procedure TFrmChama_Bem_Patrimonio.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Bem_Patrimonio.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Bem_Patrimonio <> NIl) and (FrmCadastro_Bem_Patrimonio.ativo = true) then
  begin
    FrmCadastro_Bem_Patrimonio.EdtCodigo.Text:= qrychama_bemCodigo.AsString;
    FrmCadastro_Bem_Patrimonio.EdtIdentificacao.Text:= qrychama_bemIdentificacao.AsString;
    FrmCadastro_Bem_Patrimonio.EdtResponsavel.Text:= qrychama_bemCodigo_Funcionario.AsString;
    FrmCadastro_Bem_Patrimonio.EdtDescricao.Text:= qrychama_bemDescricao.AsString;
    FrmCadastro_Bem_Patrimonio.EdtCodigo_Tipo_Bem.Text:= qrychama_bemCodigo_Tipo_Bem_Patrimonial.AsString;
    FrmCadastro_Bem_Patrimonio.EdtTipo_Bem.Text:= qrychama_bemTipo_Bem_1.AsString;
    FrmCadastro_Bem_Patrimonio.EdtCodigo_Unidade.Text:= qrychama_bemCodigo_Unidade.AsString;
    FrmCadastro_Bem_Patrimonio.EdtUnidade.Text:= qrychama_bemUnidade_Medida.AsString;

    FrmCadastro_Bem_Patrimonio.EdtPreco_RS.Text:= FormatFloat('#0.0,0', qrychama_bemPreco_RS.AsFloat);
    FrmCadastro_Bem_Patrimonio.EdtPreco_RS.Text:= StringReplace(FrmCadastro_Bem_Patrimonio.EdtPreco_RS.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Bem_Patrimonio.EdtPreco_S.Text:= FormatFloat('#0.0,0', qrychama_bemPreco_S.AsFloat);
    FrmCadastro_Bem_Patrimonio.EdtPreco_S.Text:= StringReplace(FrmCadastro_Bem_Patrimonio.EdtPreco_S.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Bem_Patrimonio.EdtQuantidade.Text:= FormatFloat('#0.0,0', qrychama_bemQuantidade.AsFloat);
    FrmCadastro_Bem_Patrimonio.EdtQuantidade.Text:= StringReplace(FrmCadastro_Bem_Patrimonio.EdtQuantidade.Text, ThousandSeparator, '', [rfReplaceAll]);

    if (qrychama_bemTipo_Bem.AsString = 'I') then
      FrmCadastro_Bem_Patrimonio.RGTipo_Bem.ItemIndex:= 0
    else if (qrychama_bemTipo_Bem.AsString = 'M') then
      FrmCadastro_Bem_Patrimonio.RGTipo_Bem.ItemIndex:= 1
    else if (qrychama_bemTipo_Bem.AsString = 'O') then
      FrmCadastro_Bem_Patrimonio.RGTipo_Bem.ItemIndex:= 2;

    FrmCadastro_Bem_Patrimonio.MEdtData_Cadastro.Text:= qrychama_bemData_Cadastro.AsString;
    FrmCadastro_Bem_Patrimonio.MEdtData_Compra.Text:= qrychama_bemData_Compra.AsString;
    FrmCadastro_Bem_Patrimonio.MMODescricao_Detalhada.Text:= qrychama_bemObservacao.AsString;
    FrmCadastro_Bem_Patrimonio.MMObservacoes.Text:= qrychama_bemDescricao_Detalhada.AsString;


    FrmChama_Bem_Patrimonio.Close;

    FrmCadastro_Bem_Patrimonio.BBtnSalvar.Enabled:= true;
    FrmCadastro_Bem_Patrimonio.BBtnExcluir.Enabled:= true;
    FrmCadastro_Bem_Patrimonio.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Bem_Patrimonio.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Bem_Patrimonio);
    FrmCadastro_Bem_Patrimonio.achei:= true;
  end
end;

procedure TFrmChama_Bem_Patrimonio.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Bem_Patrimonio.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Bem_Patrimonio.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Bem_Patrimonial;
end;

procedure TFrmChama_Bem_Patrimonio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Bem_Patrimonio.Release;
end;

procedure TFrmChama_Bem_Patrimonio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Bem_Patrimonio.FormShow(Sender: TObject);
begin
  qrychama_bem.Close;
  qrychama_bem.Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
  qrychama_bem.Open;
end;

end.
