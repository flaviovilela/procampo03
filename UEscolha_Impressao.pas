unit UEscolha_Impressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, RSPrint, UUtilitarios;

type
  TFrmEscolha_Impressao = class(TForm)
    RGTipo: TRadioGroup;
    TlbFerramentas: TToolBar;
    BBtnOK: TToolButton;
    ImgImagens_Comandos: TImageList;
    BBtnSair: TToolButton;
    RGTipo_Impressora: TRadioGroup;
    RS: TRSPrinter;
    procedure BBtnSairClick(Sender: TObject);
    procedure imprime(pForm: TForm);
    procedure BBtnOKClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }

    Util: UUtilitarios.TUtil;
    linha_cozinha: integer;
    procedure Imprime_Pedido;
    procedure Imprime_Cozinha;
    procedure Monta_Imprimir_Cozinha;
  public
    { Public declarations }
    var
      preview: boolean;
  end;

var
  FrmEscolha_Impressao: TFrmEscolha_Impressao;

implementation

uses URel_Pedido_Selecionado, URel_Pedido_Cozinha, UPedido;

{$R *.dfm}

procedure TFrmEscolha_Impressao.BBtnOKClick(Sender: TObject);
begin
  if (RGTipo_Impressora.ItemIndex = 1) then
  begin
    if (RGTipo.ItemIndex = 0) then
    begin
      FrmRel_Pedido_Selecionado:= TFrmRel_Pedido_Selecionado.create(self);
      FrmRel_Pedido_Selecionado.Release;
      FrmRel_Pedido_Selecionado:= Nil;
    end
    else if (RGTipo.ItemIndex = 1) then
    begin
      FrmRel_Pedido_Cozinha:= TFrmRel_Pedido_Cozinha.create(self);
      FrmRel_Pedido_Cozinha.Release;
      FrmRel_Pedido_Cozinha:= Nil;
    end;
  end
  else if (RGTipo_Impressora.ItemIndex = 0) then
  begin
    if (RGTipo.ItemIndex = 0) then
    begin
      Imprime_Pedido;
    end
    else if (RGTipo.ItemIndex = 1) then
    begin
      Imprime_Cozinha;
    end;
  end;

  Close;
end;

procedure TFrmEscolha_Impressao.BBtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmEscolha_Impressao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmEscolha_Impressao.Release;
end;

procedure TFrmEscolha_Impressao.imprime(pForm: TForm);
begin
  pForm:= TForm.Create(self);
  pForm.Print;
  pForm.Release;
  pForm:= Nil;
end;

procedure TFrmEscolha_Impressao.Imprime_Cozinha;
var
  i, i2, linha: integer;
  pedido: string;
  cn, cp: string;
  quantidade: double;
begin
  i:= 0;
  i2:= 136;
  Monta_Imprimir_Cozinha;

  FrmPedido.ADOQuery1.First;
  while not FrmPedido.ADOQuery1.Eof do
  begin
    if (FrmPedido.ADOQuery1Cozinha.AsString = 'SIM') then
    begin
      rs.Write(linha_cozinha, 0, FrmPedido.ADOQuery1N_Pedido.AsString);
      rs.Write(linha_cozinha, 15, FrmPedido.ADOQuery1Descricao.AsString);
      rs.Write(linha_cozinha, 60, FrmPedido.ADOQuery1Tamanho.AsString);
      rs.Write(linha_cozinha, 70, FrmPedido.ADOQuery1Borda.AsString);
      rs.Write(linha_cozinha, 77, FrmPedido.ADOQuery1Sabor_Borda.AsString);
      rs.Write(linha_cozinha, 93, FormatFloat('#0.0,0', FrmPedido.ADOQuery1Quantidade.AsFloat));
      rs.Write(linha_cozinha, 100, FrmPedido.ADOQuery1Observacao.AsString);
      linha_cozinha:= linha_cozinha + 1;
      i:= 1;
      for i := 0 to i2 do
        rs.Write(linha_cozinha+1,i,'-');

      quantidade:= quantidade + FrmPedido.ADOQuery1Quantidade.AsFloat;

      if (quantidade >= 1) then
      begin
        rs.Print;
        quantidade:= 0;
        Monta_Imprimir_Cozinha;
      end;
      FrmPedido.ADOQuery1.Next;

    end
    else
      FrmPedido.ADOQuery1.Next;
  end;

