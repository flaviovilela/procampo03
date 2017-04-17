unit URel_Mala_Direta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB;

type
  TFrmRel_Mala_Direta = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    LblTexto: TQRLabel;
    LblData: TQRLabel;
    LblNome: TQRLabel;
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
  FrmRel_Mala_Direta: TFrmRel_Mala_Direta;

implementation

uses UDM, UPrincipal, UUtilitarios, UMala_Direta;

{$R *.dfm}

procedure TFrmRel_Mala_Direta.FormCreate(Sender: TObject);
var
  i: integer;
begin
  {for i := 1 to StrToInt(FrmMala_Direta.EdtNumero_Copia.Text) do
  begin
    QuickRep1.Preview;
  end;     }

  QuickRep1.Preview;
end;

procedure TFrmRel_Mala_Direta.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
    i: integer;
    texto: string;
begin
  LblData.Caption:= FormatDateTime('dddddd', date);

  LblTexto.Caption:= FrmMala_Direta.MMOReferente.Text;
  LblNome.Caption:= FrmMala_Direta.EdtNome.Text;
  LblEmpresa.Caption:= FrmMala_Direta.EdtEmpresa.Text;

end;

end.
