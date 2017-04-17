unit URegistro;

interface

uses
  Forms, ComCtrls, StdCtrls, Mask, ADODB, SysUtils, Variants, UUtilitarios, DateUtils, Windows, Dialogs,
  TLoggerUnit;

type
  TCadastro_Padrao = class
    procedure Inserir(Tabela, Descricao: AnsiString; Codigo: integer; Data_Cadastro: TDateTime);
    procedure Alterar(Tabela, Descricao: AnsiString; Codigo: integer; Data_Cadastro: TDateTime);
    procedure Excluir(Tabela, Descricao: AnsiString; Codigo: integer; Data_Cadastro: TDateTime);
  end;

  TCidade = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TCliente = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TSetor = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TCultura = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TSafra = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TMaquina = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TMarca = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TGrupo_Maquina = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TBem_Patrimonial = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TTipo_Bem_Patrimonial = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TCheque = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TBanco = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TAgencia = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TConta = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TUnidade_Medida = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TAgenda = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TAgenda_Compromisso = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TLogradouro = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TEmpresa = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TUsuario = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TConfiguracao = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TCadastro_Perfil_Usuario = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TCotacao_Preco_Produto = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TItens_Cotacao_Preco_Produto = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
    procedure Excluir_Selecionado;
  end;

  TRetorno_Cotacao = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TItens_Retorno_Cotacao = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
    procedure Excluir_Selecionado;
  end;

  TCondicao_Pagamento = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TCompra = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TItens_Compra = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
    procedure Excluir_Selecionado;
  end;

  TLancamento_Banco = class
    Codigo: integer;
    Codigo_Empresa: integer;
    N_Documento: integer;
    Data_Lancamento:	TDate;
    Codigo_Conta: integer;
    Codigo_Cheque: integer;
    Codigo_Operacao: integer;
    Codigo_Plano: integer;
    Descricao: string;
    Valor: double;
    Status: string;
    public
      function GetCodigo: integer;
      function GetCodigo_Empresa: integer;
      function GetN_Documento: integer;
      function GetData_Lancamento: TDate;
      function GetCodigo_Conta:	integer;
      function GetCodigo_Cheque:	integer;
      function GetCodigo_Operacao: integer;
      function GetCodigo_Plano:	integer;
      function GetDescricao:	string;
      function GetValor: double;
      function GetStatus: string;

      property Cod: integer read GetCodigo;
      property Cod_Empresa: integer read GetCodigo_Empresa;
      property N_Doc: integer read GetN_Documento;
      property Data_Lanc: TDate read GetData_Lancamento;
      property Cod_Conta: integer read GetCodigo_Conta;
      property Cod_Cheque: integer read GetCodigo_Cheque;
      property Cod_Op:	integer read GetCodigo_Operacao;
      property Cod_Plan: integer read GetCodigo_Plano;
      property Desc:	string read GetDescricao;
      property Val:	double read GetValor;
      property Stat:	string read GetStatus;

      procedure Inserir(var Registro: TLancamento_Banco; Saldo_Anterior: double; Saldo_Atual: double;
Codigo_Conta_Transferencia: integer; Saldo_Anterior_Transferencia: Double; Saldo_Atual_Transferencia: double);
      procedure Alterar(var Registro: TLancamento_Banco; Saldo_Anterior: double; Saldo_Atual: double;
Codigo_Conta_Transferencia: integer; Saldo_Anterior_Transferencia: Double; Saldo_Atual_Transferencia: double);
      procedure Excluir(var Registro: TLancamento_Banco);
  end;

  TOperacao_Bancaria = class
    Codigo: integer;
    Operacao: string;
    Tipo: string;
    Data_Cadastro: Tdate;

    public
      function GetCodigo: integer;
      function GetOperacao: string;
      function GetTipo: string;
      function GetData_Cadastro: TDate;

      property Cod: integer read GetCodigo;
      property Op: string read GetOperacao;
      property Tip: string read GetTipo;
      property Data: TDate read GetData_Cadastro;

      procedure Inserir(var Registro: TOperacao_Bancaria);
      procedure Alterar(var Registro: TOperacao_Bancaria);
      procedure Excluir(var Registro: TOperacao_Bancaria);
  end;

  TConciliacao = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TMovimento_Caixa = class
    procedure Inserir;
  end;

  TCaixa = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TFechamento_Caixa = class
    procedure Salva_Conta(Codigo, Codigo_Empresa, Codigo_Caixa, Codigo_Usuario, Acerto, Movimenta, N_Documento, Parcela: integer; Forma_Pagamento, Tipo_Documento, Status, Tipo: Ansistring; Valor,
    Troco: double; Data: TDate);

    procedure Inserir;
  end;

  TAbertura_Caixa = class
    procedure Inserir;
  end;

  TAcerto = class
    procedure Inserir;
  end;

  TLancamento_Financeiro = class
    procedure Inserir;
    procedure Excluir;
  end;

  TParcela_Lancamentos = class
    procedure Inserir;
    procedure Excluir;
  end;

  TTipo_Documento = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TPlano_Financeiro = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TDepartamento = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TItens_Folha_Pagamento = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TFolha_Pagamento = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
  end;

  TIt_Folha_Pagamento = class
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
    procedure Excluir_Tudo;
  end;


var
  Util: TUtil;
  Mensagem: UUtilitarios.TMensagem;

implementation

uses UDM, UCadastro_Empresa, UCadastro_Usuario,
  UAgenda_Telefonica, UCadastro_Perfil_Usuario,
  UAgenda_Compromisso, UCadastro_Unidade_Medida,
  UCadastro_Cidade, UCadastro_Setor,
  UCadastro_Logradouro, UCadastro_Cliente, UCotacao_Preco_Produto,
  URetorno_Cotacao, UCadastro_Condicao_Pagamento, UCompra, UConciliacao_Compra,
  UBaixar_Titulo, UChama_Lancamentos_Financeiros, UCadastro_Caixa, UAbertura,
  UAbertura_Caixa, UAcerto_Caixa, ULancamento_Financeiro,
  UCadastro_Plano_Financeiro, UCadastro_Tipo_Documento, UCadastro_Departamento,
  UCadastro_Itens_Folha_Pagamento, UFolha_Pagamento, UCadastro_Banco,
  UCadastro_Conta_Corrente, UCadastro_Agencia, UCadastro_Cheque,
  UCadastro_Bem_Patrimonio, UCadastro_Tipo_Bem_Patrimonio, ULancamento_Banco,
  UCadastro_Operacao_Bancaria, UConfiguracao_Sistema, UCadastro_Maquina,
  UCadastro_Grupo_Maquina, UCadastro_Marca, UCadastro_Cultura, UCadastro_Safra,
  UMensagens, ULog;

{ TCidade }

procedure TCidade.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Update Cadastro_Cidade set Cidade = :Cidade, UF = :UF, DDD = :DDD where Codigo =:Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Cidade.EdtCodigo.Text);
      Parameters.ParamByName('Cidade').Value:= FrmCadastro_Cidade.EdtCidade.Text;
      Parameters.ParamByName('UF').Value:= FrmCadastro_Cidade.CmbUF.Text;
      Parameters.ParamByName('DDD').Value:= FrmCadastro_Cidade.EdtDDD.Text;
      ExecSQL;
    end;

  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TCidade.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Cidade where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Cidade.EdtCodigo.Text);
      ExecSQL;
    end;

  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TCidade.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert into Cadastro_Cidade (Codigo, Cidade, UF, DDD, Data_Cadastro)');
      Add('Values');
      Add('(:Codigo, :Cidade, :UF, :DDD, :Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Cidade.EdtCodigo.Text);
      Parameters.ParamByName('Cidade').Value:= FrmCadastro_Cidade.EdtCidade.Text;
      Parameters.ParamByName('UF').Value:= FrmCadastro_Cidade.CmbUF.Text;
      Parameters.ParamByName('DDD').Value:= FrmCadastro_Cidade.EdtDDD.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Cidade.MEdtData_Cadastro.Text);
      ExecSQL;
    end;

  Finally
    FreeAndNil(QExe);
  End;

end;

{ TSetor }

procedure TSetor.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Cadastro_Setor set Descricao = :Descricao where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Setor.EdtCodigo.Text);
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Setor.EdtDescricao.Text;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TSetor.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Setor where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Setor.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TSetor.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert into Cadastro_Setor (Codigo, Descricao, Data_Cadastro)');
      Add('Values');
      Add('(:Codigo, :Descricao, :Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Setor.EdtCodigo.Text);
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Setor.EdtDescricao.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Setor.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TLogradouro }

procedure TLogradouro.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Update Cadastro_Logradouro set Logradouro = :Logradouro, CEP = :CEP, Tipo_Logradouro = :Tipo_Logradouro where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Logradouro.EdtCodigo.Text);
      Parameters.ParamByName('Logradouro').Value:= FrmCadastro_Logradouro.EdtLogradouro.Text;
      Parameters.ParamByName('CEP').Value:= FrmCadastro_Logradouro.EdtCEP.Text;
      Parameters.ParamByName('Tipo_Logradouro').Value:= FrmCadastro_Logradouro.CmbTipo_Logradouro.Text;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TLogradouro.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Logradouro where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Logradouro.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TLogradouro.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert into Cadastro_Logradouro (Codigo, Logradouro, CEP, Tipo_Logradouro, Data_Cadastro)');
      Add('Values');
      Add('(:Codigo, :Logradouro, :CEP, :Tipo_Logradouro, :Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Logradouro.EdtCodigo.Text);
      Parameters.ParamByName('Logradouro').Value:= FrmCadastro_Logradouro.EdtLogradouro.Text;
      Parameters.ParamByName('CEP').Value:= FrmCadastro_Logradouro.EdtCEP.Text;
      Parameters.ParamByName('Tipo_Logradouro').Value:= FrmCadastro_Logradouro.CmbTipo_Logradouro.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Logradouro.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TEmpresa }

procedure TEmpresa.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Cadastro_Empresa set Nome_Fantasia = :Nome_Fantasia, Razao_Social = :Razao_Social, ');
      Add('CNPJ = :CNPJ, Inscricao_Estadual = :Inscricao_Estadual, Inscricao_Municipal = :Inscricao_Municipal, ');
      Add('Codigo_Endereco = :Codigo_Endereco, Numero = :Numero, Codigo_Setor = :Codigo_Setor, E_Mail = :E_Mail, ');
      Add('Site = :Site, Codigo_Cidade = :Codigo_Cidade, Telefone = :Telefone, Celular = :Celular where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Empresa.EdtCodigo.Text);
      Parameters.ParamByName('Nome_Fantasia').Value:= FrmCadastro_Empresa.EdtNome_Fantasia.Text;
      Parameters.ParamByName('Razao_Social').Value:= FrmCadastro_Empresa.EdtRazao_Social.Text;
      Parameters.ParamByName('CNPJ').Value:= FrmCadastro_Empresa.EdtCNPJ.Text;
      Parameters.ParamByName('Inscricao_Estadual').Value:= FrmCadastro_Empresa.EdtInsc_Estadual.Text;
      Parameters.ParamByName('Inscricao_Municipal').Value:= FrmCadastro_Empresa.EdtInsc_Municipal.Text;

      if FrmCadastro_Empresa.EdtCodigo_Endereco.Text= '' then
        Parameters.ParamByName('Codigo_Endereco').Value:= Null
      else
        Parameters.ParamByName('Codigo_Endereco').Value:= StrToInt(FrmCadastro_Empresa.EdtCodigo_Endereco.Text);

      Parameters.ParamByName('Numero').Value:= FrmCadastro_Empresa.EdtNumero.Text;

      if FrmCadastro_Empresa.EdtCodigo_Setor.Text= '' then
        Parameters.ParamByName('Codigo_Setor').Value:= Null
      else
        Parameters.ParamByName('Codigo_Setor').Value:= StrToInt(FrmCadastro_Empresa.EdtCodigo_Setor.Text);

      Parameters.ParamByName('E_Mail').Value:= FrmCadastro_Empresa.EdtEmail.Text;
      Parameters.ParamByName('Site').Value:= FrmCadastro_Empresa.EdtSite.Text;

      if FrmCadastro_Empresa.EdtCodigo_Cidade.Text= '' then
        Parameters.ParamByName('Codigo_Cidade').Value:= Null
      else
        Parameters.ParamByName('Codigo_Cidade').Value:= StrToInt(FrmCadastro_Empresa.EdtCodigo_Cidade.Text);

      Parameters.ParamByName('Telefone').Value:= FrmCadastro_Empresa.MEdtTelefone.Text;
      Parameters.ParamByName('Celular').Value:= FrmCadastro_Empresa.MEdtCelular.Text;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TEmpresa.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Empresa where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Empresa.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;

end;

procedure TEmpresa.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert into Cadastro_Empresa (Codigo, Nome_Fantasia, Razao_Social, CNPJ, Inscricao_Estadual, Inscricao_Municipal, ');
      Add('Codigo_Endereco, Numero, Codigo_Setor, E_Mail, Site, Codigo_Cidade, Telefone, Celular, Data_Cadastro)');
      Add('Values');
      Add('(:Codigo, :Nome_Fantasia, :Razao_Social, :CNPJ, :Inscricao_Estadual, :Inscricao_Municipal, ');
      Add(':Codigo_Endereco, :Numero, :Codigo_Setor, :E_Mail, :Site, :Codigo_Cidade, :Telefone, :Celular, :Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Empresa.EdtCodigo.Text);
      Parameters.ParamByName('Nome_Fantasia').Value:= FrmCadastro_Empresa.EdtNome_Fantasia.Text;
      Parameters.ParamByName('Razao_Social').Value:= FrmCadastro_Empresa.EdtRazao_Social.Text;
      Parameters.ParamByName('CNPJ').Value:= FrmCadastro_Empresa.EdtCNPJ.Text;
      Parameters.ParamByName('Inscricao_Estadual').Value:= FrmCadastro_Empresa.EdtInsc_Estadual.Text;
      Parameters.ParamByName('Inscricao_Municipal').Value:= FrmCadastro_Empresa.EdtInsc_Municipal.Text;

      if FrmCadastro_Empresa.EdtCodigo_Endereco.Text= '' then
        Parameters.ParamByName('Codigo_Endereco').Value:= Null
      else
        Parameters.ParamByName('Codigo_Endereco').Value:= StrToInt(FrmCadastro_Empresa.EdtCodigo_Endereco.Text);

      Parameters.ParamByName('Numero').Value:= FrmCadastro_Empresa.EdtNumero.Text;

      if FrmCadastro_Empresa.EdtCodigo_Setor.Text= '' then
        Parameters.ParamByName('Codigo_Setor').Value:= Null
      else
        Parameters.ParamByName('Codigo_Setor').Value:= StrToInt(FrmCadastro_Empresa.EdtCodigo_Setor.Text);

      Parameters.ParamByName('E_Mail').Value:= FrmCadastro_Empresa.EdtEmail.Text;
      Parameters.ParamByName('Site').Value:= FrmCadastro_Empresa.EdtSite.Text;

      if FrmCadastro_Empresa.EdtCodigo_Cidade.Text= '' then
        Parameters.ParamByName('Codigo_Cidade').Value:= Null
      else
        Parameters.ParamByName('Codigo_Cidade').Value:= StrToInt(FrmCadastro_Empresa.EdtCodigo_Cidade.Text);

      Parameters.ParamByName('Telefone').Value:= FrmCadastro_Empresa.MEdtTelefone.Text;
      Parameters.ParamByName('Celular').Value:= FrmCadastro_Empresa.MEdtCelular.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Empresa.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TUsuario }

procedure TUsuario.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Cadastro_Usuario set Nome = :Nome, Login = :Login, Senha = :Senha, Codigo_Perfil = :Codigo_Perfil where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Usuario.EdtCodigo.Text);
      Parameters.ParamByName('Nome').Value:= FrmCadastro_Usuario.EdtNome.Text;
      Parameters.ParamByName('Login').Value:= FrmCadastro_Usuario.EdtLogin.Text;
      Parameters.ParamByName('Senha').Value:= FrmCadastro_Usuario.EdtSenha.Text;

      if (FrmCadastro_Usuario.EdtCodigo_Perfil.Text = '') then
        Parameters.ParamByName('Codigo_Perfil').Value:= 0
      else
        Parameters.ParamByName('Codigo_Perfil').Value:= StrToInt(FrmCadastro_Usuario.EdtCodigo_Perfil.Text);

      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TUsuario.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('delete from Cadastro_Usuario where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Usuario.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TUsuario.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert into Cadastro_Usuario (Codigo, Nome, Login, Senha, Codigo_Perfil, Data_Cadastro)');
      Add('Values');
      Add('(:Codigo, :Nome, :Login, :Senha, :Codigo_Perfil, :Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Usuario.EdtCodigo.Text);
      Parameters.ParamByName('Nome').Value:= FrmCadastro_Usuario.EdtNome.Text;
      Parameters.ParamByName('Login').Value:= FrmCadastro_Usuario.EdtLogin.Text;
      Parameters.ParamByName('Senha').Value:= FrmCadastro_Usuario.EdtSenha.Text;

      if (FrmCadastro_Usuario.EdtCodigo_Perfil.Text = '') then
        Parameters.ParamByName('Codigo_Perfil').Value:= 0
      else
        Parameters.ParamByName('Codigo_Perfil').Value:= StrToInt(FrmCadastro_Usuario.EdtCodigo_Perfil.Text);

      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Usuario.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TAgenda }

procedure TAgenda.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Agenda_Telefonica set Nome = :Nome, Telefone1 = :Telefone1, ');
      add('Telefone2 = :Telefone2, Telefone3 = :Telefone3 where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmAgenda_Telefonica.EdtCodigo.Text);
      Parameters.ParamByName('Nome').Value:= FrmAgenda_Telefonica.EdtNome.Text;
      Parameters.ParamByName('Telefone1').Value:= FrmAgenda_Telefonica.MEdtTelefone1.Text;
      Parameters.ParamByName('Telefone2').Value:= FrmAgenda_Telefonica.MEdtTelefone2.Text;
      Parameters.ParamByName('Telefone3').Value:= FrmAgenda_Telefonica.MEdtTelefone3.Text;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TAgenda.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Agenda_Telefonica where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmAgenda_Telefonica.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TAgenda.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert into Agenda_Telefonica (Codigo, Nome, Telefone1, Telefone2, Telefone3, Data_Cadastro)');
      Add('Values');
      Add('(:Codigo, :Nome, :Telefone1, :Telefone2, :Telefone3, :Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmAgenda_Telefonica.EdtCodigo.Text);
      Parameters.ParamByName('Nome').Value:= FrmAgenda_Telefonica.EdtNome.Text;
      Parameters.ParamByName('Telefone1').Value:= FrmAgenda_Telefonica.MEdtTelefone1.Text;
      Parameters.ParamByName('Telefone2').Value:= FrmAgenda_Telefonica.MEdtTelefone2.Text;
      Parameters.ParamByName('Telefone3').Value:= FrmAgenda_Telefonica.MEdtTelefone3.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmAgenda_Telefonica.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TCadastro_Perfil_Usuario }

procedure TCadastro_Perfil_Usuario.Alterar;
var
  qAux, qaux2: TADOQuery;
begin
  try
    DM.ADOConnection1.BeginTrans;
    try
      qAux:= TADOQuery.Create(nil);
      qAux2:= TADOQuery.Create(nil);
      with qAux, SQL do
        begin
          close;
          clear;
          Connection:= dm.ADOConnection1;
          add('UPDATE Cadastro_Perfil_Usuario');
          add('   SET Perfil = :Perfil');
          add('      ,Cadastro_Empresa = :Cadastro_Empresa');
          add('      ,Cadastro_Cliente = :Cadastro_Cliente');
          add('      ,Cadastro_Produto = :Cadastro_Produto');
          add('      ,Cadastro_Mesa = :Cadastro_Mesa');
          add('      ,Cadastro_Usuario = :Cadastro_Usuario');
          add('      ,Cadastro_Perfil_Usuario = :Cadastro_Perfil_Usuario');
          add('      ,Cadastro_Grupo_Produto = :Cadastro_Grupo_Produto');
          add('      ,Cadastro_Ingrediente = :Cadastro_Ingrediente');
          add('      ,Cadastro_Condicao_Pagamento = :Cadastro_Condicao_Pagamento');
          add('      ,Cadastro_Plano_Financeiro = :Cadastro_Plano_Financeiro');
          add('      ,Cadastro_Tipo_Documento = :Cadastro_Tipo_Documento');
          add('      ,Cadastro_Departamento = :Cadastro_Departamento');
          add('      ,Cadastro_Caixa = :Cadastro_Caixa');
          add('      ,Cadastro_Cidade = :Cadastro_Cidade');
          add('      ,Cadastro_Setor = :Cadastro_Setor');
          add('      ,Cadastro_Logradouro = :Cadastro_Logradouro');
          add('      ,Abertura_Caixa = :Abertura_Caixa');
          add('      ,Acerto_Caixa = :Acerto_Caixa');
          add('      ,Lancamento_Financeiro = :Lancamento_Financeiro');
          add('      ,Baixar_Conta = :Baixar_Conta');
          add('      ,Pedido = :Pedido');
          add('      ,Mudanca_Status = :Mudanca_Status');
          add('      ,Agenda_Telefonica = :Agenda_Telefonica');
          add('      ,Recibo = :Recibo');
          add('      ,Consulta_Lancamento_Financeiro = :Consulta_Lancamento_Financeiro');
          add('      ,Consulta_Acerto_Caixa = :Consulta_Acerto_Caixa');
          add('      ,Consulta_Fechamento_Caixa = :Consulta_Fechamento_Caixa');
          add('      ,Consulta_Agenda_Telefonica = :Consulta_Agenda_Telefonica');
          add('      ,Consulta_Historico_Acesso = :Consulta_Historico_Acesso');
          add('      ,Consulta_Pedido = :Consulta_Pedido');
          add('      ,Consulta_Rancking_Venda_Produto = :Consulta_Rancking_Venda_Produto');
          add('      ,Consulta_Rancking_Venda_Cliente = :Consulta_Rancking_Venda_Cliente');
          add('      ,Consulta_Tempo_Producao = :Consulta_Tempo_Producao');
          add(' WHERE Codigo = :Codigo');

          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Perfil_Usuario.EdtCodigo.Text);
          Parameters.ParamByName('Perfil').Value:= FrmCadastro_Perfil_Usuario.EdtPerfil.Text;

          //Cadastros
          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[0].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Empresa').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[0].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Empresa').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[1].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Cliente').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[1].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Cliente').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[2].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Produto').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[2].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Produto').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[3].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Mesa').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[3].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Mesa').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[4].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Usuario').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[4].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Usuario').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[5].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Perfil_Usuario').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[5].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Perfil_Usuario').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[6].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Grupo_Produto').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[6].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Grupo_Produto').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[7].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Ingrediente').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[7].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Ingrediente').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[8].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Condicao_Pagamento').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[8].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Condicao_Pagamento').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[9].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Plano_Financeiro').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[9].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Plano_Financeiro').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[10].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Tipo_Documento').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[10].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Tipo_Documento').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[11].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Departamento').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[11].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Departamento').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[12].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Caixa').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[12].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Caixa').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[13].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Cidade').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[13].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Cidade').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[14].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Setor').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[14].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Setor').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[15].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Logradouro').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[15].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Logradouro').Value:= 2;


          //Movimentação
          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[0].StateIndex = 1 then
            Parameters.ParamByName('Abertura_Caixa').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Movimentação').Item[0].StateIndex = 2 then
            Parameters.ParamByName('Abertura_Caixa').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[1].StateIndex = 1 then
            Parameters.ParamByName('Acerto_Caixa').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Movimentação').Item[1].StateIndex = 2 then
            Parameters.ParamByName('Acerto_Caixa').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[2].StateIndex = 1 then
            Parameters.ParamByName('Lancamento_Financeiro').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Movimentação').Item[2].StateIndex = 2 then
            Parameters.ParamByName('Lancamento_Financeiro').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[3].StateIndex = 1 then
            Parameters.ParamByName('Baixar_Conta').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Movimentação').Item[3].StateIndex = 2 then
            Parameters.ParamByName('Baixar_Conta').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[4].StateIndex = 1 then
            Parameters.ParamByName('Pedido').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Movimentação').Item[4].StateIndex = 2 then
            Parameters.ParamByName('Pedido').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[5].StateIndex = 1 then
            Parameters.ParamByName('Mudanca_Status').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Movimentação').Item[5].StateIndex = 2 then
            Parameters.ParamByName('Mudanca_Status').Value:= 2;


          //Ferramentas

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[0].StateIndex = 1 then
            Parameters.ParamByName('Agenda_Telefonica').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Ferramentas').Item[0].StateIndex = 2 then
            Parameters.ParamByName('Agenda_Telefonica').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[1].StateIndex = 1 then
            Parameters.ParamByName('Recibo').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Ferramentas').Item[1].StateIndex = 2 then
            Parameters.ParamByName('Recibo').Value:= 2;

          //Relatórios

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[0].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Lancamento_Financeiro').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[0].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Lancamento_Financeiro').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[1].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Acerto_Caixa').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[1].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Acerto_Caixa').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[2].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Fechamento_Caixa').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[2].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Fechamento_Caixa').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[3].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Agenda_Telefonica').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[3].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Agenda_Telefonica').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[4].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Historico_Acesso').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[4].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Historico_Acesso').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[5].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Pedido').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[5].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Pedido').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[6].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Rancking_Venda_Produto').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[6].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Rancking_Venda_Produto').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[7].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Rancking_Venda_Cliente').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[7].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Rancking_Venda_Cliente').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[8].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Tempo_Producao').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[8].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Tempo_Producao').Value:= 2;

          ExecSQL;
          DM.ADOConnection1.CommitTrans;
        end;
    finally
      qAux.Close;
      FreeAndNil(qAux);
    end;

  except
    on E: Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        Mensagem.Impossivel_Executar;
      end;
  end;
