unit URel_Etiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB;

type
  TFrmRel_Etiqueta = class(TForm)
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
  FrmRel_Etiqueta: TFrmRel_Etiqueta;

implementation

uses UDM, UPrincipal, UUtilitarios, UMala_Direta, UGera_Etiqueta;

{$R *.dfm}

procedure TFrmRel_Etiqueta.FormCreate(Sender: TObject);
begin
  Monta_Relatorio;
end;

procedure TFrmRel_Etiqueta.Monta_Relatorio;
begin
  //qtde colunas
  QuickRep1.Page.Columns:= FrmGera_Etiqueta.etiqueta_linha;

  //Altura etiqueta
  QRExpr1.Size.Height := FrmGera_Etiqueta.altura_etiqueta * 10;

  //Largura etiqueta
  QRExpr1.Size.Width := FrmGera_Etiqueta.largura_etiqueta * 10;

  //Altura coluna
  QrDados.Size.Height:= FrmGera_Etiqueta.distancia_vertical * 10;

  //Largura coluna
  QrDados.Size.Width:= FrmGera_Etiqueta.distancia_horizontal * 10;

  //Tamanho Fonte
  QRExpr1.Font.Size:= FrmGera_Etiqueta.tamanho_fonte;

  //Altura Página
  QuickRep1.Page.Length:= FrmGera_Etiqueta.altura_pagina * 10;

  //Largura Página
  QuickRep1.Page.Width:= FrmGera_Etiqueta.largura_pagina * 10;

  //Margem Esquerda
  QuickRep1.Page.LeftMargin:= FrmGera_Etiqueta.margem_esquerda * 10;

  //Margem direita
  QuickRep1.Page.RightMargin:= FrmGera_Etiqueta.margem_direita * 10;

  //margem superior
  QuickRep1.Page.TopMargin:= FrmGera_Etiqueta.margem_superior * 10;

  //margem inferior
  QuickRep1.Page.BottomMargin:= FrmGera_Etiqueta.margem_inferior * 10;
  EtiquetaInicial:= FrmGera_Etiqueta.EtiquetaSelecionada;
  QuickRep1.Preview;
end;

procedure TFrmRel_Etiqueta.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
    x: integer;
    texto: string;
begin
  QrDados.Items.Clear;
  for x := 1 to EtiquetaInicial -1 do
    QrDados.Items.Add('');

  FrmGera_Etiqueta.ClientDataSet1.First;
  while not FrmGera_Etiqueta.ClientDataSet1.Eof do
    begin
      Text:= '';
      texto:= 'Nome.....: ' + FrmGera_Etiqueta.ClientDataSet1.FieldByName('Nome').AsString + #13;
      texto:= texto +
              'Endereço.: ' + FrmGera_Etiqueta.ClientDataSet1.FieldByName('Endereco').AsString + ', ' + FrmGera_Etiqueta.ClientDataSet1.FieldByName('Numero').AsString + #13;
      texto:= texto +
              'Setor....: ' + FrmGera_Etiqueta.ClientDataSet1.FieldByName('Setor').AsString + #13;
      texto:= texto +
              'C.E.P....: ' + FrmGera_Etiqueta.ClientDataSet1.FieldByName('CEP').AsString;
      QrDados.Items.Add(Texto);
      FrmGera_Etiqueta.ClientDataSet1.Next;
    end;

end;

end.
