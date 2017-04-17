unit URel_Lancamento_Contas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Lancamento_Contas = class(TForm)
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
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
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
    LblValor_Total: TQRLabel;
    QRLabel4: TQRLabel;
    LblTipo_Conta: TQRLabel;
    LblConsulta_Por: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    LblStatus: TQRLabel;
    QRLabel10: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel11: TQRLabel;
    Lblde: TQRLabel;
    Lbla: TQRLabel;
    QRLabel13: TQRLabel;
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
  FrmRel_Lancamento_Contas: TFrmRel_Lancamento_Contas;

implementation

uses UChama_Lancamentos_Financeiros, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Lancamento_Contas.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Lancamento_Contas.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  //LblPropriedade.Caption:= FrmCarregar_Contas_Pagar.EdtPropriedade.Text;

  if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
    lblTipo_Conta.Caption:= 'Contas a Pagar'
  else
    lblTipo_Conta.Caption:= 'Contas a Receber';

  if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Por.Caption:= 'Número do documento'
  else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Por.Caption:= 'Cliente / Fornecedor'
  else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Por.Caption:= 'Data de Lançamento'
  else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Por.Caption:= 'Data de Vencimento';

  if (FrmChama_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
    LblStatus.Caption:= 'Pendente'
  else
    LblStatus.Caption:= 'Pago';

  if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) or (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) then
    begin
      QRLabel11.Enabled:= false;
      Lblde.Enabled:= false;
      Lbla.Enabled:= false;
      QRLabel13.Enabled:= false;
      QRLabel10.Enabled:= true;
      LblParametro.Enabled:= true;
      LblParametro.Caption:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
    end
    else if ((FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) or (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3)) then
    begin
      QRLabel10.Enabled:= false;
      LblParametro.Enabled:= false;
      LblParametro.Caption:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
      
      QRLabel11.Enabled:= true;
      Lblde.Enabled:= true;
      Lbla.Enabled:= true;
      QRLabel13.Enabled:= true;
      Lblde.Caption:= FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text;
      Lbla.Caption:= FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text;
    end;
    //LblValor_Total.Caption:= FrmChama_Lancamentos_Financeiros.EdtValor_Total.Text;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;

end.