end;

procedure TCadastro_Perfil_Usuario.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Perfil_Usuario');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Perfil_Usuario.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TCadastro_Perfil_Usuario.Inserir;
var
  qAux, qaux2: TADOQuery;
begin
  try
    DM.ADOConnection1.BeginTrans;
    try
      qAux:= TADOQuery.Create(nil);
      qAux2:= TADOQuery.Create(nil);
      with qAux, SQL do
        begin
          close;
          clear;
          Connection:= dm.ADOConnection1;
          add('INSERT INTO Cadastro_Perfil_Usuario');
          add('           (Codigo');
          add('           ,Perfil');
          add('           ,Cadastro_Empresa');
          add('           ,Cadastro_Cliente');
          add('           ,Cadastro_Produto');
          add('           ,Cadastro_Mesa');
          add('           ,Cadastro_Usuario');
          add('           ,Cadastro_Perfil_Usuario');
          add('           ,Cadastro_Grupo_Produto');
          add('           ,Cadastro_Ingrediente');
          add('           ,Cadastro_Condicao_Pagamento');
          add('           ,Cadastro_Plano_Financeiro');
          add('           ,Cadastro_Tipo_Documento');
          add('           ,Cadastro_Departamento');
          add('           ,Cadastro_Caixa');
          add('           ,Cadastro_Cidade');
          add('           ,Cadastro_Setor');
          add('           ,Cadastro_Logradouro');
          add('           ,Abertura_Caixa');
          add('           ,Acerto_Caixa');
          add('           ,Lancamento_Financeiro');
          add('           ,Baixar_Conta');
          add('           ,Pedido');
          add('           ,Mudanca_Status');
          add('           ,Agenda_Telefonica');
          add('           ,Recibo');
          add('           ,Consulta_Lancamento_Financeiro');
          add('           ,Consulta_Acerto_Caixa');
          add('           ,Consulta_Fechamento_Caixa');
          add('           ,Consulta_Agenda_Telefonica');
          add('           ,Consulta_Historico_Acesso');
          add('           ,Consulta_Pedido');
          add('           ,Consulta_Rancking_Venda_Produto');
          add('           ,Consulta_Rancking_Venda_Cliente');
          add('           ,Consulta_Tempo_Producao');
          add('           ,Data_Cadastro)');
          add('     VALUES');
          add('           (:Codigo');
          add('           ,:Perfil');
          add('           ,:Cadastro_Empresa');
          add('           ,:Cadastro_Cliente');
          add('           ,:Cadastro_Produto');
          add('           ,:Cadastro_Mesa');
          add('           ,:Cadastro_Usuario');
          add('           ,:Cadastro_Perfil_Usuario');
          add('           ,:Cadastro_Grupo_Produto');
          add('           ,:Cadastro_Ingrediente');
          add('           ,:Cadastro_Condicao_Pagamento');
          add('           ,:Cadastro_Plano_Financeiro');
          add('           ,:Cadastro_Tipo_Documento');
          add('           ,:Cadastro_Departamento');
          add('           ,:Cadastro_Caixa');
          add('           ,:Cadastro_Cidade');
          add('           ,:Cadastro_Setor');
          add('           ,:Cadastro_Logradouro');
          add('           ,:Abertura_Caixa');
          add('           ,:Acerto_Caixa');
          add('           ,:Lancamento_Financeiro');
          add('           ,:Baixar_Conta');
          add('           ,:Pedido');
          add('           ,:Mudanca_Status');
          add('           ,:Agenda_Telefonica');
          add('           ,:Recibo');
          add('           ,:Consulta_Lancamento_Financeiro');
          add('           ,:Consulta_Acerto_Caixa');
          add('           ,:Consulta_Fechamento_Caixa');
          add('           ,:Consulta_Agenda_Telefonica');
          add('           ,:Consulta_Historico_Acesso');
          add('           ,:Consulta_Pedido');
          add('           ,:Consulta_Rancking_Venda_Produto');
          add('           ,:Consulta_Rancking_Venda_Cliente');
          add('           ,:Consulta_Tempo_Producao');
          add('           ,:Data_Cadastro)');

          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Perfil_Usuario.EdtCodigo.Text);
          Parameters.ParamByName('Perfil').Value:= FrmCadastro_Perfil_Usuario.EdtPerfil.Text;

          //Cadastros
          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[0].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Empresa').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[0].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Empresa').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[1].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Cliente').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[1].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Cliente').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[2].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Produto').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[2].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Produto').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[3].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Mesa').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[3].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Mesa').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[4].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Usuario').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[4].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Usuario').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[5].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Perfil_Usuario').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[5].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Perfil_Usuario').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[6].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Grupo_Produto').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[6].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Grupo_Produto').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[7].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Ingrediente').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[7].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Ingrediente').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[8].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Condicao_Pagamento').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[8].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Condicao_Pagamento').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[9].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Plano_Financeiro').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[9].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Plano_Financeiro').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[10].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Tipo_Documento').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[10].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Tipo_Documento').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[11].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Departamento').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[11].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Departamento').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[12].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Caixa').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[12].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Caixa').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[13].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Cidade').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[13].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Cidade').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[14].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Setor').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[14].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Setor').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastro').Item[15].StateIndex = 1 then
            Parameters.ParamByName('Cadastro_Logradouro').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Cadastro').Item[15].StateIndex = 2 then
            Parameters.ParamByName('Cadastro_Logradouro').Value:= 2;


          //Movimentação
          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[0].StateIndex = 1 then
            Parameters.ParamByName('Abertura_Caixa').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Movimentação').Item[0].StateIndex = 2 then
            Parameters.ParamByName('Abertura_Caixa').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[1].StateIndex = 1 then
            Parameters.ParamByName('Acerto_Caixa').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Movimentação').Item[1].StateIndex = 2 then
            Parameters.ParamByName('Acerto_Caixa').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[2].StateIndex = 1 then
            Parameters.ParamByName('Lancamento_Financeiro').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Movimentação').Item[2].StateIndex = 2 then
            Parameters.ParamByName('Lancamento_Financeiro').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[3].StateIndex = 1 then
            Parameters.ParamByName('Baixar_Conta').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Movimentação').Item[3].StateIndex = 2 then
            Parameters.ParamByName('Baixar_Conta').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[4].StateIndex = 1 then
            Parameters.ParamByName('Pedido').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Movimentação').Item[4].StateIndex = 2 then
            Parameters.ParamByName('Pedido').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[5].StateIndex = 1 then
            Parameters.ParamByName('Mudanca_Status').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Movimentação').Item[5].StateIndex = 2 then
            Parameters.ParamByName('Mudanca_Status').Value:= 2;


          //Ferramentas

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[0].StateIndex = 1 then
            Parameters.ParamByName('Agenda_Telefonica').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Ferramentas').Item[0].StateIndex = 2 then
            Parameters.ParamByName('Agenda_Telefonica').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[1].StateIndex = 1 then
            Parameters.ParamByName('Recibo').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Ferramentas').Item[1].StateIndex = 2 then
            Parameters.ParamByName('Recibo').Value:= 2;



          //Relatórios

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[0].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Lancamento_Financeiro').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[0].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Lancamento_Financeiro').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[1].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Acerto_Caixa').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[1].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Acerto_Caixa').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[2].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Fechamento_Caixa').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[2].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Fechamento_Caixa').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[3].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Agenda_Telefonica').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[3].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Agenda_Telefonica').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[4].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Historico_Acesso').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[4].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Historico_Acesso').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[5].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Pedido').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[5].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Pedido').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[6].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Rancking_Venda_Produto').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[6].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Rancking_Venda_Produto').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[7].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Rancking_Venda_Cliente').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[7].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Rancking_Venda_Cliente').Value:= 2;

          if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[8].StateIndex = 1 then
            Parameters.ParamByName('Consulta_Tempo_Producao').Value:= 1
          else if Util.obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Relatórios').Item[8].StateIndex = 2 then
            Parameters.ParamByName('Consulta_Tempo_Producao').Value:= 2;

          Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Perfil_Usuario.MEdtData_Cadastro.Text);
          ExecSQL;
          DM.ADOConnection1.CommitTrans;
        end;
    finally
      qAux.Close;
      FreeAndNil(qAux);
    end;

  except
    on E: Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        Mensagem.Impossivel_Executar;
      end;
  end;
end;

{ TAgenda_Compromisso }

procedure TAgenda_Compromisso.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Agenda_Compromisso set Data_Compromisso = :Data_Compromisso, Hora_Compromisso = :Hora_Compromisso, Compromisso = :Compromisso');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmAgenda_Compromisso.EdtCodigo.Text);
      Parameters.ParamByName('Data_Compromisso').Value:= StrToDateTime(FrmAgenda_Compromisso.MEdtData_Compromisso.Text);
      Parameters.ParamByName('Hora_Compromisso').Value:= FrmAgenda_Compromisso.MEdtHora.Text;
      Parameters.ParamByName('Compromisso').Value:= FrmAgenda_Compromisso.MMOCompromisso.Text;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TAgenda_Compromisso.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Agenda_Compromisso where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmAgenda_Compromisso.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TAgenda_Compromisso.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert into Agenda_Compromisso (Codigo, Data_Cadastro, Data_Compromisso, Hora_Compromisso, Compromisso)');
      Add('Values');
      Add('(:Codigo, :Data_Cadastro, :Data_Compromisso, :Hora_Compromisso, :Compromisso)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmAgenda_Compromisso.EdtCodigo.Text);
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmAgenda_Compromisso.MEdtData_Cadastro.Text);
      Parameters.ParamByName('Data_Compromisso').Value:= StrToDateTime(FrmAgenda_Compromisso.MEdtData_Compromisso.Text);
      Parameters.ParamByName('Hora_Compromisso').Value:= FrmAgenda_Compromisso.MEdtHora.Text;
      Parameters.ParamByName('Compromisso').Value:= FrmAgenda_Compromisso.MMOCompromisso.Text;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TUnidade_Medida }

procedure TUnidade_Medida.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Unidade_Medida set Sigla = :Sigla, Descricao = :Descricao where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Unidade_Medida.EdtCodigo.Text);
      Parameters.ParamByName('Sigla').Value:= FrmCadastro_Unidade_Medida.EdtSigla.Text;
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Unidade_Medida.EdtDescricao.Text;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TUnidade_Medida.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Unidade_Medida where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Unidade_Medida.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TUnidade_Medida.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    try
      with QExe, SQL do
      begin
        Close;
        Connection:= dm.AdoConnection1;
        Clear;
        Add('Insert into Unidade_Medida (Codigo, Sigla, Descricao, Data_Cadastro)');
        Add('Values');
        Add('(:Codigo, :Sigla, :Descricao, :Data_Cadastro)');

        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Unidade_Medida.EdtCodigo.Text);
        Parameters.ParamByName('Sigla').Value:= FrmCadastro_Unidade_Medida.EdtSigla.Text;
        Parameters.ParamByName('Descricao').Value:= FrmCadastro_Unidade_Medida.EdtDescricao.Text;
        Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Unidade_Medida.MEdtData_Cadastro.Text);
        ExecSQL;
      end;
    except on E:Exception do
    begin
      TMensagens.MensagemErro('Erro ao gravar unidade de medida: '+e.Message);
    end;

    end;
  Finally
    FreeAndNil(QExe);
  End;
end;
{ TCadastro_Padrao }

procedure TCadastro_Padrao.Alterar(Tabela, Descricao: AnsiString;
  Codigo: integer; Data_Cadastro: TDateTime);
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update '+ Tabela + ' set Descricao = :Descricao where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= Codigo;
      Parameters.ParamByName('Descricao').Value:= Descricao;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TCadastro_Padrao.Excluir(Tabela, Descricao: AnsiString;
  Codigo: integer; Data_Cadastro: TDateTime);
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from '+ Tabela + ' where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= Codigo;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TCadastro_Padrao.Inserir(Tabela, Descricao: AnsiString;
  Codigo: integer; Data_Cadastro: TDateTime);
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert into '+ Tabela + ' (Codigo, Descricao, Data_Cadastro)');
      Add('Values');
      Add('(:Codigo, :Descricao, :Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= Codigo;
      Parameters.ParamByName('Descricao').Value:= Descricao;
      Parameters.ParamByName('Data_Cadastro').Value:= Data_Cadastro;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TCliente }

procedure TCliente.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    try
      with QExe, SQL do
      begin
        Close;
        Connection:= dm.AdoConnection1;
        Clear;
        Add('update Cadastro_Cliente set Tipo = :Tipo, Tipo_Cliente = :Tipo_Cliente, Nome = :Nome, Razao_Social = :Razao_Social, CPF = :CPF, RG = :RG, Orgao_Expedidor = :Orgao_Expedidor, Data_Emissao = :Data_Emissao, ');
        Add('CNPJ = :CNPJ, Inscricao_Estadual = :Inscricao_Estadual, Inscricao_Municipal = :Inscricao_Municipal, Codigo_Endereco = :Codigo_Endereco, Numero = :Numero, Ponto_Referencia = :Ponto_Referencia, ');
        Add('Complemento = :Complemento, Codigo_Setor = :Codigo_Setor, E_Mail = :E_Mail, Site = :Site, Codigo_Cidade = :Codigo_Cidade, Profissao = :Profissao, Data_Nascimento = :Data_Nascimento, Estado_Civil = :Estado_Civil, ');
        Add('Telefone = :Telefone, Celular = :Celular, Contato = :Contato, Telefone_Contato = :Telefone_Contato, Codigo_Grupo = :Codigo_Grupo');
        add(' where Codigo = :Codigo');

        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Cliente.EdtCodigo.Text);

        if FrmCadastro_Cliente.RGTipo.ItemIndex = 0 then
          Parameters.ParamByName('Tipo').Value:= 'CLIENTE'
        else if FrmCadastro_Cliente.RGTipo.ItemIndex = 1 then
          Parameters.ParamByName('Tipo').Value:= 'FORNECEDOR'
        else if FrmCadastro_Cliente.RGTipo.ItemIndex = 2 then
          Parameters.ParamByName('Tipo').Value:= 'FUNCIONÁRIO';

        if FrmCadastro_Cliente.CBTipo.Checked then
          Parameters.ParamByName('Tipo_Cliente').Value:= 'FÍSICO'
        else
          Parameters.ParamByName('Tipo_Cliente').Value:= 'JURÍDICO';

        Parameters.ParamByName('Nome').Value:= FrmCadastro_Cliente.EdtNome.Text;
        Parameters.ParamByName('Razao_Social').Value:= FrmCadastro_Cliente.EdtRazao_Social.Text;
        Parameters.ParamByName('CPF').Value:= FrmCadastro_Cliente.EdtCPF.Text;
        Parameters.ParamByName('RG').Value:= FrmCadastro_Cliente.EdtRG.Text;
        Parameters.ParamByName('Orgao_Expedidor').Value:= FrmCadastro_Cliente.EdtOrgao_Expedidor.Text;

        if FrmCadastro_Cliente.EdtData_Emissao.Text = '  /  /    ' then
          Parameters.ParamByName('Data_Emissao').Value:= Null
        else
          Parameters.ParamByName('Data_Emissao').Value:= StrToDateTime(FrmCadastro_Cliente.EdtData_Emissao.Text);

        Parameters.ParamByName('CNPJ').Value:= FrmCadastro_Cliente.EdtCNPJ.Text;
        Parameters.ParamByName('Inscricao_Estadual').Value:= FrmCadastro_Cliente.EdtInsc_Estadual.Text;
        Parameters.ParamByName('Inscricao_Municipal').Value:= FrmCadastro_Cliente.EdtInsc_Municipal.Text;

        if FrmCadastro_Cliente.EdtCodigo_Endereco.Text= '' then
          Parameters.ParamByName('Codigo_Endereco').Value:= Null
        else
          Parameters.ParamByName('Codigo_Endereco').Value:= StrToInt(FrmCadastro_Cliente.EdtCodigo_Endereco.Text);

        Parameters.ParamByName('Numero').Value:= FrmCadastro_Cliente.EdtNumero.Text;
        Parameters.ParamByName('Ponto_Referencia').Value:= FrmCadastro_Cliente.EdtReferencia.Text;
        Parameters.ParamByName('Complemento').Value:= FrmCadastro_Cliente.EdtComplemento.Text;

        if FrmCadastro_Cliente.EdtCodigo_Setor.Text= '' then
          Parameters.ParamByName('Codigo_Setor').Value:= Null
        else
          Parameters.ParamByName('Codigo_Setor').Value:= StrToInt(FrmCadastro_Cliente.EdtCodigo_Setor.Text);

        Parameters.ParamByName('E_Mail').Value:= FrmCadastro_Cliente.EdtEmail.Text;
        Parameters.ParamByName('Site').Value:= FrmCadastro_Cliente.EdtSite.Text;

        if FrmCadastro_Cliente.EdtCodigo_Cidade.Text= '' then
          Parameters.ParamByName('Codigo_Cidade').Value:= Null
        else
          Parameters.ParamByName('Codigo_Cidade').Value:= StrToInt(FrmCadastro_Cliente.EdtCodigo_Cidade.Text);

        Parameters.ParamByName('Profissao').Value:= FrmCadastro_Cliente.EdtProfissao.Text;

        if FrmCadastro_Cliente.MEdtData_Nascimento.Text = '  /  /    ' then
          Parameters.ParamByName('Data_Nascimento').Value:= Null
        else
          Parameters.ParamByName('Data_Nascimento').Value:= StrToDateTime(FrmCadastro_Cliente.MEdtData_Nascimento.Text);

        Parameters.ParamByName('Estado_Civil').Value:= FrmCadastro_Cliente.CmbEstado_Civil.Text;
        Parameters.ParamByName('Telefone').Value:= FrmCadastro_Cliente.MEdtTelefone.Text;
        Parameters.ParamByName('Celular').Value:= FrmCadastro_Cliente.MEdtCelular.Text;
        Parameters.ParamByName('Contato').Value:= FrmCadastro_Cliente.EdtContato.Text;
        Parameters.ParamByName('Telefone_Contato').Value:= FrmCadastro_Cliente.MEdtTelefone_Contato.Text;
        if FrmCadastro_Cliente.EdtCodigo_Grupo.Text= '' then
          Parameters.ParamByName('Codigo_Grupo').Value:= Null
        else
          Parameters.ParamByName('Codigo_Grupo').Value:= StrToInt(FrmCadastro_Cliente.EdtCodigo_Grupo.Text);

        ExecSQL;
      end;
    finally
      FreeAndNil(QExe);
    end;

  except on E:Exception do
  begin
    Application.MessageBox(PChar('Erro ao alterar pessoa: '+e.Message), 'Erro ao alterar pessoa', MB_OK + MB_ICONHAND)
  end;

  End;
end;

