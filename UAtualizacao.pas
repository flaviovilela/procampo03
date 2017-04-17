unit UAtualizacao;

interface

uses
  Windows, SysUtils, Forms, Dialogs, ExtCtrls, DateUtils, Classes, URegistro,
  ADODB, DBClient, IniFiles, StdCtrls, Registry, Mask, ShellAPI, Controls, Graphics,
  WinInet, ComCtrls, DBGrids, SHDocVw, ACBrUtil, ACBrNFe, Math, Printers, Consts,
  StrUtils, ACBrECF, Variants, Types;


type
  TAtualizacoes = class
    procedure Verifica_Atualizacoes;
    procedure Atualiza(Versao: integer);

    procedure Atualizacao1;
    procedure fAtualizaVersao;
  end;

const
  versao_bd_atual = 2;

implementation

uses UDM;

{ TAtualizacoes }

procedure TAtualizacoes.Atualiza(Versao: integer);
begin
  case Versao of
    1: Atualizacao1;
  end;

  if (Versao = versao_bd_atual) then
    fAtualizaVersao;
end;

procedure TAtualizacoes.Atualizacao1;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cadastro_Plano_Financeiro')+')and name = '+QuotedStr('Sub_Nivel')+')');
        add('ALTER TABLE Cadastro_Plano_Financeiro ADD Sub_Nivel varchar(50)');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Cadastro_Plano_Financeiro Sub_Nivel: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cadastro_Plano_Financeiro')+')and name = '+QuotedStr('Codigo_Pai')+')');
        add('ALTER TABLE Cadastro_Plano_Financeiro ADD Codigo_Pai int');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Cadastro_Plano_Financeiro Codigo_Pai: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;                                //VERIFICANDO SE EXISTE
        add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cadastro_Plano_Financeiro')+')and name = '+QuotedStr('Plano')+')');
        add('ALTER TABLE Cadastro_Plano_Financeiro DROP COLUMN Plano');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Cadastro_Plano_Financeiro Deletar Plano: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cadastro_Plano_Financeiro')+')and name = '+QuotedStr('Descricao')+')');
        add('ALTER TABLE Cadastro_Plano_Financeiro ALTER COLUMN Descricao varchar(300)');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Cadastro_Plano_Financeiro Alterar Descricao: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;


    //ATUALIZANDO OS CAMPOS PARA QUE NÃO FIQUEM NULL. PEGA O CÓDIGO DO GRUPO E COLOCA NOS TRES
    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Cadastro_Plano_Financeiro set Sub_Nivel = Codigo, Codigo_Pai = Codigo where (Sub_Nivel is null) and (Codigo_Pai is null)');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Cadastro_Plano_Financeiro - Atualizar Valores Nulos: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Lancamento_Financeiro')+')and name = '+QuotedStr('Observacoes')+')');
        add('ALTER TABLE Lancamento_Financeiro ALTER COLUMN Observacoes varchar(800)');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Lancamento_Financeiro Observacoes: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cadastro_Tipo_Bem_Patrimonial')+')and name = '+QuotedStr('Descricao')+')');
        add('ALTER TABLE Cadastro_Tipo_Bem_Patrimonial DROP COLUMN Descricao ');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Cadastro_Plano_Financeiro Deletar Descricao: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cadastro_Tipo_Bem_Patrimonial')+')and name = '+QuotedStr('Tipo_Bem')+')');
        add('ALTER TABLE Cadastro_Tipo_Bem_Patrimonial ADD Tipo_Bem varchar(50)');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Cadastro_Plano_Financeiro Adicionar Coluna Tipo_Bem: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        //add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Unidade_Medida')+')and name = '+QuotedStr('Codigo')+')');
        add('SET IDENTITY_INSERT Unidade_Medida ON');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Unidade_Medida Remover campo identidade: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cadastro_Cliente')+')and name = '+QuotedStr('Tipo')+')');
        add('ALTER TABLE Cadastro_Cliente ALTER COLUMN Tipo varchar(11)');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Cadastro_Cliente Alterar Tipo: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Lancamento_Banco')+')and name = '+QuotedStr('Saldo_Anterior')+')');
        add('ALTER TABLE Lancamento_Banco ADD Saldo_Anterior float not null default(0)');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Lancamento_Banco - Saldo_Anterior: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Lancamento_Banco')+')and name = '+QuotedStr('Saldo_Atual')+')');
        add('ALTER TABLE Lancamento_Banco ADD Saldo_Atual float not null default(0)');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Lancamento_Banco - Saldo_Atual: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cadastro_Operacoes_Bancarias')+'))');
        add('ALTER TABLE Lancamento_Banco Drop CONSTRAINT FK_Lancamento_Bancario_Cadastro_Operacoes_Bancarias');
        //Add('drop table Cadastro_Operacoes_Bancarias cascade constraints');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Cadastro_Operacoes_Bancarias - Drop FK_Lancamento_Bancario_Cadastro_Operacoes_Bancarias: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cadastro_Operacoes_Bancarias')+'))');
        add('ALTER TABLE Movimentacao_Bancaria Drop CONSTRAINT FK_Movimentacao_Bancaria_Cadastro_Operacoes_Bancarias');
        //Add('drop table Cadastro_Operacoes_Bancarias cascade constraints');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Cadastro_Operacoes_Bancarias - Drop FK_Movimentacao_Bancaria_Cadastro_Operacoes_Bancarias: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Cadastro_Operacoes_Bancarias')+'))');
        Add('drop table Cadastro_Operacoes_Bancarias');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Cadastro_Operacoes_Bancarias - Drop Cadastro_Operacoes_Bancarias: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Lancamento_Banco')+')and name = '+QuotedStr('Codigo_Conta_Transferencia')+')');
        add('ALTER TABLE Lancamento_Banco ADD Codigo_Conta_Transferencia int not null default(0)');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Lancamento_Banco - Codigo_Conta_Transferencia: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Lancamento_Banco')+')and name = '+QuotedStr('Saldo_Anterior_Transferencia')+')');
        add('ALTER TABLE Lancamento_Banco ADD Saldo_Anterior_Transferencia float not null default(0)');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Lancamento_Banco - Saldo_Anterior_Transferencia: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Lancamento_Banco')+')and name = '+QuotedStr('Saldo_Atual_Transferencia')+')');
        add('ALTER TABLE Lancamento_Banco ADD Saldo_Atual_Transferencia float not null default(0)');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Lancamento_Banco - Saldo_Atual_Transferencia: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if not exists(select 1 from syscolumns where id = object_id('+QuotedStr('Parcelas_Lancamentos')+')and name = '+QuotedStr('Codigo_Lancamento_Bancario')+')');
        add('ALTER TABLE Parcelas_Lancamentos ADD Codigo_Lancamento_Bancario int not null default(0)');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Lancamento_Banco - Codigo_Lancamento_Bancario: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('if exists(select 1 from syscolumns where id = object_id('+QuotedStr('Lancamento_Banco')+')and name = '+QuotedStr('Status')+')');
        add('ALTER TABLE Lancamento_Banco ALTER COLUMN Status varchar(30)');
        ExecSQL;
      end;
    except on E:Exception do
    begin
      Application.MessageBox(PChar('Causa do erro em Lancamento_Banco - Alterar tamanho campo status: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      abort;
    end;
    end;

end;

procedure TAtualizacoes.fAtualizaVersao;
var
  qAux: TADOQuery;
  ArqIni: TIniFile;
  versao: AnsiString;
begin
  try
    ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Configura_Estacao.ini');
    ArqIni.WriteString('Configuracao', 'Versao_BD', IntToStr(versao_bd_atual));
  finally
    FreeAndNil(ArqIni);
  end;
  {qAux:= TADOQuery.Create(nil);
  try
    try
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Configuracao_Sistema set Versao_BD = :Versao');
        Parameters.ParamByName('Versao').Value:= versao_bd_atual;
        ExecSQL;
      end;
    except on E:Exception do
      Application.MessageBox(PChar('Causa do erro em Atualizar Versao no BD: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
    end;
  finally
    FreeAndNil(qAux);
  end;}
end;

procedure TAtualizacoes.Verifica_Atualizacoes;
var
  i: integer;
begin
  {if (versao_bd_atual <> versao_bd_cliente) then
  begin
    for i := versao_bd_cliente to versao_bd_atual do
    begin
      Atualiza(i);
    end;
  end;}

  Atualizacao1; 

end;

end.
