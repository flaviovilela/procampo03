unit UConsulta_Aptidao_Novilha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Aptidao_Novilha = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    RGOpacao: TRadioGroup;
    LblMarca: TLabel;
    EdtTotal_Animais: TEdit;
    BBtnAptidao: TToolButton;
    Label2: TLabel;
    MEdtData_Aptidao: TMaskEdit;
    qryconsultaCodigo: TIntegerField;
    qryconsultaAnimal: TStringField;
    qryconsultaGrau_Sangue: TStringField;
    qryconsultaCodigo_Categoria: TIntegerField;
    qryconsultaData_Nascimento: TDateTimeField;
    qryconsultaidade_meses: TIntegerField;
    qryconsultaidade_dias: TIntegerField;
    qryconsultaUltimo_Peso: TFloatField;
    qryconsultaData_Desmama: TDateTimeField;
    qryconsultadias_crescimento: TIntegerField;
    qryconsultaCategoria: TStringField;
    qryconsultaQtde: TIntegerField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_UsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnAptidaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Aptidao_Novilha: TFrmConsulta_Aptidao_Novilha;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, URel_Consulta_Aptidao_Novilha;

{$R *.dfm}

procedure TFrmConsulta_Aptidao_Novilha.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Aptidao_Novilha.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Aptidao_Novilha;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
  BBtnAptidao.Enabled:= true;
end;

procedure TFrmConsulta_Aptidao_Novilha.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Aptidao_Novilha:= TFrmRel_Consulta_Aptidao_Novilha.create(self);
  FrmRel_Consulta_Aptidao_Novilha.Release;
  FrmRel_Consulta_Aptidao_Novilha:= Nil;
end;

procedure TFrmConsulta_Aptidao_Novilha.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnAptidao.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Aptidao_Novilha.BBtnAptidaoClick(
  Sender: TObject);
begin
  if (RGOpacao.ItemIndex = 0) then
  begin
    if (MEdtData_Aptidao.Text = '  /  /    ') then
      Application.MessageBox('Informe uma data para aptidão', 'Atenção', MB_OK+MB_ICONHAND)
    else if (DBGrid1.SelectedRows.Count = 0) then
      Application.MessageBox('É necessário informar pelo menos um animal a mudar de categoria', 'Atenção', MB_OK+MB_ICONHAND)
    else
    begin
      if (Application.MessageBox('Confirma a mudança de categoria para Novilhas Aptas?', 'FAV Sistemas', MB_ICONQUESTION+MB_YESNO)) = idyes then
        begin
          qryconsulta.First;
          while not qryconsulta.Eof do
            begin
              if (DBGrid1.SelectedRows.CurrentRowSelected) then
              begin
                Util.Atualiza_Novilha_Apta(qryconsultaCodigo.AsInteger, situacao_novilhas_aptas, situacao_ini_novilha, StrToDateTime(MEdtData_Aptidao.Text));
                qryconsulta.Next;
              end
              else
                qryconsulta.Next;
            end;
            Mensagem.Processo_Concluido;;
            BBtnAptidao.Enabled:= false;
        end;
    end;
  end
  else
  begin
    if (DBGrid1.SelectedRows.Count = 0) then
      Application.MessageBox('É necessário informar pelo menos um animal a estornar', 'Atenção', MB_OK+MB_ICONHAND)
    else
    begin
      if (Application.MessageBox('Confirma o estorno dos animais selecionados? Reconfigure a situação dos animais selecionados, em seu cadastro', 'Atenção', MB_ICONQUESTION+MB_YESNO)) = idyes then
        begin
          qryconsulta.First;
          while not qryconsulta.Eof do
            begin
              if (DBGrid1.SelectedRows.CurrentRowSelected) then
              begin
                Util.Atualiza_Novilha_Apta(qryconsultaCodigo.AsInteger, situacao_crescimento1, situacao_ini_em_crescimento, NULL);
                qryconsulta.Next;
              end
              else
                qryconsulta.Next;
            end;
            Mensagem.Processo_Concluido;
            BBtnAptidao.Enabled:= false;
        end;
    end;
  end;
end;

procedure TFrmConsulta_Aptidao_Novilha.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Aptidao_Novilha.EdtCodigo_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Aptidao_Novilha.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Aptidao_Novilha.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Aptidao_Novilha.Release;
end;

procedure TFrmConsulta_Aptidao_Novilha.FormCreate(Sender: TObject);
begin
  qryconsulta.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  MEdtData_Aptidao.Text:= DateToStr(date);
end;

procedure TFrmConsulta_Aptidao_Novilha.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Aptidao_Novilha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