procedure TCliente.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Cliente where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Cliente.EdtCodigo.Text);
      ExecSQL;
    end;

  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TCliente.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    try
      with QExe, SQL do
      begin
        Close;
        Connection:= dm.AdoConnection1;
        Clear;
        Add('Insert into Cadastro_Cliente (Codigo, Tipo, Tipo_Cliente, Nome, Razao_Social, CPF, RG, Orgao_Expedidor, Data_Emissao, ');
        Add('CNPJ, Inscricao_Estadual, Inscricao_Municipal, Codigo_Endereco, Numero, Ponto_Referencia, ');
        Add('Complemento, Codigo_Setor, E_Mail, Site, Codigo_Cidade, Profissao, Data_Nascimento, Estado_Civil, ');
        Add('Telefone, Celular, Contato, Telefone_Contato, Codigo_Grupo, Data_Cadastro)');
        Add('values');
        Add('(:Codigo, :Tipo, :Tipo_Cliente, :Nome, :Razao_Social, :CPF, :RG, :Orgao_Expedidor, :Data_Emissao, ');
        Add(':CNPJ, :Inscricao_Estadual, :Inscricao_Municipal, :Codigo_Endereco, :Numero, :Ponto_Referencia, ');
        Add(':Complemento, :Codigo_Setor, :E_Mail, :Site, :Codigo_Cidade, :Profissao, :Data_Nascimento, :Estado_Civil, ');
        Add(':Telefone, :Celular, :Contato, :Telefone_Contato, :Codigo_Grupo, :Data_Cadastro)');

        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Cliente.EdtCodigo.Text);

        if FrmCadastro_Cliente.RGTipo.ItemIndex = 0 then
          Parameters.ParamByName('Tipo').Value:= 'CLIENTE'
        else if FrmCadastro_Cliente.RGTipo.ItemIndex = 1 then
          Parameters.ParamByName('Tipo').Value:= 'FORNECEDOR'
        else if FrmCadastro_Cliente.RGTipo.ItemIndex = 2 then
          Parameters.ParamByName('Tipo').Value:= 'FUNCIONÁRIO';

        if FrmCadastro_Cliente.CBTipo.Checked then
          Parameters.ParamByName('Tipo_Cliente').Value:= 'FÍSICO'
        else
          Parameters.ParamByName('Tipo_Cliente').Value:= 'JURÍDICO';

        Parameters.ParamByName('Nome').Value:= FrmCadastro_Cliente.EdtNome.Text;
        Parameters.ParamByName('Razao_Social').Value:= FrmCadastro_Cliente.EdtRazao_Social.Text;
        Parameters.ParamByName('CPF').Value:= FrmCadastro_Cliente.EdtCPF.Text;
        Parameters.ParamByName('RG').Value:= FrmCadastro_Cliente.EdtRG.Text;
        Parameters.ParamByName('Orgao_Expedidor').Value:= FrmCadastro_Cliente.EdtOrgao_Expedidor.Text;

        if FrmCadastro_Cliente.EdtData_Emissao.Text = '  /  /    ' then
          Parameters.ParamByName('Data_Emissao').Value:= Null
        else
          Parameters.ParamByName('Data_Emissao').Value:= StrToDateTime(FrmCadastro_Cliente.EdtData_Emissao.Text);

        Parameters.ParamByName('CNPJ').Value:= FrmCadastro_Cliente.EdtCNPJ.Text;
        Parameters.ParamByName('Inscricao_Estadual').Value:= FrmCadastro_Cliente.EdtInsc_Estadual.Text;
        Parameters.ParamByName('Inscricao_Municipal').Value:= FrmCadastro_Cliente.EdtInsc_Municipal.Text;

        if FrmCadastro_Cliente.EdtCodigo_Endereco.Text= '' then
          Parameters.ParamByName('Codigo_Endereco').Value:= Null
        else
          Parameters.ParamByName('Codigo_Endereco').Value:= StrToInt(FrmCadastro_Cliente.EdtCodigo_Endereco.Text);

        Parameters.ParamByName('Numero').Value:= FrmCadastro_Cliente.EdtNumero.Text;
        Parameters.ParamByName('Ponto_Referencia').Value:= FrmCadastro_Cliente.EdtReferencia.Text;
        Parameters.ParamByName('Complemento').Value:= FrmCadastro_Cliente.EdtComplemento.Text;

        if FrmCadastro_Cliente.EdtCodigo_Setor.Text= '' then
          Parameters.ParamByName('Codigo_Setor').Value:= Null
        else
          Parameters.ParamByName('Codigo_Setor').Value:= StrToInt(FrmCadastro_Cliente.EdtCodigo_Setor.Text);

        Parameters.ParamByName('E_Mail').Value:= FrmCadastro_Cliente.EdtEmail.Text;
        Parameters.ParamByName('Site').Value:= FrmCadastro_Cliente.EdtSite.Text;

        if FrmCadastro_Cliente.EdtCodigo_Cidade.Text= '' then
          Parameters.ParamByName('Codigo_Cidade').Value:= Null
        else
          Parameters.ParamByName('Codigo_Cidade').Value:= StrToInt(FrmCadastro_Cliente.EdtCodigo_Cidade.Text);

        Parameters.ParamByName('Profissao').Value:= FrmCadastro_Cliente.EdtProfissao.Text;

        if FrmCadastro_Cliente.MEdtData_Nascimento.Text = '  /  /    ' then
          Parameters.ParamByName('Data_Nascimento').Value:= Null
        else
          Parameters.ParamByName('Data_Nascimento').Value:= StrToDateTime(FrmCadastro_Cliente.MEdtData_Nascimento.Text);

        Parameters.ParamByName('Estado_Civil').Value:= FrmCadastro_Cliente.CmbEstado_Civil.Text;
        Parameters.ParamByName('Telefone').Value:= FrmCadastro_Cliente.MEdtTelefone.Text;
        Parameters.ParamByName('Celular').Value:= FrmCadastro_Cliente.MEdtCelular.Text;
        Parameters.ParamByName('Contato').Value:= FrmCadastro_Cliente.EdtContato.Text;
        Parameters.ParamByName('Telefone_Contato').Value:= FrmCadastro_Cliente.MEdtTelefone_Contato.Text;

        if FrmCadastro_Cliente.EdtCodigo_Grupo.Text= '' then
          Parameters.ParamByName('Codigo_Grupo').Value:= Null
        else
          Parameters.ParamByName('Codigo_Grupo').Value:= StrToInt(FrmCadastro_Cliente.EdtCodigo_Grupo.Text);

        Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Cliente.MEdtData_Cadastro.Text);
        ExecSQL;
      end;
    finally
      FreeAndNil(QExe);
    end;

  except on E:Exception do
  begin
    Application.MessageBox(PChar('Erro ao gravar pessoa: '+e.Message), 'Erro ao gravar pessoa', MB_OK + MB_ICONHAND)
  end;
  End;
end;

{ TCotacao_Preco_Produto }

procedure TCotacao_Preco_Produto.Alterar;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Update Cotacao_Preco_Produto set Codigo_Empresa = :Codigo_Empresa, Responsavel = :Responsavel,');
        add('Data_Cotacao = :Data_Cotacao, Hora_Cotacao = :Hora_Cotacao, Data_Vencimento = :Data_Vencimento,');
        add('Qtde_Itens = :Qtde_Itens');
        add('where N_Cotacao = :N_Cotacao');
        Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmCotacao_Preco_Produto.EdtN_Cotacao.Text);
        Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;
        Parameters.ParamByName('Responsavel').Value:= FrmCotacao_Preco_Produto.EdtResponsavel.Text;
        Parameters.ParamByName('Data_Cotacao').Value:= StrToDateTime(FrmCotacao_Preco_Produto.MEdtData_Cotacao.Text);
        Parameters.ParamByName('Hora_Cotacao').Value:= FrmCotacao_Preco_Produto.MEdtHora_Pedido.Text;
        Parameters.ParamByName('Data_Vencimento').Value:= StrToDateTime(FrmCotacao_Preco_Produto.MEdtData_Vencimento.Text);
        Parameters.ParamByName('Qtde_Itens').Value:= StrToFloat(FrmCotacao_Preco_Produto.EdtQuantidade_Itens.Text);
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;

end;

procedure TCotacao_Preco_Produto.Excluir;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Delete from Cotacao_Preco_Produto where N_Cotacao = :N_Cotacao');
        Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmCotacao_Preco_Produto.EdtN_Cotacao.Text);
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TCotacao_Preco_Produto.Inserir;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('insert into Cotacao_Preco_Produto (N_Cotacao, Codigo_Empresa, Responsavel, Data_Cotacao, Hora_Cotacao,');
        add('Data_Vencimento, Qtde_Itens)');
        add('values (:N_Cotacao, :Codigo_Empresa, :Responsavel, :Data_Cotacao, :Hora_Cotacao, ');
        add(':Data_Vencimento, :Qtde_Itens)');
        Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmCotacao_Preco_Produto.EdtN_Cotacao.Text);
        Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;
        Parameters.ParamByName('Responsavel').Value:= FrmCotacao_Preco_Produto.EdtResponsavel.Text;
        Parameters.ParamByName('Data_Cotacao').Value:= StrToDateTime(FrmCotacao_Preco_Produto.MEdtData_Cotacao.Text);
        Parameters.ParamByName('Hora_Cotacao').Value:= FrmCotacao_Preco_Produto.MEdtHora_Pedido.Text;
        Parameters.ParamByName('Data_Vencimento').Value:= StrToDateTime(FrmCotacao_Preco_Produto.MEdtData_Vencimento.Text);
        Parameters.ParamByName('Qtde_Itens').Value:= StrToFloat(FrmCotacao_Preco_Produto.EdtQuantidade_Itens.Text);
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;

end;

{ TItens_Cotacao_Preco_Produto }

procedure TItens_Cotacao_Preco_Produto.Alterar;
begin

end;

procedure TItens_Cotacao_Preco_Produto.Excluir;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Delete from Itens_Cotacao_Preco_Produto where N_Cotacao = :N_Cotacao');
        Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmCotacao_Preco_Produto.EdtN_Cotacao.Text);
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TItens_Cotacao_Preco_Produto.Excluir_Selecionado;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Delete from Itens_Cotacao_Preco_Produto where N_Cotacao = :N_Cotacao and Codigo_Produto = :Produto');
        Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmCotacao_Preco_Produto.EdtN_Cotacao.Text);
        Parameters.ParamByName('Produto').Value:= FrmCotacao_Preco_Produto.qryitens_cotacaoCodigo_Produto.AsInteger;
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;

end;

procedure TItens_Cotacao_Preco_Produto.Inserir;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('insert into Itens_Cotacao_Preco_Produto (N_Cotacao, Codigo_Produto, Qtde)');
        add('values (:N_Cotacao, :Codigo_Produto, :Qtde)');
        Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmCotacao_Preco_Produto.EdtN_Cotacao.Text);
        Parameters.ParamByName('Codigo_Produto').Value:= StrToInt(FrmCotacao_Preco_Produto.EdtCodigo_Produto.Text);
        Parameters.ParamByName('Qtde').Value:= StrToFloat(FrmCotacao_Preco_Produto.EdtQuantidade.Text);
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;

end;

{ TRetorno_Cotacao }

procedure TRetorno_Cotacao.Alterar;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    begin
      with qAux, SQL do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('Update Retorno_Cotacao_Preco set Data_Cotacao = :Data_Cotacao, Data_Retorno = :Data_Retorno,');
          add('Prazo_Entrega = :Prazo_Entrega, Codigo_Fornecedor = :Codigo_Fornecedor,');
          add('Codigo_Condicao_Pagamento = :Codigo_Condicao_Pagamento, Codigo_Funcionario = :Codigo_Funcionario,');
          add('Codigo_Empresa = :Codigo_Empresa, Tipo_Frete = :Tipo_Frete, Valor_Frete = :Valor_Frete, Outras_Despesas = :Outras_Despesas,');
          add('Qtde_Itens = :Qtde_Itens, Total_Produtos = :Total_Produtos, Peso_Total = :Peso_Total,');
          add('Desconto = :Desconto, Tipo_Desconto = :Tipo_Desconto, Total_Pedido = :Total_Pedido,');
          add('Observacoes = :Observacoes');
          add('where Codigo = :Codigo and N_Cotacao = :N_Cotacao');
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmRetorno_Cotacao.EdtCodigo.Text);
          Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmRetorno_Cotacao.EdtN_Cotacao.Text);
          Parameters.ParamByName('Data_Cotacao').Value:= StrToDateTime(FrmRetorno_Cotacao.MEdtData_Cotacao.Text);
          Parameters.ParamByName('Data_Retorno').Value:= StrToDateTime(FrmRetorno_Cotacao.MEdtData_Retorno.Text);
          Parameters.ParamByName('Prazo_Entrega').Value:= StrToInt(FrmRetorno_Cotacao.EdtPrazo_Entrega.Text);
          Parameters.ParamByName('Codigo_Fornecedor').Value:= StrToInt(FrmRetorno_Cotacao.EdtCodigo_Fornecedor.Text);
          Parameters.ParamByName('Codigo_Condicao_Pagamento').Value:= StrToInt(FrmRetorno_Cotacao.EdtCodigo_Condicao_Pagamento.Text);
          Parameters.ParamByName('Responsavel').Value:= FrmRetorno_Cotacao.EdtResponsavel.Text;
          Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;

          if (FrmRetorno_Cotacao.RGTipo_Frete.ItemIndex = 0) then
            Parameters.ParamByName('Tipo_Frete').Value:= 'CIF'
          else if (FrmRetorno_Cotacao.RGTipo_Frete.ItemIndex = 1) then
            Parameters.ParamByName('Tipo_Frete').Value:= 'FOB'
          else if (FrmRetorno_Cotacao.RGTipo_Frete.ItemIndex = 2) then
            Parameters.ParamByName('Tipo_Frete').Value:= 'TERCEIROS'
          else if (FrmRetorno_Cotacao.RGTipo_Frete.ItemIndex = 3) then
            Parameters.ParamByName('Tipo_Frete').Value:= 'ISENTO';

          Parameters.ParamByName('Valor_Frete').Value:= StrToFloat(FrmRetorno_Cotacao.EdtValor_Frete.Text);
          Parameters.ParamByName('Outras_Despesas').Value:= StrToFloat(FrmRetorno_Cotacao.EdtOutras_Despesas.Text);
          Parameters.ParamByName('Qtde_Itens').Value:= StrToInt(FrmRetorno_Cotacao.EdtQuantidade_Itens.Text);
          Parameters.ParamByName('Total_Produtos').Value:= StrToFloat(FrmRetorno_Cotacao.EdtTotal_Produtos.Text);
          Parameters.ParamByName('Peso_Total').Value:= StrToFloat(FrmRetorno_Cotacao.EdtPeso_Total.Text);
          Parameters.ParamByName('Desconto').Value:= StrToFloat(FrmRetorno_Cotacao.EdtDesconto.Text);
          if (FrmRetorno_Cotacao.RGDesconto.ItemIndex = 0) then
            Parameters.ParamByName('Tipo_Desconto').Value:= '%'
          else
            Parameters.ParamByName('Tipo_Desconto').Value:= '$';
          Parameters.ParamByName('Total_Pedido').Value:= StrToFloat(FrmRetorno_Cotacao.EdtTotal_Pedido.Text);
          Parameters.ParamByName('Observacoes').Value:= FrmRetorno_Cotacao.MmoObservacao.Text;
          ExecSQL;
        end;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TRetorno_Cotacao.Excluir;
var
  qAux, qaux2: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Delete from Retorno_Cotacao_Preco where Codigo = :Codigo and N_Cotacao = :N_Cotacao');
        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmRetorno_Cotacao.EdtCodigo.Text);
        Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmRetorno_Cotacao.EdtN_Cotacao.Text);
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TRetorno_Cotacao.Inserir;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    begin
      with qAux, SQL do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('Insert into Retorno_Cotacao_Preco (Codigo, N_Cotacao, Data_Cotacao, Data_Retorno, Prazo_Entrega, Codigo_Fornecedor,');
          add('Codigo_Condicao_Pagamento, Responsavel, Codigo_Empresa, Tipo_Frete, Valor_Frete, Outras_Despesas,');
          add('Qtde_Itens, Total_Produtos, Peso_Total, Desconto, Tipo_Desconto, Total_Pedido, ');
          add('Observacoes)');
          add('values (:Codigo, :N_Cotacao, :Data_Cotacao, :Data_Retorno, :Prazo_Entrega, :Codigo_Fornecedor,');
          add(':Codigo_Condicao_Pagamento, :Responsavel, :Codigo_Empresa, :Tipo_Frete, :Valor_Frete, :Outras_Despesas,');
          add(':Qtde_Itens, :Total_Produtos, :Peso_Total, :Desconto, :Tipo_Desconto, :Total_Pedido, ');
          add(':Observacoes)');
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmRetorno_Cotacao.EdtCodigo.Text);
          Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmRetorno_Cotacao.EdtN_Cotacao.Text);
          Parameters.ParamByName('Data_Cotacao').Value:= StrToDateTime(FrmRetorno_Cotacao.MEdtData_Cotacao.Text);
          Parameters.ParamByName('Data_Retorno').Value:= StrToDateTime(FrmRetorno_Cotacao.MEdtData_Retorno.Text);
          Parameters.ParamByName('Prazo_Entrega').Value:= StrToInt(FrmRetorno_Cotacao.EdtPrazo_Entrega.Text);
          Parameters.ParamByName('Codigo_Fornecedor').Value:= StrToInt(FrmRetorno_Cotacao.EdtCodigo_Fornecedor.Text);
          Parameters.ParamByName('Codigo_Condicao_Pagamento').Value:= StrToInt(FrmRetorno_Cotacao.EdtCodigo_Condicao_Pagamento.Text);
          Parameters.ParamByName('Responsavel').Value:= FrmRetorno_Cotacao.EdtResponsavel.Text;
          Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;

          if (FrmRetorno_Cotacao.RGTipo_Frete.ItemIndex = 0) then
            Parameters.ParamByName('Tipo_Frete').Value:= 'CIF'
          else if (FrmRetorno_Cotacao.RGTipo_Frete.ItemIndex = 1) then
            Parameters.ParamByName('Tipo_Frete').Value:= 'FOB'
          else if (FrmRetorno_Cotacao.RGTipo_Frete.ItemIndex = 2) then
            Parameters.ParamByName('Tipo_Frete').Value:= 'TERCEIROS'
          else if (FrmRetorno_Cotacao.RGTipo_Frete.ItemIndex = 3) then
            Parameters.ParamByName('Tipo_Frete').Value:= 'ISENTO';

          Parameters.ParamByName('Valor_Frete').Value:= StrToFloat(FrmRetorno_Cotacao.EdtValor_Frete.Text);
          Parameters.ParamByName('Outras_Despesas').Value:= StrToFloat(FrmRetorno_Cotacao.EdtOutras_Despesas.Text);
          Parameters.ParamByName('Qtde_Itens').Value:= StrToInt(FrmRetorno_Cotacao.EdtQuantidade_Itens.Text);
          Parameters.ParamByName('Total_Produtos').Value:= StrToFloat(FrmRetorno_Cotacao.EdtTotal_Produtos.Text);
          Parameters.ParamByName('Peso_Total').Value:= StrToFloat(FrmRetorno_Cotacao.EdtPeso_Total.Text);
          Parameters.ParamByName('Desconto').Value:= StrToFloat(FrmRetorno_Cotacao.EdtDesconto.Text);
          if (FrmRetorno_Cotacao.RGDesconto.ItemIndex = 0) then
            Parameters.ParamByName('Tipo_Desconto').Value:= '%'
          else
            Parameters.ParamByName('Tipo_Desconto').Value:= '$';
          Parameters.ParamByName('Total_Pedido').Value:= StrToFloat(FrmRetorno_Cotacao.EdtTotal_Pedido.Text);
          Parameters.ParamByName('Observacoes').Value:= FrmRetorno_Cotacao.MmoObservacao.Text;
          ExecSQL;
        end;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

{ TCondicao_Pagamento }

procedure TCondicao_Pagamento.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Condicao_Pagamento set Status = :Status, Descricao = :Descricao, ');
      add('Parcela = :Parcela, Prazo = :Prazo, Taxa = :Taxa, Tipo_Pagamento = :Tipo_Pagamento,');
      add('Tipo_Juro = :Tipo_Juro');

      add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Condicao_Pagamento.EdtCodigo.Text);

      if FrmCadastro_Condicao_Pagamento.CBStatus.Checked then
        Parameters.ParamByName('Status').Value:= 'ATIVO'
      else
        Parameters.ParamByName('Status').Value:= 'INATIVO';

      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Condicao_Pagamento.EdtDescricao.Text;
      Parameters.ParamByName('Parcela').Value:= StrToInt(FrmCadastro_Condicao_Pagamento.EdtParcela.Text);
      Parameters.ParamByName('Prazo').Value:= StrToInt(FrmCadastro_Condicao_Pagamento.EdtPrazo.Text);
      Parameters.ParamByName('Taxa').Value:= StrToFloat(FrmCadastro_Condicao_Pagamento.EdtTaxa_Juros.Text);

      if (FrmCadastro_Condicao_Pagamento.RBA_Vista.Checked) then
        Parameters.ParamByName('Tipo_Pagamento').Value:= 'A VISTA'
      else if (FrmCadastro_Condicao_Pagamento.RBA_Prazo.Checked) then
        Parameters.ParamByName('Tipo_Pagamento').Value:= 'A PRAZO';

      if (FrmCadastro_Condicao_Pagamento.RGTipo_Juro.ItemIndex = 0) then
        Parameters.ParamByName('Tipo_Juro').Value:= 'S'
      else if (FrmCadastro_Condicao_Pagamento.RGTipo_Juro.ItemIndex = 1) then
        Parameters.ParamByName('Tipo_Juro').Value:= 'C';

      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TCondicao_Pagamento.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Condicao_Pagamento where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Condicao_Pagamento.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TCondicao_Pagamento.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      sql.Add('INSERT INTO Condicao_Pagamento');
      sql.Add('(Codigo');
      sql.Add(',Status');
      sql.Add(',Descricao');
      sql.Add(',Parcela');
      sql.Add(',Prazo');
      sql.Add(',Taxa');
      sql.Add(',Tipo_Pagamento');
      sql.Add(',Tipo_Juro');
      sql.Add(',Data_Cadastro)');
      sql.Add('VALUES');
      sql.Add('(:Codigo');
      sql.Add(',:Status');
      sql.Add(',:Descricao');
      sql.Add(',:Parcela');
      sql.Add(',:Prazo');
      sql.Add(',:Taxa');
      sql.Add(',:Tipo_Pagamento');
      sql.Add(',:Tipo_Juro');
      sql.Add(',:Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Condicao_Pagamento.EdtCodigo.Text);

      if FrmCadastro_Condicao_Pagamento.CBStatus.Checked then
        Parameters.ParamByName('Status').Value:= 'ATIVO'
      else
        Parameters.ParamByName('Status').Value:= 'INATIVO';

      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Condicao_Pagamento.EdtDescricao.Text;
      Parameters.ParamByName('Parcela').Value:= StrToInt(FrmCadastro_Condicao_Pagamento.EdtParcela.Text);
      Parameters.ParamByName('Prazo').Value:= StrToInt(FrmCadastro_Condicao_Pagamento.EdtPrazo.Text);
      Parameters.ParamByName('Taxa').Value:= StrToFloat(FrmCadastro_Condicao_Pagamento.EdtTaxa_Juros.Text);

      if (FrmCadastro_Condicao_Pagamento.RBA_Vista.Checked) then
        Parameters.ParamByName('Tipo_Pagamento').Value:= 'A VISTA'
      else if (FrmCadastro_Condicao_Pagamento.RBA_Prazo.Checked) then
        Parameters.ParamByName('Tipo_Pagamento').Value:= 'A PRAZO';

      if (FrmCadastro_Condicao_Pagamento.RGTipo_Juro.ItemIndex = 0) then
        Parameters.ParamByName('Tipo_Juro').Value:= 'S'
      else if (FrmCadastro_Condicao_Pagamento.RGTipo_Juro.ItemIndex = 1) then
        Parameters.ParamByName('Tipo_Juro').Value:= 'C';

      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Condicao_Pagamento.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TItens_Retorno_Cotacao }

procedure TItens_Retorno_Cotacao.Alterar;
begin

end;

procedure TItens_Retorno_Cotacao.Excluir;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Delete from Itens_Retorno_Cotacao_Preco where N_Cotacao = :N_Cotacao and Codigo = :Codigo');
        Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmRetorno_Cotacao.EdtN_Cotacao.Text);
        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmRetorno_Cotacao.EdtCodigo.Text);
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TItens_Retorno_Cotacao.Excluir_Selecionado;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Delete from Itens_Retorno_Cotacao_Preco where N_Cotacao = :N_Cotacao and ');
        add('Codigo_Produto = :Produto and Codigo = :Codigo');
        Parameters.ParamByName('N_Cotacao').Value:= StrToInt(FrmRetorno_Cotacao.EdtN_Cotacao.Text);
        Parameters.ParamByName('Produto').Value:= FrmRetorno_Cotacao.qryitens_retorno_cotacaoCodigo_Produto.AsInteger;
        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmRetorno_Cotacao.EdtCodigo.Text);
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TItens_Retorno_Cotacao.Inserir;
begin

end;

{ TCompra }

procedure TCompra.Alterar;
var
  qAux: TADOQuery;
