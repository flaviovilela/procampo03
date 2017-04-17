unit URel_Consulta_Lancamento_Financeiro_Agrupado_Plano;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Lancamento_Financeiro_Agrupado_Plano = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
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
    LblPeriodo: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel1: TQRLabel;
    QRBand3: TQRBand;
    QRDBValor: TQRDBText;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    LblData: TQRLabel;
    QRLabel3: TQRLabel;
    LblStatus: TQRLabel;
    QRLabel6: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Plano: TFrmRel_Consulta_Lancamento_Financeiro_Agrupado_Plano;

implementation

uses UConsulta_Lancamentos_Financeiros, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado_Plano.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado_Plano.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {if FrmConsulta_Venda.DBGrid1.SelectedRows.CurrentRowSelected then
    PrintBand:= true
  else
    PrintBand:= false; }
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado_Plano.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblPeriodo.Caption:= 'De ' + FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text + ' a ' + FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text;

  if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
    LblData.Caption:= 'Data de Vencimento'
  else
    LblData.Caption:= 'Data de Pagamento';

  if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
    LblStatus.Caption:= 'Pago'
  else
    LblStatus.Caption:= 'Pendente';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;
end.
