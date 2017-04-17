unit UChama_Propriedade_Inicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios, XPMan;

type
  TFrmChama_Propriedade_Inicial = class(TForm)
    DBGrid1: TDBGrid;
    qrychama: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qryparametros: TADOQuery;
    qryparametrosCodigo_Propriedade: TIntegerField;
    qryparametrosDias_Secamento: TIntegerField;
    qryparametrosDias_Paricao: TIntegerField;
    qryparametrosDias_Cobertura: TIntegerField;
    qryparametrosDias_Cobertura_Sincronizacao: TIntegerField;
    qryparametrosLancamento_Financeiro: TStringField;
    qryparametrosContas_Fixas: TStringField;
    qryparametrosCheque_Vencer: TStringField;
    qryparametrosProdutos_Vencidos: TStringField;
    qryparametrosAniversario_Funcionario: TStringField;
    qryparametrosAniversario_Cliente: TStringField;
    qryparametrosAnimal_Cobrir: TStringField;
    qryparametrosAnimal_Secar: TStringField;
    qryparametrosAnimal_Parir: TStringField;
    qryparametrosAplicacao_Programada: TStringField;
    qryparametrosAnimal_Idade: TStringField;
    qryparametrosCalendario_Sanitario: TStringField;
    qryparametrosPeriodo_Idade_De: TIntegerField;
    qryparametrosPeriodo_Idade_Ate: TIntegerField;
    qryparametrosDias_Aviso: TIntegerField;
    qryparametrosFinalizar_Periodo_Lactacao: TStringField;
    qryparametrosMostrar_Inicializacao: TStringField;
    qryparametrosBackup_Fechar_Sistema: TStringField;
    qryparametrosAvisa_Dias_Coberta: TStringField;
    qryparametrosN_Dias_Coberta: TIntegerField;
    qryparametrosAvisa_Dias_Diagnosticada: TStringField;
    qryparametrosN_Dias_Diagnosticada: TIntegerField;
    qryparametrosAvisa_Dias_Seca: TStringField;
    qryparametrosN_Dias_Seca: TIntegerField;
    qryparametrosAvisa_Dias_Parida: TStringField;
    qryparametrosN_Dias_Parida: TIntegerField;
    qryparametrosAvisa_Lac_Sec_Vazia_Atrasada: TStringField;
    qryparametrosAvisa_Novilha_Atrasada: TStringField;
    qryparametrosAvisa_Novilha_Apta_Atrasada: TStringField;
    qryparametrosAvisa_Animal_Sincronizar: TStringField;
    qryparametrosAvisa_Protocolo_Sincronizacao: TStringField;
    qryparametrosAvisa_Animais_Desmamar: TStringField;
    qryparametrosAvisa_Novilhas_Aptas: TStringField;
    qryparametrosAvisa_Limite_Producao: TStringField;
    qryparametrosAvisa_Limite_Diagnostico: TStringField;
    qryparametrosLimite_Producao: TFloatField;
    qryparametrosAvisa_Vaca_Acima_Pesagem: TStringField;
    qryparametrosPeso_Maximo_Leite: TFloatField;
    qryparametrosAptidao_Novilhas: TStringField;
    qryparametrosValor_Aptidao: TFloatField;
    qryparametrosLimite_Minimo_Aptidao: TIntegerField;
    qryparametrosLimite_Maximo_Aptidao: TIntegerField;
    qryparametrosMu_Aut_Ap: TStringField;
    qryparametrosDias_Matrizes_Atrasadas: TIntegerField;
    qryparametrosDias_Novilhas_Atrasadas: TIntegerField;
    qryparametrosDias_Novilhas_Aptas_Atrasadas: TIntegerField;
    qryparametrosLimite_Diagnostico: TIntegerField;
    qryparametrosLimite_Desmama: TIntegerField;
    qryparametrosAnimais_Lactantes: TIntegerField;
    qryparametrosAvisa_Situacao1: TStringField;
    qryparametrosDe1: TIntegerField;
    qryparametrosAte1: TIntegerField;
    qryparametrosSituacao1: TIntegerField;
    qryparametrosMu_Aut_Sit1: TStringField;
    qryparametrosAvisa_Situacao2: TStringField;
    qryparametrosDe2: TIntegerField;
    qryparametrosAte2: TIntegerField;
    qryparametrosSituacao2: TIntegerField;
    qryparametrosMu_Aut_Sit2: TStringField;
    qryparametrosAvisa_Situacao3: TStringField;
    qryparametrosDe3: TIntegerField;
    qryparametrosAte3: TIntegerField;
    qryparametrosSituacao3: TIntegerField;
    qryparametrosMu_Aut_Sit3: TStringField;
    qryparametrosAvisa_Situacao4: TStringField;
    qryparametrosDe4: TIntegerField;
    qryparametrosAte4: TIntegerField;
    qryparametrosSituacao4: TIntegerField;
    qryparametrosMu_Aut_Sit4: TStringField;
    qryparametrosAvisa_Situacao5: TStringField;
    qryparametrosDe5: TIntegerField;
    qryparametrosAte5: TIntegerField;
    qryparametrosSituacao5: TIntegerField;
    qryparametrosMu_Aut_Sit5: TStringField;
    qryparametrosAvisa_Situacao6: TStringField;
    qryparametrosDe6: TIntegerField;
    qryparametrosAte6: TIntegerField;
    qryparametrosSituacao6: TIntegerField;
    qryparametrosMu_Aut_Sit6: TStringField;
    qryparametrosNovilhas_Aptas: TIntegerField;
    qryparametrosNovilhas_Aptas_Atrasadas: TIntegerField;
    qryparametrosNovilhas_Vazias: TIntegerField;
    qryparametrosNovilhas_Vazias_Atrasadas: TIntegerField;
    qryparametrosNovilhas_Cobertas: TIntegerField;
    qryparametrosNovilhas_Gestantes: TIntegerField;
    qryparametrosVacas_Lactacao_Vazias_Normais: TIntegerField;
    qryparametrosVacas_Lactacao_Vazias_Atrasadas: TIntegerField;
    qryparametrosVacas_Lactacao_Cobertas: TIntegerField;
    qryparametrosVacas_Lactacao_Gestantes: TIntegerField;
    qryparametrosVacas_Secas_Vazia: TIntegerField;
    qryparametrosVacas_Secas_Vazias_Atrasadas: TIntegerField;
    qryparametrosVacas_Secas_Cobertas: TIntegerField;
    qryparametrosVacas_Secas_Gestantes: TIntegerField;
    qryparametrosVacas_Secas_Descartes: TIntegerField;
    qryparametrosAnimais_Lactantes_Macho: TIntegerField;
    qryparametrosAvisa_Situacao1_Macho: TStringField;
    qryparametrosDe1_Macho: TIntegerField;
    qryparametrosAte1_Macho: TIntegerField;
    qryparametrosSituacao1_Macho: TIntegerField;
    qryparametrosMu_Aut_Sit1_Macho: TStringField;
    qryparametrosAvisa_Situacao2_Macho: TStringField;
    qryparametrosDe2_Macho: TIntegerField;
    qryparametrosAte2_Macho: TIntegerField;
    qryparametrosSituacao2_Macho: TIntegerField;
    qryparametrosMu_Aut_Sit2_Macho: TStringField;
    qryparametrosAvisa_Situacao3_Macho: TStringField;
    qryparametrosDe3_Macho: TIntegerField;
    qryparametrosAte3_Macho: TIntegerField;
    qryparametrosSituacao3_Macho: TIntegerField;
    qryparametrosMu_Aut_Sit3_Macho: TStringField;
    qryparametrosAvisa_Situacao4_Macho: TStringField;
    qryparametrosDe4_Macho: TIntegerField;
    qryparametrosAte4_Macho: TIntegerField;
    qryparametrosSituacao4_Macho: TIntegerField;
    qryparametrosMu_Aut_Sit4_Macho: TStringField;
    qryparametrosAvisa_Situacao5_Macho: TStringField;
    qryparametrosDe5_Macho: TIntegerField;
    qryparametrosAte5_Macho: TIntegerField;
    qryparametrosSituacao5_Macho: TIntegerField;
    qryparametrosMu_Aut_Sit5_Macho: TStringField;
    qryparametrosAvisa_Situacao6_Macho: TStringField;
    qryparametrosDe6_Macho: TIntegerField;
    qryparametrosAte6_Macho: TIntegerField;
    qryparametrosSituacao6_Macho: TIntegerField;
    qryparametrosMu_Aut_Sit6_Macho: TStringField;
    qryparametrosAvisa_Situacao7_Macho: TStringField;
    qryparametrosDe7_Macho: TIntegerField;
    qryparametrosAte7_Macho: TIntegerField;
    qryparametrosSituacao7_Macho: TIntegerField;
    qryparametrosMu_Aut_Sit7_Macho: TStringField;
    qryparametrosReprodutor: TIntegerField;
    qryparametrosRufiao: TIntegerField;
    qryparametrosBoi_Carreiro: TIntegerField;
    qryparametrosSemen: TIntegerField;
    qryparametrosCat_Ini_Lactante: TIntegerField;
    qryparametrosCat_Ini_Em_Crescimento: TIntegerField;
    qryparametrosCat_Ini_Novilha: TIntegerField;
    qryparametrosCat_Ini_Matriz: TIntegerField;
    qryparametrosCat_Ini_Lactante_Macho: TIntegerField;
    qryparametrosCat_Ini_Em_Crescimento_Macho: TIntegerField;
    qryparametrosCat_Ini_Reprodutor: TIntegerField;
    qryparametrosCat_Ini_Rufiao: TIntegerField;
    qryparametrosCat_Ini_Boi_Carreiro: TIntegerField;
    qryparametrosLimite_Cheque: TIntegerField;
    qryparametrosDias_Acrecimo_Cheque: TIntegerField;
    qryparametrosAvisa_Lote_1: TStringField;
    qryparametrosDe_Lote_1: TIntegerField;
    qryparametrosAte_Lote_1: TIntegerField;
    qryparametrosLote_1: TIntegerField;
    qryparametrosMu_Aut_Lote_1: TStringField;
    qryparametrosAvisa_Lote_2: TStringField;
    qryparametrosDe_Lote_2: TIntegerField;
    qryparametrosAte_Lote_2: TIntegerField;
    qryparametrosLote_2: TIntegerField;
    qryparametrosMu_Aut_Lote_2: TStringField;
    qryparametrosAvisa_Lote_3: TStringField;
    qryparametrosDe_Lote_3: TIntegerField;
    qryparametrosAte_Lote_3: TIntegerField;
    qryparametrosLote_3: TIntegerField;
    qryparametrosMu_Aut_Lote_3: TStringField;
    qryparametrosAvisa_Lote_4: TStringField;
    qryparametrosDe_Lote_4: TIntegerField;
    qryparametrosAte_Lote_4: TIntegerField;
    qryparametrosLote_4: TIntegerField;
    qryparametrosMu_Aut_Lote_4: TStringField;
    qryparametrosAvisa_Lote_5: TStringField;
    qryparametrosDe_Lote_5: TIntegerField;
    qryparametrosAte_Lote_5: TIntegerField;
    qryparametrosLote_5: TIntegerField;
    qryparametrosMu_Aut_Lote_5: TStringField;
    qryparametrosAvisa_Lote_6: TStringField;
    qryparametrosDe_Lote_6: TIntegerField;
    qryparametrosAte_Lote_6: TIntegerField;
    qryparametrosLote_6: TIntegerField;
    qryparametrosMu_Aut_Lote_6: TStringField;
    qryparametrosAvisa_Lote_7: TStringField;
    qryparametrosDe_Lote_7: TIntegerField;
    qryparametrosAte_Lote_7: TIntegerField;
    qryparametrosLote_7: TIntegerField;
    qryparametrosMu_Aut_Lote_7: TStringField;
    qryparametrosAvisa_Lote_8: TStringField;
    qryparametrosDe_Lote_8: TIntegerField;
    qryparametrosAte_Lote_8: TIntegerField;
    qryparametrosLote_8: TIntegerField;
    qryparametrosMu_Aut_Lote_8: TStringField;
    qryparametrosAvisa_Lote_9: TStringField;
    qryparametrosDe_Lote_9: TIntegerField;
    qryparametrosAte_Lote_9: TIntegerField;
    qryparametrosLote_9: TIntegerField;
    qryparametrosMu_Aut_Lote_9: TStringField;
    qryparametrosAvisa_Lote_10: TStringField;
    qryparametrosDe_Lote_10: TIntegerField;
    qryparametrosAte_Lote_10: TIntegerField;
    qryparametrosLote_10: TIntegerField;
    qryparametrosMu_Aut_Lote_10: TStringField;
    qryparametrosValor_Conta_Menor: TFloatField;
    qryparametrosAvisa_Conta_Menor: TIntegerField;
    qryparametrosValor_Conta_Maior: TFloatField;
    qryparametrosAvisa_Conta_Maior: TIntegerField;
    qrychamaCodigo: TIntegerField;
    qrychamaNome_fantasia: TStringField;
    qrychamaCidade: TStringField;
    qrychamaSetor: TStringField;
    qrychamaLogradouro: TStringField;
    qrychamaTipo_Logradouro: TStringField;
    qrychamaNumero: TStringField;
    qrychamaTelefone: TStringField;
    qrychamaUF: TStringField;
    qrychamaInscricao_Estadual: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    qAux: TADOQuery;
    min, max: integer;

    procedure Chama_Fazenda;
    procedure Chama_Parametros;


    procedure Verifica_Conta_Menor;
    procedure Verifica_Conta_Maior;
    procedure Verifica_Cheque;
  public
    { Public declarations }
  end;

