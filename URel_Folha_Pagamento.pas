unit URel_Folha_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB, jpeg,
  QRPDFFilt;

type
  TFrmRel_Folha_Pagamento = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrysoma_consulta_cliente_balcao_selecionado: TADOQuery;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRHRule2: TQRHRule;
    QRLabel26: TQRLabel;
    LblEmpresa: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel20: TQRLabel;
    QRExpr2: TQRExpr;
    QRHRule1: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand2: TQRBand;
    LblEmpresa2: TQRLabel;
    QRHRule4: TQRHRule;
    QRHRule5: TQRHRule;
    QRLabel8: TQRLabel;
    LblFuncionario: TQRLabel;
    LblEndereco: TQRLabel;
    LblCidade: TQRLabel;
    LblTelefone: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel13: TQRLabel;
    LblCPF: TQRLabel;
    LblEndereco_Empresa: TQRLabel;
    QRLabel24: TQRLabel;
    LblCidade_Empresa: TQRLabel;
    QRLabel25: TQRLabel;
    LblTelefone_Empresa: TQRLabel;
    QRLabel27: TQRLabel;
    LblCNPJ: TQRLabel;
    LblFuncionario2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRHRule6: TQRHRule;
    LblSaidas: TQRLabel;
    LblDesconto: TQRLabel;
    QRLabel4: TQRLabel;
    LblSalario: TQRLabel;
    LblEntradas: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel10: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    QRLabel14: TQRLabel;
    QRLabel5: TQRLabel;
    LblObservacao: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Folha_Pagamento: TFrmRel_Folha_Pagamento;

implementation

uses UFolha_Pagamento, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Folha_Pagamento.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Folha_Pagamento.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  cn, cp: AnsiString;
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  QRLabel14.Caption:= nome_fantasia;

  {cn:= Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+
    Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);}

  cp:= Copy(FrmFolha_Pagamento.LblCPF.Caption,1,3)+'.'+Copy(FrmFolha_Pagamento.LblCPF.Caption,4,3)+'.'+Copy(FrmFolha_Pagamento.LblCPF.Caption,7,3)+'-'+
    Copy(FrmFolha_Pagamento.LblCPF.Caption,10,2);

  LblFuncionario.Caption:= FrmFolha_Pagamento.EdtFuncionario.Text;
  LblFuncionario2.Caption:= FrmFolha_Pagamento.EdtFuncionario.Text;
  LblCPF.Caption:= cp;
  LblEndereco.Caption:= FrmFolha_Pagamento.LblTipo_Logradouro.Caption + ' ' + FrmFolha_Pagamento.LblEndereco.Caption + ', ' + FrmFolha_Pagamento.LblNumero.Caption;
  LblCidade.Caption:= FrmFolha_Pagamento.LblCidade.Caption + ' - ' + FrmFolha_Pagamento.LblUF.Caption;
  LblTelefone.Caption:= FrmFolha_Pagamento.LblTelefone.Caption;
  LblObservacao.Caption:= FrmFolha_Pagamento.MmoObservacao.Text;

  LblEmpresa.Caption:= nome_fantasia;
  LblEmpresa2.Caption:= nome_fantasia;
  LblCNPJ.Caption:= cnpj;
  LblEndereco_Empresa.Caption:= tipo_endereco + ' ' + endereco + ', ' + numero;
  LblCidade_Empresa.Caption:= cidade + ' - ' + uf;
  LblTelefone_Empresa.Caption:= telefone;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  LblEntradas.Caption:= FrmFolha_Pagamento.EdtEntradas.Text;
  LblSaidas.Caption:= FrmFolha_Pagamento.EdtSaidas.Text;
  LblDesconto.Caption:= FrmFolha_Pagamento.EdtDesconto.Text;
  LblSalario.Caption:= FrmFolha_Pagamento.EdtSalario.Text;
end;

end.