begin
    try
      qAux:= TADOQuery.Create(nil);
      begin
        with qAux, SQL do
          begin
            close;
            clear;
            Connection:= dm.ADOConnection1;
            add('Update Compra set Data_Pedido = :Data_Pedido, Hora_Pedido = :Hora_Pedido,');
            add('Data_Previsao_Entrega = :Data_Previsao_Entrega, Codigo_Fornecedor = :Codigo_Fornecedor,');
            add('Codigo_Condicao_Pagamento = :Codigo_Condicao_Pagamento, Codigo_Funcionario = :Codigo_Funcionario,');
            add('Codigo_Empresa = :Codigo_Empresa, Tipo_Frete = :Tipo_Frete, Valor_Frete = :Valor_Frete, Outras_Despesas = :Outras_Despesas,');
            add('Qtde_Itens = :Qtde_Itens, Total_Produtos = :Total_Produtos, Peso_Total = :Peso_Total,');
            add('Desconto = :Desconto, Tipo_Desconto = :Tipo_Desconto, Total_Pedido = :Total_Pedido,');
            add('Status = :Status, Observacoes = :Observacoes');
            add('where Codigo = :Codigo and N_Pedido = :N_Pedido');

            Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCompra.EdtCodigo.Text);
            Parameters.ParamByName('N_Pedido').Value:= StrToInt(FrmCompra.EdtN_Pedido.Text);
            Parameters.ParamByName('Data_Pedido').Value:= StrToDateTime(FrmCompra.MEdtData_Pedido.Text);
            Parameters.ParamByName('Hora_Pedido').Value:= FrmCompra.MEdtHora_Pedido.Text;
            Parameters.ParamByName('Data_Previsao_Entrega').Value:= StrToDateTime(FrmCompra.MEdtPrevisao_Entrega.Text);
            Parameters.ParamByName('Codigo_Fornecedor').Value:= StrToInt(FrmCompra.EdtCodigo_Fornecedor.Text);
            Parameters.ParamByName('Codigo_Condicao_Pagamento').Value:= StrToInt(FrmCompra.EdtCodigo_Condicao_Pagamento.Text);
            Parameters.ParamByName('Responsavel').Value:= FrmCompra.EdtResponsavel.Text;
            Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;

            if (FrmCompra.RGTipo_Frete.ItemIndex = 0) then
              Parameters.ParamByName('Tipo_Frete').Value:= 'CIF'
            else if (FrmCompra.RGTipo_Frete.ItemIndex = 1) then
              Parameters.ParamByName('Tipo_Frete').Value:= 'FOB'
            else if (FrmCompra.RGTipo_Frete.ItemIndex = 2) then
              Parameters.ParamByName('Tipo_Frete').Value:= 'TERCEIROS'
            else if (FrmCompra.RGTipo_Frete.ItemIndex = 3) then
              Parameters.ParamByName('Tipo_Frete').Value:= 'ISENTO';

            Parameters.ParamByName('Valor_Frete').Value:= StrToFloat(FrmCompra.EdtValor_Frete.Text);
            Parameters.ParamByName('Outras_Despesas').Value:= StrToFloat(FrmCompra.EdtOutras_Despesas.Text);
            Parameters.ParamByName('Qtde_Itens').Value:= StrToInt(FrmCompra.EdtQuantidade_Itens.Text);
            Parameters.ParamByName('Total_Produtos').Value:= StrToFloat(FrmCompra.EdtTotal_Produtos.Text);
            Parameters.ParamByName('Peso_Total').Value:= StrToFloat(FrmCompra.EdtPeso_Total.Text);
            Parameters.ParamByName('Desconto').Value:= StrToFloat(FrmCompra.EdtDesconto.Text);
            Parameters.ParamByName('Tipo_Desconto').Value:= '$';
            Parameters.ParamByName('Total_Pedido').Value:= StrToFloat(FrmCompra.EdtTotal_Pedido.Text);
            Parameters.ParamByName('Status').Value:= 'PENDENTE';
            Parameters.ParamByName('Observacoes').Value:= FrmCompra.MmoObservacao.Text;
            ExecSQL;
          end;
      end;
    finally
      qAux.Close;
      FreeAndNil(qAux);
    end;
end;

procedure TCompra.Excluir;
var
  qAux: TADOQuery;
begin
    try
      qAux:= TADOQuery.Create(nil);
      with qAux, SQL do
        begin
          close;
          clear;
          Connection:= dm.ADOConnection1;
          add('Delete from Compra where Codigo = :Codigo and N_Pedido = :N_Pedido');
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCompra.EdtCodigo.Text);
          Parameters.ParamByName('N_Pedido').Value:= StrToInt(FrmCompra.EdtN_Pedido.Text);
          ExecSQL;
        end;
    finally
      qAux.Close;
      FreeAndNil(qAux);
    end;
end;

procedure TCompra.Inserir;
var
  qAux, qaux2: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    begin
      with qAux, SQL do
        begin
          close;
          clear;
          Connection:= dm.ADOConnection1;
          add('Insert into Compra (N_Pedido, Data_Pedido, Hora_Pedido, Data_Previsao_Entrega, Codigo_Fornecedor,');
          add('Codigo_Condicao_Pagamento, Responsavel, Codigo_Empresa, Tipo_Frete, Valor_Frete, Outras_Despesas,');
          add('Qtde_Itens, Total_Produtos, Peso_Total, Desconto, Tipo_Desconto, Total_Pedido, Status,');
          add('Observacoes)');
          add('values (:N_Pedido, :Data_Pedido, :Hora_Pedido, :Data_Previsao_Entrega, :Codigo_Fornecedor,');
          add(':Codigo_Condicao_Pagamento, :Responsavel, :Codigo_Empresa, :Tipo_Frete, :Valor_Frete, :Outras_Despesas,');
          add(':Qtde_Itens, :Total_Produtos, :Peso_Total, :Desconto, :Tipo_Desconto, :Total_Pedido, :Status,');
          add(':Observacoes)');
          Parameters.ParamByName('N_Pedido').Value:= StrToInt(FrmCompra.EdtN_Pedido.Text);
          Parameters.ParamByName('Data_Pedido').Value:= StrToDateTime(FrmCompra.MEdtData_Pedido.Text);
          Parameters.ParamByName('Hora_Pedido').Value:= FrmCompra.MEdtHora_Pedido.Text;
          Parameters.ParamByName('Data_Previsao_Entrega').Value:= StrToDateTime(FrmCompra.MEdtPrevisao_Entrega.Text);
          Parameters.ParamByName('Codigo_Fornecedor').Value:= StrToInt(FrmCompra.EdtCodigo_Fornecedor.Text);
          Parameters.ParamByName('Codigo_Condicao_Pagamento').Value:= StrToInt(FrmCompra.EdtCodigo_Condicao_Pagamento.Text);
          Parameters.ParamByName('Responsavel').Value:= FrmCompra.EdtResponsavel.Text;
          Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;

          if (FrmCompra.RGTipo_Frete.ItemIndex = 0) then
            Parameters.ParamByName('Tipo_Frete').Value:= 'CIF'
          else if (FrmCompra.RGTipo_Frete.ItemIndex = 1) then
            Parameters.ParamByName('Tipo_Frete').Value:= 'FOB'
          else if (FrmCompra.RGTipo_Frete.ItemIndex = 2) then
            Parameters.ParamByName('Tipo_Frete').Value:= 'TERCEIROS'
          else if (FrmCompra.RGTipo_Frete.ItemIndex = 3) then
            Parameters.ParamByName('Tipo_Frete').Value:= 'ISENTO';

          Parameters.ParamByName('Valor_Frete').Value:= StrToFloat(FrmCompra.EdtValor_Frete.Text);
          Parameters.ParamByName('Outras_Despesas').Value:= StrToFloat(FrmCompra.EdtOutras_Despesas.Text);
          Parameters.ParamByName('Qtde_Itens').Value:= StrToInt(FrmCompra.EdtQuantidade_Itens.Text);
          Parameters.ParamByName('Total_Produtos').Value:= StrToFloat(FrmCompra.EdtTotal_Produtos.Text);
          Parameters.ParamByName('Peso_Total').Value:= StrToFloat(FrmCompra.EdtPeso_Total.Text);
          Parameters.ParamByName('Desconto').Value:= StrToFloat(FrmCompra.EdtDesconto.Text);
          Parameters.ParamByName('Tipo_Desconto').Value:= '$';
          Parameters.ParamByName('Total_Pedido').Value:= StrToFloat(FrmCompra.EdtTotal_Pedido.Text);
          Parameters.ParamByName('Status').Value:= 'PENDENTE';
          Parameters.ParamByName('Observacoes').Value:= FrmCompra.MmoObservacao.Text;
          ExecSQL;
        end;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

{ TItens_Compra }

procedure TItens_Compra.Alterar;
begin

end;

procedure TItens_Compra.Excluir;
var
  qAux, qaux2: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    qAux2:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Delete from Itens_Compra where N_Pedido = :N_Pedido');
        Parameters.ParamByName('N_Pedido').Value:= StrToInt(FrmCompra.LblPedido.Caption);
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TItens_Compra.Excluir_Selecionado;
var
  qAux, qaux2: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    qAux2:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Delete from Itens_Compra where N_Pedido = :N_Pedido and Codigo_Produto = :Produto');
        Parameters.ParamByName('N_Pedido').Value:= StrToInt(FrmCompra.LblPedido.Caption);
        Parameters.ParamByName('Produto').Value:= FrmCompra.qryitens_compraCodigo_Produto.AsInteger;
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TItens_Compra.Inserir;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    begin
      with qAux, SQL do
        begin
          close;
          clear;
          Connection:= dm.ADOConnection1;
          add('Insert into Itens_Compra (Codigo, N_Pedido, Codigo_Produto, Qtde, Qtde_Recebida,');
          add('Qtde_Restante, Valor_Unitario, Desconto, Tipo_Desconto, Sub_Total, Status)');
          add('values (:Codigo, :N_Pedido, :Codigo_Produto, :Qtde, :Qtde_Recebida, :Qtde_Restante, :Valor_Unitario,');
          add(':Desconto, :Tipo_Desconto, :Sub_Total, :Status)');
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCompra.EdtCodigo.Text);
          Parameters.ParamByName('N_Pedido').Value:= StrToInt(FrmCompra.LblPedido.Caption);
          Parameters.ParamByName('Codigo_Produto').Value:= StrToInt(FrmCompra.EdtCodigo_Produto.Text);
          Parameters.ParamByName('Qtde').Value:= StrToFloat(FrmCompra.EdtQuantidade.Text);
          Parameters.ParamByName('Qtde_Recebida').Value:= 0;
          Parameters.ParamByName('Qtde_Restante').Value:= StrToFloat(FrmCompra.EdtQuantidade.Text);
          Parameters.ParamByName('Valor_Unitario').Value:= StrToFloat(FrmCompra.EdtValor_Unitario.Text);
          Parameters.ParamByName('Desconto').Value:= StrToFloat(FrmCompra.EdtDesconto_Item.Text);
          if (FrmCompra.RGDesconto_Item.ItemIndex = 0) then
            Parameters.ParamByName('Tipo_Desconto').Value:= '%'
          else
            Parameters.ParamByName('Tipo_Desconto').Value:= '$';
          Parameters.ParamByName('Sub_Total').Value:= StrToFloat(FrmCompra.EdtValor_Total.Text);
          Parameters.ParamByName('Status').Value:= 'PENDENTE';
          ExecSQL;
        end;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

{ TConciliacao }

procedure TConciliacao.Alterar;
begin

end;

procedure TConciliacao.Excluir;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Delete from Conciliacao_Compra where N_Pedido = :N_Pedido and Codigo_Produto = :Produto');
        Parameters.ParamByName('N_Pedido').Value:= StrToInt(FrmConciliacao_Compra.EdtN_Pedido.Text);
        Parameters.ParamByName('Produto').Value:= FrmConciliacao_Compra.qryitens_compraCodigo_Produto.AsInteger;
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TConciliacao.Inserir;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    begin
      with qAux, SQL do
        begin
          close;
          clear;
          Connection:= dm.ADOConnection1;
          add('Insert into Conciliacao_Compra (N_Pedido, Codigo_Produto, Qtde_Solicitada, Qtde_Recebida,');
          add('Qtde_Restante, Valor_Unitario, Valor_Total_Recebido, Valor_Total_Restante)');
          add('values (:N_Pedido, :Codigo_Produto, :Qtde_Solicitada, :Qtde_Recebida, :Qtde_Restante,');
          add(':Valor_Unitario, :Valor_Total_Recebido, :Valor_Total_Restante)');
          Parameters.ParamByName('N_Pedido').Value:= StrToInt(FrmConciliacao_Compra.EdtN_Pedido.Text);
          Parameters.ParamByName('Codigo_Produto').Value:= StrToInt(FrmConciliacao_Compra.EdtCodigo_Produto.Text);
          Parameters.ParamByName('Qtde_Solicitada').Value:= StrToFloat(FrmConciliacao_Compra.EdtQtde_Solicitada.Text);
          Parameters.ParamByName('Qtde_Recebida').Value:= StrToFloat(FrmConciliacao_Compra.EdtQtde_Recebida.Text);
          Parameters.ParamByName('Qtde_Restante').Value:= StrToFloat(FrmConciliacao_Compra.EdtQtde_Restante.Text);
          Parameters.ParamByName('Valor_Unitario').Value:= StrToFloat(FrmConciliacao_Compra.EdtValor_Unitario.Text);
          Parameters.ParamByName('Valor_Total_Recebido').Value:= StrToFloat(FrmConciliacao_Compra.EdtValor_Total_Recebido.Text);
          Parameters.ParamByName('Valor_Total_Restante').Value:= StrToFloat(FrmConciliacao_Compra.Edtvalor_Total_Restante.Text);
          ExecSQL;
        end;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

{ TMovimento_Caixa }

procedure TMovimento_Caixa.Inserir;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Insert Into Movimento_Caixa (Codigo_Empresa, Codigo_Caixa, Codigo_Plano, N_Documento, Data_Movimentacao, Descricao, Dinheiro,');
        add('Cheque_Vista, Cheque_Prazo, Cartao, Juros, Desconto) values (:Codigo_Empresa, :Codigo_Caixa, :Codigo_Plano,');
        add(':N_Documento, :Data_Movimentacao, :Descricao, :Dinheiro, :Cheque_Vista, :Cheque_Prazo, :Cartao, :Juros, :Desconto)');
        Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;
        Parameters.ParamByName('Codigo_Caixa').Value:= Codigo_Caixa;
        Parameters.ParamByName('Codigo_Plano').Value:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCodigo_Plano.AsInteger;
        Parameters.ParamByName('N_Documento').Value:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoN_Documento.AsInteger;
        Parameters.ParamByName('Data_Movimentacao').Value:= StrToDateTime(FrmBaixar_Titulo.MEdtData_Pagamento.Text);
        Parameters.ParamByName('Descricao').Value:= '';

        if (FrmChama_Lancamentos_Financeiros.CBBaixa.Checked = false) then
          Parameters.ParamByName('Dinheiro').Value:= StrToFloat(FrmBaixar_Titulo.EdtDinheiro.Text)
        else
          Parameters.ParamByName('Dinheiro').Value:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor.AsFloat;

        Parameters.ParamByName('Cheque_Vista').Value:= StrToFloat(FrmBaixar_Titulo.EdtCheque_a_Vista.Text);
        Parameters.ParamByName('Cheque_Prazo').Value:= StrToFloat(FrmBaixar_Titulo.EdtCheque_a_Prazo.Text);
        Parameters.ParamByName('Cartao').Value:= StrToFloat(FrmBaixar_Titulo.EdtCartao.Text);
        Parameters.ParamByName('Juros').Value:= StrToFloat(FrmBaixar_Titulo.EdtJuros.Text);
        Parameters.ParamByName('Desconto').Value:= StrToFloat(FrmBaixar_Titulo.EdtDesconto.Text);
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;

end;

{ TFechamento_Caixa }

procedure TFechamento_Caixa.Inserir;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        {close;
        Connection:= dm.ADOConnection1;
        clear;
        add('Insert into Fechamento_Caixa ( Data_Abertura, Data_Fechamento, Forma_Pagamento, Codigo_Caixa, ');
        add('Codigo_Usuario, Valor_Abertura, Valor_Fechamento, Tipo_Documento)');
        add('values ');
        add('(:Data_Abertura, :Data_Fechamento, :Forma_Pagamento, :Codigo_Caixa, ');
        add(':Codigo_Usuario, :Valor_Abertura, :Valor_Fechamento, :Tipo_Documento)');

        Parameters.ParamByName('Data_Abertura').Value:= FrmAcerto_Caixa.qryaberturaData_Abertura.AsDateTime;
        Parameters.ParamByName('Data_Fechamento').Value:= date;
        Parameters.ParamByName('Forma_Pagamento').Value:= FrmAcerto_Caixa.qryfechamentoForma_Pagamento.AsString;
        Parameters.ParamByName('Codigo_Caixa').Value:= Codigo_Caixa;
        Parameters.ParamByName('Codigo_Usuario').Value:= Codigo_Usuario;
        Parameters.ParamByName('Valor_Abertura').Value:= FrmAcerto_Caixa.qryaberturaValor.AsFloat;
        Parameters.ParamByName('Valor_Fechamento').Value:= FrmAcerto_Caixa.qryfechamentoValor.AsFloat;
        Parameters.ParamByName('Tipo_Documento').Value:= FrmAcerto_Caixa.qryfechamentoTipo_Documento.AsString;
        ExecSQL;}
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TFechamento_Caixa.Salva_Conta(Codigo, Codigo_Empresa, Codigo_Caixa,
  Codigo_Usuario, Acerto, Movimenta, N_Documento, Parcela: integer;
  Forma_Pagamento, Tipo_Documento, Status, Tipo: Ansistring; Valor,
  Troco: double; Data: TDate);
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);
  try
    with qAux, SQL do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('Insert into Fechamento_Venda (Codigo, Codigo_Empresa, Codigo_Caixa, Codigo_Usuario, Forma_Pagamento, Valor, Troco, Data, Tipo_Documento, Status, Acerto, Tipo, Movimenta, N_Documento, Parcela)');
        add('values (:Codigo, :Codigo_Empresa, :Codigo_Caixa, :Codigo_Usuario, :Forma_Pagamento, :Valor, :Troco, :Data, :Tipo_Documento, :Status, :Acerto, :Tipo, :Movimenta, :N_Documento, :Parcela)');
        Parameters.ParamByName('Codigo').Value:= Codigo;
        Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;
        Parameters.ParamByName('Codigo_Caixa').Value:= Codigo_Caixa;
        Parameters.ParamByName('Codigo_Usuario').Value:= Codigo_Usuario;
        Parameters.ParamByName('Forma_Pagamento').Value:= Forma_Pagamento;
        Parameters.ParamByName('Valor').Value:= Valor;
        Parameters.ParamByName('Troco').Value:= Troco;
        Parameters.ParamByName('Data').Value:= Data;
        Parameters.ParamByName('Tipo_Documento').Value:= Tipo_Documento;
        Parameters.ParamByName('Status').Value:= Status;
        Parameters.ParamByName('Acerto').Value:= Acerto;
        Parameters.ParamByName('Tipo').Value:= Tipo;
        Parameters.ParamByName('Movimenta').Value:= Movimenta;
        Parameters.ParamByName('N_Documento').Value:= N_Documento;
        Parameters.ParamByName('Parcela').Value:= Parcela;
        ExecSQL;
      end;
  finally
    FreeAndNil(qAux);
  end;
end;

{ TCaixa }

procedure TCaixa.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Cadastro_Caixa set Codigo_Empresa = :Codigo_Empresa, Descricao = :Descricao,');
      add('Codigo_SubNivel = :Codigo_SubNivel, Caixa = :Caixa where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Caixa.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Empresa').Value:= UUtilitarios.Codigo_Empresa;
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Caixa.EdtDescricao.Text;

      if (FrmCadastro_Caixa.EdtCodigo_SubNivel.Text = '') then
        Parameters.ParamByName('Codigo_SubNivel').Value:= 0
      else
        Parameters.ParamByName('Codigo_SubNivel').Value:= StrToInt(FrmCadastro_Caixa.EdtCodigo_SubNivel.Text);

      Parameters.ParamByName('Caixa').Value:= FrmCadastro_Caixa.EdtCaixa.Text;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TCaixa.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Caixa where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Caixa.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TCaixa.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert into Cadastro_Caixa (Codigo, Codigo_Empresa, Descricao, Codigo_SubNivel, Caixa, Data_Cadastro)');
      Add('Values');
      Add('(:Codigo, :Codigo_Empresa, :Descricao, :Codigo_SubNivel, :Caixa, :Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Caixa.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Empresa').Value:= UUtilitarios.Codigo_Empresa;
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Caixa.EdtDescricao.Text;

      if (FrmCadastro_Caixa.EdtCodigo_SubNivel.Text = '') then
        Parameters.ParamByName('Codigo_SubNivel').Value:= 0
      else
        Parameters.ParamByName('Codigo_SubNivel').Value:= StrToInt(FrmCadastro_Caixa.EdtCodigo_SubNivel.Text);

      Parameters.ParamByName('Caixa').Value:= FrmCadastro_Caixa.EdtCaixa.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Caixa.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TAbertura_Caixa }

procedure TAbertura_Caixa.Inserir;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Insert into Abertura_Caixa ( Data_Abertura, Codigo_Forma_Pagamento, Codigo_Caixa, Codigo_Usuario, Valor, Acerto)');
        add('values ');
        add('(:Data_Abertura, :Codigo_Forma_Pagamento, :Codigo_Caixa, :Codigo_Usuario, :Valor, :Acerto)');
        Parameters.ParamByName('Data_Abertura').Value:= date;
        Parameters.ParamByName('Codigo_Forma_Pagamento').Value:= StrToInt(FrmAbertura_Caixa.EdtCodigo_Forma_Pagamento.Text);
        Parameters.ParamByName('Codigo_Caixa').Value:= StrToInt(FrmAbertura_Caixa.EdtCodigo_Caixa.Text);
        Parameters.ParamByName('Codigo_Usuario').Value:= Codigo_Usuario;
        Parameters.ParamByName('Valor').Value:= StrToFloat(FrmAbertura_Caixa.EdtValor.Text);
        Parameters.ParamByName('Acerto').Value:= 0;
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

{ TAcerto }

procedure TAcerto.Inserir;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('Insert into Acerto_Caixa ( Data_Abertura, Data_Fechamento, Codigo_Caixa, Codigo_Usuario, Valor_Abertura,');
        add('Entrada, Saida, Saldo, Acerto, Fechamento)');
        add('values ');
        add('(:Data_Abertura, :Data_Fechamento, :Codigo_Caixa, :Codigo_Usuario, :Valor_Abertura,');
        add(':Entrada, :Saida, :Saldo, :Acerto, :Fechamento)');

        Parameters.ParamByName('Data_Abertura').Value:= FrmAcerto_Caixa.qryaberturaData_Abertura.AsDateTime;
        Parameters.ParamByName('Data_Fechamento').Value:= date;
        Parameters.ParamByName('Codigo_Caixa').Value:= Codigo_Caixa;
        Parameters.ParamByName('Codigo_Usuario').Value:= Codigo_Usuario;
        Parameters.ParamByName('Valor_Abertura').Value:= FrmAcerto_Caixa.qryaberturaValor.AsFloat;
        Parameters.ParamByName('Entrada').Value:= StrToFloat(FrmAcerto_Caixa.EdtEntrada.Text);
        Parameters.ParamByName('Saida').Value:= StrToFloat(FrmAcerto_Caixa.EdtSaida.Text);
        Parameters.ParamByName('Saldo').Value:= StrToFloat(FrmAcerto_Caixa.EdtSaldo.Text);
        Parameters.ParamByName('Acerto').Value:= StrToFloat(FrmAcerto_Caixa.EdtAcerto.Text);
        Parameters.ParamByName('Fechamento').Value:= StrToFloat(FrmAcerto_Caixa.EdtFechamento.Text);
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

