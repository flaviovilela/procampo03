unit URel_Consulta_Lancamento_Financeiro_Sintetico_Agrupado_Plano;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_Agrupado_Plano = class(TForm)
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
    LblConsulta_Lancamento: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel4: TQRLabel;
    LblDe: TQRLabel;
    LblTipo_Conta: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    LblAte: TQRLabel;
    ADOQuery1: TADOQuery;
    QRBand3: TQRBand;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1N_Documento: TIntegerField;
    ADOQuery1Codigo_Empresa: TIntegerField;
    ADOQuery1Tipo: TStringField;
    ADOQuery1Codigo_Cli_For: TIntegerField;
    ADOQuery1Historico: TStringField;
    ADOQuery1Data_Lancamento: TDateTimeField;
    ADOQuery1Data_Vencimento: TDateTimeField;
    ADOQuery1Valor: TFloatField;
    ADOQuery1Nome: TStringField;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    ADOQuery1Data_Pagamento: TDateTimeField;
    QRDBText1: TQRDBText;
    ADOQuery1Cheque: TStringField;
    ADOQuery1Conta: TStringField;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel39: TQRLabel;
    LblFiscal: TQRLabel;
    QRLabel7: TQRLabel;
    LblSafra: TQRLabel;
    QRDBText4: TQRDBText;
    ADOQuery1Observacoes: TStringField;
    ChildBand1: TQRChildBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand2: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr3: TQRExpr;
    ADOQuery1Plano: TStringField;
    ADOQuery1Codigo_Plano: TIntegerField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Agrupado_Plano: TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_Agrupado_Plano;

implementation

