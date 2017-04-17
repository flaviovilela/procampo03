unit UConsulta;

interface

uses
  Forms, ComCtrls, StdCtrls, Mask, ADODB, SysUtils, Variants, UUtilitarios, Windows;

Type

  TConsulta = class
    procedure Chama_Cidade;
    procedure Chama_Setor;
    procedure Chama_Cultura;
    procedure Chama_Safra;
    procedure Chama_Grupo_Maquina;
    procedure Chama_Maquina;
    procedure Chama_Marca;
    procedure Chama_Bem_Patrimonial;
    procedure Chama_Tipo_Bem_Patrimonial;
    procedure Chama_Cheque;
    procedure Chama_Banco;
    procedure Chama_Conta_Corrente;
    procedure Chama_Agencia;
    procedure Chama_Cliente;
    procedure Chama_Unidade_Medida;
    procedure Chama_Perfil;
    procedure Chama_Agenda_Telefonica;
    procedure Chama_Agenda_Compromisso;
    procedure Chama_Logradouro;
    procedure Chama_Empresa;
    procedure Chama_Usuario;
    procedure Chama_Produto;
    procedure Chama_Condicao_Pagamento;
    procedure Chama_Produto_Compra;
    procedure Chama_Departamento;
    procedure Chama_Folha;

    procedure Consulta_Lancamento_Financeiro_Sintetico;
    procedure Consulta_Comparativo_Preco_Cotacao;
    procedure Consulta_Historico_Log;
    procedure Consulta_Cheque;
    procedure Consulta_Bem_Patrimonio;
    procedure Consulta_Acerto_Caixa;
    procedure Chama_Caixa;
    procedure Chama_Lancamento_Financeiro;
    procedure Chama_Tipo_Documento;
    procedure Chama_Itens_Folha_Pagamento;
    procedure Chama_Plano_Financeiro;
    procedure Consulta_Lancamento_Financeiro;
    procedure Consulta_Parcelas_Lancamento;
    procedure Chama_Lancamento_Financeiro_Alterar;

    procedure Consulta_Folha_Pagamento;
    procedure Consulta_Itens_Folha_Pagamento;
    procedure Consulta_Agenda_Telefonica;
    procedure Consulta_Agenda_Compromisso;
    procedure Consulta_Cotacao;
    procedure Consulta_Itens_Cotacao;

    procedure Consulta_Retorno_Cotacao;
    procedure Consulta_Itens_Retorno_Cotacao;
    procedure Consulta_Compra;
    procedure Consulta_Itens_Compra;

    procedure Consulta_Estoque;
    procedure Chama_Operacao_Bancaria;
    procedure Chama_Lancamento_Banco;
    procedure Consulta_Saldo;
    procedure Consulta_Extrato_Bancario;
    procedure Chama_Lancamento_Conciliacao;
    procedure Consulta_Lancamento_Financeiro_Pagar_Agrupado;
    procedure Consulta_Lancamento_Financeiro_Receber_Agrupado;
    procedure Consulta_Lancamento_Financeiro_Agrupado_Cli_Forn;
    procedure Consulta_Lancamento_Financeiro_Agrupado_PF;
    procedure Consulta_Lanacmento_Financeiro_Sintetico2;
  end;

var
  Mensagem: TMensagem;

implementation

uses UChama_Cidade, UChama_Setor, UChama_Logradouro,
  UChama_Empresa, UChama_Usuario, UChama_Agenda_Telefonica,
  UChama_Perfil,
  UChama_Agenda_Compromisso, UChama_Unidade_Medida, UChama_Cliente,
  UChama_Produto, UChama_Condicao_Pagamento,
  UConsulta_Comparativo_Preco_Cotacao, UConciliacao_Compra,
  UChama_Produto_Compra, UConsulta_Historico_Log, UConsulta_Acerto_Caixa,
  UChama_Caixa, UChama_Lancamento_Financeiro_Alterar,
  UChama_Lancamentos_Financeiros, UChama_Plano_Financeiro,
  UChama_Tipo_Documento, UConsulta_Lancamentos_Financeiros, UChama_Departamento,
  UChama_Item_Folha_Pagamento, UConsulta_Folha_Pagamento,
  UConsulta_Agenda_Compromisso, UConsulta_Agenda_Telefonica,
  UConsulta_Cotacao_Preco_Produto, UConsulta_Retorno_Cotacao_Preco,
  UConsulta_Compra, UConsulta_Estoque, UChama_Conta_Corrente, UChama_Agencia,
  UChama_Banco, UChama_Cheque, UConsulta_Cheque, UChama_Bem_Patrimonio,
  UChama_Tipo_Bem_Patrimonio, UChama_Operacao_Bancaria, UChama_Lancamento_Banco,
  UConsulta_Saldo_Bancario, UConciliacao_Bancaria, UChama_Marca, UChama_Maquina,
  UChama_Grupo_Maquina, UChama_Cultura, UChama_Safra, UConsulta_Bem_Patrimonial,
  UChama_Folha_Pagamento, UConsulta_Extrato_Bancario;

{ TConsulta }

procedure TConsulta.Chama_Lancamento_Conciliacao;
begin
  if (FrmConciliacao_Bancaria.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmConciliacao_Bancaria.qryconciliacao_bancaria do
        begin
          close;
          sql.clear;
          sql.add('select LB.*, CC.Conta_Corrente, OB.Operacao, OB.Tipo from Lancamento_Banco LB');
          sql.add('left join Cadastro_Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo_Conta_Corrente)');
          sql.add('left join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
          if (FrmConciliacao_Bancaria.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where (LB.Status = :Status1 or LB.Status = :Status2) and LB.N_Documento like '''+ FrmConciliacao_Bancaria.EdtConsulta.Text +'%''order by LB.Data_Lancamento')
          else
            sql.add('where (LB.Status = :Status1 or LB.Status = :Status2) and LB.N_Documento like '''+ FrmConciliacao_Bancaria.EdtConsulta.Text +'%''order by LB.N_Documento');

          if (FrmConciliacao_Bancaria.RGStatus.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Status1').Value:= 'BLOQUEADO';
            Parameters.ParamByName('Status2').Value:= 'BLOQUEADO';
          end
          else
          begin
            Parameters.ParamByName('Status1').Value:= 'LIBERADO';
            Parameters.ParamByName('Status2').Value:= 'BLOQUEADO/LIBERADO';
          end;

          open;

          if (FrmConciliacao_Bancaria.qryconciliacao_bancaria.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmConciliacao_Bancaria.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmConciliacao_Bancaria.qryconciliacao_bancaria do
            begin
              close;
              sql.clear;
              sql.add('select LB.*, CC.Conta_Corrente, OB.Operacao, OB.Tipo from Lancamento_Banco LB');
              sql.add('left join Cadastro_Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo_Conta_Corrente)');
              sql.add('left join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
              if (FrmConciliacao_Bancaria.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where (LB.Status = :Status1 or LB.Status = :Status2) and CC.Conta_Corrente like '''+ FrmConciliacao_Bancaria.EdtConsulta.Text +'%''order by LB.Data_Lancamento')
              else
                sql.add('where (LB.Status = :Status1 or LB.Status = :Status2) and CC.Conta_Corrente like '''+ FrmConciliacao_Bancaria.EdtConsulta.Text +'%''order by LB.N_Documento');

                if (FrmConciliacao_Bancaria.RGStatus.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Status1').Value:= 'BLOQUEADO';
                  Parameters.ParamByName('Status2').Value:= 'BLOQUEADO';
                end
                else
                begin
                  Parameters.ParamByName('Status1').Value:= 'LIBERADO';
                  Parameters.ParamByName('Status2').Value:= 'BLOQUEADO/LIBERADO';
                end;

              open;

              if (FrmConciliacao_Bancaria.qryconciliacao_bancaria.IsEmpty = true) then
                begin
                  Mensagem.Fim_Pesquisa;
                  abort;
                end;
            end;
        end
        else
          if (FrmConciliacao_Bancaria.RGConsulta_Por.ItemIndex = 2) then
          begin
            with FrmConciliacao_Bancaria.qryconciliacao_bancaria do
              begin
                close;
                sql.clear;
                sql.add('select LB.*, CC.Conta_Corrente, OB.Operacao, OB.Tipo from Lancamento_Banco LB');
                sql.add('left join Cadastro_Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo_Conta_Corrente)');
                sql.add('left join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
                if (FrmConciliacao_Bancaria.RGOrdena_Por.ItemIndex = 0) then
                  sql.add('where (LB.Status = :Status1 or LB.Status = :Status2) and LB.Data_Lancamento like '''+ FrmConciliacao_Bancaria.EdtConsulta.Text +'%''order by LB.Data_Lancamento')
                else
                  sql.add('where (LB.Status = :Status1 or LB.Status = :Status2) and LB.Data_Lancamento like '''+ FrmConciliacao_Bancaria.EdtConsulta.Text +'%''order by LB.N_Documento');

                if (FrmConciliacao_Bancaria.RGStatus.ItemIndex = 0) then
                begin
                  Parameters.ParamByName('Status1').Value:= 'BLOQUEADO';
                  Parameters.ParamByName('Status2').Value:= 'BLOQUEADO';
                end
                else
                begin
                  Parameters.ParamByName('Status1').Value:= 'LIBERADO';
                  Parameters.ParamByName('Status2').Value:= 'BLOQUEADO/LIBERADO';
                end;

                open;

                if (FrmConciliacao_Bancaria.qryconciliacao_bancaria.IsEmpty = true) then
                  begin
                    Mensagem.Fim_Pesquisa;
                    abort;
                  end;
              end;
          end;
end;

procedure TConsulta.Chama_Operacao_Bancaria;
begin
  if (FrmChama_Operacao_Bancaria.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Operacao_Bancaria.qrychama_operacao do
        begin
          close;
          sql.clear;
          sql.add('Select * from Operacao_Bancaria OB');
          if (FrmChama_Operacao_Bancaria.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where OB.Codigo like '''+ FrmChama_Operacao_Bancaria.EdtConsulta.Text +'%''order by OB.Codigo')
          else
            sql.add('where OB.Codigo like '''+ FrmChama_Operacao_Bancaria.EdtConsulta.Text +'%''order by OB.Operacao');
          open;

          {if (FrmChama_Operacao_Bancaria.qrychama_operacao.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;}
        end;
    end
    else
      if (FrmChama_Operacao_Bancaria.RGConsulta_Por.ItemIndex = 1) then
        begin
          with FrmChama_Operacao_Bancaria.qrychama_operacao do
            begin
              close;
              sql.clear;
              sql.add('Select * from Operacao_Bancaria OB');
              if (FrmChama_Operacao_Bancaria.RGOrdena_Por.ItemIndex = 0) then
                sql.add('where OB.Operacao like '''+ FrmChama_Operacao_Bancaria.EdtConsulta.Text +'%''order by OB.Codigo')
              else
                sql.add('where OB.Operacao like '''+ FrmChama_Operacao_Bancaria.EdtConsulta.Text +'%''order by OB.Operacao');
              open;

              {if (FrmChama_Operacao_Bancaria.qrychama_operacao.IsEmpty = true) then
                begin
                  Mensagem.Fim_Pesquisa;
                  abort;
                end;}
            end;
        end;
end;

procedure TConsulta.Consulta_Lanacmento_Financeiro_Sintetico2;
begin
  if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
     (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
    abort;
  end;

  if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Lancamento_Bancario.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Lancamento_Bancario.SetFocus;
    Abort;
  end;

  with FrmConsulta_Lancamentos_Financeiros.qryconsulta_sintetico_2 do
    begin
      close;
      sql.clear;
      sql.add('select LF.*, PL.*, Cli.Nome, CP.Descricao');
      sql.add('from Lancamento_Financeiro LF');
      sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
      sql.add('left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');
      sql.add('left join Condicao_Pagamento CP on(LF.Codigo_Forma_Pagamento = CP.Codigo)');

      if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status and PL.Codigo_Lancamento_Bancario = :Codigo_Lancamento_Bancario')
        else
        begin
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status and PL.Codigo_Lancamento_Bancario = :Codigo_Lancamento_Bancario');
        end;

      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status and PL.Codigo_Lancamento_Bancario = :Codigo_Lancamento_Bancario')
        else
        begin
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status and PL.Codigo_Lancamento_Bancario = :Codigo_Lancamento_Bancario');
        end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status and PL.Codigo_Lancamento_Bancario = :Codigo_Lancamento_Bancario')
        else
        begin
          sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status and PL.Codigo_Lancamento_Bancario = :Codigo_Lancamento_Bancario');
        end;
      end;

      Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
      if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
        Parameters.ParamByName('Fiscal').Value:= 0
      else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
        Parameters.ParamByName('Fiscal').Value:= 1;

        Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

        if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
        begin
          Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';

        end;

        if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        Parameters.ParamByName('Codigo_Lancamento_Bancario').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Lancamento_Bancario.Text);

        open;
        if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_sintetico_2.IsEmpty = true) then
        begin
          Mensagem.Fim_Pesquisa;
          abort;
        end;
    end;
end;

procedure TConsulta.Consulta_Lancamento_Financeiro;
begin
  with FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento do
    begin
      close;
      sql.clear;
      sql.add('select LF.*, PL.*, Cli.Nome, CP.Descricao, TD.Descricao, D.Descricao, PF.Plano');
      sql.add('from Lancamento_Financeiro LF');
      sql.add('left join Parcelas_Lancamentos PL on (LF.N_Documento = PL.N_Documento)');      // o erro está aqui
      sql.add('left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');
      sql.add('left join Condicao_Pagamento CP on(LF.Codigo_Forma_Pagamento = CP.Codigo)');
      sql.add('left join Cadastro_Tipo_Documento TD on(LF.Codigo_Tipo_Documento = TD.Codigo)');
      sql.add('left join Cadastro_Departamento D on(LF.Codigo_Departamento = D.Codigo)');
      sql.add('left join Cadastro_Plano_Financeiro PF on(LF.Codigo_Plano = PF.Codigo)');

      if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
           (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
        begin
          Mensagem.Mensagem_Falta_Dados;
          FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
          abort;
        end
        else
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
              //Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';

            end;

            {if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
              Parameters.ParamByName('Status').Value:= 'PAGO'
            else
              Parameters.ParamByName('Status').Value:= 'PENDENTE'; }
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

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

            {if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
              Parameters.ParamByName('Status').Value:= 'PAGO'
            else
              Parameters.ParamByName('Status').Value:= 'PENDENTE';}

          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

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

            {if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
              Parameters.ParamByName('Status').Value:= 'PAGO'
            else
              Parameters.ParamByName('Status').Value:= 'PENDENTE'; }

          end
        end;
        open;
        if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = true) then
          begin
            Mensagem.Fim_Pesquisa;
            FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
            abort;
          end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text = '') then
        begin
          Mensagem.Mensagem_Falta_Dados;
          FrmConsulta_Lancamentos_Financeiros.EdtConsulta.SetFocus;
          abort;
        end
        else
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text;

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
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;

            end;


            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text;

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
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text;

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
          end
        end;
        open;
        if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = true) then
          begin
            Mensagem.Fim_Pesquisa;
            FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
            abort;
          end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
            (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
        begin
          Mensagem.Mensagem_Falta_Dados;
          FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
          abort;
        end
        else
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF and PL.Status = :Status')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF and PL.Status = :Status');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
            Parameters.ParamByName('Status').Value:= 'PENDENTE';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF and PL.Status = :Status')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF and PL.Status = :Status');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
            Parameters.ParamByName('Status').Value:= 'PAGO';
          end
        end;
        open;
        if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = true) then
          begin
            Mensagem.Fim_Pesquisa;
            FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
            abort;
          end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
            (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
        begin
          Mensagem.Mensagem_Falta_Dados;
          FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
          abort;
        end
        else
        begin
        if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Plano and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Plano and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;

            end;


            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Plano').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Plano and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF and PL.Status = :Status')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Plano and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF and PL.Status = :Status');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Plano').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
            Parameters.ParamByName('Status').Value:= 'PENDENTE';
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Plano and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF and PL.Status = :Status')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Plano and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF and PL.Status = :Status');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
            Parameters.ParamByName('Plano').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
            Parameters.ParamByName('Status').Value:= 'PAGO';
          end
        end;
        open;
        if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = true) then
          begin
            Mensagem.Fim_Pesquisa;
            FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
            abort;
          end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
            (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
          begin
            Mensagem.Mensagem_Falta_Dados;
            FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
            abort;
          end
          else
          begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
            begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Forma_Pagamento = :Forma and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Forma_Pagamento = :Forma and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


              Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
              Parameters.ParamByName('Forma').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
            begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Forma_Pagamento = :Forma and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF and PL.Status = :Status')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Forma_Pagamento = :Forma and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF and PL.Status = :Status');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


              Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
              Parameters.ParamByName('Forma').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
              Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
            begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Forma_Pagamento = :Forma and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF and PL.Status = :Status')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Forma_Pagamento = :Forma and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF and PL.Status = :Status');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


              Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
              Parameters.ParamByName('Forma').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
              Parameters.ParamByName('Status').Value:= 'PAGO';
            end;
          end;
          open;
          if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
              abort;
            end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
            (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
          begin
            Mensagem.Mensagem_Falta_Dados;
            FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
            abort;
          end
          else
          begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
            begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Departamento and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Departamento and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


              Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
              Parameters.ParamByName('Departamento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
            begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Departamento and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF and PL.Status = :Status')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Departamento and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF and PL.Status = :Status');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


              Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
              Parameters.ParamByName('Departamento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
              Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
            begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Departamento and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF and PL.Status = :Status')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Departamento and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF and PL.Status = :Status');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


              Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
              Parameters.ParamByName('Departamento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
              Parameters.ParamByName('Status').Value:= 'PAGO';
            end;
          end;
          open;
          if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
              abort;
            end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 6) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
            (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
          begin
            Mensagem.Mensagem_Falta_Dados;
            FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
            abort;
          end
          else
          begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 6) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
            begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Tipo_Documento = :Documento and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Tipo_Documento = :Documento and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


              Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
              Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 6) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
            begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Tipo_Documento = :Documento and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF and PL.Status = :Status')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Tipo_Documento = :Documento and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF and PL.Status = :Status');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


              Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
              Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
              Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 6) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
            begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Tipo_Documento = :Documento and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF and PL.Status = :Status')
            else
            begin
              sql.add('where LF.Fiscal = :Fiscal and LF.Codigo_Empresa = :Empresa and LF.Codigo_Tipo_Documento = :Documento and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF and PL.Status = :Status');
              if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
                Parameters.ParamByName('Fiscal').Value:= 0
              else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
                Parameters.ParamByName('Fiscal').Value:= 1;
            end;


              Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
              Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
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
              Parameters.ParamByName('Status').Value:= 'PAGO';
            end;
          end;
          open;
          if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
              abort;
            end;
      end;
    end;
