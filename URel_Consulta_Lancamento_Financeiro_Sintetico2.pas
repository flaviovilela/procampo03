unit URel_Consulta_Lancamento_Financeiro_Sintetico2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Lancamento_Financeiro_Sintetico2 = class(TForm)
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
    QRLabel10: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel4: TQRLabel;
    LblDe: TQRLabel;
    LblTipo_Conta: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    LblAte: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRBand3: TQRBand;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel39: TQRLabel;
    LblFiscal: TQRLabel;
    QRLabel7: TQRLabel;
    LblSafra: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    qryconsulta_sintetico_2: TADOQuery;
    qryconsulta_sintetico_2Codigo: TIntegerField;
    qryconsulta_sintetico_2Tipo: TStringField;
    qryconsulta_sintetico_2N_Documento: TIntegerField;
    qryconsulta_sintetico_2Codigo_Empresa: TIntegerField;
    qryconsulta_sintetico_2Codigo_Forma_Pagamento: TIntegerField;
    qryconsulta_sintetico_2Codigo_Cli_For: TIntegerField;
    qryconsulta_sintetico_2Codigo_Tipo_Documento: TIntegerField;
    qryconsulta_sintetico_2Historico: TStringField;
    qryconsulta_sintetico_2Codigo_Departamento: TIntegerField;
    qryconsulta_sintetico_2Codigo_Plano: TIntegerField;
    qryconsulta_sintetico_2Codigo_Safra: TIntegerField;
    qryconsulta_sintetico_2Data_Lancamento: TDateTimeField;
    qryconsulta_sintetico_2Data_Vencimento: TDateTimeField;
    qryconsulta_sintetico_2Valor_Documento: TFloatField;
    qryconsulta_sintetico_2Desconto: TFloatField;
    qryconsulta_sintetico_2Multa: TFloatField;
    qryconsulta_sintetico_2Valor_Cobrado: TFloatField;
    qryconsulta_sintetico_2Observacoes: TStringField;
    qryconsulta_sintetico_2Status: TStringField;
    qryconsulta_sintetico_2Fiscal: TIntegerField;
    qryconsulta_sintetico_2Codigo_1: TIntegerField;
    qryconsulta_sintetico_2N_Documento_1: TIntegerField;
    qryconsulta_sintetico_2Data_Vencimento_1: TDateTimeField;
    qryconsulta_sintetico_2Data_Pagamento: TDateTimeField;
    qryconsulta_sintetico_2Parcela: TIntegerField;
    qryconsulta_sintetico_2Status_1: TStringField;
    qryconsulta_sintetico_2Valor: TFloatField;
    qryconsulta_sintetico_2Cheque: TStringField;
    qryconsulta_sintetico_2Conta: TStringField;
    qryconsulta_sintetico_2Codigo_Lancamento_Bancario: TIntegerField;
    qryconsulta_sintetico_2Nome: TStringField;
    qryconsulta_sintetico_2Descricao: TStringField;
    LblStatus: TQRLabel;
    QRLabel12: TQRLabel;
    LblData: TQRLabel;
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
  FrmRel_Consulta_Lancamento_Financeiro_Sintetico2: TFrmRel_Consulta_Lancamento_Financeiro_Sintetico2;

implementation

uses UDM, UConsulta_Lancamentos_Financeiros, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Consulta_Lancamento_Financeiro_Sintetico2.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Sintetico2.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblParametro.Caption:= '';
  LblParametro.Caption:= FrmConsulta_Lancamentos_Financeiros.EdtLancamento_Bancario.Text;

  if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
    LblStatus.Caption:= 'Pago'
  else
    LblStatus.Caption:= 'Pendente';

  if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
    LblData.Caption:= 'Lançamento'
  else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
    LblData.Caption:= 'Vencimento'
  else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
    LblData.Caption:= 'Pagamento';

  if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
  begin
    LblDe.Caption:= '';
    LblAte.Caption:= '';
  end
  else
  begin
    LblDe.Caption:= FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text;
    LblAte.Caption:= FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text;
  end;

  LblSafra.Caption:= FrmConsulta_Lancamentos_Financeiros.EdtSafra.Text;

  if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
    LblTipo_Conta.Caption:= 'À Pagar'
  else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
    LblTipo_Conta.Caption:= 'À Receber';

  if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
    LblFiscal.Caption:= 'Tudo'
  else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
    LblFiscal.Caption:= 'Sim'
  else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
    LblFiscal.Caption:= 'Não';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with qryconsulta_sintetico_2 do
    begin
      close;
      sql.clear;
      sql.add('select LF.*, PL.*, Cli.Nome, CP.Descricao');
      sql.add('from Lancamento_Financeiro LF');
      sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
      sql.add('left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');
      sql.add('left join Condicao_Pagamento CP on(LF.Codigo_Forma_Pagamento = CP.Codigo)');

      if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status and PL.Codigo_Lancamento_Bancario = :Codigo_Lancamento_Bancario')
        else
        begin
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status and PL.Codigo_Lancamento_Bancario = :Codigo_Lancamento_Bancario');
        end;

      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status and PL.Codigo_Lancamento_Bancario = :Codigo_Lancamento_Bancario')
        else
        begin
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status and PL.Codigo_Lancamento_Bancario = :Codigo_Lancamento_Bancario');
        end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status and PL.Codigo_Lancamento_Bancario = :Codigo_Lancamento_Bancario')
        else
        begin
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status and PL.Codigo_Lancamento_Bancario = :Codigo_Lancamento_Bancario');
        end;
      end;

      Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
      if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
        Parameters.ParamByName('Fiscal').Value:= 0
      else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
        Parameters.ParamByName('Fiscal').Value:= 1;

        Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

        if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
        begin
          Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';

        end;

        if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        Parameters.ParamByName('Codigo_Lancamento_Bancario').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Lancamento_Bancario.Text);

        open;
    end;
end;
end.
