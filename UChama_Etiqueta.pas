unit UChama_Etiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Etiqueta = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_etiqueta: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_etiquetaCodigo: TIntegerField;
    qrychama_etiquetaDescricao: TStringField;
    qrychama_etiquetaMargem_Superior: TFloatField;
    qrychama_etiquetaMargem_Inferior: TFloatField;
    qrychama_etiquetaMargem_Esquerda: TFloatField;
    qrychama_etiquetaMargem_Direita: TFloatField;
    qrychama_etiquetaDistancia_Vertical: TFloatField;
    qrychama_etiquetaDistancia_Horizontal: TFloatField;
    qrychama_etiquetaAltura_Etiqueta: TFloatField;
    qrychama_etiquetaLargura_Etiqueta: TFloatField;
    qrychama_etiquetaTamanho_Fonte: TFloatField;
    qrychama_etiquetaLargura_Pagina: TFloatField;
    qrychama_etiquetaAltura_Pagina: TFloatField;
    qrychama_etiquetaEtiqueta_Linha: TFloatField;
    qrychama_etiquetaLinha_Pagina: TFloatField;
    qrychama_etiquetaData_Cadastro: TDateTimeField;
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
  FrmChama_Etiqueta: TFrmChama_Etiqueta;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Etiqueta;

{$R *.dfm}