end;

procedure TConsulta.Consulta_Lancamento_Financeiro_Pagar_Agrupado;
begin
  if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.SetFocus;
    Abort;
  end;

  with FrmConsulta_Lancamentos_Financeiros.qrypagar_agrupado do
    begin
      close;
      sql.clear;
      sql.add('select PL.Codigo, PL.N_Documento, LF.Codigo_Empresa, LF.Tipo, LF.Historico, PL.Data_Vencimento, PL.Data_Pagamento, PL.Valor,');
      sql.add('PL.Status, PL.Cheque, PL.Conta, Cli.Nome from Lancamento_Financeiro LF');
      sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
      sql.add('left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');

      if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
        abort;
      end
      else
      begin

        if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
          else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
          else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento');
        end
        else
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
          else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
          else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento');

          if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
            Parameters.ParamByName('Fiscal').Value:= 0
          else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
            Parameters.ParamByName('Fiscal').Value:= 1;
        end;

        Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
        Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

        if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
      end;
      open;
    end;

    if (FrmConsulta_Lancamentos_Financeiros.qrypagar_agrupado.IsEmpty) then
    begin
      Application.MessageBox('Dados a pagar não encontrados', 'Fim da Pesquisa', MB_OK+MB_ICONEXCLAMATION);
    end;

end;

procedure TConsulta.Consulta_Lancamento_Financeiro_Receber_Agrupado;
begin
  if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.SetFocus;
    Abort;
  end;

  with FrmConsulta_Lancamentos_Financeiros.qryreceber_agrupado do
    begin
      close;
      sql.clear;
      sql.add('select PL.Codigo, PL.N_Documento, LF.Codigo_Empresa, LF.Tipo, LF.Historico, PL.Data_Vencimento, PL.Data_Pagamento, PL.Valor,');
      sql.add('PL.Status, PL.Cheque, PL.Conta, Cli.Nome from Lancamento_Financeiro LF');
      sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
      sql.add('left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');


      if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
        abort;
      end
      else
      begin

        if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
          else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
          else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento');
        end
        else
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
          else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento')
          else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
            sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan order by PL.Data_Vencimento');

          if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 1) then
            Parameters.ParamByName('Fiscal').Value:= 0
          else if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 2) then
            Parameters.ParamByName('Fiscal').Value:= 1;
        end;

        Parameters.ParamByName('Codigo_Safra').value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
        Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

        if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
      end;
      open;
    end;

    if (FrmConsulta_Lancamentos_Financeiros.qrypagar_agrupado.IsEmpty) then
    begin
      Application.MessageBox('Dados a receber não encontrados', 'Fim da Pesquisa', MB_OK+MB_ICONEXCLAMATION);
    end;

end;

//procedure TConsulta.Consulta_Lancamento_Financeiro_
procedure TConsulta.Consulta_Lancamento_Financeiro_Sintetico;
begin
  if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.SetFocus;
    Abort;
  end;

  with FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento_sintetico, sql do
    begin
      close;
      clear;
      add('declare @P varchar(1)');
      add('set @P = :PPP');

      add('select PL.Codigo, PL.N_Documento, LF.Observacoes, LF.Codigo_Empresa, LF.Tipo, LF.Codigo_Cli_For, ');
      add('LF.Historico, LF.Data_Lancamento, PL.Data_Vencimento, PL.Data_Pagamento, PL.Valor, PL.Status, ');
      Add('PL.Cheque, PL.Conta, Cli.Nome from Lancamento_Financeiro LF');
      add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
      add('left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');

      if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
           (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
        begin
          Mensagem.Mensagem_Falta_Dados;
          FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
          abort;
        end
        else
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
            begin
              sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan');
            end
            else
            begin
              sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan');
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
            sql.Add('case when @P = 4 then PL.Data_Pagamento end');

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
            begin
              sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan ');
            end
            else
            begin
              sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan');
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
            sql.Add('case when @P = 4 then PL.Data_Pagamento end');

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
            begin
              sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan ');
            end
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
            sql.Add('case when @P = 4 then PL.Data_Pagamento end');

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
        end;
        open;
        if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento_sintetico.IsEmpty = true) then
          begin
            Mensagem.Fim_Pesquisa;
            FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
            abort;
          end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text = '') then
        begin
          Mensagem.Mensagem_Falta_Dados;
          FrmConsulta_Lancamentos_Financeiros.EdtConsulta.SetFocus;
          abort;
        end
        else
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan')
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
            sql.Add('case when @P = 4 then PL.Data_Pagamento end');

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
            sql.Add('case when @P = 4 then PL.Data_Pagamento end');

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
            sql.Add('case when @P = 4 then PL.Data_Pagamento end');

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
        end;
        open;
        if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento_sintetico.IsEmpty = true) then
          begin
            Mensagem.Fim_Pesquisa;
            FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
            abort;
          end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
            (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
        begin
          Mensagem.Mensagem_Falta_Dados;
          FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
          abort;
        end
        else
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF ')
            else
            begin
              sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF ');
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
            sql.Add('case when @P = 4 then PL.Data_Pagamento end');

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
            sql.Add('case when @P = 4 then PL.Data_Pagamento end');

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
            sql.Add('case when @P = 4 then PL.Data_Pagamento end');

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
        if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento_sintetico.IsEmpty = true) then
          begin
            Mensagem.Fim_Pesquisa;
            FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
            abort;
          end;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text = '') or (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
            (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
        begin
          Mensagem.Mensagem_Falta_Dados;
          FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
          abort;
        end
        else
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGFiscal.ItemIndex = 0) then
              sql.add('where LF.Codigo_Safra = :Codigo_Safra and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF ')
            else
            begin
              sql.add('where LF.Codigo_Safra = :Codigo_Safra and LF.Fiscal = :Fiscal and PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF ');
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
            sql.Add('case when @P = 4 then PL.Data_Pagamento end');

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
            sql.Add('case when @P = 4 then PL.Data_Pagamento end');

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
            sql.Add('case when @P = 4 then PL.Data_Pagamento end');

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
        if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento_sintetico.IsEmpty = true) then
          begin
            Mensagem.Fim_Pesquisa;
            FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.SetFocus;
            abort;
          end;
      end;
    end;
end;

procedure TConsulta.Consulta_Parcelas_Lancamento;
begin
    if (FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento.IsEmpty = false) then
    begin
      with FrmConsulta_Lancamentos_Financeiros.qryconsulta_parcelas do
      begin
        close;
        sql.clear;
        sql.add('select PL.*, MC.Dinheiro, MC.Cheque_Vista, MC.Cheque_Prazo, MC.Cartao, MC.Juros, MC.Desconto from Parcelas_Lancamentos PL');
        sql.add('left join Movimento_Caixa MC on (PL.N_Documento = MC.N_Documento)');
        sql.add('where PL.Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamentoCodigo.AsInteger;
        open;
      end;
    end;
end;

procedure TConsulta.Consulta_Retorno_Cotacao;
begin
  if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Retorno_Cotacao_Preco.EdtCotacao.Text = '') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        FrmConsulta_Retorno_Cotacao_Preco.EdtCotacao.SetFocus;
        abort;
      end;

      with FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, Forn.Nome, CP.Descricao as Cond_Pag from Retorno_Cotacao_Preco RC');
          sql.add('inner join Cadastro_Cliente Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');

          if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :Cotacao order by RC.N_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 1) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :Cotacao order by RC.Data_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 2) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :Cotacao order by Forn.Nome');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('Cotacao').Value:= StrToInt(FrmConsulta_Retorno_Cotacao_Preco.EdtCotacao.Text);
          open;

          if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text = '  /  /    ') or
          (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.SetFocus;
        abort;
      end;

      with FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, Forn.Nome, CP.Descricao as Cond_Pag from Retorno_Cotacao_Preco RC');
          sql.add('inner join Cadastro_Cliente Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');

          if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Data_Cotacao between :DI and :DF order by RC.N_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 1) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Data_Cotacao between :DI and :DF order by RC.Data_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 2) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Data_Cotacao between :DI and :DF order by Forn.Nome');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text = '  /  /    ') or
          (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.SetFocus;
        abort;
      end;

      with FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, Forn.Nome, CP.Descricao as Cond_Pag from Retorno_Cotacao_Preco RC');
          sql.add('inner join Cadastro_Cliente Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');

          if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Data_Retorno between :DI and :DF order by RC.N_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 1) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Data_Retorno between :DI and :DF order by RC.Data_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 2) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Data_Retorno between :DI and :DF order by Forn.Nome');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text = '') or
          (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text = '  /  /    ') or
           (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.SetFocus;
        abort;
      end;

      with FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, Forn.Nome, CP.Descricao as Cond_Pag from Retorno_Cotacao_Preco RC');
          sql.add('inner join Cadastro_Cliente Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');

          if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo and RC.Data_Cotacao between :DI and :DF order by RC.N_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 1) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo and RC.Data_Cotacao between :DI and :DF order by RC.Data_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 2) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo and RC.Data_Cotacao between :DI and :DF order by Forn.Nome');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Retorno_Cotacao_Preco.RGConsulta_Por.ItemIndex = 4) then
    begin
      if (FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text = '') or
          (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text = '  /  /    ') or
           (FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.SetFocus;
        abort;
      end;

      with FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select RC.*, Forn.Nome, CP.Descricao as Cond_Pag from Retorno_Cotacao_Preco RC');
          sql.add('inner join Cadastro_Cliente Forn on (RC.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');

          if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 0) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo and RC.Data_Retorno between :DI and :DF order by RC.N_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 1) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo and RC.Data_Retorno between :DI and :DF order by RC.Data_Cotacao')
          else if (FrmConsulta_Retorno_Cotacao_Preco.RGOrdena_Por.ItemIndex = 2) then
            sql.Add('where RC.Codigo_Empresa = :Empresa and RC.Codigo_Fornecedor = :Codigo and RC.Data_Retorno between :DI and :DF order by Forn.Nome');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Retorno_Cotacao_Preco.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Chama_Plano_Financeiro;
begin
  if FrmChama_Plano_Financeiro.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Plano_Financeiro.qrychama_plano, Sql do
        begin
          close;
          Clear;
          Add('select PF.*, PF2.Descricao as Descricao2 from Cadastro_Plano_Financeiro PF');
          Add('left join Cadastro_Plano_Financeiro PF2 on (PF.Codigo_SubNivel = PF2.Codigo)');
          Add('where PF.Codigo like '''+ FrmChama_Plano_Financeiro.EdtConsulta.Text  +'%'' order by PF.Descricao');
          open;

        end;
    end
    else if FrmChama_Plano_Financeiro.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Plano_Financeiro.qrychama_plano, Sql do
        begin
          close;
          Clear;
          Add('select PF.*, PF2.Descricao as Descricao2 from Cadastro_Plano_Financeiro PF');
          Add('left join Cadastro_Plano_Financeiro PF2 on (PF.Codigo_SubNivel = PF2.Codigo)');
          Add('where PF.Descricao like '''+ FrmChama_Plano_Financeiro.EdtConsulta.Text  +'%'' order by PF.Descricao');
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Tipo_Bem_Patrimonial;
begin
  if FrmChama_Tipo_bem_Patrimonio.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Tipo_bem_Patrimonio.qrychama_tipo_bem, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Tipo_Bem_Patrimonial');
          Add('where Codigo like '''+ FrmChama_Tipo_bem_Patrimonio.EdtConsulta.Text  +'%'' order by Tipo_Bem');
          open;
        end;
    end
    else if FrmChama_Tipo_bem_Patrimonio.RGConsulta_Por.ItemIndex = 1 then
    begin
      with FrmChama_Tipo_bem_Patrimonio.qrychama_tipo_bem, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Tipo_Bem_Patrimonial');
          Add('where Tipo_Bem like '''+ FrmChama_Tipo_bem_Patrimonio.EdtConsulta.Text  +'%'' order by Tipo_Bem');
          open;
        end;
    end;
end;

procedure TConsulta.Chama_Tipo_Documento;
begin
  if FrmChama_Tipo_Documento.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Tipo_Documento.qrychama_tipo_documento, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Tipo_Documento');
          Add('where Codigo like '''+ FrmChama_Tipo_Documento.EdtConsulta.Text  +'%'' order by Descricao');
          open;
        end;
    end
    else if FrmChama_Tipo_Documento.RGConsulta_Por.ItemIndex = 1 then
    begin
      with FrmChama_Tipo_Documento.qrychama_tipo_documento, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Tipo_Documento');
          Add('where Descricao like '''+ FrmChama_Tipo_Documento.EdtConsulta.Text  +'%'' order by Descricao');
          open;
        end;
    end;
end;

