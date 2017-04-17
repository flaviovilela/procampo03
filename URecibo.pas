unit URecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, ComCtrls,
  ImgList, ToolWin;

type
  TFrmRecibo = class(TForm)
    StbStatus: TStatusBar;
    Timer1: TTimer;
    ImgImagens_Cadastros: TImageList;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnImprimir: TToolButton;
    BBtnFechar: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    LblSetor: TLabel;
    EdtCliente: TEdit;
    EdtEndereco: TEdit;
    EdtImportancia: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    MMOReferente: TMemo;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    EdtEmitente: TEdit;
    Label16: TLabel;
    EdtEndereco_Emitente: TEdit;
    LblData_Cadastro: TLabel;
    MEdtData_Cadastro: TMaskEdit;
    EdtNumero_Emitente: TEdit;
    EdtNumero_Cliente: TEdit;
    BBtnLimpar: TToolButton;
    EdtCNPJ: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnFecharClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtEmitenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    var
    achou: boolean;
    { Private declarations }
    procedure Limpa_Campos;
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmRecibo: TFrmRecibo;
  codigo: integer;
implementation

uses UDM, UPrincipal, URel_Recibo, UChama_Empresa, UChama_Cliente;

{$R *.dfm}

procedure TFrmRecibo.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRecibo.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Recibo:= TFrmRel_Recibo.Create(self);
  FrmRel_Recibo.Release;
  FrmRel_Recibo:= Nil;
end;

procedure TFrmRecibo.BBtnLimparClick(Sender: TObject);
var Cont: integer;
begin
  for Cont := 0 to componentcount - 1 do
    begin
      if Components[Cont] is TEdit then
        TEdit(Components[Cont]).Text:='';
      if Components[Cont] is TMaskEdit then
        TMaskEdit(Components[Cont]).Text:= '';
      if Components[Cont] is TMemo then
        TMemo(Components[Cont]).Text:='';
      end;
end;

procedure TFrmRecibo.BBtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRecibo.EdtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmRecibo.EdtEmitenteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Empresa, FrmChama_Empresa);
    FrmChama_Empresa.ShowModal;
    FrmChama_Empresa.Free;
  end;
end;

procedure TFrmRecibo.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmRecibo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FrmRecibo.Free;
  FrmRecibo:= Nil;
end;

procedure TFrmRecibo.FormCreate(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
  Limpa_Campos;
  MEdtData_Cadastro.Text:= DatetoStr(Date);
end;

procedure TFrmRecibo.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmRecibo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmRecibo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
    key:=#0; //anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmRecibo.Limpa_Campos;
begin
  EdtCliente.Clear;
  EdtEndereco.Clear;
  EdtImportancia.Clear;
  MEdtData_Cadastro.clear;;
  MMOReferente.Clear;
  EdtEmitente.Clear;
  EdtEndereco_Emitente.Clear;
  EdtCNPJ.Clear;

end;

procedure TFrmRecibo.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DatetoStr(Date);
end;

procedure TFrmRecibo.Timer1Timer(Sender: TObject);
begin
  StbStatus.Panels[0].Text := TimeToStr (time);
  StbStatus.Panels[1].Text := DateToStr(date);
end;

end.
