unit URel_Recibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB;

type
  TFrmRel_Recibo = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRHRule1: TQRHRule;
    QRLabel4: TQRLabel;
    QRBand4: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    LblTelefone_Rodape: TQRLabel;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    LblCliente: TQRLabel;
    QRLabel3: TQRLabel;
    LblEndereco: TQRLabel;
    QRLabel5: TQRLabel;
    LblImportancia: TQRLabel;
    QRLabel7: TQRLabel;
    LblReferente: TQRLabel;
    LblData: TQRLabel;
    QRLabel1: TQRLabel;
    LblEmitente: TQRLabel;
    QRLabel8: TQRLabel;
    LblCNPJ: TQRLabel;
    QRLabel11: TQRLabel;
    LblEndereco_Emitente: TQRLabel;
    QRHRule2: TQRHRule;
    LblEmitente_Rodape: TQRLabel;
    LblCliente_Rodape: TQRLabel;
    QRHRule3: TQRHRule;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Recibo: TFrmRel_Recibo;

implementation

uses UDM, UPrincipal, URecibo, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Recibo.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Recibo.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
    i: integer;
    texto: string;
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);

  LblCliente.Caption:= FrmRecibo.EdtCliente.Text;
  LblEndereco.Caption:= FrmRecibo.EdtEndereco.Text + ', N. ' + FrmRecibo.EdtNumero_Cliente.Text;
  LblImportancia.Caption:= FrmRecibo.EdtImportancia.Text;
  LblReferente.Caption:= FrmRecibo.MMOReferente.Text;
  LblEmitente.Caption:= FrmRecibo.EdtEmitente.Text;
  LblCNPJ.Caption:= FrmRecibo.EdtCNPJ.Text;
  LblEndereco_Emitente.Caption:= FrmRecibo.EdtEndereco_Emitente.Text + ', N. ' + FrmRecibo.EdtNumero_Emitente.Text;
  LblData.Caption:= FormatDateTime('dddddd', StrToDateTime(FrmRecibo.MEdtData_Cadastro.Text));
  LblEmitente_Rodape.Caption:= FrmRecibo.EdtEmitente.Text;
  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblCliente_Rodape.Caption:= FrmRecibo.EdtCliente.Text;

  {for I := 0 to FrmMensagem_Sistema.RichEdit1.Lines.Count do
    begin
      //texto:= '';
      texto:= FrmMensagem_Sistema.RichEdit1.Lines.Strings[i] + #13;
      QRStringsBand1.Items.Add(texto);
    end; }

end;

end.
