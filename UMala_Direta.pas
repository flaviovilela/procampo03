unit UMala_Direta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, ComCtrls,
  ImgList, ToolWin, DB, DBClient;

type
  TFrmMala_Direta = class(TForm)
    StbStatus: TStatusBar;
    Timer1: TTimer;
    ImgImagens_Cadastros: TImageList;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnImprimir: TToolButton;
    BBtnFechar: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    MMOReferente: TMemo;
    LblData_Cadastro: TLabel;
    MEdtData_Cadastro: TMaskEdit;
    BBtnLimpar: TToolButton;
    LblMarca: TLabel;
    EdtNome: TEdit;
    Label1: TLabel;
    EdtEmpresa: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnFecharClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtEmitenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    var
    achou: boolean;
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmMala_Direta: TFrmMala_Direta;
  codigo: integer;
implementation

uses UDM, UPrincipal, UChama_Empresa;

{$R *.dfm}

procedure TFrmMala_Direta.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmMala_Direta.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Mala_Direta:= TFrmRel_Mala_Direta.Create(self);
  FrmRel_Mala_Direta.Release;
  FrmRel_Mala_Direta:= Nil;
end;

procedure TFrmMala_Direta.BBtnLimparClick(Sender: TObject);
var Cont: integer;
begin
  for Cont := 0 to componentcount - 1 do
    begin
      if Components[Cont] is TEdit then
        TEdit(Components[Cont]).Text:='';
      if Components[Cont] is TMemo then
        TMemo(Components[Cont]).Text:='';
      end;
end;

procedure TFrmMala_Direta.BBtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmMala_Direta.EdtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmMala_Direta.EdtEmitenteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Empresa, FrmChama_Empresa);
    FrmChama_Empresa.ShowModal;
    FrmChama_Empresa.Free;
  end;
end;

procedure TFrmMala_Direta.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmMala_Direta.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FrmMala_Direta.Release;
end;

procedure TFrmMala_Direta.FormCreate(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
  Util.Limpa_Campos(FrmMala_Direta);
  MEdtData_Cadastro.Text:= DatetoStr(Date);
end;

procedure TFrmMala_Direta.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmMala_Direta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmMala_Direta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
    key:=#0; //anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmMala_Direta.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DatetoStr(Date);
end;

procedure TFrmMala_Direta.Timer1Timer(Sender: TObject);
begin
  StbStatus.Panels[0].Text := TimeToStr (time);
  StbStatus.Panels[1].Text := DateToStr(date);
end;

end.
