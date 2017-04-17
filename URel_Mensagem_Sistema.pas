unit URel_Mensagem_Sistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Mensagem_Sistema = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRHRule1: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    LblTelefone_Rodape: TQRLabel;
    QRStringsBand1: TQRStringsBand;
    QRExpr2: TQRExpr;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    LblTotal: TQRLabel;
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
  FrmRel_Mensagem_Sistema: TFrmRel_Mensagem_Sistema;

implementation

uses UDM, UMensagem_Sistema, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Mensagem_Sistema.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Mensagem_Sistema.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
    i: integer;
    texto: string;
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  LblTotal.caption:= FrmMensagem_Sistema.LblTotal.Caption;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  for I := 0 to FrmMensagem_Sistema.RichEdit1.Lines.Count do
    begin
      //texto:= '';
      texto:= FrmMensagem_Sistema.RichEdit1.Lines.Strings[i] + #13;
      QRStringsBand1.Items.Add(texto);
    end;

end;

end.
