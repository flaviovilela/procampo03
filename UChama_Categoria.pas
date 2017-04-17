unit UChama_Categoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Categoria = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychamaCodigo: TIntegerField;
    qrychamaDescricao: TStringField;
    qrychamaData_Cadastro: TDateTimeField;
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
  FrmChama_Categoria: TFrmChama_Categoria;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Categoria, UCadastro_Lote, UConfiguracao_Sistema;

{$R *.dfm}

procedure TFrmChama_Categoria.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Categoria.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Categoria <> NIl) and (FrmCadastro_Categoria.ativo = true) then
  begin
    FrmCadastro_Categoria.EdtCodigo.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Categoria.EdtDescricao.Text:= qrychamaDescricao.AsString;
    FrmCadastro_Categoria.MEdtData_Cadastro.Text:= qrychamaData_Cadastro.AsString;

    FrmChama_Categoria.Close;

    FrmCadastro_Categoria.BBtnSalvar.Enabled:= true;
    FrmCadastro_Categoria.BBtnExcluir.Enabled:= true;
    FrmCadastro_Categoria.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Categoria.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Categoria);
    FrmCadastro_Categoria.achei:= true;
  end
  else if (FrmCadastro_Lote <> nil) and (FrmCadastro_Lote.ativo) then
  begin
    FrmCadastro_Lote.EdtCodigo_Categoria.Text:= qrychamaCodigo.AsString;
    FrmCadastro_Lote.EdtCategoria.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 1) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Categoria1.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCategoria1.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 2) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Categoria2.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCategoria2.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 3) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Categoria3.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCategoria3.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 4) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Categoria4.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCategoria4.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 5) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Categoria5.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCategoria5.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 6) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Categoria6.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCategoria6.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end


  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 7) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Cat_Ini_Lactante.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCat_Ini_Lactante.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 8) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Cat_Ini_Em_Crescimento.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCat_Ini_Em_Crescimento.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 9) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Cat_Ini_Novilha.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCat_Ini_Novilha.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 10) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Cat_Ini_Matriz.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCat_Ini_Matriz.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end


  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 11) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Animais_Lactantes.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtAnimais_Lactantes.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end


  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 12) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Novilha_Apta.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtNovilha_Apta.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 13) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Novilha_Apta_Atrasada.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtNovilha_Apta_Atrasada.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 14) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Novilha_Vazia.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtNovilha_Vazia.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 15) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Novilha_Vazia_Atrasada.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtNovilha_Vazia_Atrasada.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 16) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Novilha_Coberta.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtNovilha_Coberta.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 17) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Novilha_Gestante.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtNovilha_Gestante.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end



  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 18) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Matriz_Seca_Vazia.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtMatriz_Seca_Vazia.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 19) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Matriz_Seca_Vazia_Atrasada.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtMatriz_Seca_Vazia_Atrasada.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 20) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Matriz_Seca_Coberta.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtMatriz_Seca_Coberta.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 21) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Matriz_Seca_Gestante.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtMatriz_Seca_Gestante.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 22) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Matriz_Seca_Descarte.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtMatriz_Seca_Descarte.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end



  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 23) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Matriz_Lactacao_Vazia_Normal.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtMatriz_Lactacao_Vazia_Normal.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 24) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Matriz_Lactacao_Vazia_Atrasada.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtMatriz_Lactacao_Vazia_Atrasada.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 25) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Matriz_Lactacao_Coberta.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtMatriz_Lactacao_Coberta.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 26) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Matriz_Lactacao_Gestante.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtMatriz_Lactacao_Gestante.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end


  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 27) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Categoria1_Macho.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCategoria1_Macho.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 28) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Categoria2_Macho.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCategoria2_Macho.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 29) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Categoria3_Macho.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCategoria3_Macho.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 30) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Categoria4_Macho.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCategoria4_Macho.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 31) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Categoria5_Macho.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCategoria5_Macho.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 32) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Categoria6_Macho.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCategoria6_Macho.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 33) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Categoria7_Macho.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCategoria7_Macho.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end


  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 34) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Cat_Ini_Lactante_Macho.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCat_Ini_Lactante_Macho.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 35) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Cat_Ini_Em_Crescimento_Macho.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCat_Ini_Em_Crescimento_Macho.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 36) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Cat_Ini_Reprodutor.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCat_Ini_Reprodutor.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 37) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Cat_Ini_Rufiao.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCat_Ini_Rufiao.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 38) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Cat_Ini_Boi_Carreiro.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtCat_Ini_Boi_Carreiro.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end


  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 39) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Animais_Lactantes_Macho.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtAnimais_Lactantes_Macho.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 40) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Reprodutores.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtReprodutores.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 41) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Semen.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtSemen.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 42) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Rufioes.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtRufioes.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end
  else if (FrmConfiguracao_Sistema <> nil) and (FrmConfiguracao_Sistema.ativo) and (FrmConfiguracao_Sistema.con = 43) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Boi_Carreiro.Text:= qrychamaCodigo.AsString;
    FrmConfiguracao_Sistema.EdtBoi_Carreiro.Text:= qrychamaDescricao.AsString;
    FrmChama_Categoria.Close;
  end;

end;

procedure TFrmChama_Categoria.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Categoria.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Categoria.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Categoria;
end;

procedure TFrmChama_Categoria.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Categoria.Release;
end;

procedure TFrmChama_Categoria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Categoria.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Open;
end;

end.