var
  FrmChama_Propriedade_Inicial: TFrmChama_Propriedade_Inicial;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UPrincipal;

{$R *.dfm}

procedure TFrmChama_Propriedade_Inicial.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Propriedade_Inicial.Chama_Fazenda;
var
  i: integer;
begin
  i:= 0;
  Codigo_Empresa:= qrychamaCodigo.AsInteger;
  Nome_Fantasia:= qrychamaNome_fantasia.AsString;
  tipo_endereco:= qrychamaTipo_Logradouro.AsString;
  endereco:= qrychamaLogradouro.AsString;
  numero:= qrychamaNumero.AsString;
  cidade:= qrychamaCidade.AsString;
  uf:= qrychamaUF.AsString;
  telefone:= qrychamaTelefone.AsString;
  cnpj:= qrychamaInscricao_Estadual.AsString;

  FrmPrincipal.StbStatus.Panels[0].Text:= 'Fazenda: ' + Nome_Fantasia;
  Chama_Parametros;

  max:= 3;
  min:= 1;
  FrmPrincipal.ProgressBar1.Min:= min;
  FrmPrincipal.ProgressBar1.Max:= max;

  conta_mensagem:= 0;

 if (avisa_contas_pagar = 'Sim') then
  begin
    Verifica_Conta_Maior;
    FrmPrincipal.ProgressBar1.Position:= FrmPrincipal.ProgressBar1.Position + 1;
    Sleep(500);
  end;

 if (avisa_contas_pagar = 'Sim') then
  begin
    Verifica_Conta_Menor;
    FrmPrincipal.ProgressBar1.Position:= FrmPrincipal.ProgressBar1.Position + 1;
    Sleep(500);
  end;

  if (avisa_cheque_vencer = 'Sim') then
  begin
    Verifica_Cheque;
    FrmPrincipal.ProgressBar1.Position:= FrmPrincipal.ProgressBar1.Position + 1;
    Sleep(500);
  end;

  FrmPrincipal.ProgressBar1.Position := 0;
  FrmPrincipal.StbStatus.Repaint;
  FrmPrincipal.LblMensagem.Visible:= false;
  FrmPrincipal.Repaint;

  FrmChama_Propriedade_Inicial.Close;
