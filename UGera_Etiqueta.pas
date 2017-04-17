unit UGera_Etiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, ComCtrls,
  ImgList, ToolWin, DB, DBClient, UUtilitarios;

type
  TFrmGera_Etiqueta = class(TForm)
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
    EdtCliente: TEdit;
    EdtEndereco: TEdit;
    EdtNumero_Cliente: TEdit;
    BBtnLimpar: TToolButton;
    EdtSetor_Cliente: TEdit;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1Nome: TStringField;
    ClientDataSet1Endereco: TStringField;
    ClientDataSet1Numero: TStringField;
    ClientDataSet1Setor: TStringField;
    EdtCEP: TEdit;
    PanelEtiquetas: TPanel;
    Label2: TLabel;
    EdtEtiqueta: TEdit;
    EdtCodigo_Etiqueta: TEdit;
    BBtnGera_Etiqueta: TToolButton;
    ClientDataSet1CEP: TStringField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnFecharClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure EdtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCEPExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_EtiquetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnGera_EtiquetaClick(Sender: TObject);
  private
    achou: boolean;
    Mensagem: UUtilitarios.TMensagem;

    procedure Limpa_Cliente;
    procedure Verifica_Etiqueta;
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
  FrmGera_Etiqueta: TFrmGera_Etiqueta;
  codigo: integer;
implementation

uses UDM, UPrincipal, UChama_Etiqueta, URel_Etiqueta;

{$R *.dfm}

procedure TFrmGera_Etiqueta.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmGera_Etiqueta.BBtnGera_EtiquetaClick(Sender: TObject);
begin
  Verifica_Etiqueta;
  CriaEtiqueta(etiqueta_linha, linha_pagina);
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmGera_Etiqueta.CriaEtiqueta(NColuna, NLinha: integer);
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

procedure TFrmGera_Etiqueta.ClickEtiqueta(Sender: TObject);
begin
  DesmarcarEtiquetas(TLabel(Sender).Tag);
  EtiquetaSelecionada:= TLabel(Sender).Tag;
end;

procedure TFrmGera_Etiqueta.DesmarcarEtiquetas;
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

procedure TFrmGera_Etiqueta.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Etiqueta:= TFrmRel_Etiqueta.Create(self);
  FrmRel_Etiqueta.Release;
  FrmRel_Etiqueta:= Nil;
end;

procedure TFrmGera_Etiqueta.BBtnLimparClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmGera_Etiqueta);
  BBtnImprimir.Enabled:= false;
  Limpa_Cliente;
end;

procedure TFrmGera_Etiqueta.BBtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmGera_Etiqueta.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_DELETE) then
  begin
    ClientDataSet1.Delete;
  end;
end;

procedure TFrmGera_Etiqueta.EdtCEPExit(Sender: TObject);
begin
  if not ClientDataSet1.Active then
    ClientDataSet1.CreateDataSet;
  ClientDataSet1.Insert;
  ClientDataSet1Nome.AsString:= EdtCliente.Text;
  ClientDataSet1Endereco.AsString:= EdtEndereco.Text;
  ClientDataSet1Numero.AsString:= EdtNumero_Cliente.Text;
  ClientDataSet1Setor.AsString:= EdtSetor_Cliente.Text;
  ClientDataSet1CEP.AsString:= EdtCEP.Text;
  ClientDataSet1.SaveToFile('C:\Clientes.xml', dfXMLUTF8);
  EdtCliente.SetFocus;
end;

procedure TFrmGera_Etiqueta.EdtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmGera_Etiqueta.EdtCodigo_EtiquetaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Etiqueta, FrmChama_Etiqueta);
    FrmChama_Etiqueta.ShowModal;
    FrmChama_Etiqueta.Free;
  end;
end;

procedure TFrmGera_Etiqueta.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmGera_Etiqueta.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Limpa_Cliente;
  FrmGera_Etiqueta.Release;
end;

procedure TFrmGera_Etiqueta.FormCreate(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
  Util.Limpa_Campos(FrmGera_Etiqueta);
end;

procedure TFrmGera_Etiqueta.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmGera_Etiqueta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmGera_Etiqueta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
    key:=#0; //anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmGera_Etiqueta.Limpa_Cliente;
begin
  ClientDataSet1.Close;
  DeleteFile('C:\Clientes.xml');
end;

procedure TFrmGera_Etiqueta.Timer1Timer(Sender: TObject);
begin
  StbStatus.Panels[0].Text := TimeToStr (time);
  StbStatus.Panels[1].Text := DateToStr(date);
end;

procedure TFrmGera_Etiqueta.Verifica_Etiqueta;
begin
  if (EdtCodigo_Etiqueta.Text = '') then
  begin
    EdtCodigo_Etiqueta.SetFocus;
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;

  if (ClientDataSet1.IsEmpty) then
  begin
    EdtCliente.SetFocus;
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;
end;

end.
