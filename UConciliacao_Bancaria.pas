unit UConciliacao_Bancaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UUtilitarios,
  ADODB, UConsulta, URegistro;

type
  TFrmConciliacao_Bancaria = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    LblMarca: TLabel;
    qryconciliacao_bancaria: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qryconciliacao_bancariaCodigo_Empresa: TIntegerField;
    qryconciliacao_bancariaN_Documento: TIntegerField;
    qryconciliacao_bancariaData_Lancamento: TDateTimeField;
    qryconciliacao_bancariaCodigo_Conta: TIntegerField;
    qryconciliacao_bancariaCodigo_Operacao: TIntegerField;
    qryconciliacao_bancariaCodigo_Plano: TIntegerField;
    qryconciliacao_bancariaDescricao: TStringField;
    qryconciliacao_bancariaValor: TFloatField;
    qryconciliacao_bancariaOperacao: TStringField;
    qryconciliacao_bancariaTipo: TStringField;
    ImgImagens: TImageList;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnLimpar: TToolButton;
    BBtnConciliar: TToolButton;
    BBtnImprimir: TToolButton;
    BBtnFechar: TToolButton;
    BBtnEstornar: TToolButton;
    RGStatus: TRadioGroup;
    SPAtualiza_Status_Bancario: TADOStoredProc;
    SPAtualiza_Saldo_Bancario: TADOStoredProc;
    qryconciliacao_bancariaCodigo: TAutoIncField;
    qryconciliacao_bancariaConta_Corrente: TStringField;
    qryconciliacao_bancariaCodigo_Cheque: TIntegerField;
    qryconciliacao_bancariaStatus: TStringField;
    qryconciliacao_bancariaSaldo_Anterior: TFloatField;
    qryconciliacao_bancariaSaldo_Atual: TFloatField;
    qryconciliacao_bancariaCodigo_Conta_Transferencia: TIntegerField;
    qryconciliacao_bancariaSaldo_Anterior_Transferencia: TFloatField;
    qryconciliacao_bancariaSaldo_Atual_Transferencia: TFloatField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BBtnLimparClick(Sender: TObject);
    procedure BBtnConciliarClick(Sender: TObject);
    procedure BBtnEstornarClick(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    Fechamento: URegistro.TFechamento_Caixa;

    procedure Deleta_Movimento_Banco(Documento: integer);
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConciliacao_Bancaria: TFrmConciliacao_Bancaria;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, URel_Conciliacao_Bancaria, ULog;

{$R *.dfm}

procedure TFrmConciliacao_Bancaria.BBtnConciliarClick(Sender: TObject);
var
  qAux: TADOQuery;
  tipo: AnsiString;
  valor, saldo_atual, novo_saldo: double;
  codigo_conta: Integer;
begin
  if (DBGrid1.SelectedRows.Count = 0) then
  begin
    Mensagem.Mensagem_Falta_Dados;
    abort
  end;

  if Mensagem.Confirma_Processo then
  begin
    try
      //dm.ADOConnection1.BeginTrans;
      try
        qAux:= TADOQuery.Create(nil);
        qryconciliacao_bancaria.First;

        while not qryconciliacao_bancaria.Eof do
        begin
          if (DBGrid1.SelectedRows.CurrentRowSelected) then
          begin
            Util.Atualiza_Status_Bancario(qryconciliacao_bancariaCodigo.AsInteger, 'BLOQUEADO/LIBERADO');
            {with SPAtualiza_Status_Bancario do
            begin
               Parameters.ParamByName('@N_Documento').Value:= qryconciliacao_bancariaN_Documento.AsInteger;
               Parameters.ParamByName('@Status').Value:= 'LIBERADO';
               ExecProc;
            end;}

            valor:= qryconciliacao_bancariaValor.AsFloat;
            codigo_conta:= qryconciliacao_bancariaCodigo_Conta.AsInteger;

            saldo_atual:= Util.Pega_Saldo_Atual_Conta(codigo_conta);

            if (qryconciliacao_bancariaTipo.AsString = 'CRÉDITO') then
              novo_saldo:= saldo_atual + valor
            else
              novo_saldo:= saldo_atual - valor;

            Util.Insere_Extrato_Bancario(Codigo_Empresa, qryconciliacao_bancariaN_Documento.AsInteger, date, codigo_conta, 0, qryconciliacao_bancariaCodigo_Operacao.AsInteger,
                                         qryconciliacao_bancariaCodigo_Plano.AsInteger, 'LIBERAÇÃO DE VALOR BLOQUEADO', valor, 'LIBERADO', saldo_atual, novo_saldo,
                                         0, 0, 0);

            Util.Atualiza_Saldo_Bancario(qryconciliacao_bancariaCodigo_Conta.AsInteger, qryconciliacao_bancariaValor.AsFloat,
                                         qryconciliacao_bancariaTipo.AsString, 0);

            if (RGStatus.ItemIndex = 0) then
            begin
              if (qryconciliacao_bancariaTipo.AsString = 'CRÉDITO') then
                tipo:= '+'
              else
                tipo:= '-';

              if (qryconciliacao_bancariaTipo.AsString = 'CRÉDITO') then
                Fechamento.Salva_Conta(0, Codigo_Empresa, Codigo_Caixa, Codigo_Usuario, 0, 0, qryconciliacao_bancariaN_Documento.AsInteger, 1, 'DINHEIRO', 'RECEB. - BANCO', 'PAGO', tipo, qryconciliacao_bancariaValor.AsFloat, 0, date)
              else
                Fechamento.Salva_Conta(0, Codigo_Empresa, Codigo_Caixa, Codigo_Usuario, 0, 0, qryconciliacao_bancariaN_Documento.AsInteger, 1, 'DINHEIRO', 'PAGAS - BANCO', 'PAGO', tipo, qryconciliacao_bancariaValor.AsFloat, 0, date);

              if (qryconciliacao_bancariaCodigo_Cheque.AsInteger <> 0) then
                Util.Atualiza_Cheque(Date, 'BAIXADO', qryconciliacao_bancariaCodigo_Cheque.AsInteger);
            end;

            qryconciliacao_bancaria.Next;
          end
          else
            qryconciliacao_bancaria.Next;
        end;

        Application.MessageBox('Registros conciliados com sucesso', 'Alteração Efetuada', MB_OK+MB_ICONQUESTION);
        qryconciliacao_bancaria.Close;
        qryconciliacao_bancaria.Open;
        Util.Insere_Historico(usuario, 'REALIZOU CONCILIAÇÃO BANCÁRIA.', TimeToStr(time), alteracao, date);
      finally
        qAux.Close;
        FreeAndNil(qAux);
      end;

    except on e:Exception do
    begin
      Application.MessageBox(PWideChar('Erro ao efetuar conciliação bancária: '+e.Message), 'Erro', MB_OK+MB_ICONHAND);
      TLog.Error('Erro ao efetuar conciliação bancária: '+e.Message);
    end;
    end;

  end;
end;

procedure TFrmConciliacao_Bancaria.BBtnEstornarClick(Sender: TObject);
var
  qAux: TADOQuery;
  valor, saldo_atual, novo_saldo: double;
  codigo_conta: Integer;
begin
  if (DBGrid1.SelectedRows.Count = 0) then
  begin
    Application.MessageBox('É necessário informar pelo menos um lançamento', 'FAV Sistemas', MB_OK+MB_ICONHAND);
    abort
  end
  else
    if (Application.MessageBox('Confirma o estorno dos registros selecionados?', 'Confirmação', MB_YESNO+MB_ICONQUESTION)) = idyes then
    begin
      try
        try
          qAux:= TADOQuery.Create(nil);
          qryconciliacao_bancaria.First;
          while not qryconciliacao_bancaria.Eof do
          begin
            if (DBGrid1.SelectedRows.CurrentRowSelected) then
            begin
              Util.Atualiza_Status_Bancario(qryconciliacao_bancariaCodigo.AsInteger, 'BLOQUEADO');
              valor:= qryconciliacao_bancariaValor.AsFloat;
              codigo_conta:= qryconciliacao_bancariaCodigo_Conta.AsInteger;

              saldo_atual:= Util.Pega_Saldo_Atual_Conta(codigo_conta);

              if (qryconciliacao_bancariaTipo.AsString = 'CRÉDITO') then
                novo_saldo:= saldo_atual - valor
              else
                novo_saldo:= saldo_atual + valor;

              Util.Insere_Extrato_Bancario(Codigo_Empresa, qryconciliacao_bancariaN_Documento.AsInteger, date, codigo_conta, 0, qryconciliacao_bancariaCodigo_Operacao.AsInteger,
                                           qryconciliacao_bancariaCodigo_Plano.AsInteger, 'ESTORNO DE VALOR LIBERADO', valor, 'BLOQUEADO', saldo_atual, novo_saldo,
                                           0, 0, 0);


              Util.Atualiza_Saldo_Bancario(qryconciliacao_bancariaCodigo_Conta.AsInteger, qryconciliacao_bancariaValor.AsFloat,
                                           qryconciliacao_bancariaTipo.AsString, 1);

              Deleta_Movimento_Banco(qryconciliacao_bancariaN_Documento.AsInteger);
              qryconciliacao_bancaria.Next;
            end
            else
              qryconciliacao_bancaria.Next;
          end;

          Application.MessageBox('Estorno realizados com sucesso', 'Alteração Efetuada', MB_OK+MB_ICONQUESTION);
          qryconciliacao_bancaria.Close;
          qryconciliacao_bancaria.Open;
        finally
          qAux.Close;
          FreeAndNil(qAux);
        end;

      except on E: Exception do
      begin
        Application.MessageBox(PWideChar('Erro ao efetuar estorno de conciliação bancária: '+e.Message), 'Erro', MB_OK+MB_ICONHAND);
        TLog.Error('Erro ao efetuar estorno conciliação bancária: '+e.Message);
      end;
      end;
    end;
end;

procedure TFrmConciliacao_Bancaria.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConciliacao_Bancaria.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Lancamento_Conciliacao;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
  if (RGStatus.ItemIndex = 0) then
  begin
    BBtnEstornar.Enabled:= false;
    BBtnConciliar.Enabled:= true;
  end
  else
  begin
    BBtnEstornar.Enabled:= true;
    BBtnConciliar.Enabled:= false;
  end;
end;

procedure TFrmConciliacao_Bancaria.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Conciliacao_Bancaria:= TFrmRel_Conciliacao_Bancaria.Create(self);
  FrmRel_Conciliacao_Bancaria.Release;
  FrmRel_Conciliacao_Bancaria:= Nil;
end;

procedure TFrmConciliacao_Bancaria.BBtnLimparClick(Sender: TObject);
begin
  qryconciliacao_bancaria.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnEstornar.Enabled:= false;
  BBtnConciliar.Enabled:= false;
  BBtnConciliar.Enabled:= false;
  EdtConsulta.SetFocus;
end;

procedure TFrmConciliacao_Bancaria.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConciliacao_Bancaria.Deleta_Movimento_Banco(Documento: integer);
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
      add('delete from Fechamento_Venda where N_Documento = :Documento');
      Parameters.ParamByName('Documento').Value:= Documento;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmConciliacao_Bancaria.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    Consulta.Chama_Lancamento_Conciliacao;
end;

procedure TFrmConciliacao_Bancaria.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConciliacao_Bancaria.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConciliacao_Bancaria.Free;
  FrmConciliacao_Bancaria:= nil;
end;

procedure TFrmConciliacao_Bancaria.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConciliacao_Bancaria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