end;

procedure TFrmChama_Propriedade_Inicial.Chama_Parametros;
begin
  with qryparametros, sql do
  begin
    close;
    clear;
    add('select CS.* from Configuracao_Sistema CS');
    add('where CS.Codigo_Propriedade = :Propriedade');
    Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
    open;
  end;

  avisa_contas_pagar:= qryparametrosLancamento_Financeiro.AsString;
  avisa_contas_fixas:= qryparametrosContas_Fixas.AsString;
  avisa_cheque_vencer:= qryparametrosCheque_Vencer.AsString;
  avisa_produtos_vencidos:= qryparametrosProdutos_Vencidos.AsString;
  avisa_aniversario_funcionario:= qryparametrosAniversario_Funcionario.AsString;
  avisa_aniversario_cliente:= qryparametrosAniversario_Cliente.AsString;
  fazer_backup:= qryparametrosBackup_Fechar_Sistema.AsString;
  dias_aviso:= qryparametrosDias_Aviso.AsInteger;
  avisa_conta_menor:= qryparametrosAvisa_Conta_Menor.AsInteger;
  valor_conta_menor:= qryparametrosValor_Conta_Menor.AsFloat;
  avisa_conta_maior:= qryparametrosAvisa_Conta_Maior.AsInteger;
  valor_conta_maior:= qryparametrosValor_Conta_Maior.AsFloat;
