unit UChama_Lancamentos_Financeiros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UCadastro_Cliente, Mask, UUtilitarios;

type
  TFrmChama_Lancamentos_Financeiros = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ImgImagens: TImageList;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_lancamento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    RGTipo_Conta: TRadioGroup;
    BBtnLimpar: TToolButton;
    Label7: TLabel;
    Label8: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    BBtnImprimir_Sintetico: TToolButton;
    qrychama_lancamentoNome: TStringField;
    qrychama_lancamentoN_Documento: TIntegerField;
    qrychama_lancamentoData_Vencimento: TDateTimeField;
    qrychama_lancamentoParcela: TIntegerField;
    qrychama_lancamentoValor: TFloatField;
    qrychama_lancamentoData_Lancamento: TDateTimeField;
    BBtnImprimir_Agrupado: TToolButton;
    qrychama_lancamentoCodigo_Plano: TIntegerField;
    RGStatus: TRadioGroup;
    BBtnEstornar: TToolButton;
    SPAtualiza_Movimento_Caixa: TADOStoredProc;
    SPAtualiza_Status_Conta: TADOStoredProc;
    CBBaixa: TCheckBox;
    Label2: TLabel;
    EdtCodigo_Cli_For: TEdit;
    BBtnBaixar_Conta: TToolButton;
    BBtnImprimir_Analitico: TToolButton;
    qrychama_lancamentoCodigo: TIntegerField;
    qrychama_lancamentoConta: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnEstornarClick(Sender: TObject);
    procedure BBtnImprimir_SinteticoClick(Sender: TObject);
    procedure BBtnImprimir_AgrupadoClick(Sender: TObject);
    procedure EdtCodigo_Cli_ForKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CBBaixaClick(Sender: TObject);
    procedure RGConsulta_PorClick(Sender: TObject);
    procedure BBtnBaixar_ContaClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    ativo: boolean;
    imp, imp_agru: boolean;
    { Public declarations }
  end;

var
  FrmChama_Lancamentos_Financeiros: TFrmChama_Lancamentos_Financeiros;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Cliente, UBaixar_Titulo,
  URel_Lancamento_Contas, URel_Lancamento_Contas_Agrupado;

{$R *.dfm}

procedure TFrmChama_Lancamentos_Financeiros.BBtnBaixar_ContaClick(
  Sender: TObject);
var
  qAux: TADOQuery;
  valor: double;
begin
  if (DBGrid1.SelectedRows.Count = 0) then
  begin
    Application.MessageBox('Por favor, selecione ao menos uma conta a baixar', 'Item não selecionado', MB_OK+MB_ICONHAND);
    abort
  end
  else
  begin
    valor:= 0;
    qAux:= TADOQuery.Create(nil);
    if (qrychama_lancamento.IsEmpty = false) and (RGStatus.ItemIndex = 0) then
    begin
    if (CBBaixa.Checked = true) then
      begin
        if (Application.MessageBox('A opção para Realizar Pagamento Geral está marcada. Será dado baixa em todas as contas selecionadas. Neste procedimento, as contas baixadas não poderão ser estornadas, no momento. Deseja Continuar?', 'Confirmação...', MB_YESNO + MB_ICONQUESTION)) = idyes then
          begin
            qrychama_lancamento.First;
            while not qrychama_lancamento.Eof do
              begin
                if (DBGrid1.SelectedRows.CurrentRowSelected) then
                begin
                  valor:= valor + qrychama_lancamentoValor.AsFloat;
                  qrychama_lancamento.Next;
                end
                else
                  qrychama_lancamento.Next;
              end;
              Application.CreateForm(TFrmBaixar_Titulo, FrmBaixar_Titulo);
              FrmBaixar_Titulo.EdtN_Documento.Text:= '';
              FrmBaixar_Titulo.MEdtData_Vencimento.Text:= qrychama_lancamentoData_Vencimento.AsString;
              FrmBaixar_Titulo.EdtParcela.Text:= '';//qrychama_lancamentoParcela.AsString;
              FrmBaixar_Titulo.EdtValor_Parcela.Text:= FormatFloat('#0.0,0', valor);
              FrmBaixar_Titulo.EdtValor_Parcela.Text:= StringReplace(FrmBaixar_Titulo.EdtValor_Parcela.Text, ThousandSeparator, '', [rfReplaceAll]);

              FrmBaixar_Titulo.EdtDinheiro.Text:= FormatFloat('#0.0,0', valor);
              FrmBaixar_Titulo.EdtDinheiro.Text:= StringReplace(FrmBaixar_Titulo.EdtDinheiro.Text, ThousandSeparator, '', [rfReplaceAll]);
              FrmBaixar_Titulo.ShowModal;
              FrmBaixar_Titulo.Free;
          end;
      end
      else
      begin
        Application.CreateForm(TFrmBaixar_Titulo, FrmBaixar_Titulo);
        FrmBaixar_Titulo.EdtN_Documento.Text:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoN_Documento.AsString;
        FrmBaixar_Titulo.EdtParcela.Text:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoParcela.AsString;
        Util.FormataFloat(2, FrmBaixar_Titulo.EdtValor_Parcela, FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor.AsFloat);
        Util.FormataFloat(2, FrmBaixar_Titulo.EdtDinheiro, FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor.AsFloat);
        Util.FormataFloat(2, FrmBaixar_Titulo.EdtValor_Pagar, FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor.AsFloat);
        FrmBaixar_Titulo.MEdtData_Vencimento.Text:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoData_Vencimento.AsString;
        FrmBaixar_Titulo.ShowModal;
        FrmBaixar_Titulo.Free;
      end;
    end;
  end;
