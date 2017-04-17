unit URel_Consulta_Saldo_Bancario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Saldo_Bancario = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBData_Vencimento: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel5: TQRLabel;
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
    QRLabel10: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
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
  FrmRel_Consulta_Saldo_Bancario: TFrmRel_Consulta_Saldo_Bancario;

implementation

uses UConsulta_Saldo_Bancario, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Consulta_Saldo_Bancario.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Saldo_Bancario.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  //LblPropriedade.Caption:= FrmCarregar_Contas_Pagar.EdtPropriedade.Text;

  if (FrmConsulta_Saldo_Bancario.RGConsulta_Por.ItemIndex = 0) then
  begin
    LblConsulta_Por.Caption:= 'Todos';
    QRLabel10.Enabled:= false;
    LblParametro.Enabled:= false;
  end
  else if (FrmConsulta_Saldo_Bancario.RGConsulta_Por.ItemIndex = 1) then
  begin
    LblConsulta_Por.Caption:= 'Número da Conta';
    QRLabel10.Enabled:= true;
    LblParametro.Enabled:= true;
    LblParametro.Caption:= '';
    LblParametro.Caption:= FrmConsulta_Saldo_Bancario.EdtConsulta.Text;
  end;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;

end.
