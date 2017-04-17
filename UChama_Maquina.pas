unit UChama_Maquina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Maquina = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_maquina: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_maquinaCodigo: TIntegerField;
    qrychama_maquinaCodigo_Propriedade: TIntegerField;
    qrychama_maquinaStatus: TStringField;
    qrychama_maquinaDescricao: TStringField;
    qrychama_maquinaCodigo_Marca: TIntegerField;
    qrychama_maquinaCodigo_Grupo: TIntegerField;
    qrychama_maquinaPlaca: TStringField;
    qrychama_maquinaNumero_Chassi: TStringField;
    qrychama_maquinaNumero_Motor: TStringField;
    qrychama_maquinaData_Entrada: TDateTimeField;
    qrychama_maquinaData_Saida: TDateTimeField;
    qrychama_maquinaValor: TFloatField;
    qrychama_maquinaData_Cadastro: TDateTimeField;
    qrychama_maquinaObservacoes: TStringField;
    qrychama_maquinaMarca: TStringField;
    qrychama_maquinaGrupo: TStringField;
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
  FrmChama_Maquina: TFrmChama_Maquina;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Maquina;

{$R *.dfm}

procedure TFrmChama_Maquina.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Maquina.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Maquina <> NIl) and (FrmCadastro_Maquina.ativo = true) then
  begin
    FrmCadastro_Maquina.EdtCodigo.Text:= qrychama_maquinaCodigo.AsString;

    if (qrychama_maquinaStatus.AsString = 'ATIVO') then
      FrmCadastro_Maquina.CBStatus.Checked:= TRUE
    else
      FrmCadastro_Maquina.CBStatus.Checked:= false;

    FrmCadastro_Maquina.EdtDescricao.Text:= qrychama_maquinaDescricao.AsString;
    FrmCadastro_Maquina.EdtCodigo_Marca.Text:= qrychama_maquinaCodigo_Marca.AsString;
    FrmCadastro_Maquina.EdtMarca.Text:= qrychama_maquinaMarca.AsString;
    FrmCadastro_Maquina.EdtCodigo_Grupo_Maquina.Text:= qrychama_maquinaCodigo_Grupo.AsString;
    FrmCadastro_Maquina.EdtGrupo_Maquina.Text:= qrychama_maquinaGrupo.AsString;
    FrmCadastro_Maquina.EdtPlaca.Text:= qrychama_maquinaPlaca.AsString;
    FrmCadastro_Maquina.EdtN_Chassi.Text:= qrychama_maquinaNumero_Chassi.AsString;
    FrmCadastro_Maquina.EdtN_Motor.Text:= qrychama_maquinaNumero_Motor.AsString;
    FrmCadastro_Maquina.MEdtData_Entrada.Text:= qrychama_maquinaData_Entrada.AsString;
    FrmCadastro_Maquina.MEdtData_Saida.Text:= qrychama_maquinaData_Saida.AsString;

    FrmCadastro_Maquina.EdtValor.Text:= FormatFloat('#0.0,0', qrychama_maquinaValor.AsFloat);
    FrmCadastro_Maquina.EdtValor.Text:= StringReplace(FrmCadastro_Maquina.EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Maquina.MEdtData_Cadastro.Text:= qrychama_maquinaData_Cadastro.AsString;
    FrmCadastro_Maquina.MMObservacoes.Text:= qrychama_maquinaObservacoes.AsString;
    FrmChama_Maquina.Close;

    FrmCadastro_Maquina.BBtnSalvar.Enabled:= true;
    FrmCadastro_Maquina.BBtnExcluir.Enabled:= true;
    FrmCadastro_Maquina.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Maquina.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Maquina);
    FrmCadastro_Maquina.achei:= true;
  end
end;

procedure TFrmChama_Maquina.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Maquina.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Maquina.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Maquina;
end;

procedure TFrmChama_Maquina.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Maquina.Release;
end;

procedure TFrmChama_Maquina.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Maquina.FormShow(Sender: TObject);
begin
  qrychama_maquina.Close;
  qrychama_maquina.Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
  qrychama_maquina.Open;
end;

end.
