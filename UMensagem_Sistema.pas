unit UMensagem_Sistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ToolWin, ImgList, StdCtrls, ExtCtrls, DateUtils;

type
  TFrmMensagem_Sistema = class(TForm)
    ImgImagens: TImageList;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    BBtnImprimir: TToolButton;
    LblTotal: TLabel;
    RichEdit1: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMensagem_Sistema: TFrmMensagem_Sistema;

implementation

uses URel_Mensagem_Sistema, UUtilitarios;


{$R *.dfm}

procedure TFrmMensagem_Sistema.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmMensagem_Sistema.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Mensagem_Sistema:= TFrmRel_Mensagem_Sistema.Create(self);
  FrmRel_Mensagem_Sistema.Release;
  FrmRel_Mensagem_Sistema:= Nil;
  {Application.CreateForm(TFrmRel_Mensagem_Sistema, FrmRel_Mensagem_Sistema);
  FrmRel_Mensagem_Sistema.QuickRep1.Preview;
  FrmRel_Mensagem_Sistema.Free;}
end;

procedure TFrmMensagem_Sistema.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmMensagem_Sistema.Release;
end;

procedure TFrmMensagem_Sistema.FormCreate(Sender: TObject);
begin
  RichEdit1.Lines.Clear;

  if (conta_maior <> '') then
    RichEdit1.Lines.Add(conta_maior);

  if (conta_menor <> '') then
    RichEdit1.Lines.Add(conta_menor);

  if (cheque <> '') then
    RichEdit1.Lines.Add(cheque);

    if (conta_mensagem = 0) then
      LblTotal.Caption:= '0'
    else
      LblTotal.Caption:= 'O sistema encontrou '+IntToStr(conta_mensagem)+' ocorrências.';
end;
procedure TFrmMensagem_Sistema.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_ESCAPE) then
    close;
end;

end.
