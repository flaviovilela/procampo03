unit URel_Consulta_Retorno_Cotacao_Preco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Retorno_Cotacao_Preco = class(TForm)
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
    LblParametro: TQRLabel;
    QRLabel13: TQRLabel;
    LblData: TQRLabel;
    QRDBText16: TQRDBText;
    QRChildBand1: TQRChildBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBValor: TQRDBText;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText18: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1N_Cotacao: TIntegerField;
    ADOQuery1Data_Cotacao: TDateTimeField;
    ADOQuery1Data_Retorno: TDateTimeField;
    ADOQuery1Prazo_Entrega: TIntegerField;
    ADOQuery1Codigo_Fornecedor: TIntegerField;
    ADOQuery1Codigo_Condicao_Pagamento: TIntegerField;
    ADOQuery1Responsavel: TStringField;
    ADOQuery1Codigo_Empresa: TIntegerField;
    ADOQuery1Tipo_Frete: TStringField;
    ADOQuery1Valor_Frete: TFloatField;
    ADOQuery1Outras_Despesas: TFloatField;
    ADOQuery1Qtde_Itens: TIntegerField;
    ADOQuery1Total_Produtos: TFloatField;
    ADOQuery1Peso_Total: TFloatField;
    ADOQuery1Desconto: TFloatField;
    ADOQuery1Tipo_Desconto: TStringField;
    ADOQuery1Total_Pedido: TFloatField;
    ADOQuery1Observacoes: TStringField;
    ADOQuery1Codigo_1: TIntegerField;
    ADOQuery1N_Cotacao_1: TIntegerField;
    ADOQuery1Codigo_Produto: TIntegerField;
    ADOQuery1Qtde: TFloatField;
    ADOQuery1Valor_Unitario: TFloatField;
    ADOQuery1Desconto_1: TFloatField;
    ADOQuery1Tipo_Desconto_1: TStringField;
    ADOQuery1Sub_Total: TFloatField;
    ADOQuery1Status: TStringField;
    ADOQuery1Nome: TStringField;
    ADOQuery1Cond_Pag: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Sigla: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Retorno_Cotacao_Preco: TFrmRel_Consulta_Retorno_Cotacao_Preco;

implementation

uses UConsulta_Retorno_Cotacao_Preco, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Consulta_Retorno_Cotacao_Preco.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Retorno_Cotacao_Preco.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 1) or (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 2) or
     (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 3) or (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 4) then
  begin
    LblData.Enabled:= true;
    LblData.Caption:= 'De ' + FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text + ' a ' + FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text;
  end
  else
    LblData.Enabled:= false;

  if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 0) then
  begin
    LblParametro.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_Retorno_Cotacao_Preco.EdtCotacao.Text;
  end
  else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 3) or (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 4) then
  begin
    LblParametro.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_Retorno_Cotacao_Preco.EdtFuncionario.Text;
  end
  else
    LblParametro.Enabled:= false;

  if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Lancamento.Caption:= 'Cotação'
  else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Lancamento.Caption:= 'Data Cotação'
  else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Lancamento.Caption:= 'Data Retorno'
  else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Lancamento.Caption:= 'Fornecedor / Data Cotação'
  else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 4) then
    LblConsulta_Lancamento.Caption:= 'Fornecedor / Data Retorno';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select RC.*, IRC.*, Forn.Nome, CP.Descricao as Cond_Pag, P.Descricao, UM.Sigla from Retorno_Cotacao_Preco RC');
    add('inner join Itens_Retorno_Cotacao_Preco IRC on (RC.Codigo = IRC.Codigo)');
    add('inner join Cadastro_Cliente Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
    add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
    add('left join Cadastro_Produtos P on (P.Codigo = IRC.Codigo_Produto)');
    add('left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade)');

    if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 0) then
    begin
      sql.Add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :Cotacao');
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('Cotacao').Value:= StrToInt(FrmConsulta_Retorno_Cotacao_Preco.EdtCotacao.Text);
      open;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 1) then
    begin
      sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Data_Cotacao between :DI and :DF');
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text);
      open;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 2) then
    begin
      sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Data_Retorno between :DI and :DF');
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text);
      open;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 3) then
    begin
      sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo and RC.Data_Cotacao between :DI and :DF');
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text);
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text);
      open;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 4) then
    begin
      sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo and RC.Data_Retorno between :DI and :DF');
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text);
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text);
      open;
    end;
  end;

end;
end.
