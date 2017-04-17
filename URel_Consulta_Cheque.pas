unit URel_Consulta_Cheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Cheque = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBDescricao: TQRDBText;
    QRDBData_Vencimento: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBData_Pagamento: TQRDBText;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText1: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    ADOQuery1: TADOQuery;
    ADOQuery1Emitente: TStringField;
    ADOQuery1Recebido_De: TStringField;
    ADOQuery1Enviado_A: TStringField;
    ADOQuery1Agencia: TStringField;
    ADOQuery1Banco: TStringField;
    ADOQuery1Conta_Corrente: TStringField;
    ADOQuery1Tipo_Cheque: TStringField;
    ADOQuery1Situacao_Cheque: TStringField;
    ADOQuery1Numero_Cheque: TStringField;
    ADOQuery1Valor: TFloatField;
    ADOQuery1Juro: TFloatField;
    ADOQuery1Valor_Final: TFloatField;
    ADOQuery1Data_Entrada: TDateTimeField;
    ADOQuery1Data_Vencimento: TDateTimeField;
    ADOQuery1Data_Saida: TDateTimeField;
    ADOQuery1Observacoes: TStringField;
    ADOQuery1Status: TStringField;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel14: TQRLabel;
    LblConsulta_Por: TQRLabel;
    QRLabel16: TQRLabel;
    LblStatus: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    LblSituacao: TQRLabel;
    QRLabel26: TQRLabel;
    LblPeriodo: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    LblConta: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel35: TQRLabel;
    QRBand1: TQRBand;
    QRLabel22: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel27: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel34: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel37: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
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
  FrmRel_Consulta_Cheque: TFrmRel_Consulta_Cheque;

implementation

uses UConsulta_Historico_Log, UUtilitarios, UDM, UConsulta_Cheque;

{$R *.dfm}

