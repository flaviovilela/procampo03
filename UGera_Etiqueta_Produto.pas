unit UGera_Etiqueta_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, ComCtrls,
  ImgList, ToolWin, DB, DBClient, UUtilitarios;

type
  TFrmGera_Etiqueta_Produto = class(TForm)
    StbStatus: TStatusBar;
    Timer1: TTimer;
    ImgImagens_Cadastros: TImageList;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnImprimir: TToolButton;
    BBtnFechar: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    LblSetor: TLabel;
    EdtCodigo_Produto: TEdit;
    EdtDescricao: TEdit;
    EdtQuantidade: TEdit;
    BBtnLimpar: TToolButton;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    PanelEtiquetas: TPanel;
    Label2: TLabel;
    EdtEtiqueta: TEdit;
    EdtCodigo_Etiqueta: TEdit;
    BBtnGera_Etiqueta: TToolButton;
    Label1: TLabel;
    Label3: TLabel;
    EdtCodigo_Ficticio: TEdit;
    Label4: TLabel;
    EdtValor_Venda: TEdit;
    Label5: TLabel;
    ClientDataSet1Codigo_Produto: TStringField;
    ClientDataSet1Descricao: TStringField;
    ClientDataSet1Codigo_Ficticio: TStringField;
    ClientDataSet1Quantidade: TStringField;
    ClientDataSet1Valor: TStringField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnFecharClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_EtiquetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnGera_EtiquetaClick(Sender: TObject);
    procedure EdtValor_VendaExit(Sender: TObject);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_VendaKeyPress(Sender: TObject; var Key: Char);
  private
    achou: boolean;
    Mensagem: UUtilitarios.TMensagem;

    procedure Limpa_Menor;
    procedure Limpa_Cliente;
    procedure Verifica_Etiqueta;
    procedure Verifica_Etiqueta_Menor;
    procedure CriaEtiqueta(NColuna, NLinha: integer);
    procedure ClickEtiqueta(Sender: TObject);
    procedure DesmarcarEtiquetas(EtiquetaInicial: integer);
    { Private declarations }
  public
    ativo: boolean;
    etiqueta_linha, linha_pagina, EtiquetaSelecionada, tamanho_fonte: integer;

    margem_esquerda, margem_direita, margem_superior, margem_inferior, distancia_horizontal, distancia_vertical,
    altura_etiqueta, largura_etiqueta, altura_pagina, largura_pagina: double;
    { Public declarations }
  end;

var
  FrmGera_Etiqueta_Produto: TFrmGera_Etiqueta_Produto;
  codigo: integer;
implementation

uses UDM, UPrincipal, UChama_Etiqueta, URel_Etiqueta_Produto;

{$R *.dfm}

procedure TFrmGera_Etiqueta_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmGera_Etiqueta_Produto.BBtnGera_EtiquetaClick(Sender: TObject);
begin
  Verifica_Etiqueta;
  CriaEtiqueta(etiqueta_linha, linha_pagina);
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmGera_Etiqueta_Produto.CriaEtiqueta(NColuna, NLinha: integer);
var
  x, y: integer;
  LarguraColunas, AlturaColunas: double;
  Etiqueta: TLabel;
  Tag: integer;
  Esquerda, Topo: integer;
begin
  for x := PanelEtiquetas.ComponentCount - 1 downto 0 do
    begin
      Etiqueta:= TLabel(PanelEtiquetas.Components[x]);
      PanelEtiquetas.RemoveControl(Etiqueta);
      Etiqueta.Parent:= nil;
      Etiqueta.Free;
      Etiqueta:= nil;
    end;
    PanelEtiquetas.Refresh;

    LarguraColunas:= PanelEtiquetas.Width/NColuna;
    AlturaColunas:= PanelEtiquetas.Height/NLinha;
    Tag:= 0;
    Esquerda:= 0;
    Topo:= 0;

    for x := 1 to NColuna do
      begin
        for y := 1 to NLinha do
          begin
            inc(tag);
            Etiqueta:= TLabel.Create(PanelEtiquetas);
            Etiqueta.Alignment:= taCenter;
            Etiqueta.Parent:= PanelEtiquetas;
            Etiqueta.AutoSize:= false;
            Etiqueta.Height:= Trunc(AlturaColunas);
            Etiqueta.Width:= Trunc(LarguraColunas);
            Etiqueta.Caption:= InttoStr(Tag);
            Etiqueta.Tag:= Tag;
            Etiqueta.Left:= Esquerda;
            Etiqueta.Top:= topo;
            Etiqueta.Color:= clSilver;
            Etiqueta.Visible:= true;
            Etiqueta.OnClick:= ClickEtiqueta;

            topo:= topo + Etiqueta.Height;
          end;
            topo:= 0;
            Esquerda:= Esquerda + Etiqueta.Width;
      end;

