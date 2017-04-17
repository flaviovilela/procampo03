unit URel_Consulta_Patrimonio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Patrimonio = class(TForm)
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
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRLabel22: TQRLabel;
    QRExpr1: TQRExpr;
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
    QRHRule1: TQRHRule;
    qryconsulta_bem: TADOQuery;
    qryconsulta_bemCodigo: TIntegerField;
    qryconsulta_bemCodigo_Propriedade: TIntegerField;
    qryconsulta_bemIdentificacao: TStringField;
    qryconsulta_bemCodigo_Centro_Custo: TIntegerField;
    qryconsulta_bemCodigo_Funcionario: TStringField;
    qryconsulta_bemDescricao: TStringField;
    qryconsulta_bemCodigo_Tipo_Bem_Patrimonial: TIntegerField;
    qryconsulta_bemCodigo_Unidade: TIntegerField;
    qryconsulta_bemPreco_RS: TFloatField;
    qryconsulta_bemPreco_S: TFloatField;
    qryconsulta_bemQuantidade: TFloatField;
    qryconsulta_bemTipo_Bem: TStringField;
    qryconsulta_bemData_Cadastro: TDateTimeField;
    qryconsulta_bemData_Compra: TDateTimeField;
    qryconsulta_bemObservacao: TStringField;
    qryconsulta_bemDescricao_Detalhada: TStringField;
    qryconsulta_bemTipo_Bem_1: TStringField;
    qryconsulta_bemSigla: TStringField;
    QRLabel12: TQRLabel;
    QRExpr3: TQRExpr;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Patrimonio: TFrmRel_Consulta_Patrimonio;

implementation

uses UConsulta_Historico_Log, UUtilitarios, UDM, UConsulta_Cheque,
  UConsulta_Bem_Patrimonial;

{$R *.dfm}

procedure TFrmRel_Consulta_Patrimonio.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Patrimonio.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  if (FrmConsulta_Bem_Patrimonial.RGTipo.ItemIndex = 0) then
  begin
    with qryconsulta_bem, Sql do
    begin
      close;
      Clear;
      Add('select CBP.*, CTBP.Tipo_Bem, UM.Sigla from Cadastro_Bem_Patrimonial CBP');
      Add('left join Cadastro_Tipo_Bem_Patrimonial CTBP on (CBP.Codigo_Tipo_Bem_Patrimonial = CTBP.Codigo)');
      Add('left join Unidade_Medida UM on (CBP.Codigo_Unidade = UM.Codigo)');
      Add('where CBP.Codigo_Propriedade = :Propriedade');
      Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
      open;

    end;
  end
  else
  begin
    with qryconsulta_bem, Sql do
    begin
      close;
      Clear;
      Add('select CBP.*, CTBP.Tipo_Bem, UM.Sigla from Cadastro_Bem_Patrimonial CBP');
      Add('left join Cadastro_Tipo_Bem_Patrimonial CTBP on (CBP.Codigo_Tipo_Bem_Patrimonial = CTBP.Codigo)');
      Add('left join Unidade_Medida UM on (CBP.Codigo_Unidade = UM.Codigo)');
      Add('where CBP.Codigo_Propriedade = :Propriedade and CBP.Codigo_Tipo_Bem_Patrimonial = :Tipo_Bem');
      Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
      Parameters.ParamByName('Tipo_Bem').Value:= StrToInt(FrmConsulta_Bem_Patrimonial.EdtCodigo_Tipo_Bem.Text);
      open;
    end;
  end;

end;

end.
