unit UConsulta_Acerto_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UCadastro_Cliente, Mask, UUtilitarios;

type
  TFrmConsulta_Acerto_Caixa = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtDescricao: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_caixa: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    EdtCodigo: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    qryconsulta_caixaData_Abertura: TDateTimeField;
    qryconsulta_caixaData_Fechamento: TDateTimeField;
    qryconsulta_caixaCodigo_Caixa: TIntegerField;
    qryconsulta_caixaCodigo_Usuario: TIntegerField;
    qryconsulta_caixaEntrada: TFloatField;
    qryconsulta_caixaSaida: TFloatField;
    qryconsulta_caixaSaldo: TFloatField;
    qryconsulta_caixaAcerto: TFloatField;
    qryconsulta_caixaFechamento: TFloatField;
    qryconsulta_caixaNome: TStringField;
    qryconsulta_caixaCaixa: TStringField;
    qryconsulta_caixaValor_Abertura: TFloatField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure MEdtData_FinalExit(Sender: TObject);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Acerto_Caixa: TFrmConsulta_Acerto_Caixa;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Usuario, UChama_Caixa, URel_Consulta_Acerto_Caixa;

{$R *.dfm}

procedure TFrmConsulta_Acerto_Caixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Acerto_Caixa.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Consulta_Acerto_Caixa;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Acerto_Caixa.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Acerto_Caixa:= TFrmRel_Consulta_Acerto_Caixa.create(self);
  FrmRel_Consulta_Acerto_Caixa.Release;
  FrmRel_Consulta_Acerto_Caixa:= Nil;
end;

procedure TFrmConsulta_Acerto_Caixa.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_caixa.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
  EdtCodigo.SetFocus;
end;

procedure TFrmConsulta_Acerto_Caixa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Acerto_Caixa.EdtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      if (RGConsulta_Por.ItemIndex = 0) or (RGConsulta_Por.ItemIndex = 1) then
      begin
        Application.CreateForm(TFrmChama_Usuario, FrmChama_Usuario);
        FrmChama_Usuario.ShowModal;
        FrmChama_Usuario.Free;
      end
      else
      begin
        Application.CreateForm(TFrmChama_Caixa, FrmChama_Caixa);
        FrmChama_Caixa.ShowModal;
        FrmChama_Caixa.Free;
      end;
    end;
end;

procedure TFrmConsulta_Acerto_Caixa.EdtCodigoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Acerto_Caixa.EdtDescricaoKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmConsulta_Acerto_Caixa.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Acerto_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Acerto_Caixa.Free;
  FrmConsulta_Acerto_Caixa:= NIl;
end;

procedure TFrmConsulta_Acerto_Caixa.FormCreate(Sender: TObject);
begin
  qryconsulta_caixa.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtCodigo.Clear;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Acerto_Caixa.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Acerto_Caixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Acerto_Caixa.MEdtData_FinalExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Final);
end;

procedure TFrmConsulta_Acerto_Caixa.MEdtData_InicialExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Inicial);
end;

end.