end;

procedure TFrmGera_Etiqueta_Produto.ClickEtiqueta(Sender: TObject);
begin
  DesmarcarEtiquetas(TLabel(Sender).Tag);
  EtiquetaSelecionada:= TLabel(Sender).Tag;
end;

procedure TFrmGera_Etiqueta_Produto.DesmarcarEtiquetas;
var
  x: integer;
begin
  with PanelEtiquetas do
    begin
      for x := 0 to ControlCount - 1 do
        if Controls[x] is TLabel then
          begin
            if TLabel(Controls[x]).Tag >= EtiquetaInicial then
               TLabel(Controls[x]).Transparent := true
            else
               TLabel(Controls[x]).Transparent := false;
          end;

    end;
end;

procedure TFrmGera_Etiqueta_Produto.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Etiqueta_Produto:= TFrmRel_Etiqueta_Produto.Create(self);
  FrmRel_Etiqueta_Produto.Release;
  FrmRel_Etiqueta_Produto:= Nil;
end;

procedure TFrmGera_Etiqueta_Produto.BBtnLimparClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmGera_Etiqueta_Produto);
  BBtnImprimir.Enabled:= false;
  Limpa_Cliente;
end;

procedure TFrmGera_Etiqueta_Produto.BBtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmGera_Etiqueta_Produto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_DELETE) then
  begin
    ClientDataSet1.Delete;
  end;
end;

procedure TFrmGera_Etiqueta_Produto.EdtCodigo_EtiquetaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Etiqueta, FrmChama_Etiqueta);
    FrmChama_Etiqueta.ShowModal;
    FrmChama_Etiqueta.Free;
  end;
end;

procedure TFrmGera_Etiqueta_Produto.EdtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmGera_Etiqueta_Produto.EdtValor_VendaExit(Sender: TObject);
begin
  Verifica_Etiqueta_Menor;

  if not ClientDataSet1.Active then
    ClientDataSet1.CreateDataSet;
  ClientDataSet1.Insert;
  ClientDataSet1Codigo_Produto.AsString:= EdtCodigo_Produto.Text;
  ClientDataSet1Descricao.AsString:= EdtDescricao.Text;
  ClientDataSet1Codigo_Ficticio.AsString:= EdtCodigo_Ficticio.Text;
  ClientDataSet1Quantidade.AsString:= EdtQuantidade.Text;
  ClientDataSet1Valor.AsString:= EdtValor_Venda.Text;

  ClientDataSet1.SaveToFile('C:\Produtos.xml', dfXMLUTF8);
  Limpa_Menor;
end;

procedure TFrmGera_Etiqueta_Produto.EdtValor_VendaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmGera_Etiqueta_Produto.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmGera_Etiqueta_Produto.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Limpa_Cliente;
  FrmGera_Etiqueta_Produto.Release;
end;

procedure TFrmGera_Etiqueta_Produto.FormCreate(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
  Util.Limpa_Campos(FrmGera_Etiqueta_Produto);
end;

procedure TFrmGera_Etiqueta_Produto.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmGera_Etiqueta_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmGera_Etiqueta_Produto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
    key:=#0; //anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmGera_Etiqueta_Produto.Limpa_Cliente;
begin
  ClientDataSet1.Close;
  DeleteFile('C:\Produtos.xml');
end;

procedure TFrmGera_Etiqueta_Produto.Limpa_Menor;
begin
  EdtCodigo_Produto.Clear;
  EdtDescricao.Clear;
  EdtCodigo_Ficticio.Clear;
  EdtQuantidade.Text:= '1';
  EdtValor_Venda.Text:= '';
  EdtCodigo_Produto.SetFocus;
end;

procedure TFrmGera_Etiqueta_Produto.Timer1Timer(Sender: TObject);
begin
  StbStatus.Panels[0].Text := TimeToStr (time);
  StbStatus.Panels[1].Text := DateToStr(date);
end;

procedure TFrmGera_Etiqueta_Produto.Verifica_Etiqueta;
begin
  if (EdtCodigo_Etiqueta.Text = '') then
  begin
    EdtCodigo_Etiqueta.SetFocus;
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;

  if (ClientDataSet1.IsEmpty) then
  begin
    EdtCodigo_Produto.SetFocus;
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;

end;

procedure TFrmGera_Etiqueta_Produto.Verifica_Etiqueta_Menor;
begin
  if (EdtCodigo_Produto.Text = '') then
  begin
    EdtCodigo_Produto.SetFocus;
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;

  if (EdtDescricao.Text = '') then
  begin
    EdtDescricao.SetFocus;
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;

  if (EdtQuantidade.Text = '') then
  begin
    EdtQuantidade.SetFocus;
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;

  if (EdtValor_Venda.Text = '') then
  begin
    EdtValor_Venda.SetFocus;
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;

end;

end.
