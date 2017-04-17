unit URel_Pedido_Selecionado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Pedido_Selecionado = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    LblPedido: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel1: TQRLabel;
    QRBand3: TQRBand;
    QRDBValor: TQRDBText;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRLabel28: TQRLabel;
    QRDBText19: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRLabel38: TQRLabel;
    LblQuantidade_Itens: TQRLabel;
    QRLabel2: TQRLabel;
    LblTotal_Pedido: TQRLabel;
    QRLabel3: TQRLabel;
    LblTaxa_Entrega: TQRLabel;
    QRLabel4: TQRLabel;
    LblDesconto: TQRLabel;
    QRLabel6: TQRLabel;
    LblAcrescimo: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel27: TQRLabel;
    LblValor_Pagar: TQRLabel;
    QRLabel29: TQRLabel;
    LblValor_Recebido: TQRLabel;
    QRLabel32: TQRLabel;
    LblTroco: TQRLabel;
    QRLabel30: TQRLabel;
    LblNome_Cliente: TQRLabel;
    QRLabel8: TQRLabel;
    LblEndereco: TQRLabel;
    QRLabel7: TQRLabel;
    LblSetor: TQRLabel;
    QRLabel10: TQRLabel;
    LblTelefone: TQRLabel;
    QRLabel11: TQRLabel;
    LblCelular: TQRLabel;
    QRLabel13: TQRLabel;
    LblAtendente: TQRLabel;
    QRLabel14: TQRLabel;
    LblMesa: TQRLabel;
    QRLabel15: TQRLabel;
    LblCondicao_Pagamento: TQRLabel;
    QRLabel16: TQRLabel;
    LblData: TQRLabel;
    QRHRule1: TQRHRule;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel17: TQRLabel;
    LblOBs: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Pedido_Selecionado: TFrmRel_Pedido_Selecionado;

implementation

uses UUtilitarios, UPedido;

{$R *.dfm}

procedure TFrmRel_Pedido_Selecionado.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Pedido_Selecionado.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  LblPedido.Caption:= 'Pedido ' + FrmPedido.EdtN_Pedido.Text;
  LblNome_Cliente.Caption:= FrmPedido.EdtCliente.Text;
  LblEndereco.Caption:= FrmPedido.EdtEndereco.Text + ', ' + FrmPedido.EdtNumero.Text;
  LblSetor.Caption:= FrmPedido.EdtSetor.Text;
  LblTelefone.Caption:= FrmPedido.MEdtTelefone.Text;
  LblCelular.Caption:= FrmPedido.MEdtCelular.Text;
  LblAtendente.Caption:= FrmPedido.EdtAtendente.Text;
  LblMesa.Caption:= FrmPedido.EdtMesa.Text;
  LblCondicao_Pagamento.Caption:= FrmPedido.EdtCondicao_Pagamento.Text;
  LblData.Caption:= FrmPedido.MEdtData_Movimento.Text;
  LblQuantidade_Itens.Caption:= FrmPedido.EdtQuantidade_Itens.Text;
  LblTotal_Pedido.Caption:= FrmPedido.EdtTotal_Pedido.Text;
  LblTaxa_Entrega.Caption:= FrmPedido.EdtTaxa_Entrega.Text;
  LblDesconto.Caption:= FrmPedido.EdtDesconto_Total.Text;
  LblAcrescimo.Caption:= FrmPedido.EdtAcrescimo.Text;
  LblValor_Pagar.Caption:= FrmPedido.EdtValor_Pagar.Text;
  LblValor_Recebido.Caption:= FrmPedido.EdtValor_Recebido.Text;
  LblTroco.Caption:= FrmPedido.EdtTroco.Text;
  LblOBs.Caption:= FrmPedido.MMOObservacao.Text;
end;
end.