end;

procedure TFrmChama_Lancamentos_Financeiros.BBtnEstornarClick(Sender: TObject);
var
  qAux: TADOQuery;
  valor, saldo_atual, novo_saldo: double;
  codigo_conta: integer;
begin
  if (DBGrid1.SelectedRows.Count = 0) then
    Application.MessageBox('É necessário informar pelo menos um item', 'Dados não encontrados', MB_OK+MB_ICONHAND)
  else
  begin
    if (Application.MessageBox('Confirma o estorno dos registros selecionados?', 'Confirmação...', MB_ICONQUESTION+MB_YESNO)) = idyes then
      begin
        qrychama_lancamento.First;
        while not qrychama_lancamento.Eof do
          begin
            if (DBGrid1.SelectedRows.CurrentRowSelected) then
            begin
              Util.Atualiza_Status_Conta(qrychama_lancamentoCodigo.AsInteger,
                                         qrychama_lancamentoParcela.AsInteger,
                                         'PENDENTE',
                                         0,
                                         '',
                                         '',
                                         0);

              if (qrychama_lancamentoConta.AsString <> '') then
              begin

                Util.Atualiza_Status_Bancario(qrychama_lancamentoN_Documento.AsString, 'BLOQUEADO');
                valor:= qrychama_lancamentoValor.AsFloat;
                codigo_conta:= Util.Pega_Codigo_Conta(qrychama_lancamentoConta.AsString);

                saldo_atual:= Util.Pega_Saldo_Atual_Conta(codigo_conta);

                if (RGTipo_Conta.ItemIndex = 0) then
                  novo_saldo:= saldo_atual + valor
                else
                  novo_saldo:= saldo_atual - valor;

                Util.Insere_Extrato_Bancario(Codigo_Empresa, qrychama_lancamentoN_Documento.AsInteger, date, codigo_conta, 0, 0,
                                             0, 'ESTORNO DE VALOR LIBERADO', valor, 'LIBERADO', saldo_atual, novo_saldo,
                                             0, 0, 0);

                if (RGTipo_Conta.ItemIndex = 0) then
                  Util.Atualiza_Saldo_Bancario(qrychama_lancamentoConta.AsString, qrychama_lancamentoValor.AsFloat, 'DÉBITO', 1)
                else
                  Util.Atualiza_Saldo_Bancario(qrychama_lancamentoConta.AsString, qrychama_lancamentoValor.AsFloat, 'CRÉDITO', 1);

              end;

              {with SPAtualiza_Status_Conta do
              begin
                Parameters.ParamByName('@Codigo').Value:= qrychama_lancamentoCodigo.AsInteger;
                Parameters.ParamByName('@Parcela').Value:= qrychama_lancamentoParcela.AsInteger;
                Parameters.ParamByName('@Status').Value:= 'PENDENTE';
                Parameters.ParamByName('@Data_Pagamento').Value:= NULL;
                Parameters.ParamByName('@Cheque').Value:= '';
                Parameters.ParamByName('@Conta').Value:= '';
                ExecProc;
              end;}

              {with SPAtualiza_Movimento_Caixa do
              begin
                Parameters.ParamByName('@N_Documento').Value:= qrychama_lancamentoN_Documento.AsInteger;
                ExecProc;
              end;}

              try
                qAux:= TADOQuery.Create(self);
                with qAux, sql do
                begin
                  close;
                  Connection:= dm.ADOConnection1;
                  clear;
                  add('Delete from Fechamento_Venda where N_Documento = :N_Documento and Parcela = :Parcela');
                  Parameters.ParamByName('N_Documento').Value:= qrychama_lancamentoN_Documento.AsInteger;
                  Parameters.ParamByName('Parcela').Value:= qrychama_lancamentoParcela.AsInteger;
                  ExecSQL;
                end;
              finally
                FreeAndNil(qAux);
              end;

              qrychama_lancamento.Next;
            end
            else
              qrychama_lancamento.Next;
          end;
          Mensagem.Processo_Concluido;
          qrychama_lancamento.Close;
          qrychama_lancamento.Open;
      end;
  end;
