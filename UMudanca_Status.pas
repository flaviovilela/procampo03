unit UMudanca_Status;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, RSPrint, UUtilitarios,
  ADODB;

type
  TFrmMudanca_Status = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnOK: TToolButton;
    ImgImagens_Comandos: TImageList;
    BBtnSair: TToolButton;
    RGStatus: TRadioGroup;
    EdtN_Pedido: TEdit;
    Label4: TLabel;
    EdtCodigo_Atendente: TEdit;
    EdtAtendente: TEdit;
    Label1: TLabel;
    procedure BBtnSairClick(Sender: TObject);
    procedure BBtnOKClick(Sender: TObject);
    procedure EdtCodigo_AtendenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure RGStatusClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }

    Util: UUtilitarios.TUtil;
    Mensagem: UUtilitarios.TMensagem;
    linha_cozinha: integer;
    procedure Atualiza_Status;
    procedure Verifica_Pedido;
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmMudanca_Status: TFrmMudanca_Status;

implementation

uses UDM, UChama_Cliente;

{$R *.dfm}

procedure TFrmMudanca_Status.Atualiza_Status;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    if (RGStatus.ItemIndex = 0) then
    begin
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Pedido set Hora_Fabricacao = :Hora_Fabricacao, Hora_Termino = :Hora_Termino, Status = :Status');
        add('where N_Pedido = :Pedido');
        Parameters.ParamByName('Pedido').Value:= EdtN_Pedido.Text;
        Parameters.ParamByName('Hora_Fabricacao').Value:= NULL;
        Parameters.ParamByName('Hora_Termino').Value:= NULL;
        Parameters.ParamByName('Status').Value:= 'PENDENTE';
        ExecSQL;
      end;
    end
    else if (RGStatus.ItemIndex = 1) then
    begin
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Pedido set Hora_Fabricacao = :Hora_Fabricacao, Status = :Status');
        add('where N_Pedido = :Pedido');
        Parameters.ParamByName('Pedido').Value:= EdtN_Pedido.Text;
        Parameters.ParamByName('Hora_Fabricacao').Value:= time;
        Parameters.ParamByName('Status').Value:= 'MONTAGEM';
        ExecSQL;
      end;
    end
    else if (RGStatus.ItemIndex = 2) then
    begin
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Pedido set Hora_Termino = :Hora_Termino, Status = :Status');
        add('where N_Pedido = :Pedido');
        Parameters.ParamByName('Pedido').Value:= EdtN_Pedido.Text;
        Parameters.ParamByName('Hora_Termino').Value:= time;
        Parameters.ParamByName('Status').Value:= 'PRONTO PARA ENTREGA';
        ExecSQL;
      end;
    end
    else if (RGStatus.ItemIndex = 3) then
    begin
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Pedido set Hora_Entrega = :Hora_Entrega, Status = :Status, Codigo_Entregador = :Codigo_Entregador ');
        add('where N_Pedido = :Pedido');
        Parameters.ParamByName('Hora_Entrega').Value:= time;
        Parameters.ParamByName('Pedido').Value:= EdtN_Pedido.Text;
        Parameters.ParamByName('Status').Value:= 'SAIU PARA ENTREGA';
        Parameters.ParamByName('Codigo_Entregador').Value:= StrToInt(EdtCodigo_Atendente.Text);
        ExecSQL;
      end;
    end
    else if (RGStatus.ItemIndex = 4) then
    begin
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Pedido set Status = :Status, Hora_Fechamento = :Hora_Fechamento ');
        add('where N_Pedido = :Pedido');
        Parameters.ParamByName('Pedido').Value:= EdtN_Pedido.Text;
        Parameters.ParamByName('Status').Value:= 'FECHADO';
        Parameters.ParamByName('Hora_Fechamento').Value:= time;
        ExecSQL;
      end;
    end;

    Mensagem.Processo_Concluido;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmMudanca_Status.BBtnOKClick(Sender: TObject);
begin
  if (EdtN_Pedido.Text = '') then
  begin
    Mensagem.Mensagem_Falta_Dados;
    EdtN_Pedido.SetFocus;
    abort;
  end;

  if (RGStatus.ItemIndex = 3) then
  begin
    if (EdtCodigo_Atendente.Text = '') then
    begin
      Mensagem.Mensagem_Falta_Dados;
      EdtCodigo_Atendente.SetFocus;
      abort;
    end;
  end;

  Verifica_Pedido;
  Atualiza_Status;
end;

procedure TFrmMudanca_Status.BBtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmMudanca_Status.EdtCodigo_AtendenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmMudanca_Status.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmMudanca_Status.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmMudanca_Status.Release;
end;

procedure TFrmMudanca_Status.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmMudanca_Status.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_ESCAPE) then
    close;
end;

procedure TFrmMudanca_Status.RGStatusClick(Sender: TObject);
begin
  if (RGStatus.ItemIndex = 3) then
  begin
    Label4.Visible:= true;
    EdtCodigo_Atendente.Visible:= true;
    EdtAtendente.Visible:= true;
  end
  else
  begin
    Label4.Visible:= false;
    EdtCodigo_Atendente.Visible:= false;
    EdtAtendente.Visible:= false;
  end;
end;

procedure TFrmMudanca_Status.Verifica_Pedido;
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
      add('select P.N_Pedido from Pedido P');
      add('where P.N_Pedido = :Pedido');
      Parameters.ParamByName('Pedido').Value:= EdtN_Pedido.Text;
      open;

      if (IsEmpty) then
      begin
        Mensagem.Pedido_Nao_Encontrado;
        EdtN_Pedido.SetFocus;
        abort;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

end.