end;

procedure TFrmChama_Propriedade_Inicial.DBGrid1DblClick(Sender: TObject);
begin
  Chama_Fazenda;
end;

procedure TFrmChama_Propriedade_Inicial.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Propriedade_Inicial.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Propriedade_Inicial.Release;
end;

procedure TFrmChama_Propriedade_Inicial.FormShow(Sender: TObject);
begin
  qrychama.Close;
  qrychama.Open;
end;

procedure TFrmChama_Propriedade_Inicial.Verifica_Cheque;
var
  i: integer;
begin
  qAux:= TADOQuery.Create(self);
  try
    cheque:= '';
    FrmPrincipal.LblMensagem.Visible:= true;
    FrmPrincipal.LblMensagem.Caption:= '';
    FrmPrincipal.LblMensagem.Caption:= 'Verificando Cheques';
    FrmPrincipal.Repaint;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select CC.Numero_Cheque, CC.Emitente, CC.Recebido_De, CC.Data_Vencimento,');
      add('datediff(day, getdate(), CC.Data_Vencimento) as dias from Cadastro_Cheque CC');
      add('where CC.Codigo_Empresa = :Propriedade and');
      add('datediff(day, getdate(), CC.Data_Vencimento) <= :Dif1 and');
      add('datediff(day, getdate(), CC.Data_Vencimento) >= 0 and (CC.Status = :Status1 or CC.Status = :Status2)');

      Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
      Parameters.ParamByName('Dif1').Value:= dias_aviso;
      Parameters.ParamByName('Status1').Value:= 'LANÇADO';
      Parameters.ParamByName('Status2').Value:= 'PRORROGADO';
      open;

      if (IsEmpty = false) then
      begin
        FrmPrincipal.Label1.Visible := true;
        FrmPrincipal.Label2.Visible := true;
        qAux.First;
        while not qAux.Eof do
        begin
          cheque := cheque + 'O cheque número ' + qAux.FieldByName('Numero_Cheque').AsString + ', emitido por ' + qAux.FieldByName('Emitente').AsString +', vencerá dia ' + qAux.FieldByName('Data_Vencimento').AsString + #13;
          inc(conta_mensagem);
          qAux.Next;
        end;
      end;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmChama_Propriedade_Inicial.Verifica_Conta_Maior;
