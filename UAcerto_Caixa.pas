unit UAcerto_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, URegistro,
  DB, ADODB, Grids, DBGrids, DateUtils, UUtilitarios;

type
  TFrmAcerto_Caixa = class(TForm)
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnFechar_Caixa: TToolButton;
    BBtnFechar: TToolButton;
    DBGrid1: TDBGrid;
    qryfechamento: TADOQuery;
    DataSource1: TDataSource;
    qryfechamentoForma_Pagamento: TStringField;
    qryfechamentoData: TDateTimeField;
    qryfechamentoValor: TFloatField;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    qryabertura: TADOQuery;
    DataSource2: TDataSource;
    SaveDialog1: TSaveDialog;
    qryfechamentoTipo_Documento: TStringField;
    qryaberturaData_Abertura: TDateTimeField;
    qryaberturaCodigo_Forma_Pagamento: TIntegerField;
    qryaberturaCodigo_Caixa: TIntegerField;
    qryaberturaValor: TFloatField;
    qryaberturaDescricao: TStringField;
    qryaberturaCaixa: TStringField;
    qryaberturaAcerto: TIntegerField;
    LblMarca: TLabel;
    EdtEntrada: TEdit;
    Label1: TLabel;
    EdtSaida: TEdit;
    Label2: TLabel;
    EdtSaldo: TEdit;
    Label3: TLabel;
    EdtAcerto: TEdit;
    Label4: TLabel;
    EdtFechamento: TEdit;
    BBtnImprimir: TToolButton;
    qryaberturaCodigo_Usuario: TIntegerField;
    qryaberturaNome: TStringField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnFecharClick(Sender: TObject);
    procedure BBtnFechar_CaixaClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtAcertoExit(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
  private
    Util: UUtilitarios.TUtil;
    Mensagem: UUtilitarios.TMensagem;
    Fechamento: URegistro.TFechamento_Caixa;
    Acerto: URegistro.TAcerto;
    flagfiscal: integer;
    dataa: TDate;
    sArquivo: TextFile;
    caix: AnsiString;
    procedure Atualiza_Fechamento;
    procedure Atualiza_Abertura;
    procedure Calcula_Total;
    procedure Escreve_Texto;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAcerto_Caixa: TFrmAcerto_Caixa;

implementation

uses UDM, URel_Acerto_Caixa_Selecionado, UPrincipal;

{$R *.dfm}
procedure TFrmAcerto_Caixa.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TFrmAcerto_Caixa.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TFrmAcerto_Caixa.EdtAcertoExit(Sender: TObject);
begin
  if (EdtAcerto.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtAcerto.SetFocus;
    abort;
  end;

  EdtAcerto.Text:= FormatFloat('#0.0,0', StrToFloat(EdtAcerto.Text));
  EdtAcerto.Text:= StringReplace(EdtAcerto.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtFechamento.Text:= FormatFloat('#0.0,0', StrToFloat(EdtSaldo.Text) - StrToFloat(EdtAcerto.Text));
  EdtFechamento.Text:= StringReplace(EdtFechamento.Text, ThousandSeparator, '', [rfReplaceAll]);
  BBtnFechar_Caixa.Enabled:= true;
end;

procedure TFrmAcerto_Caixa.Escreve_Texto;
begin
  EdtEntrada.Text:= '0,00';
  EdtSaida.Text:= '0,00';
  EdtSaldo.Text:= '0,00';
  EdtAcerto.Text:= '0,00';
  EdtFechamento.Text:= '0,00';
end;

procedure TFrmAcerto_Caixa.Atualiza_Abertura;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Abertura_Caixa set Acerto = :Acerto_Caixa');
      add('where Data_Abertura = :Dat and Codigo_Caixa = :Caixa and Acerto = :Acerto and Codigo_Usuario = :Usuario');
      Parameters.ParamByName('Acerto_Caixa').Value:= 1;
      Parameters.ParamByName('Dat').Value:= Data_Movimento;
      Parameters.ParamByName('Caixa').Value:= Codigo_Caixa;
      Parameters.ParamByName('Acerto').Value:= 0;
      Parameters.ParamByName('Usuario').Value:= Codigo_Usuario;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmAcerto_Caixa.Atualiza_Fechamento;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Fechamento_Venda set Acerto = :Acerto_Caixa');
      add('where Codigo_Empresa = :Empresa and Codigo_Caixa = :Caixa and Data = :Dat and Status = :Pago');
      add('and Acerto = :Acerto and Codigo_Usuario = :Usuario and Movimenta = :Movimenta');
      Parameters.ParamByName('Acerto_Caixa').Value:= 1;
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('Caixa').Value:= Codigo_Caixa;
      Parameters.ParamByName('Dat').Value:= Data_Movimento;
      Parameters.ParamByName('Pago').Value:= 'PAGO';
      Parameters.ParamByName('Acerto').Value:= 0;
      Parameters.ParamByName('Usuario').Value:= Codigo_Usuario;
      Parameters.ParamByName('Movimenta').Value:= '0';
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmAcerto_Caixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmAcerto_Caixa.BBtnFechar_CaixaClick(Sender: TObject);
var
  data, tempo: AnsiString;
begin
  if Application.MessageBox('Deseja realizar o acerto do caixa agora?', 'Atenção', Mb_YesNo + Mb_IconQuestion) = idyes then
  begin
    Atualiza_Abertura;
    Atualiza_Fechamento;
    Acerto.Inserir;

    qryfechamento.First;
    while not qryfechamento.Eof do
    begin
      Fechamento.Inserir;
      qryfechamento.Next;
    end;
    BBtnFechar_Caixa.Enabled:= false;
    BBtnImprimir.Enabled:= true;
    Codigo_Caixa:= 0;
    Habilitado:= false;
    Util.Insere_Historico(usuario, 'REALIZOU ACERTO DE CAIXA ' + qryaberturaCaixa.AsString + '.', TimeToStr(time), insercao, date);
    Mensagem.Processo_Concluido;
  end;
end;

procedure TFrmAcerto_Caixa.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Acerto_Caixa_Selecionado:= TFrmRel_Acerto_Caixa_Selecionado.create(self);
  FrmRel_Acerto_Caixa_Selecionado.Release;
  FrmRel_Acerto_Caixa_Selecionado:= Nil;
end;

procedure TFrmAcerto_Caixa.Calcula_Total;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select sum(Valor - Troco) as Credito from Fechamento_Venda FV');
      add('where FV.Codigo_Empresa = :Empresa and FV.Codigo_Caixa = :Caixa and FV.Data = :Dat and FV.Status = :Pago');
      add('and FV.Acerto = :Acerto and FV.Codigo_Usuario = :Usuario and FV.Tipo = :Tipo and FV.Movimenta = :Movimenta');
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('Caixa').Value:= Codigo_Caixa;
      Parameters.ParamByName('Dat').Value:= Data_Movimento;
      Parameters.ParamByName('Pago').Value:= 'PAGO';
      Parameters.ParamByName('Acerto').Value:= 0;
      Parameters.ParamByName('Usuario').Value:= Codigo_Usuario;
      Parameters.ParamByName('Tipo').Value:= '+';
      Parameters.ParamByName('Movimenta').Value:= '0';
      open;
    end;

    EdtEntrada.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Credito').AsFloat);
    EdtEntrada.Text:= StringReplace(EdtEntrada.Text, ThousandSeparator, '', [rfReplaceAll]);

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select sum(Valor - Troco) as Debito from Fechamento_Venda FV');
      add('where FV.Codigo_Empresa = :Empresa and FV.Codigo_Caixa = :Caixa and FV.Data = :Dat and FV.Status = :Pago');
      add('and FV.Acerto = :Acerto and FV.Codigo_Usuario = :Usuario and FV.Tipo = :Tipo and FV.Movimenta = :Movimenta');
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('Caixa').Value:= Codigo_Caixa;
      Parameters.ParamByName('Dat').Value:= Data_Movimento;
      Parameters.ParamByName('Pago').Value:= 'PAGO';
      Parameters.ParamByName('Acerto').Value:= 0;
      Parameters.ParamByName('Usuario').Value:= Codigo_Usuario;
      Parameters.ParamByName('Tipo').Value:= '-';
      Parameters.ParamByName('Movimenta').Value:= '0';
      open;
    end;

    EdtSaida.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Debito').AsFloat);
    EdtSaida.Text:= StringReplace(EdtSaida.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtSaldo.Text:= FormatFloat('#0.0,0', StrToFloat(EdtEntrada.Text) - StrToFloat(EdtSaida.Text)); //+ qryaberturaValor.AsFloat);
    EdtSaldo.Text:= StringReplace(EdtSaldo.Text, ThousandSeparator, '', [rfReplaceAll]);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmAcerto_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmAcerto_Caixa.Free;
  FrmAcerto_Caixa:= nil;
end;

procedure TFrmAcerto_Caixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  qAux: TADOQuery;
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    BBtnImprimir.Enabled:= false;
    Escreve_Texto;

    with qryfechamento, sql do
    begin
      close;
      clear;
      add('select FV.Forma_Pagamento, FV.Data, sum(FV.Valor - FV.Troco) as Valor, FV.Tipo_Documento');
      add('from Fechamento_Venda FV');
      add('where FV.Codigo_Empresa = :Empresa and FV.Codigo_Caixa = :Caixa and FV.Data = :Dat and FV.Status = :Pago');
      add('and FV.Acerto = :Acerto and FV.Codigo_Usuario = :Usuario and FV.Movimenta = :Movimenta');
      add('group by FV.Forma_Pagamento, FV.Data, FV.Tipo_Documento');
      Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('Caixa').Value:= Codigo_Caixa;
      Parameters.ParamByName('Dat').Value:= Data_Movimento;
      Parameters.ParamByName('Pago').Value:= 'PAGO';
      Parameters.ParamByName('Acerto').Value:= 0;
      Parameters.ParamByName('Usuario').Value:= Codigo_Usuario;
      Parameters.ParamByName('Movimenta').Value:= '0';
      open;
    end;

    with qryabertura, sql do
    begin
      close;
      clear;
      add('select AC.*, CP.Descricao, CU.Nome, C.Caixa from Abertura_Caixa AC');
      add('left join Condicao_Pagamento CP on (AC.Codigo_Forma_Pagamento = CP.Codigo)');
      add('left join Cadastro_Usuario CU on (AC.Codigo_Usuario = CU.Codigo)');
      add('left join Cadastro_Caixa C on (AC.Codigo_Caixa = C.Codigo)');

      add('where AC.Data_Abertura = :Dat and AC.Codigo_Caixa = :Caixa and AC.Acerto = :Acerto and AC.Codigo_Usuario = :Usuario');
      Parameters.ParamByName('Dat').Value:= Data_Movimento;
      Parameters.ParamByName('Caixa').Value:= Codigo_Caixa;
      Parameters.ParamByName('Acerto').Value:= 0;
      Parameters.ParamByName('Usuario').Value:= Codigo_Usuario;
      open;
    end;

    if (qryabertura.IsEmpty) or (qryfechamento.IsEmpty) then
    begin
      Mensagem.Fim_Pesquisa;
      abort;
    end;

    Calcula_Total;
  end;
end;

procedure TFrmAcerto_Caixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
