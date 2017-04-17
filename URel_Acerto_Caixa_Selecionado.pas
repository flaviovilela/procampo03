unit URel_Acerto_Caixa_Selecionado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Acerto_Caixa_Selecionado = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRGroup1: TQRGroup;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText16: TQRDBText;
    QRChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand3: TQRBand;
    QRDBValor: TQRDBText;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand1: TQRBand;
    QRLabel28: TQRLabel;
    QRDBText19: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRLabel38: TQRLabel;
    LblEntrada: TQRLabel;
    QRLabel2: TQRLabel;
    LblSaida: TQRLabel;
    QRLabel3: TQRLabel;
    LblSaldo: TQRLabel;
    QRLabel4: TQRLabel;
    LblAcerto: TQRLabel;
    QRLabel6: TQRLabel;
    LblFechamento: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Acerto_Caixa_Selecionado: TFrmRel_Acerto_Caixa_Selecionado;

implementation

uses UAcerto_Caixa, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Acerto_Caixa_Selecionado.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Acerto_Caixa_Selecionado.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= Nome_Fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  LblEntrada.Caption:= FrmAcerto_Caixa.EdtEntrada.Text;
  LblSaida.Caption:= FrmAcerto_Caixa.EdtSaida.Text;
  LblSaldo.Caption:= FrmAcerto_Caixa.EdtSaldo.Text;
  LblAcerto.Caption:= FrmAcerto_Caixa.EdtAcerto.Text;
  LblFechamento.Caption:= FrmAcerto_Caixa.EdtFechamento.Text;
end;
end.
