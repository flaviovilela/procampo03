unit URel_Consulta_Agenda_Telefonica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Agenda_Telefonica = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBParcela: TQRDBText;
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
    LblConsulta_Por: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    LblParametro: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Agenda_Telefonica: TFrmRel_Consulta_Agenda_Telefonica;

implementation

uses UDM, UUtilitarios, UConsulta_Agenda_Telefonica;

{$R *.dfm}

procedure TFrmRel_Consulta_Agenda_Telefonica.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Agenda_Telefonica.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  if (FrmConsulta_Agenda_Telefonica.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Por.Caption:= 'Tudo'
  else if (FrmConsulta_Agenda_Telefonica.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Por.Caption:= 'Contato';

  if (FrmConsulta_Agenda_Telefonica.RGConsulta_Por.ItemIndex = 0) then
  begin
    LblParametro.Enabled:= false;
    QRLabel10.Enabled:= false;
  end
  else
  begin
    LblParametro.Enabled:= true;
    QRLabel10.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_Agenda_Telefonica.EdtContato.Text;
  end;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;
end.