end;

procedure TFrmEscolha_Impressao.Imprime_Pedido;
var
  i, i2, linha: integer;
  pedido: string;
  cn, cp: string;
begin
  rs.BeginDoc;
  i:= 0;
  i2:= 136;

  pedido:= 'PEDIDO ' + FrmPedido.EdtN_Pedido.Text;

  rs.WriteFont(1, 0, pedido, [Bold]);
  rs.WriteFont(1, Util.Alinha_Centro(Nome_Fantasia, i2), Nome_Fantasia, [Bold]);
  rs.WriteFont(1, 120, 'Data: ' + DateToStr(date), [Bold]);
  rs.WriteFont(2, 120, 'Hora: ' + TimeToStr(time), [Bold]);

  for i := 0 to i2 do
    rs.Write(3,i,'-');

  rs.Write(4,0, 'Cliente: ' + FrmPedido.EdtCliente.Text);
  rs.Write(4,80, 'Atendente: ' + FrmPedido.EdtAtendente.Text);
  rs.Write(5,0, 'Endereço: ' + FrmPedido.EdtEndereco.Text + ', ' + FrmPedido.EdtNumero.Text);
  rs.Write(5,80, 'Mesa: ' + FrmPedido.EdtMesa.Text);
  rs.Write(6,0, 'Setor: ' + FrmPedido.EdtSetor.Text);
  rs.Write(6,80, 'Cond. Pag.: ' + FrmPedido.EdtCondicao_Pagamento.Text);
  rs.Write(7,0, 'Telefone: ' + FrmPedido.MEdtTelefone.Text); rs.Write(8,30, 'Celular: ' + FrmPedido.MEdtCelular.Text);
  rs.Write(7,80, 'Data: ' + FrmPedido.MEdtData_Movimento.Text);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(8,i,'-');

  rs.WriteFont(9, 0, 'Produto', [Bold]);
  rs.WriteFont(9, 40, 'Tamanho', [Bold]);
  rs.WriteFont(9, 50, 'Borda', [Bold]);
  rs.WriteFont(9, 60, 'S. Borda', [Bold]);
  rs.WriteFont(9, 75, 'Valor Unit.', [Bold]);
  rs.WriteFont(9, 90, 'Qtde.', [Bold]);
  rs.WriteFont(9, 100, 'Sub Total', [Bold]);
  rs.WriteFont(9, 113, 'Desc.', [Bold]);
  rs.WriteFont(9, 120, 'Total', [Bold]);

  linha:= 10;
  FrmPedido.ADOQuery1.First;
  while not FrmPedido.ADOQuery1.Eof do
  begin
    rs.Write(linha, 0, FrmPedido.ADOQuery1Descricao.AsString);
    rs.Write(linha, 40, FrmPedido.ADOQuery1Tamanho.AsString);
    rs.Write(linha, 50, FrmPedido.ADOQuery1Borda.AsString);
    rs.Write(linha, 60, FrmPedido.ADOQuery1Sabor_Borda.AsString);
    rs.Write(linha, 75, FormatFloat('#0.0,0', FrmPedido.ADOQuery1Valor_Unitario.AsFloat));
    rs.Write(linha, 90, FormatFloat('#0.0,0', FrmPedido.ADOQuery1Quantidade.AsFloat));
    rs.Write(linha, 100, FormatFloat('#0.0,0', FrmPedido.ADOQuery1Sub_Total.AsFloat));
    rs.Write(linha, 113, FormatFloat('#0.0,0', FrmPedido.ADOQuery1Desconto.AsFloat));
    rs.Write(linha, 120, FormatFloat('#0.0,0', FrmPedido.ADOQuery1Valor_Venda.AsFloat));
    Inc(linha);
    FrmPedido.ADOQuery1.Next;
  end;

  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i,'-');

  rs.WriteFont(linha+2, 0, 'Qtde. Itens: ', [Bold] ); rs.Write(linha+2, 13, FrmPedido.EdtQuantidade_Itens.Text);
  rs.WriteFont(linha+2, 30, 'Desconto: ', [Bold] ); rs.Write(linha+2, 40, FrmPedido.EdtDesconto_Total.Text);
  rs.WriteFont(linha+2, 60, 'Valor Rec.: ', [Bold]); rs.Write(linha+2, 72, FrmPedido.EdtValor_Recebido.Text);
  rs.WriteFont(linha+3, 0, 'Total Pedido: ', [Bold]); rs.Write(linha+3, 14, FrmPedido.EdtTotal_Pedido.Text);
  rs.WriteFont(linha+3, 30, 'Acréscimo: ', [Bold]); rs.Write(linha+3, 41, FrmPedido.EdtAcrescimo.Text);
  rs.WriteFont(linha+3, 60, 'Troco: ', [Bold]); rs.Write(linha+3, 67, FrmPedido.EdtTroco.Text);
  rs.WriteFont(linha+4, 0, 'Tx. Entrega: ', [Bold]); rs.Write(linha+4, 13, FrmPedido.EdtTaxa_Entrega.Text);
  rs.WriteFont(linha+4, 30, 'Valor Pagar: ', [Bold]); rs.Write(linha+4, 43, FrmPedido.EdtValor_Pagar.Text);


  rs.Print;
