unit URel_Consulta_Fechamento_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Fechamento_Caixa = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBData_Vencimento: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel15: TQRLabel;
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
    QRDBText3: TQRDBText;
    QRLabel11: TQRLabel;
    LblUsuario: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBData_Pagamento: TQRDBText;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRBand1: TQRBand;
    QRChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    ADOQuery1: TADOQuery;
    ADOQuery1Data_Abertura: TDateTimeField;
    ADOQuery1Data_Fechamento: TDateTimeField;
    ADOQuery1Forma_Pagamento: TStringField;
    ADOQuery1Codigo_Usuario: TIntegerField;
    ADOQuery1Valor_Abertura: TFloatField;
    ADOQuery1Valor_Fechamento: TFloatField;
    ADOQuery1Nome: TStringField;
    QRHRule1: TQRHRule;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Fechamento_Caixa: TFrmRel_Consulta_Fechamento_Caixa;

implementation

uses UConsulta_Fechamento_Caixa, UDM, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Consulta_Fechamento_Caixa.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Fechamento_Caixa.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  LblParametro.Caption:= '';
  LblUsuario.Caption:= FrmConsulta_Fechamento_Caixa.EdtUsuario.Text;
  LblParametro.Caption:= 'De ' + FrmConsulta_Fechamento_Caixa.MEdtData_Inicial.Text + ' até ' + FrmConsulta_Fechamento_Caixa.MEdtData_Final.Text;

  if (FrmConsulta_Fechamento_Caixa.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Por.Caption:= 'Usuário / Data Abertura'
  else if (FrmConsulta_Fechamento_Caixa.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Por.Caption:= 'Usuário / Data Fechamento';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  if (FrmConsulta_Fechamento_Caixa.RGConsulta_Por.ItemIndex = 0) then
    begin
      with ADOQuery1 do
        begin
          close;
          sql.clear;
          sql.add('select FC.*, CU.Nome from Fechamento_Caixa FC');
          sql.add('left join Cadastro_Usuario CU on (FC.Codigo_Usuario = CU.Codigo)');
          if (FrmConsulta_Fechamento_Caixa.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where FC.Codigo_Usuario = :Parametro and Data_Abertura between :DI and :DF order by Nome')
          else if (FrmConsulta_Fechamento_Caixa.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where FC.Codigo_Usuario = :Parametro and Data_Abertura between :DI and :DF order by Data_Abertura')
          else if (FrmConsulta_Fechamento_Caixa.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where FC.Codigo_Usuario = :Parametro and Data_Abertura between :DI and :DF order by Data_Fechamento');
          Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Fechamento_Caixa.EdtCodigo_Usuario.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Fechamento_Caixa.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Fechamento_Caixa.MEdtData_Final.Text);
          open;
        end;
    end
    else
      if (FrmConsulta_Fechamento_Caixa.RGConsulta_Por.ItemIndex = 1) then
        begin
          with ADOQuery1 do
            begin
              close;
              sql.clear;
              sql.add('select FC.*, CU.Nome from Fechamento_Caixa FC');
              sql.add('left join Cadastro_Usuario CU on (FC.Codigo_Usuario = CU.Codigo)');
              if (FrmConsulta_Fechamento_Caixa.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where FC.Codigo_Usuario = :Parametro and Data_Fechamento between :DI and :DF order by Nome')
              else if (FrmConsulta_Fechamento_Caixa.RGOrdena_Por.ItemIndex = 1) then
                sql.add('where FC.Codigo_Usuario = :Parametro and Data_Fechamento between :DI and :DF order by Data_Abertura')
              else if (FrmConsulta_Fechamento_Caixa.RGOrdena_Por.ItemIndex = 2) then
                sql.add('where FC.Codigo_Usuario = :Parametro and Data_Fechamento between :DI and :DF order by Data_Fechamento');
              Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Fechamento_Caixa.EdtCodigo_Usuario.Text);
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Fechamento_Caixa.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Fechamento_Caixa.MEdtData_Final.Text);
              open;
            end;
        end;

end;

end.
