unit URel_Consulta_Compra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Compra = class(TForm)
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
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand3: TQRBand;
    QRDBValor: TQRDBText;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    LblStatus: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
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
    QRLabel27: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRLabel38: TQRLabel;
    QRExpr7: TQRExpr;
    QRBand2: TQRBand;
    QRLabel39: TQRLabel;
    QRExpr1: TQRExpr;
    ADOQuery1Codigo: TAutoIncField;
    ADOQuery1N_Pedido: TIntegerField;
    ADOQuery1Data_Pedido: TDateTimeField;
    ADOQuery1Hora_Pedido: TStringField;
    ADOQuery1Data_Previsao_Entrega: TDateTimeField;
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
    ADOQuery1Status: TStringField;
    ADOQuery1Observacoes: TStringField;
    ADOQuery1Data_Baixa: TDateTimeField;
    ADOQuery1Codigo_1: TIntegerField;
    ADOQuery1N_Pedido_1: TIntegerField;
    ADOQuery1Codigo_Produto: TIntegerField;
    ADOQuery1Qtde: TFloatField;
    ADOQuery1Qtde_Recebida: TFloatField;
    ADOQuery1Qtde_Restante: TFloatField;
    ADOQuery1Valor_Unitario: TFloatField;
    ADOQuery1Desconto_1: TFloatField;
    ADOQuery1Tipo_Desconto_1: TStringField;
    ADOQuery1Sub_Total: TFloatField;
    ADOQuery1Status_1: TStringField;
    ADOQuery1Data_Entrega: TDateTimeField;
    ADOQuery1Nome: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Descricao_1: TStringField;
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
  FrmRel_Consulta_Compra: TFrmRel_Consulta_Compra;

implementation

uses UConsulta_Compra, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Consulta_Compra.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Compra.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
    LblStatus.Caption:= 'Pendente'
  else
    LblStatus.Caption:= 'Baixado';

  if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 1) or (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 2) or
     (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 4) or (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 5) then
  begin
    LblData.Enabled:= true;
    LblData.Caption:= 'De ' + FrmConsulta_Compra.MEdtData_Inicial.Text + ' a ' + FrmConsulta_Compra.MEdtData_Final.Text;
  end
  else
    LblData.Enabled:= false;

  if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 0) then
  begin
    LblParametro.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_Compra.EdtPedido.Text;
  end
  else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 3) or (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 4) or
          (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 5) then
  begin
    LblParametro.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_Compra.EdtFornecedor.Text;
  end
  else
    LblParametro.Enabled:= false;

  if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Lancamento.Caption:= 'Pedido'
  else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Lancamento.Caption:= 'Data Pedido'
  else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Lancamento.Caption:= 'Data Prev. Entrega'
  else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Lancamento.Caption:= 'Fornecedor'
  else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 4) then
    LblConsulta_Lancamento.Caption:= 'Data Pedido/Fornecedor'
  else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 5) then
    LblConsulta_Lancamento.Caption:= 'Data Prev. Entrega/Fornecedor';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select C.*, IC.*, Forn.Nome, CP.Descricao, P.Descricao, UM.Sigla from Compra C');
    add('left join Itens_Compra IC on (C.N_Pedido = IC.N_Pedido)');
    add('left join Cadastro_Produtos P on (IC.Codigo_Produto = P.Codigo)');
    add('left join Unidade_Medida UM on (P.Codigo_Unidade = UM.Codigo)');
    add('left join Cadastro_Cliente Forn on (C.Codigo_Fornecedor = Forn.Codigo)');
    add('left join Condicao_Pagamento CP on (C.Codigo_Condicao_Pagamento = CP.Codigo)');

    if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 0) then
    begin
      Add('where C.Codigo_Empresa = :Empresa and C.N_Pedido = :N_Pedido and C.Status = :Status');
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('N_Pedido').Value:= FrmConsulta_Compra.EdtPedido.Text;
      if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';
      Open;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 1) then
    begin
      Add('where C.Codigo_Empresa = :Empresa and C.Data_Pedido between :DI and :DF and C.Status = :Status');
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Final.Text);
      if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';
      Open;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 2) then
    begin
      Add('where C.Codigo_Empresa = :Empresa and C.Data_Previsao_Entrega between :DI and :DF and C.Status = :Status');
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Final.Text);
      if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';
      Open;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 3) then
    begin
      Add('where C.Codigo_Empresa = :Empresa and C.Codigo_Fornecedor = :Forn and C.Status = :Status');
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Compra.EdtCodigo_Fornecedor.Text);
      if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';
      Open;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 4) then
    begin
      Add('where C.Codigo_Empresa = :Empresa and C.Data_Pedido between :DI and :DF and C.Codigo_Fornecedor = :Forn and C.Status = :Status');
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Final.Text);
      Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Compra.EdtCodigo_Fornecedor.Text);
      if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';
      Open;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 5) then
    begin
      Add('where C.Codigo_Empresa = :Empresa and C.Data_Previsao_Entrega between :DI and :DF and C.Codigo_Fornecedor = :Forn and C.Status = :Status');
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Final.Text);
      Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Compra.EdtCodigo_Fornecedor.Text);
      if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';
      Open;
    end;
  end;

end;
end.