{ TLancamento_Financeiro }

procedure TLancamento_Financeiro.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Lancamento_Financeiro where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmLancamento_Financeiro.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TLancamento_Financeiro.Inserir;
var
  qAux, qaux2, qaux3: TADOQuery;
  Parcela: TParcela_Lancamentos;
begin
  try
    DM.ADOConnection1.BeginTrans;
    try

      qAux:= TADOQuery.Create(nil);
      qAux2:= TADOQuery.Create(nil);
      qAux3:= TADOQuery.Create(nil);
      with qAux, SQL do
        begin
          close;
          clear;
          Connection:= dm.ADOConnection1;
          add('Insert into Lancamento_Financeiro (Codigo, Tipo, N_Documento, Codigo_Empresa, Codigo_Forma_Pagamento, ');
          add('Codigo_Cli_For, Codigo_Tipo_Documento, Historico, Codigo_Departamento, Codigo_Plano, Codigo_Safra, Data_Lancamento,');
          add('Data_Vencimento, Valor_Documento, Desconto, Multa, Valor_Cobrado, Observacoes, Status, Fiscal) values (');
          add(':Codigo, :Tipo, :N_Documento, :Codigo_Empresa, :Codigo_Forma_Pagamento, :Codigo_Cli_For, :Codigo_Tipo_Documento, ');
          add(':Historico, :Codigo_Departamento, :Codigo_Plano, :Codigo_Safra, :Data_Lancamento, :Data_Vencimento, :Valor_Documento, ');
          add(':Desconto, :Multa, :Valor_Cobrado, :Observacoes, :Status, :Fiscal)');

          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmLancamento_Financeiro.EdtCodigo.Text);

          if (FrmLancamento_Financeiro.RGTipo.ItemIndex = 0) then
            Parameters.ParamByName('Tipo').Value:= 'RECEBER'
          else
            Parameters.ParamByName('Tipo').Value:= 'PAGAR';

          Parameters.ParamByName('N_Documento').Value:= StrToInt(FrmLancamento_Financeiro.EdtDocumento.Text);
          Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;
          Parameters.ParamByName('Codigo_Forma_Pagamento').Value:= StrToInt(FrmLancamento_Financeiro.EdtCodigo_Condicao_Pagamento.Text);
          Parameters.ParamByName('Codigo_Cli_For').Value:= StrToInt(FrmLancamento_Financeiro.EdtCodigo_Cli_Forn.Text);

          if (FrmLancamento_Financeiro.EdtCodigo_Tipo_Documento.Text = '') then
            Parameters.ParamByName('Codigo_Tipo_Documento').Value:= 0
          else
            Parameters.ParamByName('Codigo_Tipo_Documento').Value:= StrToInt(FrmLancamento_Financeiro.EdtCodigo_Tipo_Documento.Text);

          Parameters.ParamByName('Historico').Value:= FrmLancamento_Financeiro.EdtHistorico.Text;

          if (FrmLancamento_Financeiro.EdtCodigo_Departamento.Text = '') then
            Parameters.ParamByName('Codigo_Departamento').Value:= 0
          else
            Parameters.ParamByName('Codigo_Departamento').Value:= StrToInt(FrmLancamento_Financeiro.EdtCodigo_Departamento.Text);

          if (FrmLancamento_Financeiro.EdtCodigo_Plano.Text = '') then
            Parameters.ParamByName('Codigo_Plano').Value:= 0
          else
            Parameters.ParamByName('Codigo_Plano').Value:= StrToInt(FrmLancamento_Financeiro.EdtCodigo_Plano.Text);

          if (FrmLancamento_Financeiro.EdtCodigo_Safra.Text = '') then
            Parameters.ParamByName('Codigo_Safra').Value:= 0
          else
            Parameters.ParamByName('Codigo_Safra').Value:= StrToInt(FrmLancamento_Financeiro.EdtCodigo_Safra.Text);

          Parameters.ParamByName('Data_Lancamento').Value:= StrToDateTime(FrmLancamento_Financeiro.MEdtData_Lancamento.Text);
          Parameters.ParamByName('Data_Vencimento').Value:= StrToDateTime(FrmLancamento_Financeiro.MEdtData_Vencimento.Text);
          Parameters.ParamByName('Valor_Documento').Value:= StrToFloat(FrmLancamento_Financeiro.EdtValor_Documento.Text);
          Parameters.ParamByName('Desconto').Value:= StrToFloat(FrmLancamento_Financeiro.EdtDesconto.Text);
          Parameters.ParamByName('Multa').Value:= StrToFloat(FrmLancamento_Financeiro.EdtMulta.Text);
          Parameters.ParamByName('Valor_Cobrado').Value:= StrToFloat(FrmLancamento_Financeiro.EdtValor_Cobrado.Text);
          Parameters.ParamByName('Observacoes').Value:= FrmLancamento_Financeiro.MmoObservacoes.Text;
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

          if (FrmLancamento_Financeiro.RGFiscal.ItemIndex = 0) then
            Parameters.ParamByName('Fiscal').Value:= 0
          else
            Parameters.ParamByName('Fiscal').Value:= 1;

          ExecSQL;
          Parcela.Inserir;
          DM.ADOConnection1.CommitTrans;
        end;
    finally
      qAux.Close;
      FreeAndNil(qAux);
    end;

  except
    on E: Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        Mensagem.Impossivel_Executar;
      end;
  end;
end;

{ TParcela_Lancamentos }

procedure TParcela_Lancamentos.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Parcelas_Lancamentos where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmLancamento_Financeiro.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TParcela_Lancamentos.Inserir;
var
  qAux, qaux2, qaux3: TADOQuery;
  data_vencim: TDate;
  doc, i: integer;
  valaux, valor: double;
begin
    try
      qAux:= TADOQuery.Create(nil);
      qAux2:= TADOQuery.Create(nil);
      qAux3:= TADOQuery.Create(nil);
      with qaux3 do
        begin
          close;
          sql.clear;
          Connection:= dm.ADOConnection1;
          sql.add('select * from Condicao_Pagamento where Codigo = :Codigo');
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmLancamento_Financeiro.EdtCodigo_Condicao_Pagamento.Text);
          open;
        end;

        data_vencim:= StrToDateTime(FrmLancamento_Financeiro.MEdtData_Vencimento.Text);
        doc:= StrToInt(FrmLancamento_Financeiro.EdtDocumento.Text + '1');
        for i := 1 to qaux3.FieldByName('Parcela').AsInteger do
        begin
          with qAux, SQL do
            begin
              close;
              clear;
              Connection:= dm.ADOConnection1;
              add('Insert into Parcelas_Lancamentos (Codigo, N_Documento, Data_Vencimento, Data_Pagamento, ');
              add('Parcela, Status, Valor, Codigo_Lancamento_Bancario) values (:Codigo, :N_Documento, :Data_Vencimento, :Data_Pagamento, ');
              add(':Parcela, :Status, :Valor, :Codigo_Lancamento_Bancario)');
              Parameters.ParamByName('Codigo').Value:= StrToInt(FrmLancamento_Financeiro.EdtCodigo.Text);
              Parameters.ParamByName('N_Documento').Value:= doc;
              Parameters.ParamByName('Data_Vencimento').Value:= data_vencim;
              Parameters.ParamByName('Data_Pagamento').Value:= NULL;

              data_vencim:= IncDay(data_vencim, qaux3.FieldByName('Prazo').AsInteger);
              Parameters.ParamByName('Parcela').Value:= i;
              Parameters.ParamByName('Status').Value:= 'PENDENTE';

              valor:= StrToFloat(FrmLancamento_Financeiro.EdtValor_Cobrado.Text);
              if (qaux3.FieldByName('Tipo_Juro').AsString = 'C') then
              begin
                valaux:= Util.Calcula_Juro_Composto(valor, qaux3.FieldByName('Taxa').AsFloat / 100, qaux3.FieldByName('Parcela').AsInteger);
                Parameters.ParamByName('Valor').Value:= (valaux / qaux3.FieldByName('Parcela').AsInteger);
              end
              else
              begin
                valaux:= valor + (valor * (qaux3.FieldByName('Taxa').AsFloat / 100));
                valaux:= (valaux / qaux3.FieldByName('Parcela').AsInteger);

                Parameters.ParamByName('Valor').Value:= valaux;
              end;

              Parameters.ParamByName('Codigo_Lancamento_Bancario').Value:= 0;
              ExecSQL;
              if (FrmLancamento_Financeiro.CBReplicar.Checked = true) then
                doc:= doc + 1
            end;
        end;
    finally
      qAux.Close;
      FreeAndNil(qAux);
    end;
end;


{ TTipo_Documento }

procedure TTipo_Documento.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Cadastro_Tipo_Documento set Descricao = :Descricao');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Tipo_Documento.EdtDescricao.Text;
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Tipo_Documento.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TTipo_Documento.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Tipo_Documento');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Tipo_Documento.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TTipo_Documento.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert Into Cadastro_Tipo_Documento (Codigo, Descricao, Data_Cadastro) values');
      add('(:Codigo, :Descricao, :Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Tipo_Documento.EdtCodigo.Text);
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Tipo_Documento.EdtDescricao.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Tipo_Documento.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TPlano_Financeiro }

procedure TPlano_Financeiro.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Cadastro_Plano_Financeiro set Codigo_Empresa = :Codigo_Empresa, Tipo = :Tipo, ');
      add('Descricao = :Descricao, Codigo_SubNivel = :Codigo_SubNivel, Sub_Nivel = :Sub_Nivel, Codigo_Pai = :Codigo_Pai');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Plano_Financeiro.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;

      if (FrmCadastro_Plano_Financeiro.RGTipo.ItemIndex = 0) then
        Parameters.ParamByName('Tipo').Value:= 'RECEITA'
      else
        Parameters.ParamByName('Tipo').Value:= 'DESPESA';

      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Plano_Financeiro.EdtDescricao.Text;

      if (FrmCadastro_Plano_Financeiro.EdtCodigo_SubNivel.Text = '') then
        Parameters.ParamByName('Codigo_SubNivel').Value:= StrToInt(FrmCadastro_Plano_Financeiro.EdtCodigo.Text)
      else
        Parameters.ParamByName('Codigo_SubNivel').Value:= StrToInt(FrmCadastro_Plano_Financeiro.EdtCodigo_SubNivel.Text);

      //Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Plano_Financeiro.MEdtData_Cadastro.Text);

      Parameters.ParamByName('Sub_Nivel').Value := FrmCadastro_Plano_Financeiro.EdtSub_Grupo.Text;

      if (FrmCadastro_Plano_Financeiro.EdtCodigo_SubNivel.Text = '') then
        Parameters.ParamByName('Codigo_Pai').Value := StrToInt(FrmCadastro_Plano_Financeiro.EdtCodigo.Text)
      else
        Parameters.ParamByName('Codigo_Pai').Value := FrmCadastro_Plano_Financeiro.codigo_pai;

      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TPlano_Financeiro.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Plano_Financeiro');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Plano_Financeiro.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TPlano_Financeiro.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert Into Cadastro_Plano_Financeiro (Codigo, Codigo_Empresa, Tipo, Descricao, Codigo_SubNivel,');
      add('Data_Cadastro, Sub_Nivel, Codigo_Pai) values');
      add('(:Codigo, :Codigo_Empresa, :Tipo, :Descricao, :Codigo_SubNivel, :Data_Cadastro, :Sub_Nivel, :Codigo_Pai)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Plano_Financeiro.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;

      if (FrmCadastro_Plano_Financeiro.RGTipo.ItemIndex = 0) then
        Parameters.ParamByName('Tipo').Value:= 'RECEITA'
      else
        Parameters.ParamByName('Tipo').Value:= 'DESPESA';

      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Plano_Financeiro.EdtDescricao.Text;

      if (FrmCadastro_Plano_Financeiro.EdtCodigo_SubNivel.Text = '') then
        Parameters.ParamByName('Codigo_SubNivel').Value:= StrToInt(FrmCadastro_Plano_Financeiro.EdtCodigo.Text)
      else
        Parameters.ParamByName('Codigo_SubNivel').Value:= StrToInt(FrmCadastro_Plano_Financeiro.EdtCodigo_SubNivel.Text);

      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Plano_Financeiro.MEdtData_Cadastro.Text);

      Parameters.ParamByName('Sub_Nivel').Value := FrmCadastro_Plano_Financeiro.EdtSub_Grupo.Text;

      if (FrmCadastro_Plano_Financeiro.EdtCodigo_SubNivel.Text = '') then
        Parameters.ParamByName('Codigo_Pai').Value := StrToInt(FrmCadastro_Plano_Financeiro.EdtCodigo.Text)
      else
        Parameters.ParamByName('Codigo_Pai').Value := FrmCadastro_Plano_Financeiro.codigo_pai;

      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{TDepartamento}

procedure TDepartamento.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Cadastro_Departamento set Descricao = :Descricao');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Departamento.EdtDescricao.Text;
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Departamento.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TDepartamento.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Departamento');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Departamento.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TDepartamento.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert Into Cadastro_Departamento (Codigo, Descricao, Data_Cadastro) values');
      add('(:Codigo, :Descricao, :Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Departamento.EdtCodigo.Text);
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Departamento.EdtDescricao.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Departamento.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TItens_Folha_Pagamento }

procedure TItens_Folha_Pagamento.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Cadastro_Itens_Folha_Pagamento set Descricao = :Descricao, Natureza = :Natureza');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Itens_Folha_Pagamento.EdtDescricao.Text;

      case FrmCadastro_Itens_Folha_Pagamento.RGNatureza.ItemIndex of
        0: Parameters.ParamByName('Natureza').Value:= 'ENTRADA';
        1: Parameters.ParamByName('Natureza').Value:= 'SAIDA';
      end;

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Itens_Folha_Pagamento.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TItens_Folha_Pagamento.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Itens_Folha_Pagamento');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Itens_Folha_Pagamento.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TItens_Folha_Pagamento.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert Into Cadastro_Itens_Folha_Pagamento (Codigo, Descricao, Natureza, Data_Cadastro) values');
      add('(:Codigo, :Descricao, :Natureza, :Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Itens_Folha_Pagamento.EdtCodigo.Text);
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Itens_Folha_Pagamento.EdtDescricao.Text;

      case FrmCadastro_Itens_Folha_Pagamento.RGNatureza.ItemIndex of
        0: Parameters.ParamByName('Natureza').Value:= 'ENTRADA';
        1: Parameters.ParamByName('Natureza').Value:= 'SAIDA';
      end;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Itens_Folha_Pagamento.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TFolha_Pagamento }

procedure TFolha_Pagamento.Inserir;
var
  qAux, qaux2: TADOQuery;
begin
  try
  qAux:= TADOQuery.Create(nil);
  with qAux, SQL do
    begin
      close;
      clear;
      Connection:= dm.ADOConnection1;
      add('Insert into Folha_Pagamento (Codigo, Codigo_Funcionario, Codigo_Propriedade, Mes_Ano, Data_Fechamento,');
      add('Entradas, Saidas, Desconto, Salario, Quantidade_Itens, Observacao)');
      add('values (:Codigo, :Codigo_Funcionario, :Codigo_Propriedade, :Mes_Ano, :Data_Fechamento,');
      add(':Entradas, :Saidas, :Desconto, :Salario, :Quantidade_Itens, :Observacao)');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmFolha_Pagamento.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Funcionario').Value:= StrToInt(FrmFolha_Pagamento.EdtCodigo_Funcionario.Text);
      Parameters.ParamByName('Codigo_Propriedade').Value:= Codigo_Empresa;
      Parameters.ParamByName('Mes_Ano').Value:= FrmFolha_Pagamento.MEdtMes_Ano.Text;
      Parameters.ParamByName('Data_Fechamento').Value:= StrToDateTime(FrmFolha_Pagamento.MEdtData_Fechamento.Text);
      Parameters.ParamByName('Entradas').Value:= StrToFloat(FrmFolha_Pagamento.EdtEntradas.Text);
      Parameters.ParamByName('Saidas').Value:= StrToFloat(FrmFolha_Pagamento.EdtSaidas.Text);
      Parameters.ParamByName('Desconto').Value:= StrToFloat(FrmFolha_Pagamento.EdtDesconto.Text);
      Parameters.ParamByName('Salario').Value:= StrToFloat(FrmFolha_Pagamento.EdtSalario.Text);
      Parameters.ParamByName('Quantidade_Itens').Value:= StrToInt(FrmFolha_Pagamento.EdtQuantidade_Itens.Text);
      Parameters.ParamByName('Observacao').Value:= FrmFolha_Pagamento.MmoObservacao.Text;
      ExecSQL;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TFolha_Pagamento.Excluir;
var
  qAux: TADOQuery;
begin
  DM.ADOConnection1.BeginTrans;
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Delete from Folha_Pagamento where Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmFolha_Pagamento.EdtCodigo.Text);
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TFolha_Pagamento.Alterar;
var
  qAux, qaux2: TADOQuery;
begin
  try
  qAux:= TADOQuery.Create(nil);
  with qAux, SQL do
    begin
      close;
      clear;
      Connection:= dm.ADOConnection1;
      add('Update Folha_Pagamento set Codigo_Funcionario = :Codigo_Funcionario, Codigo_Propriedade = :Codigo_Propriedade,');
      add('Mes_Ano = :Mes_Ano, Data_Fechamento = :Data_Fechamento, Entradas = :Entradas,');
      add('Saidas = :Saidas, Desconto = :Desconto, Salario = :Salario, ');
      add('Quantidade_Itens = :Quantidade_Itens, Observacao = :Observacao');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmFolha_Pagamento.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Funcionario').Value:= StrToInt(FrmFolha_Pagamento.EdtCodigo_Funcionario.Text);
      Parameters.ParamByName('Codigo_Propriedade').Value:= Codigo_Empresa;
      Parameters.ParamByName('Mes_Ano').Value:= FrmFolha_Pagamento.MEdtMes_Ano.Text;
      Parameters.ParamByName('Data_Fechamento').Value:= StrToDateTime(FrmFolha_Pagamento.MEdtData_Fechamento.Text);
      Parameters.ParamByName('Entradas').Value:= StrToFloat(FrmFolha_Pagamento.EdtEntradas.Text);
      Parameters.ParamByName('Saidas').Value:= StrToFloat(FrmFolha_Pagamento.EdtSaidas.Text);
      Parameters.ParamByName('Desconto').Value:= StrToFloat(FrmFolha_Pagamento.EdtDesconto.Text);
      Parameters.ParamByName('Salario').Value:= StrToFloat(FrmFolha_Pagamento.EdtSalario.Text);
      Parameters.ParamByName('Quantidade_Itens').Value:= StrToInt(FrmFolha_Pagamento.EdtQuantidade_Itens.Text);
      Parameters.ParamByName('Observacao').Value:= FrmFolha_Pagamento.MmoObservacao.Text;
      ExecSQL;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

{ TIt_Folha_Pagamento }

procedure TIt_Folha_Pagamento.Alterar;
begin
//
end;

procedure TIt_Folha_Pagamento.Excluir;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Delete from Itens_Folha_Pagamento where Codigo = :Codigo and Codigo_Item = :Codigo_Item');
        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmFolha_Pagamento.EdtCodigo.Text);
        Parameters.ParamByName('Codigo_Item').Value:= FrmFolha_Pagamento.qryitens_folhaCodigo_Item.AsInteger;
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TIt_Folha_Pagamento.Excluir_Tudo;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Delete from Itens_Folha_Pagamento where Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value:= StrToInt(FrmFolha_Pagamento.EdtCodigo.Text);
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TIt_Folha_Pagamento.Inserir;
var
  qAux, qaux2: TADOQuery;
begin
  try
  qAux:= TADOQuery.Create(nil);
  with qAux, SQL do
    begin
      close;
      clear;
      Connection:= dm.ADOConnection1;
      add('Insert into Itens_Folha_Pagamento (Codigo, Codigo_Item, Valor)');
      add('values (:Codigo, :Codigo_Item, :Valor)');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmFolha_Pagamento.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Item').Value:= StrToInt(FrmFolha_Pagamento.EdtCodigo_Item.Text);
      Parameters.ParamByName('Valor').Value:= StrToFloat(FrmFolha_Pagamento.EdtValor.Text);
      ExecSQL;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

{ TBanco }

