unit UChama_Lote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Lote = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaCodigo_Propriedade: TIntegerField;
    qrychamaDescricao: TStringField;
    qrychamaQuantidade: TIntegerField;
    qrychamaSexo: TStringField;
    qrychamaCodigo_Categoria: TIntegerField;
    qrychamaData_Cadastro: TDateTimeField;
    qrychamaObservacao: TStringField;
    qrychamaCategoria: TStringField;
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
    procedure Atualiza_Dados;
  public
    { Public declarations }
  end;

var
  FrmChama_Lote: TFrmChama_Lote;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Lote, UCadastro_Animal, UConfiguracao_Sistema, Secamento,
  UParto, UDesmama;

{$R *.dfm}

procedure TFrmChama_Lote.Atualiza_Dados;
begin
  with qrychama, sql do
  begin
    close;
    clear;
    add('select CL.*, CC.Descricao as Categoria from Cadastro_Lote CL');
    add('left join Cadastro_Categoria CC on (CL.Codigo_Categoria = CC.Codigo)');
    add('where CL.Codigo_Propriedade = :Propriedade order by CL.Descricao');
    Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
    open;
  end;
end;

procedure TFrmChama_Lote.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Lote.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Lote <> NIl) and (FrmCadastro_Lote.ativo = true) then
  begin
    FrmCadastro_Lote.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Lote.EdtDescricao.Text:= qrychamaDescricao.AsString;
    FrmCadastro_Lote.EdtQuantidade.Text:= qrychamaQuantidade.AsString;
    FrmCadastro_Lote.CMBResultado.Text:= qrychamaSexo.AsString;
    FrmCadastro_Lote.EdtCodigo_Categoria.Text:= qrychamaCodigo_Categoria.AsString;
    FrmCadastro_Lote.EdtCategoria.Text:= qrychamaCategoria.AsString;
    FrmCadastro_Lote.MMOObservacoes.Text:= qrychamaObservacao.AsString;
    FrmCadastro_Lote.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;

    FrmChama_Lote.Close;

    FrmCadastro_Lote.BBtnSalvar.Enabled:= true;
    FrmCadastro_Lote.BBtnExcluir.Enabled:= true;
    FrmCadastro_Lote.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Lote.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Lote);
    FrmCadastro_Lote.achei:= true;
  end
  else if (FrmCadastro_Animal <> nil) and (FrmCadastro_Animal.ativo) then
  begin
    FrmCadastro_Animal.EdtCodigo_Lote.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Animal.EdtLote.Text:= qrychamaDescricao.AsString;
    FrmChama_Lote.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.lot = 1) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Lote1.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtLote1.Text:= qrychamaDescricao.AsString;
    FrmChama_Lote.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.lot = 2) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Lote2.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtLote2.Text:= qrychamaDescricao.AsString;
    FrmChama_Lote.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.lot = 3) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Lote3.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtLote3.Text:= qrychamaDescricao.AsString;
    FrmChama_Lote.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.lot = 4) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Lote4.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtLote4.Text:= qrychamaDescricao.AsString;
    FrmChama_Lote.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.lot = 5) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Lote5.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtLote5.Text:= qrychamaDescricao.AsString;
    FrmChama_Lote.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.lot = 6) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Lote6.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtLote6.Text:= qrychamaDescricao.AsString;
    FrmChama_Lote.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.lot = 7) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Lote7.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtLote7.Text:= qrychamaDescricao.AsString;
    FrmChama_Lote.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.lot = 8) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Lote8.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtLote8.Text:= qrychamaDescricao.AsString;
    FrmChama_Lote.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.lot = 9) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Lote9.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtLote9.Text:= qrychamaDescricao.AsString;
    FrmChama_Lote.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.lot = 10) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Lote10.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtLote10.Text:= qrychamaDescricao.AsString;
    FrmChama_Lote.Close;
  end
  else if (FrmSecamento <> nil) and (FrmSecamento.ativo) then
  begin
    FrmSecamento.EdtCodigo_Lote.Text:= qrychamaCodigo.AsString;
    FrmSecamento.EdtLote.Text:= qrychamaDescricao.AsString;
    FrmChama_Lote.Close;
  end
  else if (FrmParto <> nil) and (FrmParto.ativo) then
  begin
    FrmParto.EdtCodigo_Lote.Text:= qrychamaCodigo.AsString;
    FrmParto.EdtLote.Text:= qrychamaDescricao.AsString;
    FrmChama_Lote.Close;
  end
  else if (FrmDesmama <> nil) and (FrmDesmama.ativo) then
  begin
    FrmDesmama.EdtCodigo_Lote.Text:= qrychamaCodigo.AsString;
    FrmDesmama.EdtLote.Text:= qrychamaDescricao.AsString;
    FrmChama_Lote.Close;
  end;
end;

procedure TFrmChama_Lote.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Lote.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Lote.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Lote;
end;

procedure TFrmChama_Lote.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Lote.Release;
end;

procedure TFrmChama_Lote.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Lote.FormShow(Sender: TObject);
begin
  Atualiza_Dados;
end;

end.
