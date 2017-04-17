unit UControle_Acesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, Registry, ImgList, ADODB, DB,
  UAtualizacao, UUtilitarios;

type
  TFrmControle_Acesso = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    EdtLogin: TEdit;
    EdtSenha: TEdit;
    btOK: TBitBtn;
    BtCancela: TBitBtn;
    StatusBar: TStatusBar;
    BalloonHint1: TBalloonHint;
    ImageList1: TImageList;
    qrychama_perfil: TADOQuery;
    qrychama_perfilCodigo: TIntegerField;
    qrychama_perfilPerfil: TStringField;
    qrychama_perfilCadastro_Empresa: TIntegerField;
    qrychama_perfilCadastro_Cliente: TIntegerField;
    qrychama_perfilCadastro_Produto: TIntegerField;
    qrychama_perfilCadastro_Usuario: TIntegerField;
    qrychama_perfilCadastro_Mesa: TIntegerField;
    qrychama_perfilCadastro_Grupo_Produto: TIntegerField;
    qrychama_perfilCadastro_Ingrediente: TIntegerField;
    qrychama_perfilCadastro_Condicao_Pagamento: TIntegerField;
    qrychama_perfilCadastro_Plano_Financeiro: TIntegerField;
    qrychama_perfilCadastro_Tipo_Documento: TIntegerField;
    qrychama_perfilCadastro_Departamento: TIntegerField;
    qrychama_perfilCadastro_Caixa: TIntegerField;
    qrychama_perfilCadastro_Cidade: TIntegerField;
    qrychama_perfilCadastro_Setor: TIntegerField;
    qrychama_perfilCadastro_Logradouro: TIntegerField;
    qrychama_perfilAbertura_Caixa: TIntegerField;
    qrychama_perfilAcerto_Caixa: TIntegerField;
    qrychama_perfilLancamento_Financeiro: TIntegerField;
    qrychama_perfilBaixar_Conta: TIntegerField;
    qrychama_perfilPedido: TIntegerField;
    qrychama_perfilMudanca_Status: TIntegerField;
    qrychama_perfilAgenda_Telefonica: TIntegerField;
    qrychama_perfilConsulta_Lancamento_Financeiro: TIntegerField;
    qrychama_perfilConsulta_Acerto_Caixa: TIntegerField;
    qrychama_perfilConsulta_Fechamento_Caixa: TIntegerField;
    qrychama_perfilConsulta_Historico_Acesso: TIntegerField;
    qrychama_perfilConsulta_Pedido: TIntegerField;
    qrychama_perfilConsulta_Rancking_Venda_Produto: TIntegerField;
    qrychama_perfilConsulta_Rancking_Venda_Cliente: TIntegerField;
    qrychama_perfilConsulta_Tempo_Producao: TIntegerField;
    qrychama_perfilData_Cadastro: TDateTimeField;
    qrychama_perfilCadastro_Perfil_Usuario: TIntegerField;
    qrychama_perfilRecibo: TIntegerField;
    qrychama_perfilConsulta_Agenda_Telefonica: TIntegerField;
    procedure btOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtCancelaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    function RemoveChar(Const Texto:String):String;
    Function SerialNum(FDrive:String) :String;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    tentativas: integer;
    qAux, qAux2: TADOQuery;
    Util: UUtilitarios.TUtil;
    Atualizacoes: TAtualizacoes;
    procedure Chama_Usuario;
    procedure Chama_Itens;
    procedure Chama_Perfil(perfil: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControle_Acesso: TFrmControle_Acesso;
implementation

uses UDM, UPrincipal, UChama_Propriedade_Inicial;

{$R *.dfm}

procedure TFrmControle_Acesso.BtCancelaClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmControle_Acesso.Chama_Itens;
begin
    //cadastros
    if (qrychama_perfilCadastro_Empresa.AsInteger = 1) then
      FrmPrincipal.AcCadastro_Empresa.Enabled:= true
    else
      FrmPrincipal.AcCadastro_Empresa.Enabled:= false;

    if (qrychama_perfilCadastro_Usuario.AsInteger = 1) then
      FrmPrincipal.AcCadastro_Usuario.Enabled:= true
    else
      FrmPrincipal.AcCadastro_Usuario.Enabled:= false;

    if (qrychama_perfilCadastro_Perfil_Usuario.AsInteger = 1) then
      FrmPrincipal.acCadastro_Perfil_Usuario.Enabled:= true
    else
      FrmPrincipal.acCadastro_Perfil_Usuario.Enabled:= false;

    //movimentação
    //ferramentas
    if (qrychama_perfilAgenda_Telefonica.AsInteger = 1) then
      FrmPrincipal.acAgenda_Telefonica.Enabled:= true
    else
      FrmPrincipal.acAgenda_Telefonica.Enabled:= false;

    if (qrychama_perfilRecibo.AsInteger = 1) then
      FrmPrincipal.acRecibo.Enabled:= true
    else
      FrmPrincipal.acRecibo.Enabled:= false;


    //relatórios

    if (qrychama_perfilConsulta_Lancamento_Financeiro.AsInteger = 1) then
      FrmPrincipal.acConsulta_Lancamento_Financeiro.Enabled:= true
    else
      FrmPrincipal.acConsulta_Lancamento_Financeiro.Enabled:= false;

    if (qrychama_perfilConsulta_Acerto_Caixa.AsInteger = 1) then
      FrmPrincipal.acConsulta_Acerto_Caixa.Enabled:= true
    else
      FrmPrincipal.acConsulta_Acerto_Caixa.Enabled:= false;

    if (qrychama_perfilConsulta_Fechamento_Caixa.AsInteger = 1) then
      FrmPrincipal.acConsulta_Fechamento_Caixa.Enabled:= true
    else
      FrmPrincipal.acConsulta_Fechamento_Caixa.Enabled:= false;

    if (qrychama_perfilConsulta_Agenda_Telefonica.AsInteger = 1) then
      FrmPrincipal.acConsulta_Agenda_Telefonica.Enabled:= true
    else
      FrmPrincipal.acConsulta_Agenda_Telefonica.Enabled:= false;

    if (qrychama_perfilConsulta_Historico_Acesso.AsInteger = 1) then
      FrmPrincipal.acConsulta_Historico.Enabled:= true
    else
      FrmPrincipal.acConsulta_Historico.Enabled:= false;

end;

procedure TFrmControle_Acesso.btOKClick(Sender: TObject);
var
  login, senha: AnsiString;
  perfil, i: integer;
begin
    StatusBar.Panels[1].Text:= IntToStr(tentativas);
    login:= EdtLogin.Text;
    senha:= EdtSenha.Text;
    Chama_Usuario;
    if not qAux.Locate('Login;Senha', VarArrayOf([login, senha]),[]) then
    begin
      Application.MessageBox('Usuário não encontrado', 'Usuário inválido', MB_OK+MB_ICONHAND);
      EdtLogin.SetFocus;
      inc(tentativas);
      StatusBar.Panels[1].Text:= IntToStr(tentativas);
      if (tentativas = 3) then
      begin
        Application.MessageBox('Você não tem permissão para acessar o sistema.', 'Fechando...', MB_OK+MB_ICONHAND);
        close;
        Application.Terminate;
      end;

    end
    else
    begin
      Usuario:= qAux.FieldByName('Nome').AsString;
      Codigo_Usuario:= qAux.FieldByName('Codigo').AsInteger;
      perfil:= qAux.FieldByName('Codigo_Perfil').AsInteger;
      //Chama_Perfil(perfil);

      Atualizacoes.Verifica_Atualizacoes;

      Application.CreateForm(TFrmPrincipal, FrmPrincipal);
      FrmPrincipal.Show;

      Application.CreateForm(TFrmChama_Propriedade_Inicial, FrmChama_Propriedade_Inicial);
      FrmChama_Propriedade_Inicial.ShowModal;
      FrmChama_Propriedade_Inicial.Free;

      //Chama_Itens;
      FrmControle_Acesso.Close;

      Util.Pega_Caixa;
      //Util.Pega_Empresa;
      FrmPrincipal.StbStatus.Panels[1].Text:= 'USUÁRIO: ' + Usuario;
    end;
end;

procedure TFrmControle_Acesso.Chama_Usuario;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from Cadastro_Usuario');
      open;
    end;
  finally

  end;
end;

procedure TFrmControle_Acesso.Chama_Perfil(perfil: Integer);
begin
  with qrychama_perfil, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select * from Cadastro_Perfil_Usuario where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= perfil;
    open;
  end;
end;

procedure TFrmControle_Acesso.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmControle_Acesso.Release;
end;

procedure TFrmControle_Acesso.FormCreate(Sender: TObject);
begin
  tentativas:= 0;
end;

procedure TFrmControle_Acesso.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

function TFrmControle_Acesso.RemoveChar(const Texto: String): String;
var
	I: integer;
	S: string;
begin
	S := '';
	for I := 1 To Length(Texto) Do begin
	   if (Texto[I] in ['0'..'9']) then begin
			S := S + Copy(Texto, I, 1);
		end;
	end;
	result := S;
end;

function TFrmControle_Acesso.SerialNum(FDrive: String): String;
Var
	Serial:DWord;
	DirLen,Flags: DWord;
	DLabel : Array[0..11] of Char;
begin
	Try GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
  		Result := IntToHex(Serial,8);
		Except Result :='';
	end;
end;

end.