procedure TConsulta.Chama_Lancamento_Banco;
begin
  if (FrmChama_Lancamento_Banco.RGConsulta_Por.ItemIndex = 0) then
  begin
    with FrmChama_Lancamento_Banco.qrychama_lancamento do
    begin
      close;
      sql.clear;
      sql.add('select LB.*, CC.Conta_Corrente, CC2.Conta_Corrente as Conta_Corrente_Transferencia, OB.Operacao, OB.Tipo, PF.Descricao from Lancamento_Banco LB');
      sql.add('left join Cadastro_Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo_Conta_Corrente)');
      sql.add('left join Cadastro_Conta_Corrente CC2 on (LB.Codigo_Conta_Transferencia = CC2.Codigo_Conta_Corrente)');
      sql.add('left join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
      sql.add('left join Cadastro_Plano_Financeiro PF on (LB.Codigo_Plano = PF.Codigo)');
      sql.add('where LB.Codigo_Empresa = :Empresa and LB.N_Documento like '''+ FrmChama_Lancamento_Banco.EdtConsulta.Text +'%''order by LB.Data_Lancamento');

      Parameters.ParamByName('Empresa').Value:= codigo_empresa;
      open;

    end;
  end
  else if (FrmChama_Lancamento_Banco.RGConsulta_Por.ItemIndex = 1) then
  begin
    with FrmChama_Lancamento_Banco.qrychama_lancamento do
    begin
      close;
      sql.clear;
      sql.add('select LB.*, CC.Conta_Corrente, CC2.Conta_Corrente as Conta_Corrente_Transferencia, OB.Operacao, OB.Tipo, PF.Descricao from Lancamento_Banco LB');
      sql.add('left join Cadastro_Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo_Conta_Corrente)');
      sql.add('left join Cadastro_Conta_Corrente CC2 on (LB.Codigo_Conta_Transferencia = CC2.Codigo_Conta_Corrente)');
      sql.add('left join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
      sql.add('left join Cadastro_Plano_Financeiro PF on (LB.Codigo_Plano = PF.Codigo)');
      sql.add('where LB.Codigo_Empresa = :Empresa and CC.Conta_Corrente like '''+ FrmChama_Lancamento_Banco.EdtConsulta.Text +'%''order by LB.Data_Lancamento');

      Parameters.ParamByName('Empresa').Value:= codigo_empresa;
      open;

    end;
  end
  else if (FrmChama_Lancamento_Banco.RGConsulta_Por.ItemIndex = 2) then
  begin
    with FrmChama_Lancamento_Banco.qrychama_lancamento do
    begin
      close;
      sql.clear;
      sql.add('select LB.*, CC.Conta_Corrente, CC2.Conta_Corrente as Conta_Corrente_Transferencia, OB.Operacao, OB.Tipo, PF.Descricao from Lancamento_Banco LB');
      sql.add('left join Cadastro_Conta_Corrente CC on (LB.Codigo_Conta = CC.Codigo_Conta_Corrente)');
      sql.add('left join Cadastro_Conta_Corrente CC2 on (LB.Codigo_Conta_Transferencia = CC2.Codigo_Conta_Corrente)');
      sql.add('left join Operacao_Bancaria OB on (LB.Codigo_Operacao = OB.Codigo)');
      sql.add('left join Cadastro_Plano_Financeiro PF on (LB.Codigo_Plano = PF.Codigo)');
      sql.add('where LB.Codigo_Empresa = :Empresa and LB.Descricao like '''+ FrmChama_Lancamento_Banco.EdtConsulta.Text +'%''order by LB.Data_Lancamento');

      Parameters.ParamByName('Empresa').Value:= codigo_empresa;
      open;

    end;
  end;
end;

procedure TConsulta.Consulta_Saldo;
begin
  if (FrmConsulta_Saldo_Bancario.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmConsulta_Saldo_Bancario.qryconsulta_saldo do
        begin
          close;
          sql.clear;
          sql.add('select CC.*, CA.Numero as Numero_Agencia, B.Nome from Cadastro_Conta_Corrente CC');
          sql.add('left join Cadastro_Agencia CA on (CC.Codigo_Agencia = CA.Codigo_Agencia)');
          sql.add('left join Cadastro_Banco B on (CA.Codigo_Banco = B.Codigo_Banco)');
          //sql.Add('where CC.Codigo_Empresa = :Empresa');
          //Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          open;

          if (FrmConsulta_Saldo_Bancario.qryconsulta_saldo.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
      if (FrmConsulta_Saldo_Bancario.RGConsulta_Por.ItemIndex = 1) then
        begin
          if (FrmConsulta_Saldo_Bancario.EdtCodigo_Conta.Text = '') then
          begin
            Mensagem.Mensagem_Falta_Dados;
            FrmConsulta_Saldo_Bancario.EdtCodigo_Conta.SetFocus;
            abort
          end
          else
          begin
            with FrmConsulta_Saldo_Bancario.qryconsulta_saldo do
              begin
                close;
                sql.clear;
                sql.add('select CC.*, CA.Numero as Numero_Agencia, B.Nome from Cadastro_Conta_Corrente CC');
                sql.add('left join Cadastro_Agencia CA on (CC.Codigo_Agencia = CA.Codigo_Agencia)');
                sql.add('left join Cadastro_Banco B on (CA.Codigo_Banco = B.Codigo_Banco)');
                sql.add('where CC.Codigo_Conta_Corrente = :Conta');
                //Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
                Parameters.ParamByName('Conta').Value:= FrmConsulta_Saldo_Bancario.EdtCodigo_Conta.Text;
                open;

                if (FrmConsulta_Saldo_Bancario.qryconsulta_saldo.IsEmpty = true) then
                  begin
                    Mensagem.Fim_Pesquisa;
                    abort;
                  end;
              end;
          end;
        end
end;

procedure TConsulta.Chama_Lancamento_Financeiro;
begin
  if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
    begin
      with FrmChama_Lancamentos_Financeiros.qrychama_lancamento do
        begin
          close;
          sql.clear;
          sql.add('select Cli.Nome, PL.Codigo, PL.N_Documento, LF.Data_Lancamento, LF.Codigo_Plano, PL.Data_Vencimento, PL.Parcela, PL.Valor, PL.Conta from Parcelas_Lancamentos PL');
          sql.add('left join Lancamento_Financeiro LF on(PL.Codigo = LF.Codigo)');
          sql.add('left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');

          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
            begin
              if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
              begin
                Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
                FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
                abort
              end
              else
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by PL.N_Documento');
                Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
              end;
            end
            else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Cli.Codigo = :Parametro and PL.Status = :Pendente order by PL.N_Documento');
              Parameters.ParamByName('Parametro').Value:= StrToInt(FrmChama_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text);
            end
            else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
              begin
                if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
                begin
                  Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
                  FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
                  abort
                end
                else
                begin
                  sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by PL.N_Documento');
                  Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                  Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
                end;
              end
              else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
                begin
                  if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
                  begin
                    Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
                    FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
                    abort
                  end
                  else
                  begin
                    sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by PL.N_Documento');
                    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
                  end;
                end;

          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
            begin
              if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
              begin
                Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
                FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
                abort
              end
              else
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by Forn.Nome_Fantasia');
                Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
              end;
            end
            else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Cli.Codigo = :Parametro and PL.Status = :Pendente order by Forn.Nome_Fantasia');
              Parameters.ParamByName('Parametro').Value:= StrToInt(FrmChama_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text);
            end
            else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
              begin
                if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
                begin
                  Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
                  FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
                  abort
                end
                else
                begin
                  sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente group by Form.Nome_Fantasia order by Forn.Nome_Fantasia');
                  Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                  Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
                end;
              end
              else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
                begin
                  if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
                  begin
                    Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
                    FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
                    abort
                  end
                  else
                  begin
                    sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by Forn.Nome_Fantasia');
                    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
                  end;
                end;
              Parameters.ParamByName('Tipo').Value:= 'PAGAR';
              if (FrmChama_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
                Parameters.ParamByName('Pendente').Value:= 'PENDENTE'
              else
                Parameters.ParamByName('Pendente').Value:= 'PAGO';
              Parameters.ParamByName('Empresa').Value:= codigo_empresa;
              open;

              //FrmChama_Lancamentos_Financeiros.EdtValor_Total.Text:= FormatFloat('#0.0,0', FrmChama_Lancamentos_Financeiros.qrychama_lancamento.FieldByName('Valor_par').AsFloat);
              //FrmChama_Lancamentos_Financeiros.EdtValor_Total.Text:= StringReplace(FrmChama_Lancamentos_Financeiros.EdtValor_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
              if (FrmChama_Lancamentos_Financeiros.qrychama_lancamento.IsEmpty = true) then
                begin
                  Mensagem.Fim_Pesquisa;
                  abort;
                end;
        end;
    end
    else
    if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
    begin
      with FrmChama_Lancamentos_Financeiros.qrychama_lancamento do
        begin
          close;
          sql.clear;
          sql.add('select Cli.Nome, PL.Codigo, PL.N_Documento, LF.Data_Lancamento, LF.Codigo_Plano, PL.Data_Vencimento, PL.Parcela, PL.Valor, PL.Conta from Parcelas_Lancamentos PL');
          sql.add('left join Lancamento_Financeiro LF on(PL.Codigo = LF.Codigo)');
          sql.add('left join Cadastro_Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');

          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
            begin
              if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
              begin
                Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
                FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
                abort
              end
              else
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by PL.N_Documento');
                Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
              end;
            end
            else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Cli.Nome_Nome_Fantasia = :Parametro and PL.Status = :Pendente order by PL.N_Documento');
              Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
            end
            else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
              begin
                if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
                begin
                  Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
                  FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
                  abort
                end
                else
                begin
                  sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by PL.N_Documento');
                  Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                  Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
                end;
              end
              else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
                begin
                  if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
                  begin
                    Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
                    FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
                    abort
                  end
                  else
                  begin
                    sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by PL.N_Documento');
                    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
                  end;
                end;

          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
            begin
              if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
              begin
                Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
                FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
                abort
              end
              else
              begin
                sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by Cli.Nome_Nome_Fantasia');
                Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
              end;
            end
            else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Cli.Nome_Nome_Fantasia = :Parametro and PL.Status = :Pendente order by Cli.Nome_Nome_Fantasia');
              Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
            end
            else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
              begin
                if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
                begin
                  Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
                  FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
                  abort
                end
                else
                begin
                  sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by Cli.Nome_Nome_Fantasia');
                  Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                  Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
                end;
              end
              else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
                begin
                  if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
                  begin
                    Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
                    FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
                    abort
                  end
                  else
                  begin
                    sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by Cli.Nome_Nome_Fantasia');
                    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
                    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
                  end;
                end;
              Parameters.ParamByName('Tipo').Value:= 'RECEBER';
              if (FrmChama_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
                Parameters.ParamByName('Pendente').Value:= 'PENDENTE'
              else
                Parameters.ParamByName('Pendente').Value:= 'PAGO';
              Parameters.ParamByName('Empresa').Value:= codigo_empresa;
              open;

              if (FrmChama_Lancamentos_Financeiros.qrychama_lancamento.IsEmpty = true) then
                begin
                  Mensagem.Fim_Pesquisa;
                  abort;
                end;
        end;
    end;
end;

procedure TConsulta.Chama_Caixa;
begin
  if FrmChama_Caixa.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Caixa.qrychama_caixa, Sql do
        begin
          close;
          Clear;
          Add('select Cai.*, Cai.Codigo_SubNivel, Cai.Caixa from Cadastro_Caixa Cai');
          Add('inner join Cadastro_Caixa Cai2 on (Cai.Codigo = Cai2.Codigo)');
          Add('where Cai.Codigo like '''+ FrmChama_Caixa.EdtConsulta.Text  +'%'' order by Cai.Caixa');
          open;

        end;
    end
    else if FrmChama_Caixa.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Caixa.qrychama_caixa, Sql do
        begin
          close;
          Clear;
          Add('select Cai.*, Cai.Codigo_SubNivel, Cai.Caixa from Cadastro_Caixa Cai');
          Add('inner join Cadastro_Caixa Cai2 on (Cai.Codigo = Cai2.Codigo)');
          Add('where Cai.Caixa like '''+ FrmChama_Caixa.EdtConsulta.Text  +'%'' order by Cai.Caixa');
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Cheque;
begin
  if FrmChama_Cheque.RGConsulta_Por.ItemIndex = 0 then
  begin
    with FrmChama_Cheque.qrychama_cheque, Sql do
      begin
        close;
        Clear;
        Add('select CC.*, CA.Numero, (CB.Numero_Banco + ' + QuotedStr(' - ') + ' + CB.Nome) as Banco,');
        Add('CCC.Conta_Corrente from Cadastro_Cheque CC');
        Add('left join Cadastro_Agencia CA on (CC.Codigo_Agencia = CA.Codigo_Agencia)');
        Add('left join Cadastro_Banco CB on (CA.Codigo_Banco = CB.Codigo_Banco)');
        Add('left join Cadastro_Conta_Corrente CCC on (CC.Codigo_Conta = CCC.Codigo_Conta_Corrente)');
        Add('where CC.Codigo_Empresa = :Codigo and CC.Numero_Cheque like '''+ FrmChama_Cheque.EdtConsulta.Text  +'%'' order by CC.Numero_Cheque');
        Parameters.ParamByName('Codigo').Value:= Codigo_Empresa;
        open;
      end;
    end
    else if FrmChama_Cheque.RGConsulta_Por.ItemIndex = 1 then
    begin
      with FrmChama_Cheque.qrychama_cheque, Sql do
        begin
          close;
          Clear;
          Add('select CC.*, CA.Numero, (CB.Numero_Banco + ' + QuotedStr(' - ') + ' + CB.Nome) as Banco,');
          Add('CCC.Conta_Corrente from Cadastro_Cheque CC');
          Add('left join Cadastro_Agencia CA on (CC.Codigo_Agencia = CA.Codigo_Agencia)');
          Add('left join Cadastro_Banco CB on (CA.Codigo_Banco = CB.Codigo_Banco)');
          Add('left join Cadastro_Conta_Corrente CCC on (CC.Codigo_Conta = CCC.Codigo_Conta_Corrente)');
          Add('where CC.Codigo_Empresa = :Codigo and CC.Emitente like '''+ FrmChama_Cheque.EdtConsulta.Text  +'%'' order by CC.Numero_Cheque');
          Parameters.ParamByName('Codigo').Value:= Codigo_Empresa;
          open;
        end;
    end
    else
    begin
      with FrmChama_Cheque.qrychama_cheque, Sql do
        begin
          close;
          Clear;
          Add('select CC.*, CA.Numero, (CB.Numero_Banco + ' + QuotedStr(' - ') + ' + CB.Nome) as Banco,');
          Add('CCC.Conta_Corrente from Cadastro_Cheque CC');
          Add('left join Cadastro_Agencia CA on (CC.Codigo_Agencia = CA.Codigo_Agencia)');
          Add('left join Cadastro_Banco CB on (CA.Codigo_Banco = CB.Codigo_Banco)');
          Add('left join Cadastro_Conta_Corrente CCC on (CC.Codigo_Conta = CCC.Codigo_Conta_Corrente)');
          Add('where CC.Codigo_Empresa = :Codigo and CC.Valor like '''+ FrmChama_Cheque.EdtConsulta.Text  +'%'' order by CC.Numero_Cheque');
          Parameters.ParamByName('Codigo').Value:= Codigo_Empresa;
          open;
        end;
    end;
end;

procedure TConsulta.Chama_Agencia;
begin
  if FrmChama_Agencia.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Agencia.qrychama_agencia, Sql do
        begin
          close;
          Clear;
          Add('select CA.*, CB.Numero_Banco + ' + QuotedStr(' - ') + ' + CB.Nome as Banco, CL.Logradouro, CC.Cidade from Cadastro_Agencia CA');
          Add('left join Cadastro_Banco CB on (CA.Codigo_Banco = CB.Codigo_Banco)');
          Add('left join Cadastro_Logradouro CL on (CA.Codigo_Endereco = CL.Codigo)');
          Add('left join Cadastro_Cidade CC on (CA.Codigo_Cidade = CC.Codigo)');
          Add('where CA.Codigo_Agencia like '''+ FrmChama_Agencia.EdtConsulta.Text  +'%'' order by CA.Numero');
          open;

        end;
    end
    else if FrmChama_Agencia.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Agencia.qrychama_agencia, Sql do
        begin
          close;
          clear;
          Add('select CA.*, CB.Numero_Banco + ' + QuotedStr(' - ') + ' + CB.Nome as Banco, CL.Logradouro, CC.Cidade from Cadastro_Agencia CA');
          Add('left join Cadastro_Banco CB on (CA.Codigo_Banco = CB.Codigo_Banco)');
          Add('left join Cadastro_Logradouro CL on (CA.Codigo_Endereco = CL.Codigo)');
          Add('left join Cadastro_Cidade CC on (CA.Codigo_Cidade = CC.Codigo)');
          Add('where CA.Numero like '''+ FrmChama_Agencia.EdtConsulta.Text  +'%'' order by CA.Numero');
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Agenda_Compromisso;
begin
  if FrmChama_Agenda_Compromisso.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Agenda_Compromisso.qrychama_agenda, Sql do
        begin
          close;
          Clear;
          Add('select * from Agenda_Compromisso');
          Add('where Codigo like '''+ FrmChama_Agenda_Compromisso.EdtConsulta.Text  +'%'' order by Data_Compromisso');
          open;

        end;
    end
    else if FrmChama_Agenda_Compromisso.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Agenda_Compromisso.qrychama_agenda, Sql do
        begin
          close;
          Clear;
          Add('select * from Agenda_Compromisso');
          Add('where CONVERT(CHAR(10),Data_Compromisso,103) like '''+ FrmChama_Agenda_Compromisso.EdtConsulta.Text  +'%'' order by Data_Compromisso');
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Agenda_Telefonica;
begin
  if FrmChama_Agenda_Telefonica.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Agenda_Telefonica.qrychama_agenda, Sql do
        begin
          close;
          Clear;
          Add('select * from Agenda_Telefonica');
          Add('where Codigo like '''+ FrmChama_Agenda_Telefonica.EdtConsulta.Text  +'%'' order by Nome');
          open;

        end;
    end
    else if FrmChama_Agenda_Telefonica.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Agenda_Telefonica.qrychama_agenda, Sql do
        begin
          close;
          Clear;
          Add('select * from Agenda_Telefonica');
          Add('where Nome like '''+ FrmChama_Agenda_Telefonica.EdtConsulta.Text  +'%'' order by Nome');
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Banco;
begin
  if FrmChama_Banco.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Banco.qrychama_banco, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Banco CB');
          Add('where CB.Codigo_Banco like '''+ FrmChama_Banco.EdtConsulta.Text  +'%'' order by CB.Nome');
          open;

        end;
    end
    else if FrmChama_Banco.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Banco.qrychama_banco, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Banco CB');
          Add('where CB.Nome like '''+ FrmChama_Banco.EdtConsulta.Text  +'%'' order by CB.Nome');
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Bem_Patrimonial;
begin
  if FrmChama_Bem_Patrimonio.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Bem_Patrimonio.qrychama_bem, Sql do
        begin
          close;
          Clear;
          Add('select CBP.*, UM.Descricao as Unidade_Medida,');
          Add('CTBP.Tipo_Bem as Tipo_Bem from Cadastro_Bem_Patrimonial CBP');
          Add('left join Unidade_Medida UM on (CBP.Codigo_Unidade = UM.Codigo)');
          Add('left join Cadastro_Tipo_Bem_Patrimonial CTBP on (CBP.Codigo_Tipo_Bem_Patrimonial = CTBP.Codigo)');
          Add('where CBP.Codigo_Propriedade = :Propriedade and CBP.Codigo like '''+ FrmChama_Bem_Patrimonio.EdtConsulta.Text  +'%'' order by CBP.Descricao');
          Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
          open;

        end;
    end
    else if FrmChama_Bem_Patrimonio.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Bem_Patrimonio.qrychama_bem, Sql do
        begin
          close;
          Clear;
          Add('select CBP.*, UM.Descricao as Unidade_Medida,');
          Add('CTBP.Tipo_Bem as Tipo_Bem from Cadastro_Bem_Patrimonial CBP');
          Add('left join Unidade_Medida UM on (CBP.Codigo_Unidade = UM.Codigo)');
          Add('left join Cadastro_Tipo_Bem_Patrimonial CTBP on (CBP.Codigo_Tipo_Bem_Patrimonial = CTBP.Codigo)');
          Add('where CBP.Codigo_Propriedade = :Propriedade and CBP.Descricao like '''+ FrmChama_Bem_Patrimonio.EdtConsulta.Text  +'%'' order by CBP.Descricao');
          Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Cidade;
begin
  if FrmChama_Cidade.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Cidade.qrychama_cidade, Sql do
        begin
          close;
          Clear;
          Add('select CC.* from Cadastro_Cidade CC');
          Add('where CC.Codigo like '''+ FrmChama_Cidade.EdtConsulta.Text  +'%'' order by CC.Cidade');
          open;

        end;
    end
    else if FrmChama_Cidade.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Cidade.qrychama_cidade, Sql do
        begin
          close;
          Clear;
          Add('select CC.* from Cadastro_Cidade CC');
          Add('where CC.Cidade like '''+ FrmChama_Cidade.EdtConsulta.Text  +'%'' order by CC.Cidade');
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Cliente;
begin
  if FrmChama_Cliente.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Cliente.qrychama_Cliente, Sql do
        begin
          close;
          Clear;
          Add('select CC.*, CL.Logradouro, CL.CEP, CL.Tipo_Logradouro,');
          Add('CCi.Cidade, CCi.UF, CS.Descricao from Cadastro_Cliente CC');
          Add('Left join Cadastro_Logradouro CL on (CC.Codigo_Endereco = CL.Codigo)');
          Add('Left join Cadastro_Cidade CCi on (CC.Codigo_Cidade = CCi.Codigo)');
          Add('Left join Cadastro_Setor CS on (CC.Codigo_Setor = CS.Codigo)');

          Add('where CC.Tipo = :Tipo and CC.Codigo like '''+ FrmChama_Cliente.EdtConsulta.Text  +'%'' order by CC.Nome');

          if FrmChama_Cliente.RGTipo.ItemIndex = 0 then
            Parameters.ParamByName('Tipo').Value:= 'CLIENTE'
          else if FrmChama_Cliente.RGTipo.ItemIndex = 1 then
            Parameters.ParamByName('Tipo').Value:= 'FORNECEDOR'
          else if FrmChama_Cliente.RGTipo.ItemIndex = 2 then
            Parameters.ParamByName('Tipo').Value:= 'FUNCIONÁRIO';
          open;
        end;
    end
    else if FrmChama_Cliente.RGConsulta_Por.ItemIndex = 1 then
    begin
      with FrmChama_Cliente.qrychama_cliente, Sql do
        begin
          close;
          Clear;
          Add('select CC.*, CL.Logradouro, CL.CEP, CL.Tipo_Logradouro,');
          Add('CCi.Cidade, CCi.UF, CS.Descricao from Cadastro_Cliente CC');
          Add('Left join Cadastro_Logradouro CL on (CC.Codigo_Endereco = CL.Codigo)');
          Add('Left join Cadastro_Cidade CCi on (CC.Codigo_Cidade = CCi.Codigo)');
          Add('Left join Cadastro_Setor CS on (CC.Codigo_Setor = CS.Codigo)');

          Add('where CC.Tipo = :Tipo and CC.Nome like '''+ FrmChama_Cliente.EdtConsulta.Text  +'%'' order by CC.Nome');

          if FrmChama_Cliente.RGTipo.ItemIndex = 0 then
            Parameters.ParamByName('Tipo').Value:= 'CLIENTE'
          else if FrmChama_Cliente.RGTipo.ItemIndex = 1 then
            Parameters.ParamByName('Tipo').Value:= 'FORNECEDOR'
          else if FrmChama_Cliente.RGTipo.ItemIndex = 2 then
            Parameters.ParamByName('Tipo').Value:= 'FUNCIONÁRIO';
          open;
        end;
    end
    else if FrmChama_Cliente.RGConsulta_Por.ItemIndex = 2 then
    begin
      with FrmChama_Cliente.qrychama_cliente, Sql do
        begin
          close;
          Clear;
          Add('select CC.*, CL.Logradouro, CL.CEP, CL.Tipo_Logradouro,');
          Add('CCi.Cidade, CCi.UF, CS.Descricao from Cadastro_Cliente CC');
          Add('Left join Cadastro_Logradouro CL on (CC.Codigo_Endereco = CL.Codigo)');
          Add('Left join Cadastro_Cidade CCi on (CC.Codigo_Cidade = CCi.Codigo)');
          Add('Left join Cadastro_Setor CS on (CC.Codigo_Setor = CS.Codigo)');

          Add('where CC.Tipo = :Tipo and CL.Logradouro like '''+ FrmChama_Cliente.EdtConsulta.Text  +'%'' order by CC.Nome');

          if FrmChama_Cliente.RGTipo.ItemIndex = 0 then
            Parameters.ParamByName('Tipo').Value:= 'CLIENTE'
          else if FrmChama_Cliente.RGTipo.ItemIndex = 1 then
            Parameters.ParamByName('Tipo').Value:= 'FORNECEDOR'
          else if FrmChama_Cliente.RGTipo.ItemIndex = 2 then
            Parameters.ParamByName('Tipo').Value:= 'FUNCIONÁRIO';
          open;
        end;
    end;
end;

procedure TConsulta.Chama_Condicao_Pagamento;
begin
  if FrmChama_Condicao_Pagamento.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Condicao_Pagamento.qrychama_condicao, Sql do
        begin
          close;
          Clear;
          Add('select * from Condicao_Pagamento');

          Add('where Status = :Status and Codigo like '''+ FrmChama_Condicao_Pagamento.EdtConsulta.Text  +'%'' order by Descricao');
          Parameters.ParamByName('Status').Value:= 'ATIVO';
          open;
        end;
    end
    else if FrmChama_Condicao_Pagamento.RGConsulta_Por.ItemIndex = 1 then
    begin
      with FrmChama_Condicao_Pagamento.qrychama_condicao, Sql do
        begin
          close;
          Clear;
          Add('select * from Condicao_Pagamento');

          Add('where Status = :Status and Descricao like '''+ FrmChama_Condicao_Pagamento.EdtConsulta.Text  +'%'' order by Descricao');
          Parameters.ParamByName('Status').Value:= 'ATIVO';
          open;
        end;
    end;
end;

procedure TConsulta.Chama_Conta_Corrente;
begin
  if FrmChama_Conta_Corrente.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Conta_Corrente.qrychama_conta, Sql do
        begin
          close;
          Clear;
          Add('select CCC.*, CA.Numero as Agencia, CB.Nome as Banco from Cadastro_Conta_Corrente CCC');
          Add('left join Cadastro_Agencia CA on (CCC.Codigo_Agencia = CA.Codigo_Agencia)');
          Add('left join Cadastro_Banco CB on (CA.Codigo_Banco = CB.Codigo_Banco)');
          Add('where CCC.Codigo_Conta_Corrente like '''+ FrmChama_Conta_Corrente.EdtConsulta.Text  +'%'' order by CCC.Conta_Corrente');
          open;
        end;
    end
    else if FrmChama_Conta_Corrente.RGConsulta_Por.ItemIndex = 1 then
    begin
      with FrmChama_Conta_Corrente.qrychama_conta, Sql do
        begin
          close;
          Clear;
          Add('select CCC.*, CA.Numero as Agencia, CB.Nome as Banco from Cadastro_Conta_Corrente CCC');
          Add('left join Cadastro_Agencia CA on (CCC.Codigo_Agencia = CA.Codigo_Agencia)');
          Add('left join Cadastro_Banco CB on (CA.Codigo_Banco = CB.Codigo_Banco)');
          Add('where CCC.Conta_Corrente like '''+ FrmChama_Conta_Corrente.EdtConsulta.Text  +'%'' order by CCC.Conta_Corrente');
          open;
        end;
    end;
end;

procedure TConsulta.Chama_Cultura;
begin
  if FrmChama_Cultura.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Cultura.qrychama, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Cultura');
          Add('where Codigo like '''+ FrmChama_Cultura.EdtConsulta.Text  +'%'' order by Descricao');
          open;
        end;
    end
    else if FrmChama_Cultura.RGConsulta_Por.ItemIndex = 1 then
    begin
      with FrmChama_Cultura.qrychama, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Cultura');
          Add('where Descricao like '''+ FrmChama_Cultura.EdtConsulta.Text  +'%'' order by Descricao');
          open;
        end;
    end;
end;

procedure TConsulta.Chama_Departamento;
begin
  if FrmChama_Departamento.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Departamento.qrychama_departamento, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Departamento');
          Add('where Codigo like '''+ FrmChama_Departamento.EdtConsulta.Text  +'%'' order by Descricao');
          open;
        end;
    end
    else if FrmChama_Departamento.RGConsulta_Por.ItemIndex = 1 then
    begin
      with FrmChama_Departamento.qrychama_departamento, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Departamento');
          Add('where Descricao like '''+ FrmChama_Departamento.EdtConsulta.Text  +'%'' order by Descricao');
          open;
        end;
    end;
end;

procedure TConsulta.Chama_Lancamento_Financeiro_Alterar;
begin
  if FrmChama_Lancamento_Financeiro_Alterar.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento, Sql do
        begin
          close;
          Clear;
          Add('select LF.*, CP.Descricao as Condicao_Pagamento, Cli.Nome, TD.Descricao as Tipo_Documento, D.Descricao as Departamento,');
          Add('PF.Descricao as Plano_Financeiro, CS.Descricao + ' + QuotedStr(' ') + ' + CC.Descricao as Safra from Lancamento_Financeiro LF');
          Add('left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo)');
          Add('left join Cadastro_Cliente Cli on (LF.Codigo_Cli_For = Cli.Codigo)');
          Add('left join Cadastro_Tipo_Documento TD on (LF.Codigo_Tipo_Documento = TD.Codigo)');
          Add('left join Cadastro_Departamento D on (LF.Codigo_Departamento = D.Codigo)');
          Add('left join Cadastro_Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)');
          Add('left join Cadastro_Safra CS on (LF.Codigo_Safra = CS.Codigo)');
          Add('left join Cadastro_Cultura CC on (CS.Codigo_Tipo_Cultura = CC.Codigo)');
          Add('where LF.Codigo_Empresa = :Empresa and LF.Codigo like '''+ FrmChama_Lancamento_Financeiro_Alterar.EdtConsulta.Text  +'%'' order by LF.N_Documento');
          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          open;

        end;
    end
    else if FrmChama_Lancamento_Financeiro_Alterar.RGConsulta_Por.ItemIndex = 1 then
    begin
    with FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento, Sql do
      begin
        close;
        Clear;
        Add('select LF.*, CP.Descricao as Condicao_Pagamento, Cli.Nome, TD.Descricao as Tipo_Documento, D.Descricao as Departamento,');
        Add('PF.Descricao as Plano_Financeiro, CS.Descricao + ' + QuotedStr(' ') + ' + CC.Descricao as Safra from Lancamento_Financeiro LF');
        Add('left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Cliente Cli on (LF.Codigo_Cli_For = Cli.Codigo)');
        Add('left join Cadastro_Tipo_Documento TD on (LF.Codigo_Tipo_Documento = TD.Codigo)');
        Add('left join Cadastro_Departamento D on (LF.Codigo_Departamento = D.Codigo)');
        Add('left join Cadastro_Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)');
        Add('left join Cadastro_Safra CS on (LF.Codigo_Safra = CS.Codigo)');
        Add('left join Cadastro_Cultura CC on (CS.Codigo_Tipo_Cultura = CC.Codigo)');
        Add('where LF.Codigo_Empresa = :Empresa and LF.N_Documento like '''+ FrmChama_Lancamento_Financeiro_Alterar.EdtConsulta.Text  +'%'' order by LF.N_Documento');
        Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
        open;
      end;
    end
    else if FrmChama_Lancamento_Financeiro_Alterar.RGConsulta_Por.ItemIndex = 2 then
    begin
    with FrmChama_Lancamento_Financeiro_Alterar.qrychama_lancamento, Sql do
      begin
        close;
        Clear;
        Add('select LF.*, CP.Descricao as Condicao_Pagamento, Cli.Nome, TD.Descricao as Tipo_Documento, D.Descricao as Departamento,');
        Add('PF.Descricao as Plano_Financeiro, CS.Descricao + ' + QuotedStr(' ') + ' + CC.Descricao as Safra from Lancamento_Financeiro LF');
        Add('left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Cliente Cli on (LF.Codigo_Cli_For = Cli.Codigo)');
        Add('left join Cadastro_Tipo_Documento TD on (LF.Codigo_Tipo_Documento = TD.Codigo)');
        Add('left join Cadastro_Departamento D on (LF.Codigo_Departamento = D.Codigo)');
        Add('left join Cadastro_Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)');
        Add('left join Cadastro_Safra CS on (LF.Codigo_Safra = CS.Codigo)');
        Add('left join Cadastro_Cultura CC on (CS.Codigo_Tipo_Cultura = CC.Codigo)');
        Add('where LF.Codigo_Empresa = :Empresa and Cli.Nome like '''+ FrmChama_Lancamento_Financeiro_Alterar.EdtConsulta.Text  +'%'' order by LF.N_Documento');
        Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
        open;
      end;
    end;
end;

procedure TConsulta.Chama_Empresa;
begin
  if FrmChama_Empresa.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Empresa.qrychama_Empresa, Sql do
        begin
          close;
          Clear;
          Add('select CE.*, CL.Logradouro, CL.CEP, CL.Tipo_Logradouro,');
          Add('CCi.Cidade, CCi.UF, CS.Descricao from Cadastro_Empresa CE');
          Add('Left join Cadastro_Logradouro CL on (CE.Codigo_Endereco = CL.Codigo)');
          Add('Left join Cadastro_Cidade CCi on (CE.Codigo_Cidade = CCi.Codigo)');
          Add('Left join Cadastro_Setor CS on (CE.Codigo_Setor = CS.Codigo)');

          Add('where CE.Codigo like '''+ FrmChama_Empresa.EdtConsulta.Text  +'%'' order by CE.Nome_Fantasia');
          open;
        end;
    end
    else if FrmChama_Empresa.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Empresa.qrychama_Empresa, Sql do
        begin
          close;
          Clear;
          Add('select CE.*, CL.Logradouro, CL.CEP, CL.Tipo_Logradouro,');
          Add('CCi.Cidade, CCi.UF, CS.Descricao from Cadastro_Empresa CE');
          Add('Left join Cadastro_Logradouro CL on (CE.Codigo_Endereco = CL.Codigo)');
          Add('Left join Cadastro_Cidade CCi on (CE.Codigo_Cidade = CCi.Codigo)');
          Add('Left join Cadastro_Setor CS on (CE.Codigo_Setor = CS.Codigo)');

          Add('where CE.Nome_Fantasia like '''+ FrmChama_Empresa.EdtConsulta.Text  +'%'' order by CE.Nome_Fantasia');
          open;
        end;
      end;

end;

procedure TConsulta.Chama_Folha;
begin
  with FrmChama_Folha_Pagamento.qrychama_folha do
    begin
      close;
      sql.clear;
      sql.add('Select FP.*, Cli.Nome from Folha_Pagamento FP');
      sql.add('inner join Cadastro_Cliente Cli on (FP.Codigo_Funcionario = Cli.Codigo)');

      case (FrmChama_Folha_Pagamento.RGConsulta_Por.ItemIndex) of
        0: sql.add('where Cli.Nome like '''+ FrmChama_Folha_Pagamento.EdtConsulta.Text +'%''');
        1: sql.add('where FP.Mes_Ano = :Mes');
      end;

      case (FrmChama_Folha_Pagamento.RGConsulta_Por.ItemIndex) of
        1: Parameters.ParamByName('Mes').Value:= FrmChama_Folha_Pagamento.EdtConsulta.Text;
      end;

      open;

      if (FrmChama_Folha_Pagamento.qrychama_folha.IsEmpty = true) then
        begin
          Mensagem.Fim_Pesquisa;
          abort;
        end;
    end;
end;

procedure TConsulta.Chama_Grupo_Maquina;
begin
  if FrmChama_Grupo_Maquina.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Grupo_Maquina.qrychama_grupo_maquina, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Grupo_Maquina CGM');
          Add('where CGM.Codigo like '''+ FrmChama_Grupo_Maquina.EdtConsulta.Text  +'%'' order by CGM.Descricao');
          open;

        end;
    end
    else if FrmChama_Grupo_Maquina.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Grupo_Maquina.qrychama_grupo_maquina, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Grupo_Maquina CGM');
          Add('where CGM.Descricao like '''+ FrmChama_Grupo_Maquina.EdtConsulta.Text  +'%'' order by CGM.Descricao');
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Itens_Folha_Pagamento;
begin
  if FrmChama_Item_Folha_Pagamento.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Item_Folha_Pagamento.qrychama, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Itens_Folha_Pagamento CIFP');
          Add('where CIFP.Codigo like '''+ FrmChama_Item_Folha_Pagamento.EdtConsulta.Text  +'%'' order by CIFP.Descricao');
          open;

        end;
    end
    else if FrmChama_Item_Folha_Pagamento.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Item_Folha_Pagamento.qrychama, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Itens_Folha_Pagamento CIFP');
          Add('where CIFP.Descricao like '''+ FrmChama_Item_Folha_Pagamento.EdtConsulta.Text  +'%'' order by CIFP.Descricao');
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Logradouro;
begin
  if FrmChama_Logradouro.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Logradouro.qrychama_Logradouro, Sql do
        begin
          close;
          Clear;
          Add('select CL.* from Cadastro_Logradouro CL');
          Add('where CL.Codigo like '''+ FrmChama_Logradouro.EdtConsulta.Text  +'%'' order by CL.Logradouro');
          open;

        end;
    end
    else if FrmChama_Logradouro.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Logradouro.qrychama_Logradouro, Sql do
        begin
          close;
          Clear;
          Add('select CL.* from Cadastro_Logradouro CL');
          Add('where CL.Logradouro like '''+ FrmChama_Logradouro.EdtConsulta.Text  +'%'' order by CL.Logradouro');
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Maquina;
begin
  if FrmChama_Maquina.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Maquina.qrychama_maquina, Sql do
        begin
          close;
          Clear;
          Add('select CM.*, CMM.Descricao as Marca, CGM.Descricao as Grupo');
          Add('from Cadastro_Maquina CM');
          Add('left join Cadastro_Marca CMM on (CM.Codigo_Marca = CMM.Codigo)');
          Add('left join Cadastro_Grupo_Maquina CGM on (CM.Codigo_Grupo = CGM.Codigo)');
          Add('where CM.Codigo_Propriedade = :Propriedade and CM.Placa like '''+ FrmChama_Maquina.EdtConsulta.Text  +'%'' order by CM.Descricao');
          Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
          open;

        end;
    end
    else if FrmChama_Maquina.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Maquina.qrychama_maquina, Sql do
        begin
          close;
          Clear;
          Add('select CM.*, CMM.Descricao as Marca, CGM.Descricao as Grupo');
          Add('from Cadastro_Maquina CM');
          Add('left join Cadastro_Marca CMM on (CM.Codigo_Marca = CMM.Codigo)');
          Add('left join Cadastro_Grupo_Maquina CGM on (CM.Codigo_Grupo = CGM.Codigo)');
          Add('where CM.Codigo_Propriedade = :Propriedade and CM.Descricao like '''+ FrmChama_Maquina.EdtConsulta.Text  +'%'' order by CM.Descricao');
          Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Marca;
begin
  if FrmChama_Marca.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Marca.qrychama_marca, Sql do
        begin
          close;
          Clear;
          Add('select CM.* from Cadastro_Marca CM');
          Add('where CM.Codigo like '''+ FrmChama_Marca.EdtConsulta.Text  +'%'' order by CM.Descricao');
          open;

        end;
    end
    else if FrmChama_Marca.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Marca.qrychama_marca, Sql do
        begin
          close;
          Clear;
          Add('select CM.* from Cadastro_Marca CM');
          Add('where CM.Descricao like '''+ FrmChama_Marca.EdtConsulta.Text  +'%'' order by CM.Descricao');
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Perfil;
begin
  if FrmChama_Perfil.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Perfil.qrychama_perfil, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Perfil_Usuario CPU');
          Add('where CPU.Codigo like '''+ FrmChama_Perfil.EdtConsulta.Text  +'%'' order by CPU.Perfil');
          open;
        end;
    end
    else if FrmChama_Perfil.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Perfil.qrychama_perfil, Sql do
        begin
          close;
          Clear;
          Add('select * from Cadastro_Perfil_Usuario CPU');
          Add('where CPU.Perfil like '''+ FrmChama_Perfil.EdtConsulta.Text  +'%'' order by CPU.Perfil');
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Produto;
begin
  if FrmChama_Produto.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Produto.qrychama, Sql do
        begin
          close;
          Clear;
          Add('select P.*, CGP.Descricao as Grupo_Produto, UM.Sigla as Unidade_Medida, UMV.Sigla as Unidade_Volume,');
          Add('CA.Brinco + ' + QuotedStr('-') + ' + CA.Nome as Animal from Cadastro_Produtos P');
          Add('left join Cadastro_Grupo_Produtos CGP on (P.Codigo_Grupo = CGP.Codigo)');
          Add('left join Unidade_Medida UM on (P.Codigo_Unidade = UM.Codigo)');
          Add('left join Unidade_Medida UMV on (P.Codigo_Unidade_Volume = UMV.Codigo)');
          Add('left join Cadastro_Animal CA on (P.Codigo_Animal_Reprodutor = CA.Codigo)');
          Add('where P.Codigo_Propriedade = :Propriedade and P.Codigo like '''+ FrmChama_Produto.EdtConsulta.Text  +'%'' order by P.Descricao');
          Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
          open;

        end;
    end
    else if FrmChama_Produto.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Produto.qrychama, Sql do
        begin
          close;
          Clear;
          Add('select P.*, CGP.Descricao as Grupo_Produto, UM.Sigla as Unidade_Medida, UMV.Sigla as Unidade_Volume,');
          Add('CA.Brinco + ' + QuotedStr('-') + ' + CA.Nome as Animal from Cadastro_Produtos P');
          Add('left join Cadastro_Grupo_Produtos CGP on (P.Codigo_Grupo = CGP.Codigo)');
          Add('left join Unidade_Medida UM on (P.Codigo_Unidade = UM.Codigo)');
          Add('left join Unidade_Medida UMV on (P.Codigo_Unidade_Volume = UMV.Codigo)');
          Add('left join Cadastro_Animal CA on (P.Codigo_Animal_Reprodutor = CA.Codigo)');
          Add('where P.Codigo_Propriedade = :Propriedade and P.Descricao like '''+ FrmChama_Produto.EdtConsulta.Text  +'%'' order by P.Descricao');
          Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Produto_Compra;
begin
  if (FrmChama_Produto_Compra.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmChama_Produto_Compra.qrychama_produto do
        begin
          close;
          sql.clear;
          sql.add('select IC.*, P.Codigo as Codigo_Produto_Int, P.Descricao, UM.Sigla from Itens_Compra IC');
          sql.add('inner join Cadastro_Produtos P on (IC.Codigo_Produto = P.Codigo)');
          sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade = UM.Codigo)');

          if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where IC.N_Pedido = :Parametro order by P.Codigo_Original')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where IC.N_Pedido = :Parametro order by P.Codigo_Venda')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where IC.N_Pedido = :Parametro order by P.Descricao');
          Parameters.ParamByName('Parametro').Value:= StrToInt(FrmChama_Produto_Compra.EdtConsulta.Text);
          open;

          if (FrmChama_Produto_Compra.qrychama_produto.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
    if (FrmChama_Produto_Compra.RGConsulta_Por.ItemIndex = 1) then
    begin
      with FrmChama_Produto_Compra.qrychama_produto do
        begin
          close;
          sql.clear;
          sql.add('select IC.*, P.Codigo as Codigo_Produto_Int, P.Descricao, UM.Sigla from Itens_Compra IC');
          sql.add('inner join Cadastro_Produtos P on (IC.Codigo_Produto = P.Codigo)');
          sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade = UM.Codigo)');

          if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where P.Codigo_Original = :Parametro order by P.Codigo_Original')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where P.Codigo_Original = :Parametro order by P.Codigo_Venda')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where P.Codigo_Original = :Parametro order by P.Descricao');
          Parameters.ParamByName('Parametro').Value:= FrmChama_Produto_Compra.EdtConsulta.Text;
          open;

          if (FrmChama_Produto_Compra.qrychama_produto.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
    if (FrmChama_Produto_Compra.RGConsulta_Por.ItemIndex = 2) then
    begin
      with FrmChama_Produto_Compra.qrychama_produto do
        begin
          close;
          sql.clear;
          sql.add('select IC.*, P.Codigo as Codigo_Produto_Int, P.Descricao, UM.Sigla from Itens_Compra IC');
          sql.add('inner join Cadastro_Produtos P on (IC.Codigo_Produto = P.Codigo)');
          sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade = UM.Codigo)');

          if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where P.Codigo_Venda = :Parametro order by P.Codigo_Original')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where P.Codigo_Venda = :Parametro order by P.Codigo_Venda')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where P.Codigo_Venda = :Parametro order by P.Descricao');
          Parameters.ParamByName('Parametro').Value:= FrmChama_Produto_Compra.EdtConsulta.Text;
          open;

          if (FrmChama_Produto_Compra.qrychama_produto.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else
    if (FrmChama_Produto_Compra.RGConsulta_Por.ItemIndex = 3) then
    begin
      with FrmChama_Produto_Compra.qrychama_produto do
        begin
          close;
          sql.clear;
          sql.add('select IC.*, P.Codigo as Codigo_Produto_Int, P.Descricao, UM.Sigla from Itens_Compra IC');
          sql.add('inner join Cadastro_Produtos P on (IC.Codigo_Produto = P.Codigo)');
          sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade = UM.Codigo)');

          if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where P.Descricao = :Parametro order by P.Codigo_Original')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where P.Descricao = :Parametro order by P.Codigo_Venda')
          else if (FrmChama_Produto_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where P.Descricao = :Parametro order by P.Descricao');
          Parameters.ParamByName('Parametro').Value:= FrmChama_Produto_Compra.EdtConsulta.Text;
          open;

          if (FrmChama_Produto_Compra.qrychama_produto.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Chama_Safra;
begin
  if FrmChama_Safra.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Safra.qrychama, Sql do
        begin
          close;
          Clear;
          Add('select CS.*, CC.Descricao as Cultura from Cadastro_Safra CS');
          Add('left join Cadastro_Cultura CC on (CS.Codigo_Tipo_Cultura = CC.Codigo)');
          Add('where CS.Codigo like '''+ FrmChama_Safra.EdtConsulta.Text  +'%'' order by CS.Descricao');
          open;

        end;
    end
    else if FrmChama_Safra.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Safra.qrychama, Sql do
        begin
          close;
          Clear;
          Add('select CS.*, CC.Descricao as Cultura from Cadastro_Safra CS');
          Add('left join Cadastro_Cultura CC on (CS.Codigo_Tipo_Cultura = CC.Codigo)');
          Add('where CS.Descricao like '''+ FrmChama_Safra.EdtConsulta.Text  +'%'' order by CS.Descricao');
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Setor;
begin
  if FrmChama_Setor.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Setor.qrychama_setor, Sql do
        begin
          close;
          Clear;
          Add('select CS.* from Cadastro_Setor CS');
          Add('where CS.Codigo like '''+ FrmChama_Setor.EdtConsulta.Text  +'%'' order by CS.Descricao');
          open;

        end;
    end
    else if FrmChama_Setor.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Setor.qrychama_setor, Sql do
        begin
          close;
          Clear;
          Add('select CS.* from Cadastro_Setor CS');
          Add('where CS.Descricao like '''+ FrmChama_Setor.EdtConsulta.Text  +'%'' order by CS.Descricao');
          open;
        end;
      end;
end;

procedure TConsulta.Chama_Unidade_Medida;
begin
  if FrmChama_Unidade_Medida.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Unidade_Medida.qrychama, Sql do
        begin
          close;
          Clear;
          Add('select * from Unidade_Medida');
          Add('where Codigo like '''+ FrmChama_Unidade_Medida.EdtConsulta.Text  +'%'' order by Descricao');
          open;
        end;
    end
    else if FrmChama_Unidade_Medida.RGConsulta_Por.ItemIndex = 1 then
    begin
      with FrmChama_Unidade_Medida.qrychama, Sql do
        begin
          close;
          Clear;
          Add('select * from Unidade_Medida');
          Add('where Descricao like '''+ FrmChama_Unidade_Medida.EdtConsulta.Text  +'%'' order by Descricao');
          open;
        end;
    end;
end;

procedure TConsulta.Chama_Usuario;
begin
  if FrmChama_Usuario.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmChama_Usuario.qrychama_Usuario, Sql do
        begin
          close;
          Clear;
          Add('select CU.*, CPU.Perfil from Cadastro_Usuario CU');
          Add('left join Cadastro_Perfil_Usuario CPU on (CU.Codigo_Perfil = CPU.Codigo)');
          if FrmChama_Usuario.RGOrdena_Por.ItemIndex = 0 then
            Add('where CU.Codigo like '''+ FrmChama_Usuario.EdtConsulta.Text  +'%'' order by CU.Codigo')
          else if FrmChama_Usuario.RGOrdena_Por.ItemIndex = 1 then
            Add('where CU.Codigo like '''+ FrmChama_Usuario.EdtConsulta.Text  +'%'' order by CU.Nome');
          open;

        end;
    end
    else if FrmChama_Usuario.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmChama_Usuario.qrychama_Usuario, Sql do
        begin
          close;
          Clear;
          Add('select CU.*, CPU.Perfil from Cadastro_Usuario CU');
          Add('left join Cadastro_Perfil_Usuario CPU on (CU.Codigo_Perfil = CPU.Codigo)');
          if FrmChama_Usuario.RGOrdena_Por.ItemIndex = 0 then
            Add('where CU.Nome like '''+ FrmChama_Usuario.EdtConsulta.Text  +'%'' order by CU.Codigo')
          else if FrmChama_Usuario.RGOrdena_Por.ItemIndex = 1 then
            Add('where CU.Nome like '''+ FrmChama_Usuario.EdtConsulta.Text  +'%'' order by CU.Nome');
          open;
        end;
      end;
end;

procedure TConsulta.Consulta_Cheque;
begin
  if (FrmConsulta_Cheque.RGSituacao.ItemIndex = 0) then
  begin
    if (FrmConsulta_Cheque.EdtCodigo_Conta.Text = '') then
    begin
      FrmConsulta_Cheque.EdtCodigo_Conta.SetFocus;
      Mensagem.Mensagem_Falta_Dados;
      abort;
    end;
  end;

  if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 4) or (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 5) or
     (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 6) or (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 7) or
     (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 8) or (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 9) then
  begin
    if (FrmConsulta_Cheque.MEdtData_Final.Text = '  /  /    ') or (FrmConsulta_Cheque.MEdtData_Inicial.Text = '  /  /    ') then
    begin
      FrmConsulta_Cheque.MEdtData_Inicial.SetFocus;
      Mensagem.Mensagem_Falta_Dados;
      abort;
    end;
  end;

  with FrmConsulta_Cheque.qryconsulta_cheque, sql do
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
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 3) then
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

    if (IsEmpty) then
    begin
      Mensagem.Fim_Pesquisa;
      abort;
    end;
  end;
end;

procedure TConsulta.Consulta_Comparativo_Preco_Cotacao;
begin
  if (FrmConsulta_Comparativo_Preco_Cotacao.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.Text = '') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.SetFocus;
        abort;
      end;

      with FrmConsulta_Comparativo_Preco_Cotacao.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select IRC.*, RC.Codigo_Fornecedor, RC.Codigo_Condicao_Pagamento, RC.Prazo_Entrega, CP.Descricao as Cond_Pag, CC.Nome, P.Descricao, UM.Sigla from Itens_Retorno_Cotacao_Preco IRC');
          sql.add('left join Retorno_Cotacao_Preco RC on (IRC.Codigo = RC.Codigo )');
          sql.add('left join Cadastro_Cliente CC on (RC.Codigo_Fornecedor = CC.Codigo)');
          sql.add('left join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('left join Cadastro_Produtos P on (P.Codigo = IRC.Codigo_Produto)');
          sql.add('left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade)');

          if (FrmConsulta_Comparativo_Preco_Cotacao.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :N_Cotacao and IRC.Status = :Status order by P.Descricao, IRC.Sub_Total')
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :N_Cotacao and IRC.Status = :Status order by CC.Nome, IRC.Sub_Total');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.Text);

          if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 1) then
            Parameters.ParamByName('Status').Value:= 'APROVADO'
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 2) then
            Parameters.ParamByName('Status').Value:= 'REPROVADO';
          open;

          if (FrmConsulta_Comparativo_Preco_Cotacao.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Comparativo_Preco_Cotacao.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.Text = '') or (FrmConsulta_Comparativo_Preco_Cotacao.EdtCodigo.Text = '') then
      begin
        Mensagem.Mensagem_Falta_Dados;;
        abort;
      end;

      with FrmConsulta_Comparativo_Preco_Cotacao.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select IRC.*, RC.Codigo_Fornecedor, RC.Codigo_Condicao_Pagamento, RC.Prazo_Entrega, CP.Descricao as Cond_Pag, CC.Nome, P.Descricao, UM.Sigla from Itens_Retorno_Cotacao_Preco IRC');
          sql.add('left join Retorno_Cotacao_Preco RC on (IRC.Codigo = RC.Codigo )');
          sql.add('left join Cadastro_Cliente CC on (RC.Codigo_Fornecedor = CC.Codigo)');
          sql.add('left join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('left join Cadastro_Produtos P on (P.Codigo = IRC.Codigo_Produto)');
          sql.add('left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade)');

          if (FrmConsulta_Comparativo_Preco_Cotacao.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :N_Cotacao and IRC.Codigo_Produto = :Produto and IRC.Status = :Status order by P.Descricao, IRC.Sub_Total')
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :N_Cotacao and IRC.Codigo_Produto = :Produto and IRC.Status = :Status order by CC.Nome, IRC.Sub_Total');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.Text);
          Parameters.ParamByName('Produto').Value:= StrToInt(FrmConsulta_Comparativo_Preco_Cotacao.EdtCodigo.Text);

          if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 1) then
            Parameters.ParamByName('Status').Value:= 'APROVADO'
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 2) then
            Parameters.ParamByName('Status').Value:= 'REPROVADO';
          open;

          if (FrmConsulta_Comparativo_Preco_Cotacao.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Comparativo_Preco_Cotacao.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.Text = '') or (FrmConsulta_Comparativo_Preco_Cotacao.EdtCodigo.Text = '') then
      begin
        Mensagem.Mensagem_Falta_Dados;;
        abort;
      end;

      with FrmConsulta_Comparativo_Preco_Cotacao.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('select IRC.*, RC.Codigo_Fornecedor, RC.Codigo_Condicao_Pagamento, RC.Prazo_Entrega, CP.Descricao as Cond_Pag, CC.Nome, P.Descricao, UM.Sigla from Itens_Retorno_Cotacao_Preco IRC');
          sql.add('left join Retorno_Cotacao_Preco RC on (IRC.Codigo = RC.Codigo )');
          sql.add('left join Cadastro_Cliente CC on (RC.Codigo_Fornecedor = CC.Codigo)');
          sql.add('left join Condicao_Pagamento CP on (RC.Codigo_Condicao_Pagamento = CP.Codigo)');
          sql.add('left join Cadastro_Produtos P on (P.Codigo = IRC.Codigo_Produto)');
          sql.add('left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade)');

          if (FrmConsulta_Comparativo_Preco_Cotacao.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :N_Cotacao and RC.Codigo_Fornecedor = :Fornecedor and IRC.Status = :Status order by P.Descricao, IRC.Sub_Total')
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where RC.Codigo_Empresa = :Empresa and RC.N_Cotacao = :N_Cotacao and RC.Codigo_Fornecedor = :Fornecedor and IRC.Status = :Status order by CC.Nome, IRC.Sub_Total');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmConsulta_Comparativo_Preco_Cotacao.EdtCotacao.Text);
          Parameters.ParamByName('Fornecedor').Value:= StrToInt(FrmConsulta_Comparativo_Preco_Cotacao.EdtCodigo.Text);

          if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 1) then
            Parameters.ParamByName('Status').Value:= 'APROVADO'
          else if (FrmConsulta_Comparativo_Preco_Cotacao.RGStatus.ItemIndex = 2) then
            Parameters.ParamByName('Status').Value:= 'REPROVADO';
          open;

          if (FrmConsulta_Comparativo_Preco_Cotacao.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Consulta_Compra;
begin
  if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Compra.EdtPedido.Text = '') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        FrmConsulta_Compra.EdtPedido.SetFocus;
        abort;
      end;

      with FrmConsulta_Compra.qryconsulta_compra do
        begin
          close;
          sql.clear;
          sql.add('select C.*, Forn.Nome, CP.Descricao from Compra C');
          sql.add('inner join Cadastro_Cliente Forn on (C.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (C.Codigo_Condicao_Pagamento = CP.Codigo)');
          if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.N_Pedido = :N_Pedido and C.Status = :Status order by C.Data_Pedido')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.N_Pedido = :N_Pedido and C.Status = :Status order by C.Data_Previsao_Entrega')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.N_Pedido = :N_Pedido and C.Status = :Status order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('N_Pedido').Value:= FrmConsulta_Compra.EdtPedido.Text;
          if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Status').Value:= 'BAIXADO';
          open;

          if (FrmConsulta_Compra.qryconsulta_compra.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Compra.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Compra.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Compra.qryconsulta_compra do
        begin
          close;
          sql.clear;
          sql.add('select C.*, Forn.Nome, CP.Descricao from Compra C');
          sql.add('inner join Cadastro_Cliente Forn on (C.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (C.Codigo_Condicao_Pagamento = CP.Codigo)');
          if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Pedido between :DI and :DF and C.Status = :Status order by C.Data_Pedido')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Pedido between :DI and :DF and C.Status = :Status order by C.Data_Previsao_Entrega')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Pedido between :DI and :DF and C.Status = :Status order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Final.Text);
          if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Status').Value:= 'BAIXADO';
          open;

          if (FrmConsulta_Compra.qryconsulta_compra.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Compra.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Compra.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Compra.qryconsulta_compra do
        begin
          close;
          sql.clear;
          sql.add('select C.*, Forn.Nome, CP.Descricao from Compra C');
          sql.add('inner join Cadastro_Cliente Forn on (C.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (C.Codigo_Condicao_Pagamento = CP.Codigo)');
          if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Previsao_Entrega between :DI and :DF and C.Status = :Status order by C.Data_Pedido')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Previsao_Entrega between :DI and :DF and C.Status = :Status order by C.Data_Previsao_Entrega')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Previsao_Entrega between :DI and :DF and C.Status = :Status order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Final.Text);
          if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Status').Value:= 'BAIXADO';
          open;

          if (FrmConsulta_Compra.qryconsulta_compra.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Compra.EdtCodigo_Fornecedor.Text = '') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        FrmConsulta_Compra.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Compra.qryconsulta_compra do
        begin
          close;
          sql.clear;
          sql.add('select C.*, Forn.Nome, CP.Descricao from Compra C');
          sql.add('inner join Cadastro_Cliente Forn on (C.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (C.Codigo_Condicao_Pagamento = CP.Codigo)');
          if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by C.Data_Pedido')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by C.Data_Previsao_Entrega')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Compra.EdtCodigo_Fornecedor.Text);
          if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Status').Value:= 'BAIXADO';
          open;

          if (FrmConsulta_Compra.qryconsulta_compra.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 4) then
    begin
      if (FrmConsulta_Compra.EdtCodigo_Fornecedor.Text = '') or (FrmConsulta_Compra.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Compra.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        FrmConsulta_Compra.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Compra.qryconsulta_compra do
        begin
          close;
          sql.clear;
          sql.add('select C.*, Forn.Nome, CP.Descricao from Compra C');
          sql.add('inner join Cadastro_Cliente Forn on (C.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (C.Codigo_Condicao_Pagamento = CP.Codigo)');
          if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Pedido between :DI and :DF and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by C.Data_Pedido')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Pedido between :DI and :DF and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by C.Data_Previsao_Entrega')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Pedido between :DI and :DF and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Final.Text);
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Compra.EdtCodigo_Fornecedor.Text);
          if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Status').Value:= 'BAIXADO';
          open;

          if (FrmConsulta_Compra.qryconsulta_compra.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Compra.RGConsulta_Por.ItemIndex = 5) then
    begin
      if (FrmConsulta_Compra.EdtCodigo_Fornecedor.Text = '') or (FrmConsulta_Compra.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Compra.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        FrmConsulta_Compra.EdtCodigo_Fornecedor.SetFocus;
        abort;
      end;

      with FrmConsulta_Compra.qryconsulta_compra do
        begin
          close;
          sql.clear;
          sql.add('select C.*, Forn.Nome, CP.Descricao from Compra C');
          sql.add('inner join Cadastro_Cliente Forn on (C.Codigo_Fornecedor = Forn.Codigo)');
          sql.add('inner join Condicao_Pagamento CP on (C.Codigo_Condicao_Pagamento = CP.Codigo)');
          if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Previsao_Entrega between :DI and :DF and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by C.Data_Pedido')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Previsao_Entrega between :DI and :DF and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by C.Data_Previsao_Entrega')
          else if (FrmConsulta_Compra.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where C.Codigo_Empresa = :Empresa and C.Data_Previsao_Entrega between :DI and :DF and C.Codigo_Fornecedor = :Forn and C.Status = :Status order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Compra.MEdtData_Final.Text);
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Compra.EdtCodigo_Fornecedor.Text);
          if (FrmConsulta_Compra.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Status').Value:= 'BAIXADO';
          open;

          if (FrmConsulta_Compra.qryconsulta_compra.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Consulta_Cotacao;
begin
  if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Cotacao_Preco_Produto.EdtCotacao.Text = '') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('Select CP.* from Cotacao_Preco_Produto CP');

          if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.N_Cotacao = :N_Cotacao order by CP.N_Cotacao')
          else if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.N_Cotacao = :N_Cotacao order by CP.Responsavel');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('N_Cotacao').Value:= FrmConsulta_Cotacao_Preco_Produto.EdtCotacao.Text;
          open;

          if (FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text = '  /  /    ') or
          (FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('Select CP.* from Cotacao_Preco_Produto CP');

          if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.Data_Cotacao between :DI and :DF order by CP.N_Cotacao')
          else if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.Data_Cotacao between :DI and :DF order by CP.Responsavel');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('DI').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text;
          Parameters.ParamByName('DF').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text;
          open;

          if (FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text = '  /  /    ') or
          (FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao do
        begin
          close;
          sql.clear;
          sql.add('Select CP.* from Cotacao_Preco_Produto CP');

          if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.Data_Vencimento between :DI and :DF order by CP.N_Cotacao')
          else if (FrmConsulta_Cotacao_Preco_Produto.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where CP.Codigo_Empresa = :Empresa and CP.Data_Vencimento between :DI and :DF order by CP.Responsavel');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('DI').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text;
          Parameters.ParamByName('DF').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text;
          open;

          if (FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
end;

procedure TConsulta.Consulta_Estoque;
begin
  if FrmConsulta_Estoque.RGConsulta_Por.ItemIndex = 0 then
    begin
    with FrmConsulta_Estoque.qryconsulta, Sql do
      begin
        close;
        Clear;
        Add('select CP.*, CGP.Descricao as Grupo, UM.Sigla as Unidade, CA.Brinco + ' + QuotedStr(' - ') + ' + CA.Nome as Animal,');
        add('(select count(*) from Cadastro_Produtos CP where CP.Codigo_Propriedade = :Propriedadee) as Qtde');
        add(' from Cadastro_Produtos CP');
        Add('left join Cadastro_Grupo_Produtos CGP on (CP.Codigo_Grupo = CGP.Codigo)');
        Add('left join Unidade_Medida UM on (CP.Codigo_Unidade = UM.Codigo)');
        Add('left join Cadastro_Animal CA on (CP.Codigo_Animal_Reprodutor = CA.Codigo)');

        case FrmConsulta_Estoque.RGOrdena_Por.ItemIndex of
          0: Add('where CP.Codigo_Propriedade = :Propriedade order by CP.Descricao');
          1: Add('where CP.Codigo_Propriedade = :Propriedade order by CGP.Descricao');
          2: Add('where CP.Codigo_Propriedade = :Propriedade order by CP.Tipo_Produto');
        end;

        Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
        Parameters.ParamByName('Propriedadee').Value:= Codigo_Empresa;

        open;

      end;
    end
    else
    begin
    with FrmConsulta_Estoque.qryconsulta, Sql do
      begin
        close;
        Clear;
        Add('select CP.*, CGP.Descricao as Grupo, UM.Sigla as Unidade, CA.Brinco + ' + QuotedStr(' - ') + ' + CA.Nome as Animal, ');
        add('(select count(*) from Cadastro_Produtos CP where CP.Codigo_Propriedade = :Propriedadee and CP.Tipo_Produto = :Tipoo) as Qtde');
        add('from Cadastro_Produtos CP');
        Add('left join Cadastro_Grupo_Produtos CGP on (CP.Codigo_Grupo = CGP.Codigo)');
        Add('left join Unidade_Medida UM on (CP.Codigo_Unidade = UM.Codigo)');
        Add('left join Cadastro_Animal CA on (CP.Codigo_Animal_Reprodutor = CA.Codigo)');

        case FrmConsulta_Estoque.RGOrdena_Por.ItemIndex of
          0: Add('where CP.Codigo_Propriedade = :Propriedade and CP.Tipo_Produto = :Tipo order by CP.Descricao');
          1: Add('where CP.Codigo_Propriedade = :Propriedade and CP.Tipo_Produto = :Tipo order by CGP.Descricao');
          2: Add('where CP.Codigo_Propriedade = :Propriedade and CP.Tipo_Produto = :Tipo order by CP.Tipo_Produto');
        end;

        Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
        Parameters.ParamByName('Propriedadee').Value:= Codigo_Empresa;

        case FrmConsulta_Estoque.RGConsulta_Por.ItemIndex of
          1: Parameters.ParamByName('Tipo').Value:= 'Medicamento';
          2: Parameters.ParamByName('Tipo').Value:= 'Consumo Animal';
          3: Parameters.ParamByName('Tipo').Value:= 'Semen';
          4: Parameters.ParamByName('Tipo').Value:= 'Embrião';
          5: Parameters.ParamByName('Tipo').Value:= 'Outros';
        end;

        case FrmConsulta_Estoque.RGConsulta_Por.ItemIndex of
          1: Parameters.ParamByName('Tipoo').Value:= 'Medicamento';
          2: Parameters.ParamByName('Tipoo').Value:= 'Consumo Animal';
          3: Parameters.ParamByName('Tipoo').Value:= 'Semen';
          4: Parameters.ParamByName('Tipoo').Value:= 'Embrião';
          5: Parameters.ParamByName('Tipoo').Value:= 'Outros';
        end;

        open;
      end;
    end;
    FrmConsulta_Estoque.EdtTotal.Text:= FrmConsulta_Estoque.qryconsultaQTde.AsString;
end;

procedure TConsulta.Consulta_Extrato_Bancario;
begin
  if (FrmConsulta_Extrato_Bancario.EdtCodigo_Conta.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    FrmConsulta_Extrato_Bancario.EdtCodigo_Conta.SetFocus;
    abort;
  end;

  if (FrmConsulta_Extrato_Bancario.MEdtData_Inicial.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    FrmConsulta_Extrato_Bancario.MEdtData_Inicial.SetFocus;
    abort;
  end;

  if (FrmConsulta_Extrato_Bancario.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    FrmConsulta_Extrato_Bancario.MEdtData_Final.SetFocus;
    abort;
  end;

  with FrmConsulta_Extrato_Bancario.qryconsulta_saldo do
  begin
    close;
    sql.clear;
    sql.add('select LB.*, CCC.Conta_Corrente, O.Operacao, O.Tipo as Tipo_Operacao, CC.Numero_Cheque');
    sql.add('from Lancamento_Banco LB');
    sql.add('left join Cadastro_Conta_Corrente CCC on (LB.Codigo_Conta = CCC.Codigo_Conta_Corrente)');
    sql.add('left join Operacao_Bancaria O on (LB.Codigo_Operacao = O.Codigo)');
    sql.add('left join Cadastro_Cheque CC on (LB.Codigo_Cheque = CC.Codigo_Cheque)');
    sql.Add('where LB.Codigo_Empresa = :Empresa and LB.Codigo_Conta = :Conta and LB.Data_Lancamento between :DI and :DF');
    Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
    Parameters.ParamByName('Conta').Value:= StrToInt(FrmConsulta_Extrato_Bancario.EdtCodigo_Conta.Text);
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Extrato_Bancario.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Extrato_Bancario.MEdtData_Final.Text);
    open;

    if (FrmConsulta_Extrato_Bancario.qryconsulta_saldo.IsEmpty = true) then
    begin
      Mensagem.Fim_Pesquisa;
      abort;
    end;
  end;
end;

procedure TConsulta.Consulta_Folha_Pagamento;
begin
  if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 0) then
    begin
      if (FrmConsulta_Folha_Pagamento.EdtCodigo_Funcionario.Text = '') or
         (FrmConsulta_Folha_Pagamento.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Folha_Pagamento.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Folha_Pagamento.qryconsulta_folha do
        begin
          close;
          sql.clear;
          sql.add('Select FP.*, Cli.Nome from Folha_Pagamento FP');
          sql.add('inner join Cadastro_Cliente Cli on (FP.Codigo_Funcionario = Cli.Codigo)');
          if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where FP.Codigo_Propriedade = :Empresa and FP.Codigo_Funcionario = :Nome and Data_Fechamento between :DI and :DF order by FP.Data_Fechamento')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where FP.Codigo_Propriedade = :Empresa and FP.Codigo_Funcionario = :Nome and Data_Fechamento between :DI and :DF order by FP.Mes_Ano')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where FP.Codigo_Propriedade = :Empresa and FP.Codigo_Funcionario = :Nome and Data_Fechamento between :DI and :DF order by Cli.Nome');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('Nome').Value:= StrToInt(FrmConsulta_Folha_Pagamento.EdtCodigo_Funcionario.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Folha_Pagamento.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Folha_Pagamento.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Folha_Pagamento.qryconsulta_folha.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Folha_Pagamento.EdtCodigo_Funcionario.Text = '') or
         (FrmConsulta_Folha_Pagamento.MEdtMes_Ano.Text = '  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Folha_Pagamento.qryconsulta_folha do
        begin
          close;
          sql.clear;
          sql.add('Select FP.*, Cli.Nome from Folha_Pagamento FP');
          sql.add('inner join Cadastro_Cliente Cli on (FP.Codigo_Funcionario = Cli.Codigo)');
          if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where FP.Codigo_Propriedade = :Empresa and FP.Codigo_Funcionario = :Nome and Mes_Ano = :Mes order by FP.Data_Fechamento')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where FP.Codigo_Propriedade = :Empresa and FP.Codigo_Funcionario = :Nome and Mes_Ano = :Mes order by FP.Mes_Ano')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where FP.Codigo_Propriedade = :Empresa and FP.Codigo_Funcionario = :Nome and Mes_Ano = :Mes order by Cli.Nome');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('Nome').Value:= StrToInt(FrmConsulta_Folha_Pagamento.EdtCodigo_Funcionario.Text);
          Parameters.ParamByName('Mes').Value:= FrmConsulta_Folha_Pagamento.MEdtMes_Ano.Text;
          open;
          if (FrmConsulta_Folha_Pagamento.qryconsulta_folha.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Folha_Pagamento.MEdtMes_Ano.Text = '  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Folha_Pagamento.qryconsulta_folha do
        begin
          close;
          sql.clear;
          sql.add('Select FP.*, Cli.Nome from Folha_Pagamento FP');
          sql.add('inner join Cadastro_Cliente Cli on (FP.Codigo_Funcionario = Cli.Codigo)');
          if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where FP.Codigo_Propriedade = :Empresa and Mes_Ano = :Mes order by FP.Data_Fechamento')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where FP.Codigo_Propriedade = :Empresa and Mes_Ano = :Mes order by FP.Mes_Ano')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where FP.Codigo_Propriedade = :Empresa and Mes_Ano = :Mes order by Cli.Nome');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('Mes').Value:= FrmConsulta_Folha_Pagamento.MEdtMes_Ano.Text;
          open;
          if (FrmConsulta_Folha_Pagamento.qryconsulta_folha.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Folha_Pagamento.MEdtData_Inicial.Text = '  /  /    ') or
         (FrmConsulta_Folha_Pagamento.MEdtData_Final.Text = '  /  /    ') then
      begin
        Mensagem.Mensagem_Falta_Dados;
        abort;
      end;

      with FrmConsulta_Folha_Pagamento.qryconsulta_folha do
        begin
          close;
          sql.clear;
          sql.add('Select FP.*, Cli.Nome from Folha_Pagamento FP');
          sql.add('inner join Cadastro_Cliente Cli on (FP.Codigo_Funcionario = Cli.Codigo)');
          if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where FP.Codigo_Propriedade = :Empresa and Data_Fechamento between :DI and :DF order by FP.Data_Fechamento')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where FP.Codigo_Propriedade = :Empresa and Data_Fechamento between :DI and :DF order by FP.Mes_Ano')
          else if (FrmConsulta_Folha_Pagamento.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where FP.Codigo_Propriedade = :Empresa and Data_Fechamento between :DI and :DF order by Cli.Nome');

          Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Folha_Pagamento.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Folha_Pagamento.MEdtData_Final.Text);
          open;
          if (FrmConsulta_Folha_Pagamento.qryconsulta_folha.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Consulta_Historico_Log;
begin
  if (FrmConsulta_Historico_Log.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Historico_Log.MEdtData_Final.Text = '  /  /    ') or
      (FrmConsulta_Historico_Log.EdtCodigo_Usuario.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    abort;
  end;

  if (FrmConsulta_Historico_Log.RGTipo.ItemIndex = 0) then
  begin
    with FrmConsulta_Historico_Log.qryconsulta_historico do
    begin
      close;
      sql.clear;
      sql.add('select H.* from Historico H');
      sql.Add('where H.Usuario = :Usuario and H.Data between :DI and :DF');

      if (FrmConsulta_Historico_Log.RGOrdena_Por.ItemIndex = 0) then
        SQL.Add('order by H.Historico')
      else if (FrmConsulta_Historico_Log.RGOrdena_Por.ItemIndex = 1) then
        SQL.Add('order by H.Data')
      else if (FrmConsulta_Historico_Log.RGOrdena_Por.ItemIndex = 2) then
        SQL.Add('order by H.Tipo_Operacao');

      Parameters.ParamByName('Usuario').Value:= FrmConsulta_Historico_Log.EdtUsuario.Text;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Historico_Log.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Historico_Log.MEdtData_Final.Text);
      open;
    end;
  end
  else
  begin
    with FrmConsulta_Historico_Log.qryconsulta_historico do
    begin
      close;
      sql.clear;
      sql.add('select H.* from Historico H');
      sql.Add('where H.Usuario = :Usuario and H.Data between :DI and :DF and H.Tipo_Operacao = :Tipo');

      if (FrmConsulta_Historico_Log.RGOrdena_Por.ItemIndex = 0) then
        SQL.Add('order by H.Historico')
      else if (FrmConsulta_Historico_Log.RGOrdena_Por.ItemIndex = 1) then
        SQL.Add('order by H.Data')
      else if (FrmConsulta_Historico_Log.RGOrdena_Por.ItemIndex = 2) then
        SQL.Add('order by H.Tipo_Operacao');

      Parameters.ParamByName('Usuario').Value:= FrmConsulta_Historico_Log.EdtUsuario.Text;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Historico_Log.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Historico_Log.MEdtData_Final.Text);

      if (FrmConsulta_Historico_Log.RGTipo.ItemIndex = 1) then
        Parameters.ParamByName('Tipo').Value:= 'INSERÇÃO'
      else if (FrmConsulta_Historico_Log.RGTipo.ItemIndex = 2) then
        Parameters.ParamByName('Tipo').Value:= 'ALTERAÇÃO'
      else if (FrmConsulta_Historico_Log.RGTipo.ItemIndex = 3) then
        Parameters.ParamByName('Tipo').Value:= 'EXCLUSÃO'
      else if (FrmConsulta_Historico_Log.RGTipo.ItemIndex = 4) then
        Parameters.ParamByName('Tipo').Value:= 'CONSULTA';
      open;
    end;
  end;

  if (FrmConsulta_Historico_Log.qryconsulta_historico.IsEmpty = true) then
    begin
      Mensagem.Fim_Pesquisa;
      abort;
    end;
end;

procedure TConsulta.Consulta_Itens_Compra;
begin
  if (FrmConsulta_Compra.qryconsulta_compra.IsEmpty = false) then
  begin
    with FrmConsulta_Compra.qryitens_compra do
    begin
      close;
      sql.clear;
      sql.add('select IC.*, P.Descricao, UM.Sigla from Itens_Compra IC');
      sql.add('left join Cadastro_Produtos P on (IC.Codigo_Produto = P.Codigo)');
      sql.add('left join Unidade_Medida UM on (P.Codigo_Unidade = UM.Codigo)');
      sql.Add('where IC.N_Pedido = :N_Pedido');
      Parameters.ParamByName('N_Pedido').Value:= FrmConsulta_Compra.qryconsulta_compraN_Pedido.AsInteger;
      open;
    end;
  end;
end;

procedure TConsulta.Consulta_Itens_Cotacao;
begin
  if (FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacao.IsEmpty = false) then
  begin
    with FrmConsulta_Cotacao_Preco_Produto.qryitens_cotacao do
    begin
      close;
      sql.clear;
      sql.add('select IC.*, P.Descricao, UM.Sigla from Itens_Cotacao_Preco_Produto IC');
      sql.add('left join Cadastro_Produtos P on (P.Codigo = IC.Codigo_Produto)');
      sql.add('left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade)');
      sql.Add('where IC.N_Cotacao = :N_Cotacao');
      Parameters.ParamByName('N_Cotacao').Value:= FrmConsulta_Cotacao_Preco_Produto.qryconsulta_cotacaoN_Cotacao.AsInteger;
      open;
    end;
  end;
end;

procedure TConsulta.Consulta_Itens_Folha_Pagamento;
begin
  if (FrmConsulta_Folha_Pagamento.qryconsulta_folha.IsEmpty = false) then
  begin
    with FrmConsulta_Folha_Pagamento.qryitens_folha do
    begin
      close;
      sql.clear;
      sql.add('select IFP.*, IFF.Descricao, IFF.Natureza from Itens_Folha_Pagamento IFP');
      sql.add('inner join Cadastro_Itens_Folha_Pagamento IFF on (IFP.Codigo_Item = IFF.Codigo)');
      sql.Add('where IFP.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= FrmConsulta_Folha_Pagamento.qryconsulta_folhaCodigo.AsInteger;
      open;
    end;
  end;
end;

procedure TConsulta.Consulta_Itens_Retorno_Cotacao;
begin
  if (FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacao.IsEmpty = false) then
  begin
    with FrmConsulta_Retorno_Cotacao_Preco.qryitens_cotacao do
    begin
      close;
      sql.clear;
      sql.add('select IRC.*, P.Descricao, UM.Sigla from Itens_Retorno_Cotacao_Preco IRC');
      sql.add('left join Cadastro_Produtos P on (P.Codigo = IRC.Codigo_Produto)');
      sql.add('left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade)');
      sql.add('where IRC.N_Cotacao = :N_Cotacao and IRC.Codigo = :Codigo');
      Parameters.ParamByName('N_Cotacao').Value:= FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacaoN_Cotacao.AsInteger;
      Parameters.ParamByName('Codigo').Value:= FrmConsulta_Retorno_Cotacao_Preco.qryconsulta_cotacaoCodigo.AsInteger;
      open;
    end;
  end;
end;

procedure TConsulta.Consulta_Acerto_Caixa;
begin
  if (FrmConsulta_Acerto_Caixa.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Acerto_Caixa.MEdtData_Final.Text = '  /  /    ') or
    (FrmConsulta_Acerto_Caixa.EdtCodigo.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;;
    FrmConsulta_Acerto_Caixa.EdtCodigo.SetFocus;
    abort;
  end;

  if (FrmConsulta_Acerto_Caixa.RGConsulta_Por.ItemIndex = 0) then
    begin
      with FrmConsulta_Acerto_Caixa.qryconsulta_caixa do
        begin
          close;
          sql.clear;
          sql.add('select AC.*, CU.Nome, C.Caixa from Acerto_Caixa AC');
          sql.add('left join Cadastro_Usuario CU on (AC.Codigo_Usuario = CU.Codigo)');
          sql.add('left join Cadastro_Caixa C on (AC.Codigo_Caixa = C.Codigo)');

          if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where AC.Codigo_Usuario = :Parametro and AC.Data_Abertura between :DI and :DF order by CU.Nome')

          else if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where AC.Codigo_Usuario = :Parametro and AC.Data_Abertura between :DI and :DF order by C.Caixa')

          else if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where AC.Codigo_Usuario = :Parametro and AC.Data_Abertura between :DI and :DF order by Data_Abertura')

          else if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 3) then
            sql.add('where AC.Codigo_Usuario = :Parametro and AC.Data_Abertura between :DI and :DF order by Data_Fechamento');

          Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Acerto_Caixa.EdtCodigo.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Acerto_Caixa.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Acerto_Caixa.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Acerto_Caixa.qryconsulta_caixa.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Acerto_Caixa.RGConsulta_Por.ItemIndex = 1) then
    begin
      with FrmConsulta_Acerto_Caixa.qryconsulta_caixa do
        begin
          close;
          sql.clear;
          sql.add('select AC.*, CU.Nome, C.Caixa from Acerto_Caixa AC');
          sql.add('left join Cadastro_Usuario CU on (AC.Codigo_Usuario = CU.Codigo)');
          sql.add('left join Cadastro_Caixa C on (AC.Codigo_Caixa = C.Codigo)');

          if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where AC.Codigo_Usuario = :Parametro and AC.Data_Fechamento between :DI and :DF order by CU.Nome')

          else if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where AC.Codigo_Usuario = :Parametro and AC.Data_Fechamento between :DI and :DF order by C.Caixa')

          else if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where AC.Codigo_Usuario = :Parametro and AC.Data_Fechamento between :DI and :DF order by Data_Abertura')

          else if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 3) then
            sql.add('where AC.Codigo_Usuario = :Parametro and AC.Data_Fechamento between :DI and :DF order by Data_Fechamento');

          Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Acerto_Caixa.EdtCodigo.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Acerto_Caixa.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Acerto_Caixa.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Acerto_Caixa.qryconsulta_caixa.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Acerto_Caixa.RGConsulta_Por.ItemIndex = 2) then
    begin
      with FrmConsulta_Acerto_Caixa.qryconsulta_caixa do
        begin
          close;
          sql.clear;
          sql.add('select AC.*, CU.Nome, C.Caixa from Acerto_Caixa AC');
          sql.add('left join Cadastro_Usuario CU on (AC.Codigo_Usuario = CU.Codigo)');
          sql.add('left join Cadastro_Caixa C on (AC.Codigo_Caixa = C.Codigo)');

          if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where AC.Codigo_Caixa = :Parametro and AC.Data_Abertura between :DI and :DF order by CU.Nome')

          else if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where AC.Codigo_Caixa = :Parametro and AC.Data_Abertura between :DI and :DF order by C.Caixa')

          else if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where AC.Codigo_Caixa = :Parametro and AC.Data_Abertura between :DI and :DF order by Data_Abertura')

          else if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 3) then
            sql.add('where AC.Codigo_Caixa = :Parametro and AC.Data_Abertura between :DI and :DF order by Data_Fechamento');

          Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Acerto_Caixa.EdtCodigo.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Acerto_Caixa.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Acerto_Caixa.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Acerto_Caixa.qryconsulta_caixa.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;;
              abort;
            end;
        end;
    end
    else if (FrmConsulta_Acerto_Caixa.RGConsulta_Por.ItemIndex = 3) then
    begin
      with FrmConsulta_Acerto_Caixa.qryconsulta_caixa do
        begin
          close;
          sql.clear;
          sql.add('select AC.*, CU.Nome, C.Caixa from Acerto_Caixa AC');
          sql.add('left join Cadastro_Usuario CU on (AC.Codigo_Usuario = CU.Codigo)');
          sql.add('left join Cadastro_Caixa C on (AC.Codigo_Caixa = C.Codigo)');

          if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where AC.Codigo_Caixa = :Parametro and AC.Data_Fechamento between :DI and :DF order by CU.Nome')

          else if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where AC.Codigo_Caixa = :Parametro and AC.Data_Fechamento between :DI and :DF order by C.Caixa')

          else if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where AC.Codigo_Caixa = :Parametro and AC.Data_Fechamento between :DI and :DF order by Data_Abertura')

          else if (FrmConsulta_Acerto_Caixa.RGOrdena_Por.ItemIndex = 3) then
            sql.add('where AC.Codigo_Caixa = :Parametro and AC.Data_Fechamento between :DI and :DF order by Data_Fechamento');

          Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Acerto_Caixa.EdtCodigo.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Acerto_Caixa.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Acerto_Caixa.MEdtData_Final.Text);
          open;

          if (FrmConsulta_Acerto_Caixa.qryconsulta_caixa.IsEmpty = true) then
            begin
              Mensagem.Fim_Pesquisa;
              abort;
            end;
        end;
    end;
end;

procedure TConsulta.Consulta_Agenda_Compromisso;
begin
  if (FrmConsulta_Agenda_Compromisso.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Agenda_Compromisso.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    FrmConsulta_Agenda_Compromisso.MEdtData_Inicial.SetFocus;
    abort;
  end;

  with FrmConsulta_Agenda_Compromisso.qryconsulta_agenda, Sql do
    begin
      close;
      Clear;
      Add('select AC.* from Agenda_Compromisso AC where Data_Compromisso between :DI and :DF order by AC.Data_Compromisso');
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Agenda_Compromisso.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Agenda_Compromisso.MEdtData_Final.Text);
      open;

      if (IsEmpty) then
        begin
          Mensagem.Fim_Pesquisa;
          abort;
        end;
    end;
end;

procedure TConsulta.Consulta_Agenda_Telefonica;
begin
  if FrmConsulta_Agenda_Telefonica.RGConsulta_Por.ItemIndex = 0 then
    begin
      with FrmConsulta_Agenda_Telefonica.qryconsulta_agenda, Sql do
        begin
          close;
          Clear;
          Add('select AT.* from Agenda_Telefonica AT order by AT.Nome');
          open;

        end;
    end
    else if FrmConsulta_Agenda_Telefonica.RGConsulta_Por.ItemIndex = 1 then
      begin
      with FrmConsulta_Agenda_Telefonica.qryconsulta_agenda, Sql do
        begin
          close;
          Clear;
          Add('select AT.* from Agenda_Telefonica AT');
          Add('where AT.Nome like '''+ FrmConsulta_Agenda_Telefonica.EdtContato.Text  +'%'' order by AT.Nome');
          open;
        end;
      end;
end;

procedure TConsulta.Consulta_Bem_Patrimonio;
begin
  {if (FrmConsulta_Bem_Patrimonial.MEdtData_Inicial.Text = '  /  /    ') or (FrmConsulta_Agenda_Compromisso.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    FrmConsulta_Agenda_Compromisso.MEdtData_Inicial.SetFocus;
    abort;
  end;}

  if (FrmConsulta_Bem_Patrimonial.RGTipo.ItemIndex = 0) then
  begin
    with FrmConsulta_Bem_Patrimonial.qryconsulta_bem, Sql do
    begin
      close;
      Clear;
      Add('select CBP.*, CTBP.Tipo_Bem, UM.Sigla from Cadastro_Bem_Patrimonial CBP');
      Add('left join Cadastro_Tipo_Bem_Patrimonial CTBP on (CBP.Codigo_Tipo_Bem_Patrimonial = CTBP.Codigo)');
      Add('left join Unidade_Medida UM on (CBP.Codigo_Unidade = UM.Codigo)');
      Add('where CBP.Codigo_Propriedade = :Propriedade');
      Parameters.ParamByName('Propriedade').Value:= Codigo_Empresa;
      open;

      if (IsEmpty) then
      begin
        Mensagem.Fim_Pesquisa;
        abort;
      end;
    end;
  end
  else if (FrmConsulta_Bem_Patrimonial.RGTipo.ItemIndex = 1) then
  begin
    if (FrmConsulta_Bem_Patrimonial.EdtCodigo_Tipo_Bem.Text = '') then
    begin
      Mensagem.Mensagem_Falta_Dados;
      FrmConsulta_Bem_Patrimonial.EdtCodigo_Tipo_Bem.SetFocus;
      abort;
    end;

    with FrmConsulta_Bem_Patrimonial.qryconsulta_bem, Sql do
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

      if (IsEmpty) then
      begin
        Mensagem.Fim_Pesquisa;
        abort;
      end;
    end;
  end;
end;

procedure TConsulta.Consulta_Lancamento_Financeiro_Agrupado_Cli_Forn;
begin
  if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
     (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
    abort;
  end;

  with FrmConsulta_Lancamentos_Financeiros.qryagrupado_cli_forn, sql do
    begin
      close;
      sql.clear;
      sql.add('select Y.Mes,');
      sql.add('       Y.Nome,');
      sql.add('	   Y.Valor_Total,');
      sql.add('	   (Y.Valor_Total / Y.Total_Geral) * 100 as Percentual');
      sql.add('from(');
      sql.add('	   select');
      sql.add('		case when (t.Tipo = '+QuotedStr('PAGAR')+') then');
      sql.add('		(select Forn.Nome_Fantasia from Fornecedores Forn where t.Codigo_Cli_For = Forn.Codigo)');
      sql.add('		when (t.Tipo = '+QuotedStr('RECEBER')+') then');
      sql.add('		(select Cli.Nome from Cadastro_Cliente Cli where t.Codigo_Cli_For = Cli.Codigo) end as Nome,');
      sql.add('       sum(tip.Valor) as Valor_Total,');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('	   convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)) as Mes,');
        2: sql.add('	   convert(varchar(2),month(tip.Data_Pagamento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Pagamento)) as Mes,');
      end;
      //sql.add('	   convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)) as Mes,');

      sql.add('      (select sum(tip.Valor) from Parcelas_Lancamentos tip');
      sql.add('      left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('      where t.Codigo_Safra = :Codigo_Safra1 and t.Tipo = :Tipo1 and tip.Data_Vencimento between :DI1 and :DF1 and tip.Status = :Status1) as Total_Geral');
        2: sql.add('      where t.Codigo_Safra = :Codigo_Safra1 and t.Tipo = :Tipo1 and tip.Data_Pagamento between :DI1 and :DF1 and tip.Status = :Status1) as Total_Geral');
      end;

      //sql.add('      where tip.Data_Vencimento between :DI1 and :DF1 and tip.Status = :Status1 and t.Tipo = :Tipo1) as Total_Geral');
      sql.add('        from Parcelas_Lancamentos tip');
      sql.add('left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)');
      sql.add('left join Cadastro_Plano_Financeiro PF on (t.Codigo_Plano = PF.Codigo)');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('where t.Codigo_Safra = :Codigo_Safra2 and t.Tipo = :Tipo2 and tip.Data_Vencimento between :DI2 and :DF2 and tip.Status = :Status2');
        2: sql.add('where t.Codigo_Safra = :Codigo_Safra2 and t.Tipo = :Tipo2 and tip.Data_Pagamento between :DI2 and :DF2 and tip.Status = :Status2');
      end;

      //sql.add('where tip.Data_Vencimento between :DI2 and :DF2 and tip.Status = :Status2 and t.Tipo = :Tipo2');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('group by t.Tipo, convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)), t.Codigo_Cli_For');
        2: sql.add('group by t.Tipo, convert(varchar(2),month(tip.Data_Pagamento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Pagamento)), t.Codigo_Cli_For');
      end;

      //sql.add('group by t.Tipo, convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)), t.Codigo_Cli_For');
      sql.add('with rollup ) Y ');

      if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Status1').Value:= 'PAGO';
        Parameters.ParamByName('Status2').Value:= 'PAGO';
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Status1').Value:= 'PENDENTE';
        Parameters.ParamByName('Status2').Value:= 'PENDENTE';
      end;

      if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Tipo1').Value:= 'PAGAR';
        Parameters.ParamByName('Tipo2').Value:= 'PAGAR';
      end
      else
      begin
        Parameters.ParamByName('Tipo1').Value:= 'RECEBER';
        Parameters.ParamByName('Tipo2').Value:= 'RECEBER';
      end;

      Parameters.ParamByName('DI1').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
      Parameters.ParamByName('Codigo_Safra1').Value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
      Parameters.ParamByName('Codigo_Safra2').Value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
      open;
    end;

    if (FrmConsulta_Lancamentos_Financeiros.qryagrupado_cli_forn.IsEmpty) then
    begin
      Application.MessageBox('Dados a pagar não encontrados', 'Fim da Pesquisa', MB_OK+MB_ICONEXCLAMATION);
    end;
end;

procedure TConsulta.Consulta_Lancamento_Financeiro_Agrupado_PF;
begin
  if (FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') or
     (FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
    abort;
  end;

  with FrmConsulta_Lancamentos_Financeiros.qryagrupado_plano, sql do
    begin
      close;
      sql.clear;
      sql.add('select Y.Mes,');
      sql.add('       Y.Descricao,');
      sql.add('	   Y.Valor_Total,');
      sql.add('	   (Y.Valor_Total / Y.Total_Geral) * 100 as Percentual');
      sql.add('from(');
      sql.add('	   select');
      sql.add('	   case when grouping(PF.Descricao) = 0 then PF.Descricao');
      sql.add('			when grouping(PF.Descricao) = 1  then '+QuotedStr('TOTAL------------------------------------------->')+'');
      sql.add('	   end as Descricao,');

      sql.add('       sum(tip.Valor) as Valor_Total,');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('	   convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)) as Mes,');
        2: sql.add('	   convert(varchar(2),month(tip.Data_Pagamento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Pagamento)) as Mes,');
      end;

      sql.add('      (select sum(tip.Valor) from Parcelas_Lancamentos tip');
      sql.add('      left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('      where t.Codigo_Safra = :Codigo_Safra1 and t.Tipo = :Tipo1 and tip.Data_Vencimento between :DI1 and :DF1 and tip.Status = :Status1) as Total_Geral');
        2: sql.add('      where t.Codigo_Safra = :Codigo_Safra1 and t.Tipo = :Tipo1 and tip.Data_Pagamento between :DI1 and :DF1 and tip.Status = :Status1) as Total_Geral');
      end;

      sql.add('        from Parcelas_Lancamentos tip');
      sql.add('left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)');
      sql.add('left join Cadastro_Plano_Financeiro PF on (t.Codigo_Plano = PF.Codigo)');

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('where t.Codigo_Safra = :Codigo_Safra2 and t.Tipo = :Tipo2 and tip.Data_Vencimento between :DI2 and :DF2 and tip.Status = :Status2');
        2: sql.add('where t.Codigo_Safra = :Codigo_Safra2 and t.Tipo = :Tipo2 and tip.Data_Pagamento between :DI2 and :DF2 and tip.Status = :Status2');
      end;

      case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('group by convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)), PF.Codigo_Pai, PF.Descricao ');
        2: sql.add('group by convert(varchar(2),month(tip.Data_Pagamento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Pagamento)), PF.Codigo_Pai, PF.Descricao ');
      end;

      {case FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex of
        1: sql.add('order by convert(varchar(2),month(tip.Data_Vencimento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Vencimento)), PF.Descricao');
        2: sql.add('order by convert(varchar(2),month(tip.Data_Pagamento)) + '+QuotedStr('/')+' + convert(varchar(4),year(tip.Data_Pagamento)), PF.Descricao ');
      end; }

      sql.add('with RollUP) Y');

      //sql.Add('');

      if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Status1').Value:= 'PAGO';
        Parameters.ParamByName('Status2').Value:= 'PAGO';
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Status1').Value:= 'PENDENTE';
        Parameters.ParamByName('Status2').Value:= 'PENDENTE';
      end;

      if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Tipo1').Value:= 'PAGAR';
        Parameters.ParamByName('Tipo2').Value:= 'PAGAR';
      end
      else
      begin
        Parameters.ParamByName('Tipo1').Value:= 'RECEBER';
        Parameters.ParamByName('Tipo2').Value:= 'RECEBER';
      end;

      Parameters.ParamByName('DI1').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
      Parameters.ParamByName('Codigo_Safra1').Value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
      Parameters.ParamByName('Codigo_Safra2').Value:= StrToInt(FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Safra.Text);
      open;
    end;

    if (FrmConsulta_Lancamentos_Financeiros.qryagrupado_plano.IsEmpty) then
    begin
      Application.MessageBox('Dados a pagar não encontrados', 'Fim da Pesquisa', MB_OK+MB_ICONEXCLAMATION);
    end;
end;

end.
