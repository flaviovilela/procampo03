unit URel_Cotacao_Preco_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Cotacao_Preco_Produto = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBData_Pagamento: TQRDBText;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRChildBand1: TQRChildBand;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    LblN_Cotacao: TQRLabel;
    LblData_Cotacao: TQRLabel;
    LblHora_Cotacao: TQRLabel;
    LblData_Vencimento: TQRLabel;
    LblResponsavel: TQRLabel;
    LblQtde_Itens: TQRLabel;
    QRHRule1: TQRHRule;
    QRLabel4: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Cotacao_Preco_Produto: TFrmRel_Cotacao_Preco_Produto;

implementation

uses UCotacao_Preco_Produto, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Cotacao_Preco_Produto.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Cotacao_Preco_Produto.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  LblN_Cotacao.Caption:= FrmCotacao_Preco_Produto.EdtN_Cotacao.Text;
  LblData_Cotacao.Caption:= FrmCotacao_Preco_Produto.MEdtData_Cotacao.Text;
  LblHora_Cotacao.Caption:= FrmCotacao_Preco_Produto.MEdtHora_Pedido.Text;
  LblData_Vencimento.Caption:= FrmCotacao_Preco_Produto.MEdtData_Vencimento.Text;
  LblResponsavel.Caption:= FrmCotacao_Preco_Produto.EdtResponsavel.Text;
  LblQtde_Itens.Caption:= FrmCotacao_Preco_Produto.EdtQuantidade_Itens.Text;

end;

end.