procedure TFrmChama_Etiqueta.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Etiqueta.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Etiqueta <> NIl) and (FrmCadastro_Etiqueta.ativo = true) then
  begin
    FrmCadastro_Etiqueta.EdtCodigo.Text:= qrychama_etiquetaCodigo.AsString;
    FrmCadastro_Etiqueta.EdtDescricao.Text:= qrychama_etiquetaDescricao.AsString;
    FrmCadastro_Etiqueta.MEdtData_Cadastro.Text:= qrychama_etiquetaData_Cadastro.AsString;

    FrmCadastro_Etiqueta.EdtMargem_Superior.Text:= FormatFloat('#0.0,0', qrychama_etiquetaMargem_Superior.AsFloat);
    FrmCadastro_Etiqueta.EdtMargem_Superior.Text:= StringReplace(FrmCadastro_Etiqueta.EdtMargem_Superior.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtMargem_Inferior.Text:= FormatFloat('#0.0,0', qrychama_etiquetaMargem_Inferior.AsFloat);
    FrmCadastro_Etiqueta.EdtMargem_Inferior.Text:= StringReplace(FrmCadastro_Etiqueta.EdtMargem_Inferior.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtMargem_Esquerda.Text:= FormatFloat('#0.0,0', qrychama_etiquetaMargem_Esquerda.AsFloat);
    FrmCadastro_Etiqueta.EdtMargem_Esquerda.Text:= StringReplace(FrmCadastro_Etiqueta.EdtMargem_Esquerda.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtMargem_Direita.Text:= FormatFloat('#0.0,0', qrychama_etiquetaMargem_Direita.AsFloat);
    FrmCadastro_Etiqueta.EdtMargem_Direita.Text:= StringReplace(FrmCadastro_Etiqueta.EdtMargem_Direita.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtDistancia_Vertical.Text:= FormatFloat('#0.0,0', qrychama_etiquetaDistancia_Vertical.AsFloat);
    FrmCadastro_Etiqueta.EdtDistancia_Vertical.Text:= StringReplace(FrmCadastro_Etiqueta.EdtDistancia_Vertical.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtDistancia_Horizontal.Text:= FormatFloat('#0.0,0', qrychama_etiquetaDistancia_Horizontal.AsFloat);
    FrmCadastro_Etiqueta.EdtDistancia_Horizontal.Text:= StringReplace(FrmCadastro_Etiqueta.EdtDistancia_Horizontal.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtAltura_Etiqueta.Text:= FormatFloat('#0.0,0', qrychama_etiquetaAltura_Etiqueta.AsFloat);
    FrmCadastro_Etiqueta.EdtAltura_Etiqueta.Text:= StringReplace(FrmCadastro_Etiqueta.EdtAltura_Etiqueta.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtLargura_Etiqueta.Text:= FormatFloat('#0.0,0', qrychama_etiquetaLargura_Etiqueta.AsFloat);
    FrmCadastro_Etiqueta.EdtLargura_Etiqueta.Text:= StringReplace(FrmCadastro_Etiqueta.EdtLargura_Etiqueta.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtTamanho_Fonte.Text:= FormatFloat('#0.0,0', qrychama_etiquetaTamanho_Fonte.AsFloat);
    FrmCadastro_Etiqueta.EdtTamanho_Fonte.Text:= StringReplace(FrmCadastro_Etiqueta.EdtTamanho_Fonte.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtLargura_Pagina.Text:= FormatFloat('#0.0,0', qrychama_etiquetaLargura_Pagina.AsFloat);
    FrmCadastro_Etiqueta.EdtLargura_Pagina.Text:= StringReplace(FrmCadastro_Etiqueta.EdtLargura_Pagina.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtAltura_Pagina.Text:= FormatFloat('#0.0,0', qrychama_etiquetaAltura_Pagina.AsFloat);
    FrmCadastro_Etiqueta.EdtAltura_Pagina.Text:= StringReplace(FrmCadastro_Etiqueta.EdtAltura_Pagina.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtEtiqueta_Linha.Text:= FormatFloat('#0.0,0', qrychama_etiquetaEtiqueta_Linha.AsFloat);
    FrmCadastro_Etiqueta.EdtEtiqueta_Linha.Text:= StringReplace(FrmCadastro_Etiqueta.EdtEtiqueta_Linha.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Etiqueta.EdtLinha_Pagina.Text:= FormatFloat('#0.0,0', qrychama_etiquetaLinha_Pagina.AsFloat);
    FrmCadastro_Etiqueta.EdtLinha_Pagina.Text:= StringReplace(FrmCadastro_Etiqueta.EdtLinha_Pagina.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmChama_Etiqueta.Close;

    FrmCadastro_Etiqueta.BBtnSalvar.Enabled:= true;
    FrmCadastro_Etiqueta.BBtnExcluir.Enabled:= true;
    FrmCadastro_Etiqueta.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Etiqueta.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Etiqueta);
    FrmCadastro_Etiqueta.achei:= true;
  end
  else if (FrmGera_Etiqueta <> NIl) and (FrmGera_Etiqueta.ativo = true) then
  begin
    FrmGera_Etiqueta.EdtCodigo_Etiqueta.Text:= qrychama_etiquetaCodigo.AsString;
    FrmGera_Etiqueta.EdtEtiqueta.Text:= qrychama_etiquetaDescricao.AsString;
    FrmGera_Etiqueta.linha_pagina:= qrychama_etiquetaLinha_Pagina.AsInteger;
    FrmGera_Etiqueta.etiqueta_linha:= qrychama_etiquetaEtiqueta_Linha.AsInteger;
    FrmGera_Etiqueta.margem_superior:= qrychama_etiquetaMargem_Superior.AsFloat;
    FrmGera_Etiqueta.margem_inferior:= qrychama_etiquetaMargem_Inferior.AsFloat;
    FrmGera_Etiqueta.margem_esquerda:= qrychama_etiquetaMargem_Esquerda.AsFloat;
    FrmGera_Etiqueta.margem_direita:= qrychama_etiquetaMargem_Direita.AsFloat;

    FrmGera_Etiqueta.distancia_horizontal:= qrychama_etiquetaDistancia_Horizontal.AsFloat;
    FrmGera_Etiqueta.distancia_vertical:= qrychama_etiquetaDistancia_Vertical.AsFloat;
    FrmGera_Etiqueta.altura_etiqueta:= qrychama_etiquetaAltura_Etiqueta.AsFloat;
    FrmGera_Etiqueta.largura_etiqueta:= qrychama_etiquetaLargura_Etiqueta.AsFloat;
    FrmGera_Etiqueta.altura_pagina:= qrychama_etiquetaAltura_Pagina.AsFloat;
    FrmGera_Etiqueta.largura_pagina:= qrychama_etiquetaLargura_Pagina.AsFloat;
    FrmGera_Etiqueta.tamanho_fonte:= qrychama_etiquetaTamanho_Fonte.AsInteger;
    FrmChama_Etiqueta.Close;
  end
  else if (FrmGera_Etiqueta_Produto <> NIl) and (FrmGera_Etiqueta_Produto.ativo = true) then
  begin
    FrmGera_Etiqueta_Produto.EdtCodigo_Etiqueta.Text:= qrychama_etiquetaCodigo.AsString;
    FrmGera_Etiqueta_Produto.EdtEtiqueta.Text:= qrychama_etiquetaDescricao.AsString;
    FrmGera_Etiqueta_Produto.linha_pagina:= qrychama_etiquetaLinha_Pagina.AsInteger;
    FrmGera_Etiqueta_Produto.etiqueta_linha:= qrychama_etiquetaEtiqueta_Linha.AsInteger;
    FrmGera_Etiqueta_Produto.margem_superior:= qrychama_etiquetaMargem_Superior.AsFloat;
    FrmGera_Etiqueta_Produto.margem_inferior:= qrychama_etiquetaMargem_Inferior.AsFloat;
    FrmGera_Etiqueta_Produto.margem_esquerda:= qrychama_etiquetaMargem_Esquerda.AsFloat;
    FrmGera_Etiqueta_Produto.margem_direita:= qrychama_etiquetaMargem_Direita.AsFloat;

    FrmGera_Etiqueta_Produto.distancia_horizontal:= qrychama_etiquetaDistancia_Horizontal.AsFloat;
    FrmGera_Etiqueta_Produto.distancia_vertical:= qrychama_etiquetaDistancia_Vertical.AsFloat;
    FrmGera_Etiqueta_Produto.altura_etiqueta:= qrychama_etiquetaAltura_Etiqueta.AsFloat;
    FrmGera_Etiqueta_Produto.largura_etiqueta:= qrychama_etiquetaLargura_Etiqueta.AsFloat;
    FrmGera_Etiqueta_Produto.altura_pagina:= qrychama_etiquetaAltura_Pagina.AsFloat;
    FrmGera_Etiqueta_Produto.largura_pagina:= qrychama_etiquetaLargura_Pagina.AsFloat;
    FrmGera_Etiqueta_Produto.tamanho_fonte:= qrychama_etiquetaTamanho_Fonte.AsInteger;
    FrmChama_Etiqueta.Close;
  end
end;

procedure TFrmChama_Etiqueta.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Etiqueta.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Etiqueta.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Etiqueta;
end;

procedure TFrmChama_Etiqueta.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Etiqueta.Release;
end;

procedure TFrmChama_Etiqueta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Etiqueta.FormShow(Sender: TObject);
begin
  qrychama_etiqueta.Close;
  qrychama_etiqueta.Open;
end;

end.