var
  i: integer;
begin
  qAux:= TADOQuery.Create(self);
  try
    conta_maior:= '';
    FrmPrincipal.LblMensagem.Visible:= true;
    FrmPrincipal.LblMensagem.Caption:= '';
    FrmPrincipal.LblMensagem.Caption:= 'Verificando Contas a Pagar/Receber maior que ' + FloatToStr(valor_conta_maior);
    FrmPrincipal.Repaint;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select PL.Data_Vencimento, PL.N_Documento,');
      add('datediff(day, getdate(), PL.Data_Vencimento) as dias from Parcelas_Lancamentos PL');
      add('left join Lancamento_Financeiro LF on (PL.Codigo = LF.Codigo)');
      add('where LF.Codigo_Empresa = :Propriedade and PL.Valor >= :Valor1 and');
      add('datediff(day, getdate(), PL.Data_Vencimento) <= :Dif1 and');
      add('datediff(day, getdate(), PL.Data_Vencimento) >= 0 and PL.Status = :Status');

      Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
      Parameters.ParamByName('Valor1').Value:= valor_conta_maior;
      Parameters.ParamByName('Dif1').Value:= avisa_conta_maior;
      Parameters.ParamByName('Status').Value:= 'PENDENTE';
      open;

      if (IsEmpty = false) then
      begin
        FrmPrincipal.Label1.Visible := true;
        FrmPrincipal.Label2.Visible := true;
        qAux.First;
        while not qAux.Eof do
        begin
          conta_maior := conta_maior + 'A conta número ' + qAux.FieldByName('N_Documento').AsString + ', que vencerá dia ' + qAux.FieldByName('Data_Vencimento').AsString + ', encontra-se entre o prazo configurado no sistema.' + #13;
          inc(conta_mensagem);
          qAux.Next;
        end;
      end;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmChama_Propriedade_Inicial.Verifica_Conta_Menor;