uses UDM, UConsulta_Lancamentos_Financeiros, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_Agrupado_Plano.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_Agrupado_Plano.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblParametro.Caption:= '';
  LblParametro.Caption:= FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text;
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

  if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) then
    LblConsulta_Lancamento.Caption:= 'Tudo'
  else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
    LblConsulta_Lancamento.Caption:= 'Documento'
  else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) then
    LblConsulta_Lancamento.Caption:= 'Cli./Forn.'
  else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) then
    LblConsulta_Lancamento.Caption:= 'Plano Financeiro';

  if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
    LblTipo_Conta.Caption:= 'Débito'
  else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
    LblTipo_Conta.Caption:= 'Crédito';

  if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
    LblFiscal.Caption:= 'Tudo'
  else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
    LblFiscal.Caption:= 'Sim'
  else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
    LblFiscal.Caption:= 'Não';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with ADOQuery1, sql do
    begin
      close;
      sql.clear;
      add('declare @P varchar(1)');
      add('set @P = :PPP');

      sql.add('select PL.Codigo, PL.N_Documento, LF.Observacoes, LF.Codigo_Empresa, LF.Tipo, LF.Codigo_Cli_For, ');
      sql.add('LF.Historico, LF.Data_Lancamento, PL.Data_Vencimento, PL.Data_Pagamento, PL.Valor, PL.Status, ');
      sql.Add('PL.Cheque, PL.Conta, Cli.Nome, LF.Codigo_Plano, PF.Descricao as Plano from Lancamento_Financeiro LF');
      sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
      sql.add('left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');
      sql.add('left join Cadastro_Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)');

      if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan ')
        else
        begin
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan ');
          if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
            Parameters.ParamByName('Fiscal').Value:= 0
          else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
            Parameters.ParamByName('Fiscal').Value:= 1;
        end;

        sql.Add('order by ');
        sql.Add('case when @P = 0 then PL.Codigo end,');
        sql.Add('case when @P = 1 then Cli.Nome end,');
        sql.Add('case when @P = 2 then LF.Data_Lancamento end,');
        sql.add('case when @P = 3 then PL.Data_Vencimento end,');
        sql.Add('case when @P = 4 then PL.Data_Pagamento end,');
        sql.Add('case when @P = 5 then PF.Descricao end');

        Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
        Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

        if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
          //Parameters.ParamByName('Status').Value:= 'PAGO';
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
        begin
          Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
          //Parameters.ParamByName('Status').Value:= 'PENDENTE';
        end;
        Parameters.ParamByName('PPP').Value:= FrmConsulta_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan ')
        else
        begin
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan ');
          if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
            Parameters.ParamByName('Fiscal').Value:= 0
          else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
            Parameters.ParamByName('Fiscal').Value:= 1;
        end;

        sql.Add('order by ');
        sql.Add('case when @P = 0 then PL.Codigo end,');
        sql.Add('case when @P = 1 then Cli.Nome end,');
        sql.Add('case when @P = 2 then LF.Data_Lancamento end,');
        sql.add('case when @P = 3 then PL.Data_Vencimento end,');
        sql.Add('case when @P = 4 then PL.Data_Pagamento end,');
        sql.Add('case when @P = 5 then PF.Descricao end');

        Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
        Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

        if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
          //Parameters.ParamByName('Status').Value:= 'PAGO';
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
        begin
          Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
          //Parameters.ParamByName('Status').Value:= 'PENDENTE';
        end;
        Parameters.ParamByName('PPP').Value:= FrmConsulta_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan ')
        else
        begin
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan ');
          if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
            Parameters.ParamByName('Fiscal').Value:= 0
          else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
            Parameters.ParamByName('Fiscal').Value:= 1;
        end;

        sql.Add('order by ');
        sql.Add('case when @P = 0 then PL.Codigo end,');
        sql.Add('case when @P = 1 then Cli.Nome end,');
        sql.Add('case when @P = 2 then LF.Data_Lancamento end,');
        sql.add('case when @P = 3 then PL.Data_Vencimento end,');
        sql.Add('case when @P = 4 then PL.Data_Pagamento end,');
        sql.Add('case when @P = 5 then PF.Descricao end');

        Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
        Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);


        if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
          //Parameters.ParamByName('Status').Value:= 'PAGO';
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
        begin
          Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
          //Parameters.ParamByName('Status').Value:= 'PENDENTE';
        end;
        Parameters.ParamByName('PPP').Value:= FrmConsulta_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex;
        open;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan ')
          else
          begin
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan ');
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
              Parameters.ParamByName('Fiscal').Value:= 0
            else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
              Parameters.ParamByName('Fiscal').Value:= 1;
          end;

          sql.Add('order by ');
          sql.Add('case when @P = 0 then PL.Codigo end,');
          sql.Add('case when @P = 1 then Cli.Nome end,');
          sql.Add('case when @P = 2 then LF.Data_Lancamento end,');
          sql.add('case when @P = 3 then PL.Data_Vencimento end,');
          sql.Add('case when @P = 4 then PL.Data_Pagamento end,');
          sql.Add('case when @P = 5 then PF.Descricao end');

          Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
          Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
          Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text;

          if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
            //Parameters.ParamByName('Status').Value:= 'PAGO';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
            //Parameters.ParamByName('Status').Value:= 'PENDENTE';
          end;
          Parameters.ParamByName('PPP').Value:= FrmConsulta_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan ')
          else
          begin
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan ');
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
              Parameters.ParamByName('Fiscal').Value:= 0
            else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
              Parameters.ParamByName('Fiscal').Value:= 1;
          end;

          sql.Add('order by ');
          sql.Add('case when @P = 0 then PL.Codigo end,');
          sql.Add('case when @P = 1 then Cli.Nome end,');
          sql.Add('case when @P = 2 then LF.Data_Lancamento end,');
          sql.add('case when @P = 3 then PL.Data_Vencimento end,');
          sql.Add('case when @P = 4 then PL.Data_Pagamento end,');
          sql.Add('case when @P = 5 then PF.Descricao end');

          Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
          Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
          Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text;

          if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
            //Parameters.ParamByName('Status').Value:= 'PAGO';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
            //Parameters.ParamByName('Status').Value:= 'PENDENTE';
          end;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          Parameters.ParamByName('PPP').Value:= FrmConsulta_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan ')
          else
          begin
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan ');
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
              Parameters.ParamByName('Fiscal').Value:= 0
            else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
              Parameters.ParamByName('Fiscal').Value:= 1;
          end;

          sql.Add('order by ');
          sql.Add('case when @P = 0 then PL.Codigo end,');
          sql.Add('case when @P = 1 then Cli.Nome end,');
          sql.Add('case when @P = 2 then LF.Data_Lancamento end,');
          sql.add('case when @P = 3 then PL.Data_Vencimento end,');
          sql.Add('case when @P = 4 then PL.Data_Pagamento end,');
          sql.Add('case when @P = 5 then PF.Descricao end');

          Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
          Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
          Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text;

          if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
            //Parameters.ParamByName('Status').Value:= 'PAGO';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
            //Parameters.ParamByName('Status').Value:= 'PENDENTE';
          end;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          Parameters.ParamByName('PPP').Value:= FrmConsulta_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex;
        end;
        open;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF ')
          else
          begin
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF ');
            sql.Add('by PL.Data_Pagamento, PL.Data_Vencimento');
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
              Parameters.ParamByName('Fiscal').Value:= 0
            else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
              Parameters.ParamByName('Fiscal').Value:= 1;
          end;

          sql.Add('order by ');
          sql.Add('case when @P = 0 then PL.Codigo end,');
          sql.Add('case when @P = 1 then Cli.Nome end,');
          sql.Add('case when @P = 2 then LF.Data_Lancamento end,');
          sql.add('case when @P = 3 then PL.Data_Vencimento end,');
          sql.Add('case when @P = 4 then PL.Data_Pagamento end,');
          sql.Add('case when @P = 5 then PF.Descricao end');

          Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
          Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
          Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;

          if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
            //Parameters.ParamByName('Status').Value:= 'PAGO';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
            //Parameters.ParamByName('Status').Value:= 'PENDENTE';
          end;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          Parameters.ParamByName('PPP').Value:= FrmConsulta_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF ')
          else
          begin
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
            sql.add('');
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
              Parameters.ParamByName('Fiscal').Value:= 0
            else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
              Parameters.ParamByName('Fiscal').Value:= 1;
          end;

          sql.Add('order by ');
          sql.Add('case when @P = 0 then PL.Codigo end,');
          sql.Add('case when @P = 1 then Cli.Nome end,');
          sql.Add('case when @P = 2 then LF.Data_Lancamento end,');
          sql.add('case when @P = 3 then PL.Data_Vencimento end,');
          sql.Add('case when @P = 4 then PL.Data_Pagamento end,');
          sql.Add('case when @P = 5 then PF.Descricao end');

          Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
          Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
          Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;

          if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
            //Parameters.ParamByName('Status').Value:= 'PAGO';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
            //Parameters.ParamByName('Status').Value:= 'PENDENTE';
          end;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          Parameters.ParamByName('PPP').Value:= FrmConsulta_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF ')
          else
          begin
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
            sql.Add('');
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
              Parameters.ParamByName('Fiscal').Value:= 0
            else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
              Parameters.ParamByName('Fiscal').Value:= 1;
          end;

          sql.Add('order by ');
          sql.Add('case when @P = 0 then PL.Codigo end,');
          sql.Add('case when @P = 1 then Cli.Nome end,');
          sql.Add('case when @P = 2 then LF.Data_Lancamento end,');
          sql.add('case when @P = 3 then PL.Data_Vencimento end,');
          sql.Add('case when @P = 4 then PL.Data_Pagamento end,');
          sql.Add('case when @P = 5 then PF.Descricao end');

          Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
          Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
          Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
          if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
            //Parameters.ParamByName('Status').Value:= 'PAGO';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
            //Parameters.ParamByName('Status').Value:= 'PENDENTE';
          end;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          Parameters.ParamByName('PPP').Value:= FrmConsulta_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex;
        end
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF ')
          else
          begin
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF ');
            sql.Add('by PL.Data_Pagamento, PL.Data_Vencimento');
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
              Parameters.ParamByName('Fiscal').Value:= 0
            else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
              Parameters.ParamByName('Fiscal').Value:= 1;
          end;

          sql.Add('order by ');
          sql.Add('case when @P = 0 then PL.Codigo end,');
          sql.Add('case when @P = 1 then Cli.Nome end,');
          sql.Add('case when @P = 2 then LF.Data_Lancamento end,');
          sql.add('case when @P = 3 then PL.Data_Vencimento end,');
          sql.Add('case when @P = 4 then PL.Data_Pagamento end,');
          sql.Add('case when @P = 5 then PF.Descricao end');

          Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
          Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
          Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;

          if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
            //Parameters.ParamByName('Status').Value:= 'PAGO';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
            //Parameters.ParamByName('Status').Value:= 'PENDENTE';
          end;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          Parameters.ParamByName('PPP').Value:= FrmConsulta_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF ')
          else
          begin
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
            sql.add('');
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
              Parameters.ParamByName('Fiscal').Value:= 0
            else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
              Parameters.ParamByName('Fiscal').Value:= 1;
          end;

          sql.Add('order by ');
          sql.Add('case when @P = 0 then PL.Codigo end,');
          sql.Add('case when @P = 1 then Cli.Nome end,');
          sql.Add('case when @P = 2 then LF.Data_Lancamento end,');
          sql.add('case when @P = 3 then PL.Data_Vencimento end,');
          sql.Add('case when @P = 4 then PL.Data_Pagamento end,');
          sql.Add('case when @P = 5 then PF.Descricao end');

          Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
          Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
          Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;

          if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
            //Parameters.ParamByName('Status').Value:= 'PAGO';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
            //Parameters.ParamByName('Status').Value:= 'PENDENTE';
          end;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          Parameters.ParamByName('PPP').Value:= FrmConsulta_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF ')
          else
          begin
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
              Parameters.ParamByName('Fiscal').Value:= 0
            else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
              Parameters.ParamByName('Fiscal').Value:= 1;
          end;

          sql.Add('order by ');
          sql.Add('case when @P = 0 then PL.Codigo end,');
          sql.Add('case when @P = 1 then Cli.Nome end,');
          sql.Add('case when @P = 2 then LF.Data_Lancamento end,');
          sql.add('case when @P = 3 then PL.Data_Vencimento end,');
          sql.Add('case when @P = 4 then PL.Data_Pagamento end,');
          sql.Add('case when @P = 5 then PF.Descricao end');

          Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
          Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
          Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
          if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
            //Parameters.ParamByName('Status').Value:= 'PAGO';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
            //Parameters.ParamByName('Status').Value:= 'PENDENTE';
          end;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          Parameters.ParamByName('PPP').Value:= FrmConsulta_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex;
        end
      end;
      open;
    end;
end;
end.
