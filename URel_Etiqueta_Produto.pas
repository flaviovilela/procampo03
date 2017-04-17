unit URel_Etiqueta_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB;

type
  TFrmRel_Etiqueta_Produto = class(TForm)
    QuickRep1: TQuickRep;
    QrDados: TQRStringsBand;
    QRExpr1: TQRExpr;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    procedure Monta_Relatorio;
    { Private declarations }
  public
    { Public declarations }
    EtiquetaInicial: integer;
  end;

var
  FrmRel_Etiqueta_Produto: TFrmRel_Etiqueta_Produto;

implementation

uses UDM, UPrincipal, UUtilitarios, UGera_Etiqueta_Produto;

{$R *.dfm}

procedure TFrmRel_Etiqueta_Produto.FormCreate(Sender: TObject);
begin
  Monta_Relatorio;
end;

procedure TFrmRel_Etiqueta_Produto.Monta_Relatorio;
begin
  //qtde colunas
  QuickRep1.Page.Columns:= FrmGera_Etiqueta_Produto.etiqueta_linha;

  //Altura etiqueta
  QRExpr1.Size.Height := FrmGera_Etiqueta_Produto.altura_etiqueta * 10;

  //Largura etiqueta
  QRExpr1.Size.Width := FrmGera_Etiqueta_Produto.largura_etiqueta * 10;

  //Altura coluna
  QrDados.Size.Height:= FrmGera_Etiqueta_Produto.distancia_vertical * 10;

  //Largura coluna
  QrDados.Size.Width:= FrmGera_Etiqueta_Produto.distancia_horizontal * 10;

  //Tamanho Fonte
  QRExpr1.Font.Size:= FrmGera_Etiqueta_Produto.tamanho_fonte;

  //Altura Página
  QuickRep1.Page.Length:= FrmGera_Etiqueta_Produto.altura_pagina * 10;

  //Largura Página
  QuickRep1.Page.Width:= FrmGera_Etiqueta_Produto.largura_pagina * 10;

  //Margem Esquerda
  QuickRep1.Page.LeftMargin:= FrmGera_Etiqueta_Produto.margem_esquerda * 10;

  //Margem direita
  QuickRep1.Page.RightMargin:= FrmGera_Etiqueta_Produto.margem_direita * 10;

  //margem superior
  QuickRep1.Page.TopMargin:= FrmGera_Etiqueta_Produto.margem_superior * 10;

  //margem inferior
  QuickRep1.Page.BottomMargin:= FrmGera_Etiqueta_Produto.margem_inferior * 10;
  EtiquetaInicial:= FrmGera_Etiqueta_Produto.EtiquetaSelecionada;
  QuickRep1.Preview;
end;

procedure TFrmRel_Etiqueta_Produto.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
    x: integer;
    texto: string;
begin
  QrDados.Items.Clear;
  for x := 1 to EtiquetaInicial -1 do
    QrDados.Items.Add('');

  FrmGera_Etiqueta_Produto.ClientDataSet1.First;
  while not FrmGera_Etiqueta_Produto.ClientDataSet1.Eof do
    begin
      for x := 1 to FrmGera_Etiqueta_Produto.ClientDataSet1.FieldByName('Quantidade').AsInteger do
        begin
          Text:= '';
          texto:= 'Codigo Venda.....: ' + FrmGera_Etiqueta_Produto.ClientDataSet1.FieldByName('Codigo_Produto').AsString + #13;
          texto:= texto +
                  'Descrição........: ' + FrmGera_Etiqueta_Produto.ClientDataSet1.FieldByName('Descricao').AsString + #13;
          texto:= texto +
                  'Codigo Fictício..: ' + FrmGera_Etiqueta_Produto.ClientDataSet1.FieldByName('Codigo_Ficticio').AsString + #13;
          texto:= texto +
                  'Valor Venda......: ' + FrmGera_Etiqueta_Produto.ClientDataSet1.FieldByName('Valor').AsString;
          QrDados.Items.Add(Texto);
        end;
        FrmGera_Etiqueta_Produto.ClientDataSet1.Next;
    end;

end;

end.
