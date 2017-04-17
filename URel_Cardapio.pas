unit URel_Cardapio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Cardapio = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Descricao: TStringField;
    QRGroup2: TQRGroup;
    ADOQuery1Grupo: TStringField;
    ADOQuery1Codigo_Grupo: TIntegerField;
    QRDBText4: TQRDBText;
    ADOQuery2: TADOQuery;
    ADOQuery1Ingrediente: TStringField;
    ADOQuery2Codigo: TIntegerField;
    ADOQuery2Descricao: TStringField;
    ADOQuery1Valor_Mini: TFloatField;
    ADOQuery1Valor_Pequena: TFloatField;
    ADOQuery1Valor_Media: TFloatField;
    ADOQuery1Valor_Grande: TFloatField;
    ADOQuery1Valor_Gigante: TFloatField;
    ADOQuery1Valor_Familia: TFloatField;
    QRChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Cardapio: TFrmRel_Cardapio;

implementation

uses UDM, UUtilitarios;

{$R *.dfm}

procedure TFrmRel_Cardapio.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Cardapio.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  LblEmpresa.Caption:= nome_fantasia;
  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;

  {with ADOQuery2, sql do
  begin
    close;
    clear;
    add('select CP.Codigo, CP.Descricao from Cadastro_Produto CP');
    open;
  end;}

  //ADOQuery2.First;
  //while not ADOQuery2.Eof do
  //begin
    with ADOQuery1, sql do
    begin
      close;
      clear;
      add('select CP.Codigo, CP.Descricao, CP.Valor_Mini, CP.Valor_Pequena, CP.Valor_Media, CP.Valor_Grande,');
      add('CP.Valor_Gigante, CP.Valor_Familia, CGP.Codigo as Codigo_Grupo, CGP.Descricao as Grupo,');
      add('CI.Descricao as Ingrediente from Ingrediente_Produto IP');
      add('left join Cadastro_Produto CP on (IP.Codigo_Produto = CP.Codigo)');
      add('left join Cadastro_Ingrediente CI on (IP.Codigo_Ingrediente = CI.Codigo)');
      add('left join Cadastro_Grupo_Produto CGP on (CP.Codigo_Grupo = CGP.Codigo)');
      add('where CP.Ativo = :Sim and IP.Permissao = :Permissao');
      add('group by CP.Codigo, CP.Descricao, CP.Valor_Mini, CP.Valor_Pequena, CP.Valor_Media, CP.Valor_Grande,');
      add('CP.Valor_Gigante, CP.Valor_Familia, CGP.Codigo, CGP.Descricao, CI.Descricao order by CP.Descricao');
      Parameters.ParamByName('Sim').Value:= 'SIM';
      Parameters.ParamByName('Permissao').Value:= 'SIM';
      open;
    end;

    //while not ADOQuery1.Eof do
    //begin
    //  LblTeste.Caption:= LblTeste.Caption + ADOQuery1Ingrediente.AsString;
    //  ADOQuery1.Next;
    //end;
    //ADOQuery2.Next;
  //end;
  {ADOQuery1.First;
  while not ADOQuery1.Eof do
  begin
    with ADOQuery2, sql do
    begin
      close;
      clear;
      add('select CP.Descricao as Produto, CI.Descricao as Ingrediente from Ingrediente_Produto IP');
      add('left join Cadastro_Produto CP on (IP.Codigo_Produto = CP.Codigo)');
      add('left join Cadastro_Ingrediente CI on (IP.Codigo_Ingrediente = CI.Codigo)');
      add('where IP.Codigo_Produto = :Codigo and IP.Permissao = :Permissao');
      Parameters.ParamByName('Codigo').Value:= ADOQuery1Codigo.AsInteger;
      Parameters.ParamByName('Permissao').Value:= 'SIM';
      open;

      while not Eof do
      begin
        QRLabel1.Caption:= QRLabel1.Caption + ', ' + ADOQuery2Ingrediente.AsString;
        ADOQuery2.Next;
      end;
    end;
    ADOQuery1.Next;
  end; }


end;
end.
