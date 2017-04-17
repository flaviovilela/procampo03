unit URel_Consulta_Tempo_Producao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Tempo_Producao = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
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
    QRLabel11: TQRLabel;
    Lblde: TQRLabel;
    Lbla: TQRLabel;
    QRLabel13: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Tempo_Producao: TFrmRel_Consulta_Tempo_Producao;

implementation

uses UDM, UUtilitarios, UConsulta_Tempo_Producao;

{$R *.dfm}

procedure TFrmRel_Consulta_Tempo_Producao.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Tempo_Producao.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  if (FrmConsulta_Tempo_Producao.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Por.Caption:= 'Tudo'
  else if (FrmConsulta_Tempo_Producao.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Por.Caption:= 'Pedido';

  if (FrmConsulta_Tempo_Producao.RGConsulta_Por.ItemIndex = 0) then
  begin
    LblParametro.Enabled:= false;
    Lblde.Enabled:= true;
    Lbla.Enabled:= true;
    QRLabel13.Enabled:= true;
    Lblde.Caption:= FrmConsulta_Tempo_Producao.MEdtData_Inicial.Text;
    lbla.Caption:= FrmConsulta_Tempo_Producao.MEdtData_Final.Text;
  end
  else
  begin
    Lblde.Enabled:= false;
    Lbla.Enabled:= false;
    QRLabel13.Enabled:= false;
    LblParametro.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_Tempo_Producao.EdtN_Pedido.Text;
  end;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;
end.
