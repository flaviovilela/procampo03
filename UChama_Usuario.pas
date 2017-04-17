unit UChama_Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Usuario = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    LblMarca: TLabel;
    qrychama_usuario: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_usuarioCodigo: TIntegerField;
    qrychama_usuarioNome: TStringField;
    qrychama_usuarioLogin: TStringField;
    qrychama_usuarioSenha: TStringField;
    qrychama_usuarioData_Cadastro: TDateTimeField;
    qrychama_usuarioCodigo_Perfil: TIntegerField;
    qrychama_usuarioPerfil: TStringField;
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
  FrmChama_Usuario: TFrmChama_Usuario;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Usuario, UConsulta_Historico_Log;

{$R *.dfm}

procedure TFrmChama_Usuario.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Usuario.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Usuario <> NIl) and (FrmCadastro_Usuario.ativo = true) then
  begin
    FrmCadastro_Usuario.EdtCodigo.Text:= qrychama_UsuarioCodigo.AsString;
    FrmCadastro_Usuario.EdtNome.Text:= qrychama_UsuarioNome.AsString;
    FrmCadastro_Usuario.EdtLogin.Text:= qrychama_usuarioLogin.AsString;
    FrmCadastro_Usuario.EdtSenha.Text:= qrychama_usuarioSenha.AsString;
    FrmCadastro_Usuario.EdtCodigo_Perfil.Text:= qrychama_usuarioCodigo_Perfil.AsString;
    FrmCadastro_Usuario.EdtPerfil.Text:= qrychama_usuarioPerfil.AsString;
    FrmCadastro_Usuario.MEdtData_Cadastro.Text:= qrychama_UsuarioData_Cadastro.AsString;
    FrmChama_Usuario.Close;

    FrmCadastro_Usuario.BBtnSalvar.Enabled:= true;
    FrmCadastro_Usuario.BBtnExcluir.Enabled:= true;
    FrmCadastro_Usuario.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Usuario.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Usuario);
    FrmCadastro_Usuario.achei:= true;
  end
  else if (FrmConsulta_Historico_Log <> NIl) and (FrmConsulta_Historico_Log.ativo = true) then
  begin
    FrmConsulta_Historico_Log.EdtCodigo_Usuario.Text:= qrychama_UsuarioCodigo.AsString;
    FrmConsulta_Historico_Log.EdtUsuario.Text:= qrychama_UsuarioNome.AsString;
    FrmChama_Usuario.Close;
  end
end;

procedure TFrmChama_Usuario.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Usuario.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Usuario.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Usuario;
end;

procedure TFrmChama_Usuario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Usuario.Release;
end;

procedure TFrmChama_Usuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Usuario.FormShow(Sender: TObject);
begin
  qrychama_usuario.Close;
  qrychama_usuario.Open;
end;

end.
