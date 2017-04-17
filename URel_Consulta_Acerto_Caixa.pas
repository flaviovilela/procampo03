unit URel_Consulta_Acerto_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Acerto_Caixa = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBData_Vencimento: TQRDBText;
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
    LblConsulta_Por: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel11: TQRLabel;
    LblUsuario: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel14: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Acerto_Caixa: TFrmRel_Consulta_Acerto_Caixa;

implementation

uses UUtilitarios, UConsulta_Acerto_Caixa;

{$R *.dfm}

procedure TFrmRel_Consulta_Acerto_Caixa.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Acerto_Caixa.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  LblParametro.Caption:= '';
  LblUsuario.Caption:= FrmConsulta_Acerto_Caixa.EdtDescricao.Text;
  LblParametro.Caption:= 'De ' + FrmConsulta_Acerto_Caixa.MEdtData_Inicial.Text + ' até ' + FrmConsulta_Acerto_Caixa.MEdtData_Final.Text;

  if (FrmConsulta_Acerto_Caixa.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Por.Caption:= 'Usuário / Data Abertura'

  else if (FrmConsulta_Acerto_Caixa.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Por.Caption:= 'Usuário / Data Fechamento'

  else if (FrmConsulta_Acerto_Caixa.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Por.Caption:= 'Caixa / Data Abertura'

  else if (FrmConsulta_Acerto_Caixa.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Por.Caption:= 'Caixa / Data Fechamento';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;

end.
