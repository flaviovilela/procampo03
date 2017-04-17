unit UConsulta_Acompanhamento_Crescimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, Mask, UUtilitarios;

type
  TFrmConsulta_Acompanhamento_Crescimento = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    RGCategoria: TRadioGroup;
    RGSexo: TRadioGroup;
    RGAlterar: TRadioGroup;
    qryconsultaCodigo: TIntegerField;
    qryconsultaAnimal: TStringField;
    qryconsultaCodigo_Categoria: TIntegerField;
    qryconsultaData_Nascimento: TDateTimeField;
    qryconsultaidade: TIntegerField;
    qryconsultaidade_dias: TIntegerField;
    qryconsultaData_Desmama: TDateTimeField;
    qryconsultadias_desmamado: TIntegerField;
    qryconsultaUltimo_Peso: TFloatField;
    qryconsultaGrau_Sangue: TStringField;
    qryconsultaQtde: TIntegerField;
    LblMarca: TLabel;
    EdtTotal_Animais: TEdit;
    qryconsultaCategoria: TStringField;
    BBtnMudar_Categoria: TToolButton;
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
    procedure BBtnMudar_CategoriaClick(Sender: TObject);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Acompanhamento_Crescimento: TFrmConsulta_Acompanhamento_Crescimento;
  Util: UUtilitarios.TUtil;
  Consulta: TConsulta;
implementation

uses UDM, URel_Consulta_Acompanhamento_Crescimento;

{$R *.dfm}

procedure TFrmConsulta_Acompanhamento_Crescimento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Acompanhamento_Crescimento.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Acompanhamento_Crescimento;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
  BBtnMudar_Categoria.Enabled:= true;
end;

procedure TFrmConsulta_Acompanhamento_Crescimento.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Acompanhamento_Crescimento:= TFrmRel_Consulta_Acompanhamento_Crescimento.create(self);
  FrmRel_Consulta_Acompanhamento_Crescimento.Release;
  FrmRel_Consulta_Acompanhamento_Crescimento:= Nil;
end;

procedure TFrmConsulta_Acompanhamento_Crescimento.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnMudar_Categoria.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Acompanhamento_Crescimento.BBtnMudar_CategoriaClick(
  Sender: TObject);
begin
  if (DBGrid1.SelectedRows.Count = 0) then
  begin
    Application.MessageBox('É necessário informar pelo menos um animal a mudar de categoria', 'Atenção', MB_OK+MB_ICONHAND);
    abort;
  end;

  if (Application.MessageBox('Confirma a mudança de categoria?', 'FAV Sistemas', MB_ICONQUESTION+MB_YESNO)) = idyes then
    begin
      qryconsulta.First;
      while not qryconsulta.Eof do
        begin
          if (DBGrid1.SelectedRows.CurrentRowSelected) then
          begin
            if (RGAlterar.ItemIndex = 0) then
            begin
              if (RGSexo.ItemIndex = 0) then
                Util.Atualiza_Categoria(qryconsultaCodigo.AsInteger, situacao_crescimento1_macho)
              else
                Util.Atualiza_Categoria(qryconsultaCodigo.AsInteger, situacao_crescimento1);
            end
            else if (RGAlterar.ItemIndex = 1) then
            begin
              if (RGSexo.ItemIndex = 0) then
                Util.Atualiza_Categoria(qryconsultaCodigo.AsInteger, situacao_crescimento2_macho)
              else
                Util.Atualiza_Categoria(qryconsultaCodigo.AsInteger, situacao_crescimento2);
            end
            else if (RGAlterar.ItemIndex = 2) then
            begin
              if (RGSexo.ItemIndex = 0) then
                Util.Atualiza_Categoria(qryconsultaCodigo.AsInteger, situacao_crescimento3_macho)
              else
                Util.Atualiza_Categoria(qryconsultaCodigo.AsInteger, situacao_crescimento3);
            end
            else if (RGAlterar.ItemIndex = 3) then
            begin
              if (RGSexo.ItemIndex = 0) then
                Util.Atualiza_Categoria(qryconsultaCodigo.AsInteger, situacao_crescimento4_macho)
              else
                Util.Atualiza_Categoria(qryconsultaCodigo.AsInteger, situacao_crescimento4);
            end
            else if (RGAlterar.ItemIndex = 4) then
            begin
              if (RGSexo.ItemIndex = 0) then
                Util.Atualiza_Categoria(qryconsultaCodigo.AsInteger, situacao_crescimento5_macho)
              else
                Util.Atualiza_Categoria(qryconsultaCodigo.AsInteger, situacao_crescimento5);
            end
            else if (RGAlterar.ItemIndex = 5) then
            begin
              if (RGSexo.ItemIndex = 0) then
                Util.Atualiza_Categoria(qryconsultaCodigo.AsInteger, situacao_crescimento6_macho)
              else
                Util.Atualiza_Categoria(qryconsultaCodigo.AsInteger, situacao_crescimento6);
            end
            else if (RGAlterar.ItemIndex = 6) then
                Util.Atualiza_Categoria(qryconsultaCodigo.AsInteger, situacao_crescimento7_macho);
          end;
          qryconsulta.Next;
        end;
        Mensagem.Processo_Concluido;
        BBtnMudar_Categoria.Enabled:= false;
    end;
end;

procedure TFrmConsulta_Acompanhamento_Crescimento.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Acompanhamento_Crescimento.EdtCodigo_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Acompanhamento_Crescimento.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Acompanhamento_Crescimento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Acompanhamento_Crescimento.Release;
end;

procedure TFrmConsulta_Acompanhamento_Crescimento.FormCreate(Sender: TObject);
begin
  qryconsulta.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
end;

procedure TFrmConsulta_Acompanhamento_Crescimento.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Acompanhamento_Crescimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
