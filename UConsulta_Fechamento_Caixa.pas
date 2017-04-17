unit UConsulta_Fechamento_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UCadastro_Cliente, Mask, UUtilitarios;

type
  TFrmConsulta_Fechamento_Caixa = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtUsuario: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_caixa: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    EdtCodigo_Usuario: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    qryconsulta_caixaData_Abertura: TDateTimeField;
    qryconsulta_caixaData_Fechamento: TDateTimeField;
    qryconsulta_caixaForma_Pagamento: TStringField;
    qryconsulta_caixaCodigo_Usuario: TIntegerField;
    qryconsulta_caixaValor_Abertura: TFloatField;
    qryconsulta_caixaValor_Fechamento: TFloatField;
    qryconsulta_caixaNome: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtCodigo_UsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_UsuarioKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Fechamento_Caixa: TFrmConsulta_Fechamento_Caixa;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Usuario, URel_Consulta_Fechamento_Caixa;

{$R *.dfm}

procedure TFrmConsulta_Fechamento_Caixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Fechamento_Caixa.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Consulta_Fechamento_Caixa;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Fechamento_Caixa.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Fechamento_Caixa:= TFrmRel_Consulta_Fechamento_Caixa.create(self);
  FrmRel_Consulta_Fechamento_Caixa.Release;
  FrmRel_Consulta_Fechamento_Caixa:= Nil;
  {Application.CreateForm(TFrmEscolha_Impressao, FrmEscolha_Impressao);
  FrmEscolha_Impressao.Show;
  ativo:= true;}
end;

procedure TFrmConsulta_Fechamento_Caixa.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_caixa.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
  EdtCodigo_Usuario.SetFocus;
end;

procedure TFrmConsulta_Fechamento_Caixa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Fechamento_Caixa.EdtCodigo_UsuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Usuario, FrmChama_Usuario);
      FrmChama_Usuario.ShowModal;
      FrmChama_Usuario.Free;
    end;
end;

procedure TFrmConsulta_Fechamento_Caixa.EdtCodigo_UsuarioKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Fechamento_Caixa.EdtUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Consulta_Acerto_Caixa;
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Fechamento_Caixa.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Fechamento_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Fechamento_Caixa.Free;
  FrmConsulta_Fechamento_Caixa:= NIl;
end;

procedure TFrmConsulta_Fechamento_Caixa.FormCreate(Sender: TObject);
begin
  qryconsulta_caixa.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtCodigo_Usuario.Clear;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Fechamento_Caixa.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Fechamento_Caixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
