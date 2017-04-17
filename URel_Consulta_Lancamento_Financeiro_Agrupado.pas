unit URel_Consulta_Lancamento_Financeiro_Agrupado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Lancamento_Financeiro_Agrupado = class(TForm)
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
    QRLabel4: TQRLabel;
    LblDe: TQRLabel;
    QRLabel11: TQRLabel;
    LblAte: TQRLabel;
    qrypagar: TADOQuery;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRBand3: TQRBand;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRLabel3: TQRLabel;
    qryreceber: TADOQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField1: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    QuickRep2: TQuickRep;
    QRBand2: TQRBand;
    QRLabel21: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel22: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRBand5: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand6: TQRBand;
    QRLabel35: TQRLabel;
    QRExpr3: TQRExpr;
    QRBand7: TQRBand;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRExpr4: TQRExpr;
    qrypagarCodigo: TIntegerField;
    qrypagarN_Documento: TIntegerField;
    qrypagarCodigo_Empresa: TIntegerField;
    qrypagarTipo: TStringField;
    qrypagarHistorico: TStringField;
    qrypagarData_Vencimento: TDateTimeField;
    qrypagarData_Pagamento: TDateTimeField;
    qrypagarValor: TFloatField;
    qrypagarStatus: TStringField;
    qrypagarNome: TStringField;
    QRLabel5: TQRLabel;
    LblSaldo: TQRLabel;
    qrypagarCheque: TStringField;
    qrypagarConta: TStringField;
    qryreceberCheque: TStringField;
    qryreceberConta: TStringField;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qrypagarObservacoes: TStringField;
    qryreceberObservacoes: TStringField;
    QRLabel12: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel39: TQRLabel;
    LblFiscal: TQRLabel;
    LblStatus: TQRLabel;
    QRLabel15: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QRExpr1Print(sender: TObject; var Value: string);
    procedure QRExpr3Print(sender: TObject; var Value: string);
    procedure LblSaldoPrint(sender: TObject; var Value: string);
  private
    val1, val2, result: double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado: TFrmRel_Consulta_Lancamento_Financeiro_Agrupado;

implementation

uses UDM, UConsulta_Lancamentos_Financeiros, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado.FormCreate(Sender: TObject);
begin
  QRCompositeReport1.Prepare;
  QRCompositeReport1.Preview;
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado.LblSaldoPrint(
  sender: TObject; var Value: string);
begin
  result:= val2 - val1;
  Value:= FormatFloat('#0.0,0', result);
  Value:= StringReplace(Value, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  QRCompositeReport1.Reports.Add(QuickRep1);
  QRCompositeReport1.Reports.Add(QuickRep2);
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado.QRExpr1Print(
  sender: TObject; var Value: string);
var
  aux: AnsiString;
begin
  aux:= StringReplace(Value, ThousandSeparator, '', [rfReplaceAll]);
  //aux:= FormatFloat('#0,00', StrToFloat(Value));
  //aux:= StringReplace(aux, ThousandSeparator, '', [rfReplaceAll]);
  val1:= StrToFloat(aux);
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado.QRExpr3Print(
  sender: TObject; var Value: string);
var
  aux: AnsiString;
begin
  aux:= StringReplace(Value, ThousandSeparator, '', [rfReplaceAll]);
  //aux:= FormatFloat('#0,00', StrToFloat(Value));
  //aux:= StringReplace(aux, ThousandSeparator, '', [rfReplaceAll]);
  val2:= StrToFloat(aux);
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= Nome_Fantasia;

  LblDe.Caption:= FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text;
  LblAte.Caption:= FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text;

  if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
    LblFiscal.Caption:= 'Tudo'
  else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
    LblFiscal.Caption:= 'Sim'
  else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
    LblFiscal.Caption:= 'Não';

  if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
    LblStatus.Caption:= 'Pago'
  else if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 1) then
    LblStatus.Caption:= 'Pendente';

  //LblTelefone_Rodape.Caption:= telefone_relatorio;
  //LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with qrypagar do
  begin
    close;
    sql.clear;
    sql.add('select PL.Codigo, PL.N_Documento, LF.Observacoes, LF.Codigo_Empresa, LF.Tipo, LF.Historico, PL.Data_Vencimento, PL.Data_Pagamento, PL.Valor,');
    sql.add('PL.Status, PL.Cheque, PL.Conta, Cli.Nome from Lancamento_Financeiro LF');
    sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
    sql.add('left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');

    if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
    begin
      if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
        sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
        sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
        sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento');
    end
    else
    begin
      if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
        sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
        sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
        sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento');

      if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
        Parameters.ParamByName('Fiscal').Value:= 0
      else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
        Parameters.ParamByName('Fiscal').Value:= 1;
    end;

    Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
    Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

    if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
      Parameters.ParamByName('Status').Value:= 'PAGO'
    else
      Parameters.ParamByName('Status').Value:= 'PENDENTE';

    Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
    open;
  end;

  with qryreceber do
  begin
    close;
    sql.clear;
    sql.add('select PL.Codigo, PL.N_Documento, LF.Observacoes, LF.Codigo_Empresa, LF.Tipo, LF.Historico, PL.Data_Vencimento, PL.Data_Pagamento, PL.Valor,');
    sql.add('PL.Status, PL.Cheque, PL.Conta, Cli.Nome from Lancamento_Financeiro LF');
    sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
    sql.add('left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');

    if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
    begin
      if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
        sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
        sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
        sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento');
    end
    else
    begin
      if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
        sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
        sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
        sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento');

      if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
        Parameters.ParamByName('Fiscal').Value:= 0
      else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
        Parameters.ParamByName('Fiscal').Value:= 1;
    end;

    Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
    Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

    if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
      Parameters.ParamByName('Status').Value:= 'PAGO'
    else
      Parameters.ParamByName('Status').Value:= 'PENDENTE';

    Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
    open;
  end;

end;

end.