procedure TFrmRel_Consulta_Cheque.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Cheque.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Por.Caption:= 'Número Cheque'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Por.Caption:= 'Emitente'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Por.Caption:= 'Recebido De'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Por.Caption:= 'Enviado A'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 4) then
    LblConsulta_Por.Caption:= 'Data Vencimento'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 5) then
    LblConsulta_Por.Caption:= 'Data Lançamento'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 6) then
    LblConsulta_Por.Caption:= 'Emitente/Data Venc.'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 7) then
    LblConsulta_Por.Caption:= 'Emitente/Data Lanç.'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 8) then
    LblConsulta_Por.Caption:= 'Recebido De/Data Venc.'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 9) then
    LblConsulta_Por.Caption:= 'Recebido De/Data Lanç.';

  if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 0) or (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 1) or
     (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 2) or (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 3) or
     (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 6) or (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 7) or
     (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 8) or (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 9) then
    LblParametro.Caption:= FrmConsulta_Cheque.EdtParametro.Text
  else
  begin
    LblParametro.Enabled:= false;
    LblParametro.Caption:= '';
  end;

  if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 4) or (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 5) or
     (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 6) or (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 7) or
     (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 8) or (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 9) then
  begin
    LblPeriodo.Enabled:= true;
    LblPeriodo.Caption:= FrmConsulta_Cheque.MEdtData_Inicial.Text + ' a ' + FrmConsulta_Cheque.MEdtData_Final.Text;
  end
  else
  begin
    LblPeriodo.Enabled:= false;
    LblPeriodo.Caption:= '';
  end;

  LblConta.Caption:= FrmConsulta_Cheque.EdtConta.Text;

  if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
    LblStatus.Caption:= 'Tudo'
  else if (FrmConsulta_Cheque.RGStatus.ItemIndex = 1) then
    LblStatus.Caption:= 'Lançado'
  else if (FrmConsulta_Cheque.RGStatus.ItemIndex = 2) then
    LblStatus.Caption:= 'Prorrogado'
  else if (FrmConsulta_Cheque.RGStatus.ItemIndex = 3) then
    LblStatus.Caption:= 'Devolvido'
  else if (FrmConsulta_Cheque.RGStatus.ItemIndex = 4) then
    LblStatus.Caption:= 'Baixado';

  if (FrmConsulta_Cheque.RGSituacao.ItemIndex = 0) then
    LblSituacao.Caption:= 'Emitido'
  else if (FrmConsulta_Cheque.RGSituacao.ItemIndex = 1) then
    LblSituacao.Caption:= 'Recebido';

  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select CC.Emitente, CC.Recebido_De, CC.Enviado_A, CA.Numero as Agencia,  (CB.Numero_Banco + ' + QuotedStr(' - ') + ' + CB.Nome) as Banco,');
    add('CCC.Conta_Corrente, CC.Tipo_Cheque, CC.Situacao_Cheque, CC.Numero_Cheque, CC.Valor, CC.Juro, CC.Valor_Final,');
    add('CC.Data_Entrada, CC.Data_Vencimento, CC.Data_Saida, CC.Observacoes, CC.Status from Cadastro_Cheque CC');
    add('left join Cadastro_Agencia CA on (CC.Codigo_Agencia = CA.Codigo_Agencia)');
    add('left join Cadastro_Banco    CB on (CA.Codigo_Banco     = CB.Codigo_Banco)');
    add('left join Cadastro_Conta_Corrente CCC on (CC.Codigo_Conta = CCC.Codigo_Conta_Corrente)');

    if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 0) and (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Numero_Cheque like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%'' and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta');
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 0) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Status = :Status and CC.Numero_Cheque like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%'' and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta');
    end;

    if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 1) and (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Emitente like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%'' and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta');
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 1) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Status = :Status and CC.Emitente like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%'' and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta');
    end;

    if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 2) and (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Recebido_De like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%'' and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta');
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 2) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Status = :Status and CC.Recebido_De like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%'' and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta');
    end;

    if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 3) and (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Enviado_A like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%'' and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta');
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 3) and (FrmConsulta_Cheque.RGStatus.ItemIndex = 1) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Status = :Status and CC.Enviado_A like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%'' and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta');
    end;

    if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 4) and (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Data_Vencimento between :DI and :DF and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta');
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 4) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Status = :Status and CC.Data_Vencimento between :DI and :DF and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta');
    end;

    if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 5) and (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Data_Entrada between :DI and :DF and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta');
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 5) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Status = :Status and CC.Data_Entrada between :DI and :DF and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta');
    end;

    if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 6) and (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Data_Vencimento between :DI and :DF and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta and CC.Emitente like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%''');
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 6) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Status = :Status and CC.Data_Vencimento between :DI and :DF and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta and CC.Emitente like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%''');
    end;

    if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 7) and (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Data_Entrada between :DI and :DF and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta and CC.Emitente like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%''');
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 7) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Status = :Status and CC.Data_Entrada between :DI and :DF and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta and CC.Emitente like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%''');
    end;

    if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 8) and (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Data_Vencimento between :DI and :DF and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta and CC.Recebido_De like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%''');
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 8) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Status = :Status and CC.Data_Vencimento between :DI and :DF and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta and CC.Recebido_De like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%''');
    end;

    if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 9) and (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Data_Entrada between :DI and :DF and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta and CC.Recebido_De like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%''');
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 9) then
    begin
      add('where CC.Codigo_Empresa = :Empresa and CC.Status = :Status and CC.Data_Entrada between :DI and :DF and ');
      add('CC.Situacao_Cheque = :Situacao and CC.Codigo_Conta = :Conta and CC.Recebido_De like '''+ FrmConsulta_Cheque.EdtParametro.Text +'%''');
    end;

    Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;

    if ((FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 4) or (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 5) or
        (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 6) or (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 7) or
        (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 8) or (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 9)) then
    begin
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Final.Text);
    end;

    if (FrmConsulta_Cheque.RGSituacao.ItemIndex = 0) then
    begin
      Parameters.ParamByName('Situacao').Value:= 'EMITIDO';
      Parameters.ParamByName('Conta').Value:= StrToInt(FrmConsulta_Cheque.EdtCodigo_Conta.Text);
    end
    else
    begin
      Parameters.ParamByName('Situacao').Value:= 'RECEBIDO';
      Parameters.ParamByName('Conta').Value:= 0;
    end;

    if (FrmConsulta_Cheque.RGStatus.ItemIndex <> 0) then
    begin
      if (FrmConsulta_Cheque.RGStatus.ItemIndex = 1) then
        Parameters.ParamByName('Status').Value:= 'LANÇADO'
      else if (FrmConsulta_Cheque.RGStatus.ItemIndex = 2) then
        Parameters.ParamByName('Status').Value:= 'PRORROGADO'
      else if (FrmConsulta_Cheque.RGStatus.ItemIndex = 3) then
        Parameters.ParamByName('Status').Value:= 'DEVOLVIDO'
      else if (FrmConsulta_Cheque.RGStatus.ItemIndex = 4) then
        Parameters.ParamByName('Status').Value:= 'BAIXADO';
    end;
    open;

  end;
end;

end.
