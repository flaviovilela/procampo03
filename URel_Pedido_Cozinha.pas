unit URel_Pedido_Cozinha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Pedido_Cozinha = class(TForm)
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
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel30: TQRLabel;
    LblNome_Cliente: TQRLabel;
    QRLabel13: TQRLabel;
    LblAtendente: TQRLabel;
    QRLabel14: TQRLabel;
    LblMesa: TQRLabel;
    QRHRule1: TQRHRule;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    quantidade: double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Pedido_Cozinha: TFrmRel_Pedido_Cozinha;

implementation

uses UUtilitarios, UPedido;

{$R *.dfm}

procedure TFrmRel_Pedido_Cozinha.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Pedido_Cozinha.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (FrmPedido.ADOQuery1Cozinha.AsString = 'SIM') then
    PrintBand:= true
  else
    PrintBand:= false;

  if (quantidade < 1) then
    QRBand3.ForceNewPage:= false
  else
  begin
    QRBand3.ForceNewPage:= true;
    quantidade:= 0;
  end;
  quantidade:= quantidade + FrmPedido.ADOQuery1Quantidade.AsFloat;
end;

procedure TFrmRel_Pedido_Cozinha.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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
  LblAtendente.Caption:= FrmPedido.EdtAtendente.Text;
  LblMesa.Caption:= FrmPedido.EdtMesa.Text;
end;
end.
