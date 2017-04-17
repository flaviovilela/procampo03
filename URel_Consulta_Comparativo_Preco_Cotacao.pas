unit URel_Consulta_Comparativo_Preco_Cotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Comparativo_Preco_Cotacao = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBData_Vencimento: TQRDBText;
    QRDBParcela: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBData_Pagamento: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
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
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    LblCotacao: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText7: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    QRLabel15: TQRLabel;
    LblStatus: TQRLabel;
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
  FrmRel_Consulta_Comparativo_Preco_Cotacao: TFrmRel_Consulta_Comparativo_Preco_Cotacao;

implementation

uses UConsulta_Comparativo_Preco_Cotacao, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Consulta_Comparativo_Preco_Cotacao.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Comparativo_Preco_Cotacao.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  LblParametro.Caption:= '';

  if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 0) then
    LblStatus.Caption:= 'PENDENTE'
  else if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 1) then
    LblStatus.Caption:= 'APROVADO'
  else if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 2) then
    LblStatus.Caption:= 'REPROVADO';


  LblCotacao.Caption:= FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.Text;

  if (FrmConsulta_Comparativo_Preco_Cotacao.RGConsulta_Por.ItemIndex = 1) or
      (FrmConsulta_Comparativo_Preco_Cotacao.RGConsulta_Por.ItemIndex = 2) then
    LblParametro.Caption:= FrmConsulta_Comparativo_Preco_Cotacao.EdtConsulta.Text
  else
    LblParametro.Enabled:= false;
  
  if (FrmConsulta_Comparativo_Preco_Cotacao.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Por.Caption:= 'Tudo'
  else if (FrmConsulta_Comparativo_Preco_Cotacao.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Por.Caption:= 'Produto'
  else if (FrmConsulta_Comparativo_Preco_Cotacao.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Por.Caption:= 'Fornecedor';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;

end.