end;

procedure TFrmEscolha_Impressao.Monta_Imprimir_Cozinha;
var
  i, i2, linha: integer;
  pedido: string;
  cn, cp: string;
begin
  rs.BeginDoc;
  i:= 0;
  i2:= 136;

  pedido:= 'PEDIDO ' + FrmPedido.EdtN_Pedido.Text;

  rs.WriteFont(1, 0, pedido, [Bold]);
  rs.WriteFont(1, Util.Alinha_Centro(Nome_Fantasia, i2), Nome_Fantasia, [Bold]);
  rs.WriteFont(1, 120, 'Data: ' + DateToStr(date), [Bold]);
  rs.WriteFont(2, 120, 'Hora: ' + TimeToStr(time), [Bold]);

  for i := 0 to i2 do
    rs.Write(3,i,'-');

  rs.Write(4,0, 'Cliente: ' + FrmPedido.EdtCliente.Text);
  rs.Write(4,80, 'Atendente: ' + FrmPedido.EdtAtendente.Text);
  //rs.Write(5,0, 'Endereço: ' + FrmPedido.EdtEndereco.Text + ', ' + FrmPedido.EdtNumero.Text);
  rs.Write(5,80, 'Mesa: ' + FrmPedido.EdtMesa.Text);
  //rs.Write(6,0, 'Setor: ' + FrmPedido.EdtSetor.Text);
  //rs.Write(6,80, 'Cond. Pag.: ' + FrmPedido.EdtCondicao_Pagamento.Text);
  //rs.Write(7,0, 'Telefone: ' + FrmPedido.MEdtTelefone.Text); rs.Write(8,30, 'Celular: ' + FrmPedido.MEdtCelular.Text);
  //rs.Write(7,80, 'Data: ' + FrmPedido.MEdtData_Movimento.Text);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(6,i,'-');

  rs.WriteFont(7, 0, 'Pedido', [Bold]);
  rs.WriteFont(7, 15, 'Produto', [Bold]);
  rs.WriteFont(7, 60, 'Tamanho', [Bold]);
  rs.WriteFont(7, 70, 'Borda', [Bold]);
  rs.WriteFont(7, 77, 'S. Borda', [Bold]);
  rs.WriteFont(7, 93, 'Qtde.', [Bold]);
  rs.WriteFont(7, 100, 'Observação', [Bold]);

  linha_cozinha:= 8;
end;

end.