end;

procedure TFrmChama_Lancamentos_Financeiros.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Lancamentos_Financeiros.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Lancamento_Financeiro;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir_Sintetico.Enabled:= true;
  BBtnImprimir_Agrupado.Enabled:= true;
  BBtnBaixar_Conta.Enabled:= true;
  if (RGStatus.ItemIndex = 0) then
    BBtnEstornar.Enabled:= false
  else
    BBtnEstornar.Enabled:= true;
end;

procedure TFrmChama_Lancamentos_Financeiros.BBtnImprimir_SinteticoClick(Sender: TObject);
begin
  FrmRel_Lancamento_Contas:= TFrmRel_Lancamento_Contas.Create(self);
  FrmRel_Lancamento_Contas.Release;
  FrmRel_Lancamento_Contas:= Nil;
end;

procedure TFrmChama_Lancamentos_Financeiros.BBtnImprimir_AgrupadoClick(
  Sender: TObject);
begin
  FrmRel_Lancamento_Contas_Agrupado:= TFrmRel_Lancamento_Contas_Agrupado.Create(self);
  FrmRel_Lancamento_Contas_Agrupado.Release;
  FrmRel_Lancamento_Contas_Agrupado:= Nil;
end;

procedure TFrmChama_Lancamentos_Financeiros.BBtnLimparClick(Sender: TObject);
begin
  qrychama_lancamento.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir_Sintetico.Enabled:= false;
  BBtnImprimir_Agrupado.Enabled:= false;
  BBtnEstornar.Enabled:= false;
  BBtnBaixar_Conta.Enabled:= false;
  EdtConsulta.SetFocus;
end;

procedure TFrmChama_Lancamentos_Financeiros.CBBaixaClick(Sender: TObject);
begin
  {if (RGConsulta_Por.ItemIndex <> 1) then
    begin
      Application.MessageBox('Para realizar esta operação, é necessário marcar a opção Consultar por Cliente/Forn.', 'Opção Inválida', MB_OK+Mb_ICONEXCLAMATION);
      CBBaixa.Checked:= false;
      abort;
    end
    else if (EdtCodigo_Cli_For.Text = '') then
    begin
      Application.MessageBox('Por favor, informe um parametro', 'Atenção', MB_OK+Mb_ICONEXCLAMATION);
      CBBaixa.Checked:= false;
      abort;
    end;}
  
end;

procedure TFrmChama_Lancamentos_Financeiros.DBGrid1DrawColumnCell(
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

procedure TFrmChama_Lancamentos_Financeiros.EdtCodigo_Cli_ForKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
      FrmChama_Cliente.ShowModal;
      FrmChama_Cliente.Free;
    end;
end;

procedure TFrmChama_Lancamentos_Financeiros.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Lancamento_Financeiro;
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir_Sintetico.Enabled:= true;
    BBtnImprimir_Agrupado.Enabled:= true;
  end;
end;

procedure TFrmChama_Lancamentos_Financeiros.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmChama_Lancamentos_Financeiros.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Lancamentos_Financeiros.Free;
  FrmChama_Lancamentos_Financeiros:= NIl;
end;

procedure TFrmChama_Lancamentos_Financeiros.FormCreate(Sender: TObject);
begin
  qrychama_lancamento.close;
  CBBaixa.Checked:= false;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir_Sintetico.Enabled:= false;
  BBtnImprimir_Agrupado.Enabled:= false;
  EdtConsulta.Clear;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmChama_Lancamentos_Financeiros.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmChama_Lancamentos_Financeiros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Lancamentos_Financeiros.RGConsulta_PorClick(
  Sender: TObject);
begin
  if (RGConsulta_Por.ItemIndex <> 1) then
    CBBaixa.Checked:= false;
end;

end.