var
  i: integer;
begin
  qAux:= TADOQuery.Create(self);
  try
    conta_menor:= '';
    FrmPrincipal.LblMensagem.Visible:= true;
    FrmPrincipal.LblMensagem.Caption:= '';
    FrmPrincipal.LblMensagem.Caption:= 'Verificando Contas a Pagar/Receber menor que ' + FloatToStr(valor_conta_menor);
    FrmPrincipal.Repaint;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select PL.Data_Vencimento, PL.N_Documento,');
      add('datediff(day, getdate(), PL.Data_Vencimento) as dias from Parcelas_Lancamentos PL');
      add('left join Lancamento_Financeiro LF on (PL.Codigo = LF.Codigo)');
      add('where LF.Codigo_Empresa = :Propriedade and PL.Valor <= :Valor1 and');
      add('datediff(day, getdate(), PL.Data_Vencimento) <= :Dif1 and');
      add('datediff(day, getdate(), PL.Data_Vencimento) >= 0 and PL.Status = :Status');

      Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
      Parameters.ParamByName('Valor1').Value:= valor_conta_menor;
      Parameters.ParamByName('Dif1').Value:= avisa_conta_menor;
      Parameters.ParamByName('Status').Value:= 'PENDENTE';
      open;

      if (IsEmpty = false) then
      begin
        FrmPrincipal.Label1.Visible := true;
        FrmPrincipal.Label2.Visible := true;
        qAux.First;
        while not qAux.Eof do
        begin
          conta_menor := conta_menor + 'A conta número ' + qAux.FieldByName('N_Documento').AsString + ', que vencerá dia ' + qAux.FieldByName('Data_Vencimento').AsString + ', encontra-se entre o prazo configurado no sistema.' + #13;
          inc(conta_mensagem);
          qAux.Next;
        end;
      end;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;
end.
