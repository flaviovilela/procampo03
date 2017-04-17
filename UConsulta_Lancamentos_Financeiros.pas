unit UConsulta_Lancamentos_Financeiros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios, QuickRpt, Buttons;

type
  TFrmConsulta_Lancamentos_Financeiros = class(TForm)
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_lancamento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    ds_qry_consulta_parcelas: TDataSource;
    qryconsulta_parcelas: TADOQuery;
    qryconsulta_parcelasCodigo: TIntegerField;
    qryconsulta_parcelasN_Documento: TIntegerField;
    qryconsulta_parcelasData_Vencimento: TDateTimeField;
    qryconsulta_parcelasData_Pagamento: TDateTimeField;
    qryconsulta_parcelasParcela: TIntegerField;
    qryconsulta_parcelasStatus: TStringField;
    qryconsulta_parcelasValor: TFloatField;
    qryconsulta_parcelasDinheiro: TFloatField;
    qryconsulta_parcelasCheque_Vista: TFloatField;
    qryconsulta_parcelasCheque_Prazo: TFloatField;
    qryconsulta_parcelasCartao: TFloatField;
    qryconsulta_parcelasJuros: TFloatField;
    qryconsulta_parcelasDesconto: TFloatField;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    DataSource1: TDataSource;
    Panel3: TPanel;
    DBGrid3: TDBGrid;
    qryconsulta_parcelasCheque: TStringField;
    qryconsulta_parcelasConta: TStringField;
    TabSheet3: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    RGConsulta_Lancamento: TRadioGroup;
    EdtConsulta: TEdit;
    RGData: TRadioGroup;
    RGTipo_Conta: TRadioGroup;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    EdtCodigo_Cli_For: TEdit;
    RGTipo: TRadioGroup;
    RGStatus: TRadioGroup;
    RGFiscal: TRadioGroup;
    Label1: TLabel;
    EdtSafra: TEdit;
    EdtCodigo_Safra: TEdit;
    qryconsulta_lancamentoCodigo: TIntegerField;
    qryconsulta_lancamentoTipo: TStringField;
    qryconsulta_lancamentoN_Documento: TIntegerField;
    qryconsulta_lancamentoCodigo_Empresa: TIntegerField;
    qryconsulta_lancamentoCodigo_Forma_Pagamento: TIntegerField;
    qryconsulta_lancamentoCodigo_Cli_For: TIntegerField;
    qryconsulta_lancamentoCodigo_Tipo_Documento: TIntegerField;
    qryconsulta_lancamentoHistorico: TStringField;
    qryconsulta_lancamentoCodigo_Departamento: TIntegerField;
    qryconsulta_lancamentoCodigo_Plano: TIntegerField;
    qryconsulta_lancamentoCodigo_Safra: TIntegerField;
    qryconsulta_lancamentoData_Lancamento: TDateTimeField;
    qryconsulta_lancamentoData_Vencimento: TDateTimeField;
    qryconsulta_lancamentoValor_Documento: TFloatField;
    qryconsulta_lancamentoDesconto: TFloatField;
    qryconsulta_lancamentoMulta: TFloatField;
    qryconsulta_lancamentoValor_Cobrado: TFloatField;
    qryconsulta_lancamentoStatus: TStringField;
    qryconsulta_lancamentoFiscal: TIntegerField;
    qryconsulta_lancamentoCodigo_1: TIntegerField;
    qryconsulta_lancamentoN_Documento_1: TIntegerField;
    qryconsulta_lancamentoData_Vencimento_1: TDateTimeField;
    qryconsulta_lancamentoData_Pagamento: TDateTimeField;
    qryconsulta_lancamentoParcela: TIntegerField;
    qryconsulta_lancamentoStatus_1: TStringField;
    qryconsulta_lancamentoValor: TFloatField;
    qryconsulta_lancamentoCheque: TStringField;
    qryconsulta_lancamentoConta: TStringField;
    qryconsulta_lancamentoNome: TStringField;
    qryconsulta_lancamentoDescricao: TStringField;
    qryconsulta_lancamentoDescricao_1: TStringField;
    qryconsulta_lancamentoDescricao_2: TStringField;
    qryconsulta_lancamentoPlano: TStringField;
    TabSheet4: TTabSheet;
    QRCompositeReport1: TQRCompositeReport;
    Panel4: TPanel;
    DBGrid4: TDBGrid;
    Panel5: TPanel;
    DBGrid5: TDBGrid;
    DataSource2: TDataSource;
    qrypagar_agrupado: TADOQuery;
    qrypagar_agrupadoCodigo: TIntegerField;
    qrypagar_agrupadoN_Documento: TIntegerField;
    qrypagar_agrupadoCodigo_Empresa: TIntegerField;
    qrypagar_agrupadoTipo: TStringField;
    qrypagar_agrupadoHistorico: TStringField;
    qrypagar_agrupadoData_Vencimento: TDateTimeField;
    qrypagar_agrupadoData_Pagamento: TDateTimeField;
    qrypagar_agrupadoValor: TFloatField;
    qrypagar_agrupadoStatus: TStringField;
    qryreceber_agrupado: TADOQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField1: TFloatField;
    StringField3: TStringField;
    DataSource3: TDataSource;
    qrypagar_agrupadoCheque: TStringField;
    qrypagar_agrupadoConta: TStringField;
    qrypagar_agrupadoNome: TStringField;
    qryreceber_agrupadoCheque: TStringField;
    qryreceber_agrupadoConta: TStringField;
    qryreceber_agrupadoNome: TStringField;
    TabSheet1: TTabSheet;
    qryagrupado_plano: TADOQuery;
    DataSource4: TDataSource;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    DBGrid2: TDBGrid;
    BitBtn2: TBitBtn;
    TabSheet6: TTabSheet;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    qryagrupado_planoMes: TStringField;
    qryagrupado_planoDescricao: TStringField;
    qryagrupado_planoValor_Total: TFloatField;
    qryagrupado_planoPercentual: TFloatField;
    qryagrupado_cli_forn: TADOQuery;
    qryagrupado_cli_fornMes: TStringField;
    qryagrupado_cli_fornNome: TStringField;
    qryagrupado_cli_fornValor_Total: TFloatField;
    qryagrupado_cli_fornPercentual: TFloatField;
    DataSource5: TDataSource;
    RGOrdena_Por: TRadioGroup;
    qryconsulta_lancamento_sintetico: TADOQuery;
    qryconsulta_lancamento_sinteticoCodigo: TIntegerField;
    qryconsulta_lancamento_sinteticoN_Documento: TIntegerField;
    qryconsulta_lancamento_sinteticoCodigo_Empresa: TIntegerField;
    qryconsulta_lancamento_sinteticoTipo: TStringField;
    qryconsulta_lancamento_sinteticoCodigo_Cli_For: TIntegerField;
    qryconsulta_lancamento_sinteticoHistorico: TStringField;
    qryconsulta_lancamento_sinteticoData_Lancamento: TDateTimeField;
    qryconsulta_lancamento_sinteticoData_Vencimento: TDateTimeField;
    qryconsulta_lancamento_sinteticoData_Pagamento: TDateTimeField;
    qryconsulta_lancamento_sinteticoValor: TFloatField;
    qryconsulta_lancamento_sinteticoStatus: TStringField;
    qryconsulta_lancamento_sinteticoCheque: TStringField;
    qryconsulta_lancamento_sinteticoConta: TStringField;
    qryconsulta_lancamento_sinteticoNome: TStringField;
    qryconsulta_lancamento_sinteticoObservacoes: TStringField;
    RGAgrupa_Impressao: TRadioGroup;
    Label3: TLabel;
    EdtLancamento_Bancario: TEdit;
    EdtCodigo_Lancamento_Bancario: TEdit;
    TabSheet7: TTabSheet;
    Panel1: TPanel;
    DBGrid6: TDBGrid;
    qryconsulta_sintetico_2: TADOQuery;
    DataSource6: TDataSource;
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
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtCodigo_Cli_ForKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RGConsulta_ParcelaEnter(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_Cli_ForKeyPress(Sender: TObject; var Key: Char);
    procedure RGTipoClick(Sender: TObject);
    procedure EdtCodigo_SafraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RGConsulta_LancamentoClick(Sender: TObject);
    procedure RGAgrupa_ImpressaoClick(Sender: TObject);
    procedure EdtCodigo_Lancamento_BancarioKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtLancamento_BancarioKeyPress(Sender: TObject; var Key: Char);
    procedure RGTipo_ContaClick(Sender: TObject);
  private
    { Private declarations }
  public
    ativo: boolean;
    imp, imp_agru: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Lancamentos_Financeiros: TFrmConsulta_Lancamentos_Financeiros;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Cliente, UChama_Plano_Financeiro, URel_Consulta_Lancamento_Financeiro,
  UChama_Condicao_Pagamento, UChama_Departamento, UChama_Tipo_Documento,
  URel_Consulta_Lancamento_Financeiro_Sintetico, UChama_Safra,
  URel_Consulta_Lancamento_Financeiro_Agrupado,
  URel_Consulta_Lancamento_Financeiro_Agrupado_Cliente,
  URel_Consulta_Lancamento_Financeiro_Agrupado_Plano,
  URel_Consulta_Lancamento_Financeiro_Sintetico_Agrupado_Plano,
  UChama_Lancamento_Banco, URel_Consulta_Lancamento_Financeiro_Sintetico2;

{$R *.dfm}

procedure TFrmConsulta_Lancamentos_Financeiros.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.BBtnFiltrarClick(Sender: TObject);
begin
  if (RGTipo.ItemIndex = 0) then
  begin
    Consulta.Consulta_Lancamento_Financeiro_Sintetico;
    BBtnImprimir.Enabled:= true;
    PageControl1.TabIndex:= 1;
  end
  else if (RGTipo.ItemIndex = 1) then
  begin
    Consulta.Consulta_Lancamento_Financeiro_Pagar_Agrupado;
    Consulta.Consulta_Lancamento_Financeiro_Receber_Agrupado;
    BBtnImprimir.Enabled:= true;
    PageControl1.TabIndex:= 2;
  end
  else if (RGTipo.ItemIndex = 2) then
  begin
    if (RGConsulta_Lancamento.ItemIndex = 2) and (RGData.ItemIndex <> 0) then
    begin
      Consulta.Consulta_Lancamento_Financeiro_Agrupado_Cli_Forn;
      PageControl1.TabIndex:= 3;
      PageControl2.TabIndex:= 0;
    end
    else if (RGConsulta_Lancamento.ItemIndex = 3) and (RGData.ItemIndex <> 0) then
    begin
      Consulta.Consulta_Lancamento_Financeiro_Agrupado_PF;
      PageControl1.TabIndex:= 3;
      PageControl2.TabIndex:= 1;
    end
    else
    begin
      if (FrmConsulta_Lancamentos_Financeiros.qryagrupado_cli_forn.IsEmpty) then
      begin
        Application.MessageBox('Escolha a opção Cli./Forn ou Plano Financeiro. A opção Data de Lançamento não pode ser escolhida.', 'Fim da Pesquisa', MB_OK+MB_ICONEXCLAMATION);
        Abort;
      end;
    end;
  end
  else if (RGTipo.ItemIndex = 3) then
  begin
    Consulta.Consulta_Lanacmento_Financeiro_Sintetico2;
    BBtnImprimir.Enabled:= true;
    PageControl1.TabIndex:= 4;
  end;

  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.BBtnImprimirClick(
  Sender: TObject);
begin
  {if (RGTipo.ItemIndex = 0) then
  begin
    FrmRel_Consulta_Lancamento_Financeiro:= TFrmRel_Consulta_Lancamento_Financeiro.create(self);
    FrmRel_Consulta_Lancamento_Financeiro.Release;
    FrmRel_Consulta_Lancamento_Financeiro:= Nil;
  end
  else }if (RGTipo.ItemIndex = 0) then
  begin
    if (RGAgrupa_Impressao.ItemIndex = 0) then
    begin
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico:= TFrmRel_Consulta_Lancamento_Financeiro_Sintetico.create(self);
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico.Release;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico:= Nil;
    end
    else if (RGAgrupa_Impressao.ItemIndex = 1) then
    begin
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Agrupado_Plano:= TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_Agrupado_Plano.create(self);
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Agrupado_Plano.Release;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Agrupado_Plano:= Nil;
    end;
  end
  else if (RGTipo.ItemIndex = 1) then
  begin
    FrmRel_Consulta_Lancamento_Financeiro_Agrupado:= TFrmRel_Consulta_Lancamento_Financeiro_Agrupado.create(self);
    FrmRel_Consulta_Lancamento_Financeiro_Agrupado.Release;
    FrmRel_Consulta_Lancamento_Financeiro_Agrupado:= Nil;
  end
  else if (RGTipo.ItemIndex = 3) then
  begin
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico2:= TFrmRel_Consulta_Lancamento_Financeiro_Sintetico2.create(self);
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico2.Release;
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico2:= Nil;
  end;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_lancamento.close;
  qryconsulta_lancamento_sintetico.close;
  qryconsulta_parcelas.close;
  qrypagar_agrupado.Close;
  qryreceber_agrupado.Close;
  qryagrupado_plano.Close;
  qryagrupado_cli_forn.Close;
  qryconsulta_sintetico_2.Close;
  PageControl1.TabIndex:= 0;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  EdtConsulta.SetFocus;
  BBtnImprimir.Enabled:= false;
  //EdtConsulta.Clear;
  //EdtCodigo_Cli_For.Clear;
  //MEdtData_Final.Clear;
  //MEdtData_Inicial.Clear;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.BitBtn1Click(Sender: TObject);
begin
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Plano:= TFrmRel_Consulta_Lancamento_Financeiro_Agrupado_Plano.create(self);
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Plano.Release;
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Plano:= Nil;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.BitBtn2Click(Sender: TObject);
begin
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Cliente:= TFrmRel_Consulta_Lancamento_Financeiro_Agrupado_Cliente.create(self);
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Cliente.Release;
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Cliente:= Nil;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.DBGrid1CellClick(
  Column: TColumn);
begin
  Consulta.Consulta_Parcelas_Lancamento;
  {if (Consulta.Consulta_Pagamento_Lancamento = false) then
    Application.MessageBox('Não há pagamentos efetuados por esse documento', 'Pagamento não encontrado', MB_OK+MB_ICONQUESTION);}
end;

procedure TFrmConsulta_Lancamentos_Financeiros.DBGrid1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmConsulta_Lancamentos_Financeiros.DBGrid2CellClick(
  Column: TColumn);
var
  qAux: TADOQuery;
begin
  {if (RGConsulta_Parcela.ItemIndex = 0) or (RGConsulta_Parcela.ItemIndex = 1) or (RGConsulta_Parcela.ItemIndex = 2) or (RGConsulta_Parcela.ItemIndex = 3) or (RGConsulta_Parcela.ItemIndex = 4) then
  begin
    qAux:= TADOQuery.Create(self);
    try
      with qAux, sql do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Select LF.* from Lancamento_Financeiro LF');
        add('inner join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
        add('where PL.Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value:= qryconsulta_parcelasCodigo.AsInteger;
        open;
      end;
      if (qAux.IsEmpty = false) then
      begin
        if (qAux.FieldByName('Tipo').AsString = 'PAGAR') then
        begin
          with qryconsulta_lancamento do
            begin
              close;
              sql.clear;
              sql.add('select LF.*, Forn.Nome_Fantasia as Nome, CP.Descricao, TD.Descricao, D.Descricao, PF.Plano,');
              sql.add('(select sum(Valor_Documento) from Lancamento_Financeiro LF where LF.N_Documento = :Documento and LF.Tipo = :Tipo and LF.Status = :Status) as valor_doc,');
              sql.add('(select sum(Desconto) from Lancamento_Financeiro LF where LF.N_Documento = :Documentoo and LF.Tipo = :Tipoo and LF.Status = :Statuss) as desco,');
              sql.add('(select sum(Multa) from Lancamento_Financeiro LF where LF.N_Documento = :Documentooo and LF.Tipo = :Tipooo and LF.Status = :Statusss) as mult,');
              sql.add('(select sum(Valor_Cobrado) from Lancamento_Financeiro LF where LF.N_Documento = :Documentoooo and LF.Tipo = :Tipoooo and LF.Status = :Statussss) as valor_cob');
              sql.add('from Lancamento_Financeiro LF');
              sql.add('left join Fornecedor Forn on(LF.Codigo_Cli_For = Forn.Codigo)');
              sql.add('left join Condicao_Pagamento CP on(LF.Codigo_Forma_Pagamento = CP.Codigo)');
              sql.add('left join Tipo_Documento TD on(LF.Codigo_Tipo_Documento = TD.Codigo)');
              sql.add('left join Departamento D on(LF.Codigo_Departamento = D.Codigo)');
              sql.add('left join Plano_Financeiro PF on(LF.Codigo_Plano = PF.Codigo)');
{              sql.add('select LF.*, Forn.Nome_Fantasia as Nome, CP.Descricao, TD.Descricao, D.Descricao, PF.Plano from Lancamento_Financeiro LF');
              sql.add('left join Fornecedor Forn on(LF.Codigo_Cli_For = Forn.Codigo)');
              sql.add('left join Condicao_Pagamento CP on(LF.Codigo_Forma_Pagamento = CP.Codigo)');
              sql.add('left join Tipo_Documento TD on(LF.Codigo_Tipo_Documento = TD.Codigo)');
              sql.add('left join Departamento D on(LF.Codigo_Departamento = D.Codigo)');
              sql.add('left join Plano_Financeiro PF on(LF.Codigo_Plano = PF.Codigo)');
              sql.add('where LF.Codigo = :Codigo');
              Parameters.ParamByName('Codigo').Value:= qryconsulta_parcelasCodigo.AsInteger;
              open;
            end;
        end
        else
        begin
          with qryconsulta_lancamento do
            begin
              close;
              sql.clear;
              sql.add('select LF.*, Cli.Nome_Nome_Fantasia as Nome, CP.Descricao, TD.Descricao, D.Descricao, PF.Plano from Lancamento_Financeiro LF');
              sql.add('left join Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');
              sql.add('left join Condicao_Pagamento CP on(LF.Codigo_Forma_Pagamento = CP.Codigo)');
              sql.add('left join Tipo_Documento TD on(LF.Codigo_Tipo_Documento = TD.Codigo)');
              sql.add('left join Departamento D on(LF.Codigo_Departamento = D.Codigo)');
              sql.add('left join Plano_Financeiro PF on(LF.Codigo_Plano = PF.Codigo)');
              sql.add('where LF.Codigo = :Codigo');
              Parameters.ParamByName('Codigo').Value:= qryconsulta_parcelasCodigo.AsInteger;
              open;
            end;
        end;
      end;
    finally
      FreeAndNil(qAux);
    end;
  end;}
end;

procedure TFrmConsulta_Lancamentos_Financeiros.DBGrid2DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_ForKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      if (RGTipo_Conta.ItemIndex = 0) and (RGConsulta_Lancamento.ItemIndex = 2) then
      begin
        Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
        FrmChama_Cliente.ShowModal;
        FrmChama_Cliente.Free;
      end
      else if (RGTipo_Conta.ItemIndex = 1) and (RGConsulta_Lancamento.ItemIndex = 2) then
      begin
        Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
        FrmChama_Cliente.ShowModal;
        FrmChama_Cliente.Free;
      end
      else if (RGConsulta_Lancamento.ItemIndex = 3) then
      begin
        Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
        FrmChama_Plano_Financeiro.ShowModal;
        FrmChama_Plano_Financeiro.Free;
      end
      else if (RGConsulta_Lancamento.ItemIndex = 4) then
      begin
        Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
        FrmChama_Condicao_Pagamento.ShowModal;
        FrmChama_Condicao_Pagamento.Free;
      end
      else if (RGConsulta_Lancamento.ItemIndex = 5) then
      begin
        Application.CreateForm(TFrmChama_Departamento, FrmChama_Departamento);
        FrmChama_Departamento.ShowModal;
        FrmChama_Departamento.Free;
      end
      else if (RGConsulta_Lancamento.ItemIndex = 6) then
      begin
        Application.CreateForm(TFrmChama_Tipo_Documento, FrmChama_Tipo_Documento);
        FrmChama_Tipo_Documento.ShowModal;
        FrmChama_Tipo_Documento.Free;
      end;
    end;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_ForKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Lancamentos_Financeiros.EdtCodigo_Lancamento_BancarioKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Lancamento_Banco, FrmChama_Lancamento_Banco);
    FrmChama_Lancamento_Banco.ShowModal;
    FrmChama_Lancamento_Banco.Free;
  end;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.EdtCodigo_SafraKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Safra, FrmChama_Safra);
    FrmChama_Safra.ShowModal;
    FrmChama_Safra.Free;
  end;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.EdtLancamento_BancarioKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Lancamentos_Financeiros.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Lancamentos_Financeiros.Free;
  FrmConsulta_Lancamentos_Financeiros:= NIl;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.FormCreate(Sender: TObject);
begin
  qryconsulta_lancamento.close;
  PageControl1.TabIndex:= 0;
  qryconsulta_lancamento.close;
  qryconsulta_lancamento_sintetico.close;
  qryconsulta_parcelas.close;
  qrypagar_agrupado.Close;
  qryreceber_agrupado.Close;
  qryagrupado_plano.Close;
  qryagrupado_cli_forn.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtConsulta.Clear;
  Util.Inicia_Data(MEdtData_Final, MEdtData_Inicial);
end;

procedure TFrmConsulta_Lancamentos_Financeiros.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.RGAgrupa_ImpressaoClick(
  Sender: TObject);
begin
  if (RGAgrupa_Impressao.ItemIndex = 0) then
  begin
    RGOrdena_Por.ItemIndex:= 0;
    TRadioGroup(RGOrdena_Por.Controls[0]).Enabled:= true;
    TRadioGroup(RGOrdena_Por.Controls[1]).Enabled:= true;
    TRadioGroup(RGOrdena_Por.Controls[2]).Enabled:= true;
    TRadioGroup(RGOrdena_Por.Controls[3]).Enabled:= true;
    TRadioGroup(RGOrdena_Por.Controls[4]).Enabled:= true;
    TRadioGroup(RGOrdena_Por.Controls[5]).Enabled:= true;
  end
  else
  begin
    RGOrdena_Por.ItemIndex:= 5;
    TRadioGroup(RGOrdena_Por.Controls[0]).Enabled:= false;
    TRadioGroup(RGOrdena_Por.Controls[1]).Enabled:= false;
    TRadioGroup(RGOrdena_Por.Controls[2]).Enabled:= false;
    TRadioGroup(RGOrdena_Por.Controls[3]).Enabled:= false;
    TRadioGroup(RGOrdena_Por.Controls[4]).Enabled:= false;
    TRadioGroup(RGOrdena_Por.Controls[5]).Enabled:= true;
  end;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.RGConsulta_LancamentoClick(
  Sender: TObject);
begin
  if (RGConsulta_Lancamento.ItemIndex = 1) or (RGConsulta_Lancamento.ItemIndex = 2) then
  begin
    RGAgrupa_Impressao.ItemIndex := 0;
    RGAgrupa_Impressao.Enabled:= false;
  end
  else
  begin
    RGAgrupa_Impressao.ItemIndex := 0;
    RGAgrupa_Impressao.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.RGConsulta_ParcelaEnter(
  Sender: TObject);
begin
  RGConsulta_Lancamento.ItemIndex:= -1;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.RGTipoClick(Sender: TObject);
begin
  if (RGTipo.ItemIndex = 2) then
  begin
    TRadioGroup(RGData.Controls[0]).Enabled:= false;
    TRadioGroup(RGData.Controls[1]).Enabled:= true;
    TRadioGroup(RGData.Controls[2]).Enabled:= true;
    RGAgrupa_Impressao.Enabled:= false;
    RGOrdena_Por.Enabled:= false;

    TRadioGroup(RGConsulta_Lancamento.Controls[0]).Enabled:= false;
    TRadioGroup(RGConsulta_Lancamento.Controls[1]).Enabled:= false;
    TRadioGroup(RGConsulta_Lancamento.Controls[2]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[3]).Enabled:= true;
    RGConsulta_Lancamento.ItemIndex:= 2;
    RGData.ItemIndex:= 1;
  end
  else if (RGTipo.ItemIndex = 0) then
  begin
    TRadioGroup(RGData.Controls[0]).Enabled:= true;
    TRadioGroup(RGData.Controls[1]).Enabled:= true;
    TRadioGroup(RGData.Controls[2]).Enabled:= true;
    RGAgrupa_Impressao.Enabled:= true;
    RGOrdena_Por.Enabled:= true;

    TRadioGroup(RGConsulta_Lancamento.Controls[0]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[1]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[2]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[3]).Enabled:= true;
    RGConsulta_Lancamento.ItemIndex:= 0;
    RGData.ItemIndex:= 0;
  end
  else if (RGTipo.ItemIndex = 1) then
  begin
    TRadioGroup(RGData.Controls[0]).Enabled:= true;
    TRadioGroup(RGData.Controls[1]).Enabled:= true;
    TRadioGroup(RGData.Controls[2]).Enabled:= true;
    RGAgrupa_Impressao.Enabled:= false;
    RGOrdena_Por.Enabled:= false;

    TRadioGroup(RGConsulta_Lancamento.Controls[0]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[1]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[2]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[3]).Enabled:= true;
    RGConsulta_Lancamento.ItemIndex:= 0;
    RGData.ItemIndex:= 0;
  end
  else if (RGTipo.ItemIndex = 3) then
  begin
    TRadioGroup(RGData.Controls[0]).Enabled:= true;
    TRadioGroup(RGData.Controls[1]).Enabled:= true;
    TRadioGroup(RGData.Controls[2]).Enabled:= true;
    RGAgrupa_Impressao.Enabled:= false;
    RGTipo_Conta.ItemIndex:= 0;
    RGOrdena_Por.Enabled:= false;

    TRadioGroup(RGConsulta_Lancamento.Controls[0]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[1]).Enabled:= false;
    TRadioGroup(RGConsulta_Lancamento.Controls[2]).Enabled:= false;
    TRadioGroup(RGConsulta_Lancamento.Controls[3]).Enabled:= false;
    RGConsulta_Lancamento.ItemIndex:= 0;
    RGData.ItemIndex:= 0;
  end;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.RGTipo_ContaClick(
  Sender: TObject);
begin
  if (RGTipo_Conta.ItemIndex = 0) then
  begin
    TRadioGroup(RGTipo.Controls[0]).Enabled:= true;
    TRadioGroup(RGTipo.Controls[1]).Enabled:= true;
    TRadioGroup(RGTipo.Controls[2]).Enabled:= true;
    TRadioGroup(RGTipo.Controls[3]).Enabled:= false;
  end
  else
  begin
    TRadioGroup(RGTipo.Controls[0]).Enabled:= true;
    TRadioGroup(RGTipo.Controls[1]).Enabled:= true;
    TRadioGroup(RGTipo.Controls[2]).Enabled:= true;
    TRadioGroup(RGTipo.Controls[3]).Enabled:= true;
  end;
end;

end.
