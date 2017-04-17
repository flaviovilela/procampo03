unit UConsulta_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Estoque = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    qryconsultaCodigo: TIntegerField;
    qryconsultaCodigo_Propriedade: TIntegerField;
    qryconsultaDescricao: TStringField;
    qryconsultaCodigo_Grupo: TIntegerField;
    qryconsultaPreco: TFloatField;
    qryconsultaQuantidade_Estoque: TFloatField;
    qryconsultaCodigo_Unidade: TIntegerField;
    qryconsultaCodigo_Unidade_Volume: TIntegerField;
    qryconsultaVolume: TFloatField;
    qryconsultaVolume_Total: TFloatField;
    qryconsultaData_Cadastro: TDateTimeField;
    qryconsultaData_Ultima_Compra: TDateTimeField;
    qryconsultaData_Validade: TDateTimeField;
    qryconsultaTipo_Produto: TStringField;
    qryconsultaCodigo_Animal_Reprodutor: TIntegerField;
    qryconsultaCarencia: TIntegerField;
    qryconsultaGrupo: TStringField;
    qryconsultaUnidade: TStringField;
    qryconsultaAnimal: TStringField;
    RGOrdena_Por: TRadioGroup;
    ADOQuery1: TADOQuery;
    qryconsultaQTde: TIntegerField;
    Label1: TLabel;
    EdtTotal: TEdit;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
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
  FrmConsulta_Estoque: TFrmConsulta_Estoque;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, URel_Consulta_Estoque;

{$R *.dfm}

procedure TFrmConsulta_Estoque.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Estoque.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Estoque;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Estoque.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Estoque:= TFrmRel_Consulta_Estoque.create(self);
  FrmRel_Consulta_Estoque.Release;
  FrmRel_Consulta_Estoque:= Nil;
end;

procedure TFrmConsulta_Estoque.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtTotal.Clear;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Estoque.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Estoque.EdtCodigo_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Estoque.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Estoque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Estoque.Free;
  FrmConsulta_Estoque:= nil;
end;

procedure TFrmConsulta_Estoque.FormCreate(Sender: TObject);
begin
  qryconsulta.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
end;

procedure TFrmConsulta_Estoque.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Estoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
