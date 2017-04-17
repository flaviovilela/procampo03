unit URel_Conciliacao_Bancaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Conciliacao_Bancaria = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBDescricao: TQRDBText;
    QRDBData_Vencimento: TQRDBText;
    QRDBValor: TQRDBText;
    QRDBParcela: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBData_Pagamento: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    LblConsulta_Por: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    LblStatus: TQRLabel;
    QRLabel10: TQRLabel;
    LblParametro: TQRLabel;
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
  FrmRel_Conciliacao_Bancaria: TFrmRel_Conciliacao_Bancaria;

implementation

uses UConciliacao_Bancaria, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Conciliacao_Bancaria.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Conciliacao_Bancaria.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  //LblPropriedade.Caption:= FrmCarregar_Contas_Pagar.EdtPropriedade.Text;

  LblParametro.Caption:= '';
  LblParametro.Caption:= FrmConciliacao_Bancaria.EdtConsulta.Text;
  if (FrmConciliacao_Bancaria.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Por.Caption:= 'Número do documento'
  else if (FrmConciliacao_Bancaria.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Por.Caption:= 'Número da conta'
  else if (FrmConciliacao_Bancaria.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Por.Caption:= 'Data de Lançamento';

  if (FrmConciliacao_Bancaria.RGStatus.ItemIndex = 0) then
    LblStatus.Caption:= 'Pendente'
  else
    LblStatus.Caption:= 'Conciliado';


  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;
end;

end.
