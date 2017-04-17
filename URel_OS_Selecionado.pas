unit URel_OS_Selecionado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_OS_Selecionado = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    LblPedido: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRBand1: TQRBand;
    QRLabel28: TQRLabel;
    QRDBText19: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRLabel38: TQRLabel;
    LblQuantidade_Itens: TQRLabel;
    QRLabel2: TQRLabel;
    LblTotal_Pedido: TQRLabel;
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
    LblData_Lancamento: TQRLabel;
    QRLabel15: TQRLabel;
    LblData_Previsao_Entrega: TQRLabel;
    QRLabel16: TQRLabel;
    LblDescricao: TQRLabel;
    QRHRule1: TQRHRule;
    QRShape1: TQRShape;
    QRLabel17: TQRLabel;
    LblOBs: TQRLabel;
    QRHRule3: TQRHRule;
    LblCliente_Rodape: TQRLabel;
    QRBand2: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel26: TQRLabel;
    LblHora: TQRLabel;
    LblTroco: TQRLabel;
    QRLabel3: TQRLabel;
    LblValor_Recebido: TQRLabel;
    QRLabel12: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_OS_Selecionado: TFrmRel_OS_Selecionado;

implementation

uses UUtilitarios, UOS;

{$R *.dfm}

procedure TFrmRel_OS_Selecionado.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_OS_Selecionado.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  LblPedido.Caption:= 'Pedido ' + FrmOS.EdtN_Pedido.Text;
  LblNome_Cliente.Caption:= FrmOS.EdtCliente.Text;
  LblCliente_Rodape.Caption:= FrmOS.EdtCliente.Text;
  LblEndereco.Caption:= FrmOS.endereco + ', ' + FrmOS.numero + ', ' + FrmOS.complemento;
  LblSetor.Caption:= FrmOS.setor;
  LblTelefone.Caption:= FrmOS.telefone;
  LblCelular.Caption:= FrmOS.celular;
  LblAtendente.Caption:= Usuario;
  LblData_Lancamento.Caption:= FrmOS.MEdtData_Cadastro.Text;
  LblData_Previsao_Entrega.Caption:= FrmOS.MEdtData_Previsao_Entrega.Text;
  LblHora.Caption:= FrmOS.MEdtHora.Text;
  LblDescricao.Caption:= FrmOS.MMODescricao_PC.Text;
  LblQuantidade_Itens.Caption:= FrmOS.EdtQuantidade_Itens.Text;
  LblTotal_Pedido.Caption:= FrmOS.EdtTotal_Pedido.Text;
  LblDesconto.Caption:= FrmOS.EdtDesconto_Total.Text;
  LblAcrescimo.Caption:= FrmOS.EdtAcrescimo.Text;
  LblValor_Pagar.Caption:= FrmOS.EdtValor_Pagar.Text;
  LblValor_Recebido.Caption:= FrmOS.EdtValor_Recebido.Text;
  LblTroco.Caption:= FrmOS.EdtTroco.Text;
  LblOBs.Caption:= FrmOS.MMOObservacao.Text;
  //LblTipo.Caption:= FrmOS.CmbTipo.Text;
end;
end.