procedure TBanco.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('UPDATE Cadastro_Banco');
      Add('   SET Numero_Banco = :Numero_Banco');
      Add('      ,Nome = :Nome');
      Add('      ,Telefone = :Telefone');
      Add('      ,Contato = :Contato');
      Add('      ,Data_Cadastro = :Data_Cadastro');
      add('where Codigo_Banco = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Banco.EdtCodigo.Text);
      Parameters.ParamByName('Numero_Banco').Value:= FrmCadastro_Banco.EdtNumero.Text;
      Parameters.ParamByName('Nome').Value:= FrmCadastro_Banco.EdtBanco.Text;
      Parameters.ParamByName('Telefone').Value:= FrmCadastro_Banco.MEdtTelefone.Text;
      Parameters.ParamByName('Contato').Value:= FrmCadastro_Banco.EdtContato.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Banco.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TBanco.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Banco where Codigo_Banco = :Codigo_Banco');
      Parameters.ParamByName('Codigo_Banco').Value:= StrToInt(FrmCadastro_Banco.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TBanco.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('INSERT INTO Cadastro_Banco');
      Add('           (Codigo_Banco');
      Add('           ,Numero_Banco');
      Add('           ,Nome');
      Add('           ,Telefone');
      Add('           ,Contato');
      Add('           ,Data_Cadastro)');
      Add('     VALUES');
      Add('           (:Codigo_Banco');
      Add('           ,:Numero_Banco');
      Add('           ,:Nome');
      Add('           ,:Telefone');
      Add('           ,:Contato');
      Add('           ,:Data_Cadastro)');

      Parameters.ParamByName('Codigo_Banco').Value:= StrToInt(FrmCadastro_Banco.EdtCodigo.Text);
      Parameters.ParamByName('Numero_Banco').Value:= FrmCadastro_Banco.EdtNumero.Text;
      Parameters.ParamByName('Nome').Value:= FrmCadastro_Banco.EdtBanco.Text;
      Parameters.ParamByName('Telefone').Value:= FrmCadastro_Banco.MEdtTelefone.Text;
      Parameters.ParamByName('Contato').Value:= FrmCadastro_Banco.EdtContato.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Banco.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TConta }

procedure TConta.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('UPDATE Cadastro_Conta_Corrente');
      Add('   SET Conta_Corrente = :Conta_Corrente');
      Add('      ,Codigo_Agencia = :Codigo_Agencia');
      Add('      ,Nome_Correntista = :Nome_Correntista');
      Add('      ,Saldo_Inicial = :Saldo_Inicial');
      Add('      ,Limite = :Limite');
      Add('      ,Saldo_Atual = :Saldo_Atual');
      Add('      ,Data_Cadastro = :Data_Cadastro');
      add('where Codigo_Conta_Corrente = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Conta_Corrente.EdtCodigo.Text);
      Parameters.ParamByName('Conta_Corrente').Value:= FrmCadastro_Conta_Corrente.EdtConta_Corrente.Text;
      Parameters.ParamByName('Codigo_Agencia').Value:= StrToInt(FrmCadastro_Conta_Corrente.EdtCodigo_Agencia.Text);
      Parameters.ParamByName('Nome_Correntista').Value:= FrmCadastro_Conta_Corrente.EdtNome_Correntista.Text;
      Parameters.ParamByName('Saldo_Inicial').Value:= StrToFloat(FrmCadastro_Conta_Corrente.EdtSaldo_Inicial.Text);
      Parameters.ParamByName('Limite').Value:= StrToFloat(FrmCadastro_Conta_Corrente.EdtLimite.Text);
      Parameters.ParamByName('Saldo_Atual').Value:= StrToFloat(FrmCadastro_Conta_Corrente.EdtSaldo_Atual.Text);
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Conta_Corrente.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TConta.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Conta_Corrente where Codigo_Conta_Corrente = :Codigo_Conta_Corrente');
      Parameters.ParamByName('Codigo_Conta_Corrente').Value:= StrToInt(FrmCadastro_Conta_Corrente.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TConta.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('INSERT INTO Cadastro_Conta_Corrente');
      Add('           (Codigo_Conta_Corrente');
      Add('           ,Conta_Corrente');
      Add('           ,Codigo_Agencia');
      Add('           ,Nome_Correntista');
      Add('           ,Saldo_Inicial');
      Add('           ,Limite');
      Add('           ,Saldo_Atual');
      Add('           ,Data_Cadastro)');
      Add('     VALUES');
      Add('           (:Codigo_Conta_Corrente');
      Add('           ,:Conta_Corrente');
      Add('           ,:Codigo_Agencia');
      Add('           ,:Nome_Correntista');
      Add('           ,:Saldo_Inicial');
      Add('           ,:Limite');
      Add('           ,:Saldo_Atual');
      Add('           ,:Data_Cadastro)');

      Parameters.ParamByName('Codigo_Conta_Corrente').Value:= StrToInt(FrmCadastro_Conta_Corrente.EdtCodigo.Text);
      Parameters.ParamByName('Conta_Corrente').Value:= FrmCadastro_Conta_Corrente.EdtConta_Corrente.Text;
      Parameters.ParamByName('Codigo_Agencia').Value:= StrToInt(FrmCadastro_Conta_Corrente.EdtCodigo_Agencia.Text);
      Parameters.ParamByName('Nome_Correntista').Value:= FrmCadastro_Conta_Corrente.EdtNome_Correntista.Text;
      Parameters.ParamByName('Saldo_Inicial').Value:= StrToFloat(FrmCadastro_Conta_Corrente.EdtSaldo_Inicial.Text);
      Parameters.ParamByName('Limite').Value:= StrToFloat(FrmCadastro_Conta_Corrente.EdtLimite.Text);
      Parameters.ParamByName('Saldo_Atual').Value:= StrToFloat(FrmCadastro_Conta_Corrente.EdtSaldo_Atual.Text);
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Conta_Corrente.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TAgencia }

procedure TAgencia.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('UPDATE Cadastro_Agencia');
      Add('   SET Numero = :Numero');
      Add('      ,Codigo_Banco = :Codigo_Banco');
      Add('      ,Codigo_Endereco = :Codigo_Endereco');
      Add('      ,N = :N');
      Add('      ,Codigo_Cidade = :Codigo_Cidade');
      Add('      ,Telefone = :Telefone');
      Add('      ,Contato = :Contato');
      Add('      ,Data_Cadastro = :Data_Cadastro');

      Add('where Codigo_Agencia = :Codigo_Agencia');

      Parameters.ParamByName('Codigo_Agencia').Value:= StrToInt(FrmCadastro_Agencia.EdtCodigo.Text);
      Parameters.ParamByName('Numero').Value:= FrmCadastro_Agencia.EdtNumero.Text;
      Parameters.ParamByName('Codigo_Banco').Value:= StrToInt(FrmCadastro_Agencia.EdtCodigo_Banco.Text);
      Parameters.ParamByName('Codigo_Endereco').Value:= StrToInt(FrmCadastro_Agencia.EdtCodigo_Endereco.Text);
      Parameters.ParamByName('N').Value:= FrmCadastro_Agencia.EdtN.Text;
      Parameters.ParamByName('Codigo_Cidade').Value:= StrToInt(FrmCadastro_Agencia.EdtCodigo_Cidade.Text);
      Parameters.ParamByName('Telefone').Value:= FrmCadastro_Agencia.MEdtTelefone.Text;
      Parameters.ParamByName('Contato').Value:= FrmCadastro_Agencia.EdtContato.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Agencia.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TAgencia.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Agencia where Codigo_Agencia = :Codigo_Agencia');
      Parameters.ParamByName('Codigo_Agencia').Value:= StrToInt(FrmCadastro_Agencia.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TAgencia.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('INSERT INTO Cadastro_Agencia');
      Add('           (Codigo_Agencia');
      Add('           ,Numero');
      Add('           ,Codigo_Banco');
      Add('           ,Codigo_Endereco');
      Add('           ,N');
      Add('           ,Codigo_Cidade');
      Add('           ,Telefone');
      Add('           ,Contato');
      Add('           ,Data_Cadastro)');
      Add('     VALUES');
      Add('           (:Codigo_Agencia');
      Add('           ,:Numero');
      Add('           ,:Codigo_Banco');
      Add('           ,:Codigo_Endereco');
      Add('           ,:N');
      Add('           ,:Codigo_Cidade');
      Add('           ,:Telefone');
      Add('           ,:Contato');
      Add('           ,:Data_Cadastro)');

      Parameters.ParamByName('Codigo_Agencia').Value:= StrToInt(FrmCadastro_Agencia.EdtCodigo.Text);
      Parameters.ParamByName('Numero').Value:= FrmCadastro_Agencia.EdtNumero.Text;
      Parameters.ParamByName('Codigo_Banco').Value:= StrToInt(FrmCadastro_Agencia.EdtCodigo_Banco.Text);
      Parameters.ParamByName('Codigo_Endereco').Value:= StrToInt(FrmCadastro_Agencia.EdtCodigo_Endereco.Text);
      Parameters.ParamByName('N').Value:= FrmCadastro_Agencia.EdtN.Text;
      Parameters.ParamByName('Codigo_Cidade').Value:= StrToInt(FrmCadastro_Agencia.EdtCodigo_Cidade.Text);
      Parameters.ParamByName('Telefone').Value:= FrmCadastro_Agencia.MEdtTelefone.Text;
      Parameters.ParamByName('Contato').Value:= FrmCadastro_Agencia.EdtContato.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Agencia.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TCheque }

procedure TCheque.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('UPDATE Cadastro_Cheque');
      Add('   SET Codigo_Empresa = :Codigo_Empresa');
      Add('      ,Emitente = :Emitente');
      Add('      ,Recebido_De = :Recebido_De');
      Add('      ,Enviado_A = :Enviado_A');
      Add('      ,Codigo_Agencia = :Codigo_Agencia');
      Add('      ,Codigo_Conta = :Codigo_Conta');
      Add('      ,Tipo_Cheque = :Tipo_Cheque');
      Add('      ,Situacao_Cheque = :Situacao_Cheque');
      Add('      ,Numero_Cheque = :Numero_Cheque');
      Add('      ,Valor = :Valor');
      Add('      ,Juro = :Juro');
      Add('      ,Valor_Final = :Valor_Final');
      Add('      ,Data_Entrada = :Data_Entrada');
      Add('      ,Data_Vencimento = :Data_Vencimento');
      Add('      ,Data_Saida = :Data_Saida');
      Add('      ,Observacoes = :Observacoes');
      Add('      ,Status = :Status');

      Add('where Codigo_Cheque = :Codigo_Cheque');

      Parameters.ParamByName('Codigo_Cheque').Value:= StrToInt(FrmCadastro_Cheque.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('Emitente').Value:= FrmCadastro_Cheque.EdtEmitente.Text;
      Parameters.ParamByName('Recebido_De').Value:= FrmCadastro_Cheque.EdtRecebido_De.Text;
      Parameters.ParamByName('Enviado_A').Value:= FrmCadastro_Cheque.EdtEnviado_A.Text;
      Parameters.ParamByName('Codigo_Agencia').Value:= StrToInt(FrmCadastro_Cheque.EdtCodigo_Agencia.Text);

      if (FrmCadastro_Cheque.EdtCodigo_Conta.Text = '') then
        Parameters.ParamByName('Codigo_Conta').Value:= 0
      else
        Parameters.ParamByName('Codigo_Conta').Value:= StrToInt(FrmCadastro_Cheque.EdtCodigo_Conta.Text);

      if (FrmCadastro_Cheque.RGTipo.ItemIndex = 0) then
        Parameters.ParamByName('Tipo_Cheque').Value:= 'A VISTA'
      else
        Parameters.ParamByName('Tipo_Cheque').Value:= 'A PRAZO';

      if (FrmCadastro_Cheque.RadioGroup1.ItemIndex = 0) then
        Parameters.ParamByName('Situacao_Cheque').Value:= 'EMITIDO'
      else
        Parameters.ParamByName('Situacao_Cheque').Value:= 'RECEBIDO';

      Parameters.ParamByName('Numero_Cheque').Value:= FrmCadastro_Cheque.EdtN_Cheque.Text;
      Parameters.ParamByName('Valor').Value:= StrToFloat(FrmCadastro_Cheque.EdtValor.Text);
      Parameters.ParamByName('Juro').Value:= StrToFloat(FrmCadastro_Cheque.EdtJuro.Text);
      Parameters.ParamByName('Valor_Final').Value:= StrToFloat(FrmCadastro_Cheque.EdtValor_Final.Text);

      if (FrmCadastro_Cheque.MEdtData_Cadastro.Text = '  /  /    ') then
        Parameters.ParamByName('Data_Entrada').Value:= NULL
      else
        Parameters.ParamByName('Data_Entrada').Value:= FrmCadastro_Cheque.MEdtData_Cadastro.Text;

      if (FrmCadastro_Cheque.MEdtData_Vencimento.Text = '  /  /    ') then
        Parameters.ParamByName('Data_Vencimento').Value:= NULL
      else
        Parameters.ParamByName('Data_Vencimento').Value:= FrmCadastro_Cheque.MEdtData_Vencimento.Text;

      if (FrmCadastro_Cheque.MEdtData_Saida.Text = '  /  /    ') then
        Parameters.ParamByName('Data_Saida').Value:= NULL
      else
        Parameters.ParamByName('Data_Saida').Value:= FrmCadastro_Cheque.MEdtData_Saida.Text;

      Parameters.ParamByName('Observacoes').Value:= FrmCadastro_Cheque.MmoObservacoes.Text;

      if (FrmCadastro_Cheque.MEdtData_Saida.Text <> '  /  /    ') and (FrmCadastro_Cheque.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'BAIXADO'
      else
      begin
        if (FrmCadastro_Cheque.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'LANÇADO'
        else if (FrmCadastro_Cheque.RGStatus.ItemIndex = 1) then
          Parameters.ParamByName('Status').Value:= 'PRORROGADO'
        else if (FrmCadastro_Cheque.RGStatus.ItemIndex = 2) then
          Parameters.ParamByName('Status').Value:= 'DEVOLVIDO';
      end;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TCheque.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Cheque where Codigo_Cheque = :Codigo_Cheque');
      Parameters.ParamByName('Codigo_Cheque').Value:= StrToInt(FrmCadastro_Cheque.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TCheque.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('INSERT INTO Cadastro_Cheque');
      Add('           (Codigo_Cheque');
      Add('           ,Codigo_Empresa');
      Add('           ,Emitente');
      Add('           ,Recebido_De');
      Add('           ,Enviado_A');
      Add('           ,Codigo_Agencia');
      Add('           ,Codigo_Conta');
      Add('           ,Tipo_Cheque');
      Add('           ,Situacao_Cheque');
      Add('           ,Numero_Cheque');
      Add('           ,Valor');
      Add('           ,Juro');
      Add('           ,Valor_Final');
      Add('           ,Data_Entrada');
      Add('           ,Data_Vencimento');
      Add('           ,Data_Saida');
      Add('           ,Observacoes');
      Add('           ,Status)');
      Add('     VALUES');
      Add('           (:Codigo_Cheque');
      Add('           ,:Codigo_Empresa');
      Add('           ,:Emitente');
      Add('           ,:Recebido_De');
      Add('           ,:Enviado_A');
      Add('           ,:Codigo_Agencia');
      Add('           ,:Codigo_Conta');
      Add('           ,:Tipo_Cheque');
      Add('           ,:Situacao_Cheque');
      Add('           ,:Numero_Cheque');
      Add('           ,:Valor');
      Add('           ,:Juro');
      Add('           ,:Valor_Final');
      Add('           ,:Data_Entrada');
      Add('           ,:Data_Vencimento');
      Add('           ,:Data_Saida');
      Add('           ,:Observacoes');
      Add('           ,:Status)');

      Parameters.ParamByName('Codigo_Cheque').Value:= StrToInt(FrmCadastro_Cheque.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Empresa').Value:= Codigo_Empresa;
      Parameters.ParamByName('Emitente').Value:= FrmCadastro_Cheque.EdtEmitente.Text;
      Parameters.ParamByName('Recebido_De').Value:= FrmCadastro_Cheque.EdtRecebido_De.Text;
      Parameters.ParamByName('Enviado_A').Value:= FrmCadastro_Cheque.EdtEnviado_A.Text;
      Parameters.ParamByName('Codigo_Agencia').Value:= StrToInt(FrmCadastro_Cheque.EdtCodigo_Agencia.Text);

      if (FrmCadastro_Cheque.EdtCodigo_Conta.Text = '') then
        Parameters.ParamByName('Codigo_Conta').Value:= 0
      else
        Parameters.ParamByName('Codigo_Conta').Value:= StrToInt(FrmCadastro_Cheque.EdtCodigo_Conta.Text);

      if (FrmCadastro_Cheque.RGTipo.ItemIndex = 0) then
        Parameters.ParamByName('Tipo_Cheque').Value:= 'A VISTA'
      else
        Parameters.ParamByName('Tipo_Cheque').Value:= 'A PRAZO';

      if (FrmCadastro_Cheque.RadioGroup1.ItemIndex = 0) then
        Parameters.ParamByName('Situacao_Cheque').Value:= 'EMITIDO'
      else
        Parameters.ParamByName('Situacao_Cheque').Value:= 'RECEBIDO';

      Parameters.ParamByName('Numero_Cheque').Value:= FrmCadastro_Cheque.EdtN_Cheque.Text;
      Parameters.ParamByName('Valor').Value:= StrToFloat(FrmCadastro_Cheque.EdtValor.Text);
      Parameters.ParamByName('Juro').Value:= StrToFloat(FrmCadastro_Cheque.EdtJuro.Text);
      Parameters.ParamByName('Valor_Final').Value:= StrToFloat(FrmCadastro_Cheque.EdtValor_Final.Text);

      if (FrmCadastro_Cheque.MEdtData_Cadastro.Text = '  /  /    ') then
        Parameters.ParamByName('Data_Entrada').Value:= NULL
      else
        Parameters.ParamByName('Data_Entrada').Value:= FrmCadastro_Cheque.MEdtData_Cadastro.Text;

      if (FrmCadastro_Cheque.MEdtData_Vencimento.Text = '  /  /    ') then
        Parameters.ParamByName('Data_Vencimento').Value:= NULL
      else
        Parameters.ParamByName('Data_Vencimento').Value:= FrmCadastro_Cheque.MEdtData_Vencimento.Text;

      if (FrmCadastro_Cheque.MEdtData_Saida.Text = '  /  /    ') then
        Parameters.ParamByName('Data_Saida').Value:= NULL
      else
        Parameters.ParamByName('Data_Saida').Value:= FrmCadastro_Cheque.MEdtData_Saida.Text;

      Parameters.ParamByName('Observacoes').Value:= FrmCadastro_Cheque.MmoObservacoes.Text;

      if (FrmCadastro_Cheque.MEdtData_Saida.Text <> '  /  /    ') and (FrmCadastro_Cheque.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'BAIXADO'
      else
      begin
        if (FrmCadastro_Cheque.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'LANÇADO'
        else if (FrmCadastro_Cheque.RGStatus.ItemIndex = 1) then
          Parameters.ParamByName('Status').Value:= 'PRORROGADO'
        else if (FrmCadastro_Cheque.RGStatus.ItemIndex = 2) then
          Parameters.ParamByName('Status').Value:= 'DEVOLVIDO';
      end;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TBem_Patrimonial }

procedure TBem_Patrimonial.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('UPDATE Cadastro_Bem_Patrimonial');
      Add('   SET Codigo_Propriedade = :Codigo_Propriedade');
      Add('      ,Identificacao = :Identificacao');
      Add('      ,Codigo_Centro_Custo = :Codigo_Centro_Custo');
      Add('      ,Codigo_Funcionario = :Responsavel');
      Add('      ,Descricao = :Descricao');
      Add('      ,Codigo_Tipo_Bem_Patrimonial = :Codigo_Tipo_Bem_Patrimonial');
      Add('      ,Codigo_Unidade = :Codigo_Unidade');
      Add('      ,Preco_RS = :Preco_RS');
      Add('      ,Preco_S = :Preco_S');
      Add('      ,Quantidade = :Quantidade');
      Add('      ,Tipo_Bem = :Tipo_Bem');
      Add('      ,Data_Cadastro = :Data_Cadastro');
      Add('      ,Data_Compra = :Data_Compra');
      Add('      ,Observacao = :Observacao');
      Add('      ,Descricao_Detalhada = :Descricao_Detalhada');

      Add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Bem_Patrimonio.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Propriedade').Value:= Codigo_Empresa;
      Parameters.ParamByName('Identificacao').Value:= FrmCadastro_Bem_Patrimonio.EdtIdentificacao.Text;
      Parameters.ParamByName('Codigo_Centro_Custo').Value:= 0;
      Parameters.ParamByName('Responsavel').Value:= FrmCadastro_Bem_Patrimonio.EdtResponsavel.Text;
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Bem_Patrimonio.EdtDescricao.Text;

      if (FrmCadastro_Bem_Patrimonio.EdtCodigo_Tipo_Bem.Text <> '') then
        Parameters.ParamByName('Codigo_Tipo_Bem_Patrimonial').Value:= StrToInt(FrmCadastro_Bem_Patrimonio.EdtCodigo_Tipo_Bem.Text)
      else
        Parameters.ParamByName('Codigo_Tipo_Bem_Patrimonial').Value:= NULL;

      if (FrmCadastro_Bem_Patrimonio.EdtCodigo_Unidade.Text <> '') then
        Parameters.ParamByName('Codigo_Unidade').Value:= StrToInt(FrmCadastro_Bem_Patrimonio.EdtCodigo_Unidade.Text)
      else
        Parameters.ParamByName('Codigo_Unidade').Value:= NULL;

      Parameters.ParamByName('Preco_RS').Value:= StrToFloat(FrmCadastro_Bem_Patrimonio.EdtPreco_RS.Text);
      Parameters.ParamByName('Preco_S').Value:= StrToFloat(FrmCadastro_Bem_Patrimonio.EdtPreco_S.Text);

      Parameters.ParamByName('Quantidade').Value:= StrToFloat(FrmCadastro_Bem_Patrimonio.EdtQuantidade.Text);

      if (FrmCadastro_Bem_Patrimonio.RGTipo_Bem.ItemIndex = 0) then
        Parameters.ParamByName('Tipo_Bem').Value:= 'I'
      else if (FrmCadastro_Bem_Patrimonio.RGTipo_Bem.ItemIndex = 1) then
        Parameters.ParamByName('Tipo_Bem').Value:= 'M'
      else if (FrmCadastro_Bem_Patrimonio.RGTipo_Bem.ItemIndex = 2) then
        Parameters.ParamByName('Tipo_Bem').Value:= 'O';

      if (FrmCadastro_Bem_Patrimonio.MEdtData_Cadastro.Text = '  /  /    ') then
        Parameters.ParamByName('Data_Cadastro').Value:= NULL
      else
        Parameters.ParamByName('Data_Cadastro').Value:= FrmCadastro_Bem_Patrimonio.MEdtData_Cadastro.Text;

      if (FrmCadastro_Bem_Patrimonio.MEdtData_Compra.Text = '  /  /    ') then
        Parameters.ParamByName('Data_Compra').Value:= NULL
      else
        Parameters.ParamByName('Data_Compra').Value:= FrmCadastro_Bem_Patrimonio.MEdtData_Compra.Text;

      Parameters.ParamByName('Observacao').Value:= FrmCadastro_Bem_Patrimonio.MMObservacoes.Text;
      Parameters.ParamByName('Descricao_Detalhada').Value:= FrmCadastro_Bem_Patrimonio.MMODescricao_Detalhada.Text;

      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TBem_Patrimonial.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Bem_Patrimonial where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Bem_Patrimonio.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TBem_Patrimonial.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('INSERT INTO Cadastro_Bem_Patrimonial');
      Add('           (Codigo');
      Add('           ,Codigo_Propriedade');
      Add('           ,Identificacao');
      Add('           ,Codigo_Centro_Custo');
      Add('           ,Codigo_Funcionario');
      Add('           ,Descricao');
      Add('           ,Codigo_Tipo_Bem_Patrimonial');
      Add('           ,Codigo_Unidade');
      Add('           ,Preco_RS');
      Add('           ,Preco_S');
      Add('           ,Quantidade');
      Add('           ,Tipo_Bem');
      Add('           ,Data_Cadastro');
      Add('           ,Data_Compra');
      Add('           ,Observacao');
      Add('           ,Descricao_Detalhada)');
      Add('     VALUES');
      Add('           (:Codigo');
      Add('           ,:Codigo_Propriedade');
      Add('           ,:Identificacao');
      Add('           ,:Codigo_Centro_Custo');
      Add('           ,:Responsavel');
      Add('           ,:Descricao');
      Add('           ,:Codigo_Tipo_Bem_Patrimonial');
      Add('           ,:Codigo_Unidade');
      Add('           ,:Preco_RS');
      Add('           ,:Preco_S');
      Add('           ,:Quantidade');
      Add('           ,:Tipo_Bem');
      Add('           ,:Data_Cadastro');
      Add('           ,:Data_Compra');
      Add('           ,:Observacao');
      Add('           ,:Descricao_Detalhada)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Bem_Patrimonio.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Propriedade').Value:= Codigo_Empresa;
      Parameters.ParamByName('Identificacao').Value:= FrmCadastro_Bem_Patrimonio.EdtIdentificacao.Text;
      Parameters.ParamByName('Codigo_Centro_Custo').Value:= 0;
      Parameters.ParamByName('Responsavel').Value:= FrmCadastro_Bem_Patrimonio.EdtResponsavel.Text;
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Bem_Patrimonio.EdtDescricao.Text;

      if (FrmCadastro_Bem_Patrimonio.EdtCodigo_Tipo_Bem.Text <> '') then
        Parameters.ParamByName('Codigo_Tipo_Bem_Patrimonial').Value:= StrToInt(FrmCadastro_Bem_Patrimonio.EdtCodigo_Tipo_Bem.Text)
      else
        Parameters.ParamByName('Codigo_Tipo_Bem_Patrimonial').Value:= NULL;

      if (FrmCadastro_Bem_Patrimonio.EdtCodigo_Unidade.Text <> '') then
        Parameters.ParamByName('Codigo_Unidade').Value:= StrToInt(FrmCadastro_Bem_Patrimonio.EdtCodigo_Unidade.Text)
      else
        Parameters.ParamByName('Codigo_Unidade').Value:= NULL;

      Parameters.ParamByName('Preco_RS').Value:= StrToFloat(FrmCadastro_Bem_Patrimonio.EdtPreco_RS.Text);
      Parameters.ParamByName('Preco_S').Value:= StrToFloat(FrmCadastro_Bem_Patrimonio.EdtPreco_S.Text);

      Parameters.ParamByName('Quantidade').Value:= StrToFloat(FrmCadastro_Bem_Patrimonio.EdtQuantidade.Text);

      if (FrmCadastro_Bem_Patrimonio.RGTipo_Bem.ItemIndex = 0) then
        Parameters.ParamByName('Tipo_Bem').Value:= 'I'
      else if (FrmCadastro_Bem_Patrimonio.RGTipo_Bem.ItemIndex = 1) then
        Parameters.ParamByName('Tipo_Bem').Value:= 'M'
      else if (FrmCadastro_Bem_Patrimonio.RGTipo_Bem.ItemIndex = 2) then
        Parameters.ParamByName('Tipo_Bem').Value:= 'O';

      if (FrmCadastro_Bem_Patrimonio.MEdtData_Cadastro.Text = '  /  /    ') then
        Parameters.ParamByName('Data_Cadastro').Value:= NULL
      else
        Parameters.ParamByName('Data_Cadastro').Value:= FrmCadastro_Bem_Patrimonio.MEdtData_Cadastro.Text;

      if (FrmCadastro_Bem_Patrimonio.MEdtData_Compra.Text = '  /  /    ') then
        Parameters.ParamByName('Data_Compra').Value:= NULL
      else
        Parameters.ParamByName('Data_Compra').Value:= FrmCadastro_Bem_Patrimonio.MEdtData_Compra.Text;

      Parameters.ParamByName('Observacao').Value:= FrmCadastro_Bem_Patrimonio.MMObservacoes.Text;
      Parameters.ParamByName('Descricao_Detalhada').Value:= FrmCadastro_Bem_Patrimonio.MMODescricao_Detalhada.Text;

      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TTipo_Bem_Patrimonial }

procedure TTipo_Bem_Patrimonial.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Cadastro_Tipo_Bem_Patrimonial set Tipo_Bem = :Tipo_Bem where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Tipo_Bem_Patrimonio.EdtCodigo.Text);
      Parameters.ParamByName('Tipo_Bem').Value:= FrmCadastro_Tipo_Bem_Patrimonio.EdtDescricao.Text;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TTipo_Bem_Patrimonial.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Tipo_Bem_Patrimonial where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Tipo_Bem_Patrimonio.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TTipo_Bem_Patrimonial.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert into Cadastro_Tipo_Bem_Patrimonial (Codigo, Data_Cadastro, Tipo_Bem)');
      Add('Values');
      Add('(:Codigo, :Data_Cadastro, :Tipo_Bem)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Tipo_Bem_Patrimonio.EdtCodigo.Text);
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Tipo_Bem_Patrimonio.MEdtData_Cadastro.Text);
      Parameters.ParamByName('Tipo_Bem').Value:= FrmCadastro_Tipo_Bem_Patrimonio.EdtDescricao.Text;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TLancamento_Banco }

procedure TLancamento_Banco.Alterar(var Registro: TLancamento_Banco; Saldo_Anterior: double; Saldo_Atual: double;
Codigo_Conta_Transferencia: integer; Saldo_Anterior_Transferencia: Double; Saldo_Atual_Transferencia: double);
var
  qAux, qaux2: TADOQuery;
begin
  try
    //DM.ADOConnection1.BeginTrans;
    try
      qAux:= TADOQuery.Create(nil);
      qAux2:= TADOQuery.Create(nil);
      with qAux, SQL do
        begin
          close;
          clear;
          Connection:= dm.ADOConnection1;
          add('Update Lancamento_Banco set Codigo_Empresa = :Codigo_Empresa, N_Documento = :N_Documento, Data_Lancamento = :Data_Lancamento, ');
          add('Codigo_Conta = :Codigo_Conta, Codigo_Cheque = :Codigo_Cheque, Codigo_Operacao = :Codigo_Operacao, Codigo_Plano = :Codigo_Plano, ');
          add('Descricao = :Descricao, Valor = :Valor, Status = :Status, Saldo_Anterior = :Saldo_Anterior, Saldo_Atual = :Saldo_Atual,');
          Add('Codigo_Conta_Transferencia = :Codigo_Conta_Transferencia, Saldo_Anterior_Transferencia = :Saldo_Anterior_Transferencia, Saldo_Atual_Transferencia = :Saldo_Atual_Transferencia');
          add('where Codigo = :Codigo');
          Parameters.ParamByName('Codigo').Value:= Registro.Cod;
          Parameters.ParamByName('Codigo_Empresa').Value:= Registro.Cod_Empresa;
          Parameters.ParamByName('N_Documento').Value:= Registro.N_Doc;
          Parameters.ParamByName('Data_Lancamento').Value:= Registro.Data_Lanc;
          Parameters.ParamByName('Codigo_Conta').Value:= Registro.Cod_Conta;
          Parameters.ParamByName('Codigo_Cheque').Value:= Registro.Cod_Cheque;
          Parameters.ParamByName('Codigo_Operacao').Value:= Registro.Cod_Op;
          Parameters.ParamByName('Codigo_Plano').Value:= Registro.Cod_Plan;
          Parameters.ParamByName('Descricao').Value:= Registro.Desc;
          Parameters.ParamByName('Valor').Value:= Registro.Val;
          Parameters.ParamByName('Status').Value:= Registro.Stat;
          Parameters.ParamByName('Saldo_Anterior').Value:= Saldo_Anterior;
          Parameters.ParamByName('Saldo_Atual').Value:= Saldo_Atual;
          Parameters.ParamByName('Codigo_Conta_Transferencia').Value:= Codigo_Conta_Transferencia;
          Parameters.ParamByName('Saldo_Anterior_Transferencia').Value:= Saldo_Anterior_Transferencia;
          Parameters.ParamByName('Saldo_Atual_Transferencia').Value:= Saldo_Atual_Transferencia;
          ExecSQL;

          {if (FrmLancamento_Banco.RGStatus.ItemIndex = 1) then
            begin
              with qaux2, sql do
              begin
                close;
                clear;
                Connection:= dm.ADOConnection1;
                add('select CC.* from Conta_Corrente CC where Codigo = :Codigo');
                Parameters.ParamByName('Codigo').Value:= StrToInt(FrmLancamento_Banco.EdtCodigo_Conta.Text);
                open;
              end;

              with FrmLancamento_Banco.SPAtualiza_Saldo_Bancario do
                begin
                  Parameters.ParamByName('@Codigo').Value:= FrmLancamento_Banco.EdtCodigo_Conta.Text;
                  if (FrmLancamento_Banco.EdtTipo_Operacao.Text = 'DÉBITO') then
                    Parameters.ParamByName('@Saldo_Atual').Value:= qaux2.FieldByName('Saldo_Atual').AsFloat - StrToFloat(FrmLancamento_Banco.EdtValor.Text)
                  else if (FrmLancamento_Banco.EdtTipo_Operacao.Text = 'CRÉDITO') then
                      Parameters.ParamByName('@Saldo_Atual').Value:= qaux2.FieldByName('Saldo_Atual').AsFloat + StrToFloat(FrmLancamento_Banco.EdtValor.Text);
                  ExecProc;
                end;
            end;}
          //DM.ADOConnection1.CommitTrans;
          //lrControle:= Altera;
          //UGeral.Mensagem_Padrao(lrControle);
        end;
    finally
      qAux.Close;
      FreeAndNil(qAux);
    end;

  except
    on E: Exception do
      begin
        TLog.Error('Erro ao alterar Lançamento bancário: '+e.Message);
        //DM.ADOConnection1.RollbackTrans;
        //Impossivel_Excluir_Registro;
      end;
  end;
end;

procedure TLancamento_Banco.Excluir(var Registro: TLancamento_Banco);
var
  qAux, qaux2: TADOQuery;
begin
  try
    //DM.ADOConnection1.BeginTrans;
    try
      qAux:= TADOQuery.Create(nil);
      qAux2:= TADOQuery.Create(nil);
      with qAux, SQL do
        begin
          close;
          clear;
          Connection:= dm.ADOConnection1;
          add('Delete from Lancamento_Banco where Codigo = :Codigo');
          Parameters.ParamByName('Codigo').Value:= Registro.Cod;
          ExecSQL;

          {if (FrmLancamento_Banco.RGStatus.ItemIndex = 1) then
            begin
              with qaux2, sql do
              begin
                close;
                clear;
                Connection:= dm.ADOConnection1;
                add('select CC.* from Cadastro_Conta_Corrente CC where Codigo_Conta_Corrente = :Codigo');
                Parameters.ParamByName('Codigo').Value:= StrToInt(FrmLancamento_Banco.EdtCodigo_Conta.Text);
                open;
              end;

              with FrmLancamento_Banco.SPAtualiza_Saldo_Bancario do
                begin
                  Parameters.ParamByName('@Codigo').Value:= FrmLancamento_Banco.EdtCodigo_Conta.Text;
                  if (FrmLancamento_Banco.EdtTipo_Operacao.Text = 'DÉBITO') then
                    Parameters.ParamByName('@Saldo_Atual').Value:= qaux2.FieldByName('Saldo_Atual').AsFloat + StrToFloat(FrmLancamento_Banco.EdtValor.Text)
                  else if (FrmLancamento_Banco.EdtTipo_Operacao.Text = 'CRÉDITO') then
                      Parameters.ParamByName('@Saldo_Atual').Value:= qaux2.FieldByName('Saldo_Atual').AsFloat - StrToFloat(FrmLancamento_Banco.EdtValor.Text);
                  ExecProc;
                end;
            end;}

          //DM.ADOConnection1.CommitTrans;
          //lrControle:= Exclui;
          //UGeral.Mensagem_Padrao(lrControle);
        end;
    finally
      qAux.Close;
      FreeAndNil(qAux);
    end;

  except
    on E: Exception do
      begin
        //DM.ADOConnection1.RollbackTrans;
        //Impossivel_Excluir_Registro;
      end;
  end;
end;

function TLancamento_Banco.GetCodigo: integer;
begin
  GetCodigo:= StrToInt(FrmLancamento_Banco.EdtCodigo.Text);
end;

function TLancamento_Banco.GetCodigo_Cheque: integer;
begin
  if (FrmLancamento_Banco <> nil) and (FrmLancamento_Banco.ativo = true) then
  begin
    if (FrmLancamento_Banco.EdtCodigo_Cheque.Text <> '') then
      GetCodigo_Cheque:= StrToInt(FrmLancamento_Banco.EdtCodigo_Cheque.Text)
    else
      GetCodigo_Cheque:= 0;
  end
  else if (FrmBaixar_Titulo <> nil) and (FrmBaixar_Titulo.ativo = true) then
  begin
    if (FrmBaixar_Titulo.EdtCodigo_Cheque.Text <> '') then
      GetCodigo_Cheque:= StrToInt(FrmBaixar_Titulo.EdtCodigo_Cheque.Text)
    else
      GetCodigo_Cheque:= 0;
  end;
end;

function TLancamento_Banco.GetCodigo_Conta: integer;
begin
  if (FrmLancamento_Banco <> nil) and (FrmLancamento_Banco.ativo = true) then
    GetCodigo_Conta:= StrToInt(FrmLancamento_Banco.EdtCodigo_Conta.Text)
  else if (FrmBaixar_Titulo <> nil) and (FrmBaixar_Titulo.ativo = true) then
    GetCodigo_Conta:= StrToInt(FrmBaixar_Titulo.EdtCodigo_Conta.Text);
end;

function TLancamento_Banco.GetCodigo_Empresa: integer;
begin
  GetCodigo_Empresa:= UUtilitarios.Codigo_Empresa;
end;

function TLancamento_Banco.GetCodigo_Operacao: integer;
begin
  if (FrmLancamento_Banco <> nil) and (FrmLancamento_Banco.ativo = true) then
    GetCodigo_Operacao:= StrToInt(FrmLancamento_Banco.EdtCodigo_Operacao.Text)
  else if (FrmBaixar_Titulo <> nil) and (FrmBaixar_Titulo.ativo = true) then
    GetCodigo_Operacao:= StrToInt(FrmBaixar_Titulo.EdtCodigo_Operacao.Text);
end;

function TLancamento_Banco.GetCodigo_Plano: integer;
begin
  if (FrmLancamento_Banco <> nil) and (FrmLancamento_Banco.ativo = true) then
  begin
    if (FrmLancamento_Banco.EdtCodigo_Plano.Text = '') then
      GetCodigo_Plano:= 0
    else
      GetCodigo_Plano:= StrToInt(FrmLancamento_Banco.EdtCodigo_Plano.Text)
  end
  else if (FrmBaixar_Titulo <> nil) and (FrmBaixar_Titulo.ativo = true) then
  begin
    GetCodigo_Plano:= 0;
  end;
end;

function TLancamento_Banco.GetData_Lancamento: TDate;
begin
  if (FrmLancamento_Banco <> nil) and (FrmLancamento_Banco.ativo = true) then
    GetData_Lancamento:= StrToDateTime(FrmLancamento_Banco.MEdtData_Lancamento.Text)
  else if (FrmBaixar_Titulo <> nil) and (FrmBaixar_Titulo.ativo = true) then
    GetData_Lancamento:= StrToDateTime(FrmBaixar_Titulo.MEdtData_Pagamento.Text);
end;

function TLancamento_Banco.GetDescricao: string;
begin
  if (FrmLancamento_Banco <> nil) and (FrmLancamento_Banco.ativo = true) then
    GetDescricao:= FrmLancamento_Banco.EdtDescricao.Text
  else if (FrmBaixar_Titulo <> nil) and (FrmBaixar_Titulo.ativo = true) then
    GetDescricao:= FrmBaixar_Titulo.MmoObservacoes.Text;
end;

function TLancamento_Banco.GetN_Documento: integer;
begin
  if (FrmLancamento_Banco <> nil) and (FrmLancamento_Banco.ativo = true) then
    GetN_Documento:= StrToInt(FrmLancamento_Banco.EdtDocumento.Text)
  else if (FrmBaixar_Titulo <> nil) and (FrmBaixar_Titulo.ativo = true) then
    GetN_Documento:= StrToInt(FrmBaixar_Titulo.EdtN_Documento.Text);
end;

function TLancamento_Banco.GetStatus: string;
begin
  if (FrmLancamento_Banco <> nil) and (FrmLancamento_Banco.ativo = true) then
  begin
    if (FrmLancamento_Banco.RGStatus.ItemIndex = 0) then
      GetStatus:= 'BLOQUEADO'
    else
      GetStatus:= 'LIBERADO';
  end
  else if (FrmBaixar_Titulo <> nil) and (FrmBaixar_Titulo.ativo = true) then
  begin
    if (FrmBaixar_Titulo.RGStatus.ItemIndex = 0) then
      GetStatus:= 'BLOQUEADO'
    else
      GetStatus:= 'LIBERADO';
  end;
end;

function TLancamento_Banco.GetValor: double;
begin
  if (FrmLancamento_Banco <> nil) and (FrmLancamento_Banco.ativo = true) then
    GetValor:= StrToFloat(FrmLancamento_Banco.EdtValor.Text)
  else if (FrmBaixar_Titulo <> nil) and (FrmBaixar_Titulo.ativo = true) then
    GetValor:= StrToFloat(FrmBaixar_Titulo.EdtValor_Pagar.Text);
end;

procedure TLancamento_Banco.Inserir(var Registro: TLancamento_Banco; Saldo_Anterior: double; Saldo_Atual: double;
Codigo_Conta_Transferencia: integer; Saldo_Anterior_Transferencia: Double; Saldo_Atual_Transferencia: double);
var
  qAux, qaux2: TADOQuery;
begin
  try
    //DM.ADOConnection1.BeginTrans;
    try
      qAux:= TADOQuery.Create(nil);
      qAux2:= TADOQuery.Create(nil);
      with qAux, SQL do
        begin
          close;
          clear;
          Connection:= dm.ADOConnection1;
          add('Insert Into Lancamento_Banco (Codigo_Empresa, N_Documento, Data_Lancamento, Codigo_Conta, Codigo_Cheque,');
          add('Codigo_Operacao, Codigo_Plano, Descricao, Valor, Status, Saldo_Anterior, Saldo_Atual,');
          Add('Codigo_Conta_Transferencia, Saldo_Anterior_Transferencia, Saldo_Atual_Transferencia) values (:Codigo_Empresa, :N_Documento, :Data_Lancamento,');
          add(':Codigo_Conta, :Codigo_Cheque, :Codigo_Operacao, :Codigo_Plano, :Descricao, :Valor, :Status, :Saldo_Anterior, :Saldo_Atual,');
          Add(':Codigo_Conta_Transferencia, :Saldo_Anterior_Transferencia, :Saldo_Atual_Transferencia)');
          //Parameters.ParamByName('Codigo').Value:= Registro.Cod;
          Parameters.ParamByName('Codigo_Empresa').Value:= Registro.Cod_Empresa;
          Parameters.ParamByName('N_Documento').Value:= Registro.N_Doc;
          Parameters.ParamByName('Data_Lancamento').Value:= Registro.Data_Lanc;
          Parameters.ParamByName('Codigo_Conta').Value:= Registro.Cod_Conta;
          Parameters.ParamByName('Codigo_Cheque').Value:= Registro.Cod_Cheque;
          Parameters.ParamByName('Codigo_Operacao').Value:= Registro.Cod_Op;
          Parameters.ParamByName('Codigo_Plano').Value:= Registro.Cod_Plan;
          Parameters.ParamByName('Descricao').Value:= Registro.Desc;
          Parameters.ParamByName('Valor').Value:= Registro.Val;
          Parameters.ParamByName('Status').Value:= Registro.Stat;
          Parameters.ParamByName('Saldo_Anterior').Value:= Saldo_Anterior;
          Parameters.ParamByName('Saldo_Atual').Value:= Saldo_Atual;
          Parameters.ParamByName('Codigo_Conta_Transferencia').Value:= Codigo_Conta_Transferencia;
          Parameters.ParamByName('Saldo_Anterior_Transferencia').Value:= Saldo_Anterior_Transferencia;
          Parameters.ParamByName('Saldo_Atual_Transferencia').Value:= Saldo_Atual_Transferencia;
          ExecSQL;

          {if (FrmLancamento_Banco <> nil) and (FrmLancamento_Banco.ativo = true) then
          begin
            if (FrmLancamento_Banco.RGStatus.ItemIndex = 1) then
              begin
                with qaux2, sql do
                begin
                  close;
                  clear;
                  Connection:= dm.ADOConnection1;
                  add('select CC.* from Cadastro_Conta_Corrente CC where Codigo_Conta_Corrente = :Codigo');
                  Parameters.ParamByName('Codigo').Value:= StrToInt(FrmLancamento_Banco.EdtCodigo_Conta.Text);
                  open;
                end;

                with FrmLancamento_Banco.SPAtualiza_Saldo_Bancario do
                  begin
                    Parameters.ParamByName('@Codigo').Value:= FrmLancamento_Banco.EdtCodigo_Conta.Text;
                    if (FrmLancamento_Banco.EdtTipo_Operacao.Text = 'DÉBITO') then
                      Parameters.ParamByName('@Saldo_Atual').Value:= qaux2.FieldByName('Saldo_Atual').AsFloat - StrToFloat(FrmLancamento_Banco.EdtValor.Text)
                    else if (FrmLancamento_Banco.EdtTipo_Operacao.Text = 'CRÉDITO') then
                        Parameters.ParamByName('@Saldo_Atual').Value:= qaux2.FieldByName('Saldo_Atual').AsFloat + StrToFloat(FrmLancamento_Banco.EdtValor.Text);
                    ExecProc;
                  end;
              end;
          end
          else if (FrmBaixar_Titulo <> nil) and (FrmBaixar_Titulo.ativo = true) then
          begin
            if (FrmBaixar_Titulo.RGStatus.ItemIndex = 1) then
              begin
                with qaux2, sql do
                begin
                  close;
                  clear;
                  Connection:= dm.ADOConnection1;
                  add('select CC.* from Cadastro_Conta_Corrente CC where Codigo_Conta_Corrente = :Codigo');
                  Parameters.ParamByName('Codigo').Value:= StrToInt(FrmBaixar_Titulo.EdtCodigo_Conta.Text);
                  open;
                end;

                with FrmBaixar_Titulo.SPAtualiza_Saldo_Bancario do
                  begin
                    Parameters.ParamByName('@Codigo').Value:= FrmBaixar_Titulo.EdtCodigo_Conta.Text;
                    if (FrmBaixar_Titulo.EdtTipo_Operacao.Text = 'DÉBITO') then
                      Parameters.ParamByName('@Saldo_Atual').Value:= qaux2.FieldByName('Saldo_Atual').AsFloat - StrToFloat(FrmBaixar_Titulo.EdtValor_Pagar.Text)
                    else if (FrmBaixar_Titulo.EdtTipo_Operacao.Text = 'CRÉDITO') then
                        Parameters.ParamByName('@Saldo_Atual').Value:= qaux2.FieldByName('Saldo_Atual').AsFloat + StrToFloat(FrmBaixar_Titulo.EdtValor_Pagar.Text);
                    ExecProc;
                  end;
              end;
          end; }

          //DM.ADOConnection1.CommitTrans;
          //lrControle:= Insere;
          //UGeral.Mensagem_Padrao(lrControle);
        end;
    finally
      qAux.Close;
      FreeAndNil(qAux);
    end;

  except
    on E: Exception do
      begin
        //DM.ADOConnection1.RollbackTrans;
        TLog.Error('Erro ao gravar Lançamento bancário: '+e.Message);
        //Impossivel_Excluir_Registro;
      end;
  end;
end;

{ TOperacao_Bancaria }

procedure TOperacao_Bancaria.Alterar(var Registro: TOperacao_Bancaria);
var
  qAux, qaux2: TADOQuery;
begin
  try
    DM.ADOConnection1.BeginTrans;
    try
      qAux:= TADOQuery.Create(nil);
      qAux2:= TADOQuery.Create(nil);
      with qAux, SQL do
        begin
          close;
          clear;
          Connection:= dm.ADOConnection1;
          add('Update Operacao_Bancaria set Operacao = :Operacao, Tipo = :Tipo, Data_Cadastro = :Data_Cadastro');
          add('where Codigo = :Codigo');
          Parameters.ParamByName('Codigo').Value:= Registro.Cod;
          Parameters.ParamByName('Operacao').Value:= Registro.Op;
          Parameters.ParamByName('Tipo').Value:= Registro.Tip;
          Parameters.ParamByName('Data_Cadastro').Value:= Registro.Data;
          ExecSQL;
          DM.ADOConnection1.CommitTrans;
          //lrControle:= Altera;
          //UGeral.Mensagem_Padrao(lrControle);
        end;
    finally
      qAux.Close;
      FreeAndNil(qAux);
    end;

  except
    on E: Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        //Impossivel_Excluir_Registro;
      end;
  end;
end;

procedure TOperacao_Bancaria.Excluir(var Registro: TOperacao_Bancaria);
var
  qAux, qaux2: TADOQuery;
begin
  try
    DM.ADOConnection1.BeginTrans;
    try
      qAux:= TADOQuery.Create(nil);
      qAux2:= TADOQuery.Create(nil);
      with qAux, SQL do
        begin
          close;
          clear;
          Connection:= dm.ADOConnection1;
          add('Delete from Operacao_Bancaria where Codigo = :Codigo');
          Parameters.ParamByName('Codigo').Value:= Registro.Cod;
          ExecSQL;
          DM.ADOConnection1.CommitTrans;
          //lrControle:= Exclui;
          //UGeral.Mensagem_Padrao(lrControle);
        end;
    finally
      qAux.Close;
      FreeAndNil(qAux);
    end;

  except
    on E: Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        //Impossivel_Excluir_Registro;
      end;
  end;
end;

function TOperacao_Bancaria.GetCodigo: integer;
begin
  GetCodigo:= StrToInt(FrmCadastro_Operacao_Bancaria.EdtCodigo.Text);
end;

function TOperacao_Bancaria.GetData_Cadastro: TDate;
begin
  GetData_Cadastro:= StrToDateTime(FrmCadastro_Operacao_Bancaria.MEdtData_Cadastro.Text);
end;

function TOperacao_Bancaria.GetOperacao: string;
begin
  GetOperacao:= FrmCadastro_Operacao_Bancaria.EdtOperacao.Text;
end;

function TOperacao_Bancaria.GetTipo: string;
begin
  if (FrmCadastro_Operacao_Bancaria.RGTipo.ItemIndex = 0) then
    GetTipo:= 'CRÉDITO'
  else
    GetTipo:= 'DÉBITO';
end;

procedure TOperacao_Bancaria.Inserir(var Registro: TOperacao_Bancaria);
var
  qAux, qaux2: TADOQuery;
begin
  try
    DM.ADOConnection1.BeginTrans;
    try
      qAux:= TADOQuery.Create(nil);
      qAux2:= TADOQuery.Create(nil);
      with qAux, SQL do
        begin
          close;
          clear;
          Connection:= dm.ADOConnection1;
          add('Insert Into Operacao_Bancaria (Operacao, Tipo, Data_Cadastro) values (');
          add(':Operacao, :Tipo, :Data_Cadastro)');
          //Parameters.ParamByName('Codigo').Value:= Registro.Cod;
          Parameters.ParamByName('Operacao').Value:= Registro.Op;
          Parameters.ParamByName('Tipo').Value:= Registro.Tip;
          Parameters.ParamByName('Data_Cadastro').Value:= Registro.Data;
          ExecSQL;
          DM.ADOConnection1.CommitTrans;
          //lrControle:= Insere;
          //UGeral.Mensagem_Padrao(lrControle);
        end;
    finally
      qAux.Close;
      FreeAndNil(qAux);
    end;

  except
    on E: Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        //Impossivel_Excluir_Registro;
      end;
  end;
end;
{ TConfiguracao }

procedure TConfiguracao.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('UPDATE Configuracao_Sistema');
      Add('   SET Lancamento_Financeiro = :Lancamento_Financeiro');
      Add('      ,Contas_Fixas = :Contas_Fixas');
      Add('      ,Cheque_Vencer = :Cheque_Vencer');
      Add('      ,Produtos_Vencidos = :Produtos_Vencidos');
      Add('      ,Aniversario_Funcionario = :Aniversario_Funcionario');
      Add('      ,Aniversario_Cliente = :Aniversario_Cliente');
      Add('      ,Dias_Aviso = :Dias_Aviso');
      Add('      ,Limite_Cheque = :Limite_Cheque');
      Add('      ,Dias_Acrecimo_Cheque = :Dias_Acrecimo_Cheque');
      Add('      ,Backup_Fechar_Sistema = :Backup_Fechar_Sistema');
      Add('      ,Valor_Conta_Menor = :Valor_Conta_Menor');
      Add('      ,Avisa_Conta_Menor = :Avisa_Conta_Menor');
      Add('      ,Valor_Conta_Maior = :Valor_Conta_Maior');
      Add('      ,Avisa_Conta_Maior = :Avisa_Conta_Maior');
      Add('      where Codigo_Propriedade = :Codigo_Propriedade');

      Parameters.ParamByName('Codigo_Propriedade').Value:= Codigo_Empresa;

      if (FrmConfiguracao_Sistema.CBLancamento_Financeiro.Checked = true) then
        Parameters.ParamByName('Lancamento_Financeiro').Value:= 'Sim'
      else
        Parameters.ParamByName('Lancamento_Financeiro').Value:= 'Não';

      if (FrmConfiguracao_Sistema.CBContas_Fixas.Checked = true) then
        Parameters.ParamByName('Contas_Fixas').Value:= 'Sim'
      else
        Parameters.ParamByName('Contas_Fixas').Value:= 'Não';

      if (FrmConfiguracao_Sistema.CBCheque_Vencer.Checked = true) then
        Parameters.ParamByName('Cheque_Vencer').Value:= 'Sim'
      else
        Parameters.ParamByName('Cheque_Vencer').Value:= 'Não';

      if (FrmConfiguracao_Sistema.CBProduto_Vencido.Checked = true) then
        Parameters.ParamByName('Produtos_Vencidos').Value:= 'Sim'
      else
        Parameters.ParamByName('Produtos_Vencidos').Value:= 'Não';

      if (FrmConfiguracao_Sistema.CBAniversario_Funcionario.Checked = true) then
        Parameters.ParamByName('Aniversario_Funcionario').Value:= 'Sim'
      else
        Parameters.ParamByName('Aniversario_Funcionario').Value:= 'Não';

      if (FrmConfiguracao_Sistema.CBAniversario_Cliente.Checked = true) then
        Parameters.ParamByName('Aniversario_Cliente').Value:= 'Sim'
      else
        Parameters.ParamByName('Aniversario_Cliente').Value:= 'Não';

      Parameters.ParamByName('Dias_Aviso').Value:= StrToInt(FrmConfiguracao_Sistema.EdtDias_Antecedencia.Text);

      if (FrmConfiguracao_Sistema.CBBackup.Checked = true) then
        Parameters.ParamByName('Backup_Fechar_Sistema').Value:= 'Sim'
      else
        Parameters.ParamByName('Backup_Fechar_Sistema').Value:= 'Não';

      if (FrmConfiguracao_Sistema.EdtLimite_Cheque.Text = '') then
        Parameters.ParamByName('Limite_Cheque').Value:= Null
      else
        Parameters.ParamByName('Limite_Cheque').Value:= StrToFloat(FrmConfiguracao_Sistema.EdtLimite_Cheque.Text);

      if (FrmConfiguracao_Sistema.EdtDias_Acrecimo.Text = '') then
        Parameters.ParamByName('Dias_Acrecimo_Cheque').Value:= Null
      else
        Parameters.ParamByName('Dias_Acrecimo_Cheque').Value:= StrToFloat(FrmConfiguracao_Sistema.EdtDias_Acrecimo.Text);

      if (FrmConfiguracao_Sistema.EdtValor_Conta_Menor.Text = '') then
        Parameters.ParamByName('Valor_Conta_Menor').Value:= Null
      else
        Parameters.ParamByName('Valor_Conta_Menor').Value:= StrToFloat(FrmConfiguracao_Sistema.EdtValor_Conta_Menor.Text);

      if (FrmConfiguracao_Sistema.EdtAvisa_Conta_Menor.Text = '') then
        Parameters.ParamByName('Avisa_Conta_Menor').Value:= Null
      else
        Parameters.ParamByName('Avisa_Conta_Menor').Value:= StrToInt(FrmConfiguracao_Sistema.EdtAvisa_Conta_Menor.Text);

      if (FrmConfiguracao_Sistema.EdtValor_Conta_Maior.Text = '') then
        Parameters.ParamByName('Valor_Conta_Maior').Value:= Null
      else
        Parameters.ParamByName('Valor_Conta_Maior').Value:= StrToFloat(FrmConfiguracao_Sistema.EdtValor_Conta_Maior.Text);

      if (FrmConfiguracao_Sistema.EdtAvisa_Conta_Maior.Text = '') then
        Parameters.ParamByName('Avisa_Conta_Maior').Value:= Null
      else
        Parameters.ParamByName('Avisa_Conta_Maior').Value:= StrToInt(FrmConfiguracao_Sistema.EdtAvisa_Conta_Maior.Text);

      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TConfiguracao.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Configuracao_Sistema where Codigo_Propriedade = :Codigo_Propriedade');
      Parameters.ParamByName('Codigo_Propriedade').Value:= Codigo_Empresa;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TConfiguracao.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('INSERT INTO Configuracao_Sistema');
      Add('           (Codigo_Propriedade');
      Add('           ,Lancamento_Financeiro');
      Add('           ,Contas_Fixas');
      Add('           ,Cheque_Vencer');
      Add('           ,Produtos_Vencidos');
      Add('           ,Aniversario_Funcionario');
      Add('           ,Aniversario_Cliente');
      Add('           ,Dias_Aviso');
      Add('           ,Backup_Fechar_Sistema');
      Add('           ,Valor_Conta_Menor');
      Add('           ,Avisa_Conta_Menor');
      Add('           ,Valor_Conta_Maior');
      Add('           ,Avisa_Conta_Maior)');
      Add('     VALUES');
      Add('           (:Codigo_Propriedade');
      Add('           ,:Lancamento_Financeiro');
      Add('           ,:Contas_Fixas');
      Add('           ,:Cheque_Vencer');
      Add('           ,:Produtos_Vencidos');
      Add('           ,:Aniversario_Funcionario');
      Add('           ,:Aniversario_Cliente');
      Add('           ,:Dias_Aviso');
      Add('           ,:Backup_Fechar_Sistema');
      Add('           ,:Valor_Conta_Menor');
      Add('           ,:Avisa_Conta_Menor');
      Add('           ,:Valor_Conta_Maior');
      Add('           ,:Avisa_Conta_Maior)');

      Parameters.ParamByName('Codigo_Propriedade').Value:= Codigo_Empresa;

      if (FrmConfiguracao_Sistema.CBLancamento_Financeiro.Checked = true) then
        Parameters.ParamByName('Lancamento_Financeiro').Value:= 'Sim'
      else
        Parameters.ParamByName('Lancamento_Financeiro').Value:= 'Não';

      if (FrmConfiguracao_Sistema.CBContas_Fixas.Checked = true) then
        Parameters.ParamByName('Contas_Fixas').Value:= 'Sim'
      else
        Parameters.ParamByName('Contas_Fixas').Value:= 'Não';

      if (FrmConfiguracao_Sistema.CBCheque_Vencer.Checked = true) then
        Parameters.ParamByName('Cheque_Vencer').Value:= 'Sim'
      else
        Parameters.ParamByName('Cheque_Vencer').Value:= 'Não';

      if (FrmConfiguracao_Sistema.CBProduto_Vencido.Checked = true) then
        Parameters.ParamByName('Produtos_Vencidos').Value:= 'Sim'
      else
        Parameters.ParamByName('Produtos_Vencidos').Value:= 'Não';

      if (FrmConfiguracao_Sistema.CBAniversario_Funcionario.Checked = true) then
        Parameters.ParamByName('Aniversario_Funcionario').Value:= 'Sim'
      else
        Parameters.ParamByName('Aniversario_Funcionario').Value:= 'Não';

      if (FrmConfiguracao_Sistema.CBAniversario_Cliente.Checked = true) then
        Parameters.ParamByName('Aniversario_Cliente').Value:= 'Sim'
      else
        Parameters.ParamByName('Aniversario_Cliente').Value:= 'Não';

      Parameters.ParamByName('Dias_Aviso').Value:= StrToInt(FrmConfiguracao_Sistema.EdtDias_Antecedencia.Text);

      if (FrmConfiguracao_Sistema.CBBackup.Checked = true) then
        Parameters.ParamByName('Backup_Fechar_Sistema').Value:= 'Sim'
      else
        Parameters.ParamByName('Backup_Fechar_Sistema').Value:= 'Não';

      if (FrmConfiguracao_Sistema.EdtValor_Conta_Menor.Text = '') then
        Parameters.ParamByName('Valor_Conta_Menor').Value:= Null
      else
        Parameters.ParamByName('Valor_Conta_Menor').Value:= StrToFloat(FrmConfiguracao_Sistema.EdtValor_Conta_Menor.Text);

      if (FrmConfiguracao_Sistema.EdtAvisa_Conta_Menor.Text = '') then
        Parameters.ParamByName('Avisa_Conta_Menor').Value:= Null
      else
        Parameters.ParamByName('Avisa_Conta_Menor').Value:= StrToInt(FrmConfiguracao_Sistema.EdtAvisa_Conta_Menor.Text);

      if (FrmConfiguracao_Sistema.EdtValor_Conta_Maior.Text = '') then
        Parameters.ParamByName('Valor_Conta_Maior').Value:= Null
      else
        Parameters.ParamByName('Valor_Conta_Maior').Value:= StrToFloat(FrmConfiguracao_Sistema.EdtValor_Conta_Maior.Text);

      if (FrmConfiguracao_Sistema.EdtAvisa_Conta_Maior.Text = '') then
        Parameters.ParamByName('Avisa_Conta_Maior').Value:= Null
      else
        Parameters.ParamByName('Avisa_Conta_Maior').Value:= StrToInt(FrmConfiguracao_Sistema.EdtAvisa_Conta_Maior.Text);

      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;
{ TMarca }

procedure TMarca.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Cadastro_Marca set Descricao = :Descricao where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Marca.EdtCodigo.Text);
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Marca.EdtDescricao.Text;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TMarca.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Marca where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Marca.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TMarca.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert into Cadastro_Marca (Codigo, Descricao, Data_Cadastro)');
      Add('Values');
      Add('(:Codigo, :Descricao, :Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Marca.EdtCodigo.Text);
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Marca.EdtDescricao.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Marca.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TGrupo_Maquina }

procedure TGrupo_Maquina.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('update Cadastro_Grupo_Maquina set Descricao = :Descricao where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Grupo_Maquina.EdtCodigo.Text);
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Grupo_Maquina.EdtDescricao.Text;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TGrupo_Maquina.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Grupo_Maquina where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Grupo_Maquina.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TGrupo_Maquina.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Insert into Cadastro_Grupo_Maquina (Codigo, Descricao, Data_Cadastro)');
      Add('Values');
      Add('(:Codigo, :Descricao, :Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Grupo_Maquina.EdtCodigo.Text);
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Grupo_Maquina.EdtDescricao.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Grupo_Maquina.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TMaquina }

procedure TMaquina.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('UPDATE Cadastro_Maquina');
      Add('   SET Codigo_Propriedade = :Codigo_Propriedade');
      Add('      ,Status = :Status');
      Add('      ,Descricao = :Descricao');
      Add('      ,Codigo_Marca = :Codigo_Marca');
      Add('      ,Codigo_Grupo = :Codigo_Grupo');
      Add('      ,Placa = :Placa');
      Add('      ,Numero_Chassi = :Numero_Chassi');
      Add('      ,Numero_Motor = :Numero_Motor');
      Add('      ,Data_Entrada = :Data_Entrada');
      Add('      ,Data_Saida = :Data_Saida');
      Add('      ,Valor = :Valor');
      Add('      ,Data_Cadastro = :Data_Cadastro');
      Add('      ,Observacoes = :Observacoes');
      Add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Maquina.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Propriedade').Value:= Codigo_Empresa;

      if (FrmCadastro_Maquina.CBStatus.Checked) then
        Parameters.ParamByName('Status').Value:= 'ATIVO'
      else
        Parameters.ParamByName('Status').Value:= 'INATIVO';

      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Maquina.EdtDescricao.Text;

      if (FrmCadastro_Maquina.EdtCodigo_Marca.Text <> '') then
        Parameters.ParamByName('Codigo_Marca').Value:= StrToInt(FrmCadastro_Maquina.EdtCodigo_Marca.Text)
      else
        Parameters.ParamByName('Codigo_Marca').Value:= Null;

      if (FrmCadastro_Maquina.EdtCodigo_Grupo_Maquina.Text <> '') then
        Parameters.ParamByName('Codigo_Grupo').Value:= StrToInt(FrmCadastro_Maquina.EdtCodigo_Grupo_Maquina.Text)
      else
        Parameters.ParamByName('Codigo_Grupo').Value:= Null;

      Parameters.ParamByName('Placa').Value:= FrmCadastro_Maquina.EdtPlaca.Text;
      Parameters.ParamByName('Numero_Chassi').Value:= FrmCadastro_Maquina.EdtN_Chassi.Text;
      Parameters.ParamByName('Numero_Motor').Value:= FrmCadastro_Maquina.EdtN_Motor.Text;

      if (FrmCadastro_Maquina.MEdtData_Entrada.Text <> '  /  /    ') then
        Parameters.ParamByName('Data_Entrada').Value:= StrToDateTime(FrmCadastro_Maquina.MEdtData_Entrada.Text)
      else
        Parameters.ParamByName('Data_Entrada').Value:= Null;

      if (FrmCadastro_Maquina.MEdtData_Saida.Text <> '  /  /    ') then
        Parameters.ParamByName('Data_Saida').Value:= StrToDateTime(FrmCadastro_Maquina.MEdtData_Saida.Text)
      else
        Parameters.ParamByName('Data_Saida').Value:= Null;

      Parameters.ParamByName('Valor').Value:= StrToFloat(FrmCadastro_Maquina.EdtValor.Text);

      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Maquina.MEdtData_Cadastro.Text);
      Parameters.ParamByName('Observacoes').Value:= FrmCadastro_Maquina.MMObservacoes.Text;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TMaquina.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Maquina where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Maquina.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TMaquina.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('INSERT INTO Cadastro_Maquina');
      Add('           (Codigo');
      Add('           ,Codigo_Propriedade');
      Add('           ,Status');
      Add('           ,Descricao');
      Add('           ,Codigo_Marca');
      Add('           ,Codigo_Grupo');
      Add('           ,Placa');
      Add('           ,Numero_Chassi');
      Add('           ,Numero_Motor');
      Add('           ,Data_Entrada');
      Add('           ,Data_Saida');
      Add('           ,Valor');
      Add('           ,Data_Cadastro');
      Add('           ,Observacoes)');
      Add('     VALUES');
      Add('           (:Codigo');
      Add('           ,:Codigo_Propriedade');
      Add('           ,:Status');
      Add('           ,:Descricao');
      Add('           ,:Codigo_Marca');
      Add('           ,:Codigo_Grupo');
      Add('           ,:Placa');
      Add('           ,:Numero_Chassi');
      Add('           ,:Numero_Motor');
      Add('           ,:Data_Entrada');
      Add('           ,:Data_Saida');
      Add('           ,:Valor');
      Add('           ,:Data_Cadastro');
      Add('           ,:Observacoes)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Maquina.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Propriedade').Value:= Codigo_Empresa;

      if (FrmCadastro_Maquina.CBStatus.Checked) then
        Parameters.ParamByName('Status').Value:= 'ATIVO'
      else
        Parameters.ParamByName('Status').Value:= 'INATIVO';

      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Maquina.EdtDescricao.Text;

      if (FrmCadastro_Maquina.EdtCodigo_Marca.Text <> '') then
        Parameters.ParamByName('Codigo_Marca').Value:= StrToInt(FrmCadastro_Maquina.EdtCodigo_Marca.Text)
      else
        Parameters.ParamByName('Codigo_Marca').Value:= Null;

      if (FrmCadastro_Maquina.EdtCodigo_Grupo_Maquina.Text <> '') then
        Parameters.ParamByName('Codigo_Grupo').Value:= StrToInt(FrmCadastro_Maquina.EdtCodigo_Grupo_Maquina.Text)
      else
        Parameters.ParamByName('Codigo_Grupo').Value:= Null;

      Parameters.ParamByName('Placa').Value:= FrmCadastro_Maquina.EdtPlaca.Text;
      Parameters.ParamByName('Numero_Chassi').Value:= FrmCadastro_Maquina.EdtN_Chassi.Text;
      Parameters.ParamByName('Numero_Motor').Value:= FrmCadastro_Maquina.EdtN_Motor.Text;

      if (FrmCadastro_Maquina.MEdtData_Entrada.Text <> '  /  /    ') then
        Parameters.ParamByName('Data_Entrada').Value:= StrToDateTime(FrmCadastro_Maquina.MEdtData_Entrada.Text)
      else
        Parameters.ParamByName('Data_Entrada').Value:= Null;

      if (FrmCadastro_Maquina.MEdtData_Saida.Text <> '  /  /    ') then
        Parameters.ParamByName('Data_Saida').Value:= StrToDateTime(FrmCadastro_Maquina.MEdtData_Saida.Text)
      else
        Parameters.ParamByName('Data_Saida').Value:= Null;

      Parameters.ParamByName('Valor').Value:= StrToFloat(FrmCadastro_Maquina.EdtValor.Text);

      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Maquina.MEdtData_Cadastro.Text);
      Parameters.ParamByName('Observacoes').Value:= FrmCadastro_Maquina.MMObservacoes.Text;
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TCultura }

procedure TCultura.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('UPDATE Cadastro_Cultura');
      Add('   SET Descricao = :Descricao');
      Add('      ,Data_Cadastro = :Data_Cadastro');
      Add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Cultura.EdtCodigo.Text);
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Cultura.EdtDescricao.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Cultura.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TCultura.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Cultura where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Cultura.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TCultura.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('INSERT INTO Cadastro_Cultura');
      Add('           (Codigo');
      Add('           ,Descricao');
      Add('           ,Data_Cadastro)');
      Add('     VALUES');
      Add('           (:Codigo');
      Add('           ,:Descricao');
      Add('           ,:Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Cultura.EdtCodigo.Text);
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Cultura.EdtDescricao.Text;
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Cultura.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

{ TSafra }

procedure TSafra.Alterar;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('UPDATE Cadastro_Safra');
      Add('   SET Descricao = :Descricao');
      Add('      ,Codigo_Tipo_Cultura = :Codigo_Tipo_Cultura');
      Add('      ,Data_Cadastro = :Data_Cadastro');
      Add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Safra.EdtCodigo.Text);
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Safra.EdtDescricao.Text;
      Parameters.ParamByName('Codigo_Tipo_Cultura').Value:= StrToInt(FrmCadastro_Safra.EdtCodigo_Cultura.Text);
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Safra.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TSafra.Excluir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('Delete from Cadastro_Safra where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Safra.EdtCodigo.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

procedure TSafra.Inserir;
var
  QExe: TADOQuery;
begin
  QExe:= TADOQuery.Create(Nil);
  Try
    with QExe, SQL do
    begin
      Close;
      Connection:= dm.AdoConnection1;
      Clear;
      Add('INSERT INTO Cadastro_Safra');
      Add('           (Codigo');
      Add('           ,Descricao');
      Add('           ,Codigo_Tipo_Cultura');
      Add('           ,Data_Cadastro)');
      Add('     VALUES');
      Add('           (:Codigo');
      Add('           ,:Descricao');
      Add('           ,:Codigo_Tipo_Cultura');
      Add('           ,:Data_Cadastro)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmCadastro_Safra.EdtCodigo.Text);
      Parameters.ParamByName('Descricao').Value:= FrmCadastro_Safra.EdtDescricao.Text;
      Parameters.ParamByName('Codigo_Tipo_Cultura').Value:= StrToInt(FrmCadastro_Safra.EdtCodigo_Cultura.Text);
      Parameters.ParamByName('Data_Cadastro').Value:= StrToDateTime(FrmCadastro_Safra.MEdtData_Cadastro.Text);
      ExecSQL;
    end;
  Finally
    FreeAndNil(QExe);
  End;
end;

end.
