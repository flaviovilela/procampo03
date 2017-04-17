unit URel_Consulta_Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Pedido = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRGroup1: TQRGroup;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    LblConsulta_Lancamento: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel4: TQRLabel;
    LblDe: TQRLabel;
    LblStatus: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    LblAte: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    ADOQuery1: TADOQuery;
    QRBand2: TQRBand;
    QRLabel45: TQRLabel;
    QRHRule3: TQRHRule;
    QRChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand3: TQRBand;
    QRDBValor: TQRDBText;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1N_Pedido: TStringField;
    ADOQuery1Data_Movimento: TDateTimeField;
    ADOQuery1Hora_Pedido: TDateTimeField;
    ADOQuery1Hora_Fabricacao: TDateTimeField;
    ADOQuery1Hora_Termino: TDateTimeField;
    ADOQuery1Hora_Entrega: TDateTimeField;
    ADOQuery1Tipo: TStringField;
    ADOQuery1Codigo_Mesa: TIntegerField;
    ADOQuery1Codigo_Atendente: TIntegerField;
    ADOQuery1Codigo_Cliente: TIntegerField;
    ADOQuery1Codigo_Condicao_Pagamento: TIntegerField;
    ADOQuery1Observacao: TStringField;
    ADOQuery1Quantidade_Itens: TIntegerField;
    ADOQuery1Total_Pedido: TFloatField;
    ADOQuery1Taxa_Entrega: TFloatField;
    ADOQuery1Desconto: TFloatField;
    ADOQuery1Acrescimo: TFloatField;
    ADOQuery1Valor_Pagar: TFloatField;
    ADOQuery1Valor_Recebido: TFloatField;
    ADOQuery1Troco: TFloatField;
    ADOQuery1Status: TStringField;
    ADOQuery1Codigo_Entregador: TIntegerField;
    ADOQuery1Codigo_1: TIntegerField;
    ADOQuery1N_Pedido_1: TStringField;
    ADOQuery1Codigo_Produto: TIntegerField;
    ADOQuery1Tamanho: TStringField;
    ADOQuery1Borda: TStringField;
    ADOQuery1Valor_Unitario: TFloatField;
    ADOQuery1Quantidade: TFloatField;
    ADOQuery1Sub_Total: TFloatField;
    ADOQuery1Desconto_1: TFloatField;
    ADOQuery1Valor_Venda: TFloatField;
    ADOQuery1Observacao_1: TStringField;
    ADOQuery1Condicao_Pagamento: TStringField;
    ADOQuery1Mesa: TStringField;
    ADOQuery1Cliente: TStringField;
    ADOQuery1Atendente: TStringField;
    ADOQuery1Entregador: TStringField;
    QRDBText21: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel47: TQRLabel;
    ADOQuery1Produto: TStringField;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel48: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr1: TQRExpr;
    ADOQuery1Hora_Fechamento: TDateTimeField;
    ADOQuery1Sabor_Borda: TStringField;
    QRLabel49: TQRLabel;
    QRDBText20: TQRDBText;
    QRBand1: TQRBand;
    QRDBText31: TQRDBText;
    QRLabel50: TQRLabel;
    ADOQuery1Hora_Ped: TStringField;
    ADOQuery1Hora_Fab: TStringField;
    ADOQuery1Hora_Term: TStringField;
    ADOQuery1Hora_Ent: TStringField;
    ADOQuery1Hora_Fec: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Pedido: TFrmRel_Consulta_Pedido;

implementation

uses UDM, UUtilitarios, UConsulta_Pedido;

{$R *.dfm}

procedure TFrmRel_Consulta_Pedido.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Pedido.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  LblParametro.Caption:= '';
  LblParametro.Caption:= FrmConsulta_Pedido.EdtParametro.Text;
  LblDe.Caption:= FrmConsulta_Pedido.MEdtData_Inicial.Text;
  LblAte.Caption:= FrmConsulta_Pedido.MEdtData_Final.Text;

  case FrmConsulta_Pedido.RGConsulta_Por.ItemIndex of
    0: LblConsulta_Lancamento.Caption:= 'Tudo';
    1: LblConsulta_Lancamento.Caption:= 'Pedido';
    2: LblConsulta_Lancamento.Caption:= 'Hora Pedido';
    3: LblConsulta_Lancamento.Caption:= 'Hora Fabricação';
    4: LblConsulta_Lancamento.Caption:= 'Hora Término';
    5: LblConsulta_Lancamento.Caption:= 'Hora Entrega';
    6: LblConsulta_Lancamento.Caption:= 'Atendente';
    7: LblConsulta_Lancamento.Caption:= 'Cliente';
    8: LblConsulta_Lancamento.Caption:= 'Entregador';
  end;

  case FrmConsulta_Pedido.RGStatus.ItemIndex of
    0: LblStatus.Caption:= 'Tudo';
    1: LblStatus.Caption:= 'Pendente';
    2: LblStatus.Caption:= 'Montagem';
    3: LblStatus.Caption:= 'Pronto p/ Entrega';
    4: LblStatus.Caption:= 'Saiu p/ Entrega';
    5: LblStatus.Caption:= 'Fechado';
  end;

  if (FrmConsulta_Pedido.RGStatus.ItemIndex = 0) then
  begin

    if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 0 then
    begin
      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
        open;

      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 1 then
    begin
      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

          Parameters.ParamByName('Pedido').Value:= FrmConsulta_Pedido.EdtParametro.Text;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
        open;

      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 2 then
    begin
      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
          Parameters.ParamByName('HI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Inicial.Text);
          Parameters.ParamByName('HF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Final.Text);
        open;
      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 3 then
    begin

      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
          Parameters.ParamByName('HI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Inicial.Text);
          Parameters.ParamByName('HF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Final.Text);
        open;
      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 4 then
    begin
      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
          Parameters.ParamByName('HI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Inicial.Text);
          Parameters.ParamByName('HF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Final.Text);
        open;

      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 5 then
    begin

      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
          Parameters.ParamByName('HI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Inicial.Text);
          Parameters.ParamByName('HF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Final.Text);
        open;

      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 6 then
    begin
      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

          Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Pedido.EdtCodigo_Parametro.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
        open;

      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 7 then
    begin
      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

          Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Pedido.EdtCodigo_Parametro.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
        open;

      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 8 then
    begin

      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

          Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Pedido.EdtCodigo_Parametro.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
        open;

      end;
    end;
  end
  else
  begin
    if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 0 then
    begin

      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Status = :Status and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Status = :Status and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Status = :Status and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Status = :Status and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Status = :Status and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Status = :Status and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Status = :Status and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Status = :Status and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

        case FrmConsulta_Pedido.RGStatus.ItemIndex of
          1: Parameters.ParamByName('Status').Value:= 'PENDENTE';
          2: Parameters.ParamByName('Status').Value:= 'MONTAGEM';
          3: Parameters.ParamByName('Status').Value:= 'PRONTO PARA ENTREGA';
          4: Parameters.ParamByName('Status').Value:= 'SAIU PARA ENTREGA';
          5: Parameters.ParamByName('Status').Value:= 'FECHADO';
        end;

          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
        open;

      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 1 then
    begin
      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Status = :Status and P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Status = :Status and P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Status = :Status and P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Status = :Status and P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Status = :Status and P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Status = :Status and P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Status = :Status and P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Status = :Status and P.N_Pedido = :Pedido and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

        case FrmConsulta_Pedido.RGStatus.ItemIndex of
          1: Parameters.ParamByName('Status').Value:= 'PENDENTE';
          2: Parameters.ParamByName('Status').Value:= 'MONTAGEM';
          3: Parameters.ParamByName('Status').Value:= 'PRONTO PARA ENTREGA';
          4: Parameters.ParamByName('Status').Value:= 'SAIU PARA ENTREGA';
          5: Parameters.ParamByName('Status').Value:= 'FECHADO';
        end;

          Parameters.ParamByName('Pedido').Value:= FrmConsulta_Pedido.EdtParametro.Text;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
        open;

      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 2 then
    begin
      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Status = :Status and P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Status = :Status and P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Status = :Status and P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Status = :Status and P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Status = :Status and P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Status = :Status and P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Status = :Status and P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Status = :Status and P.Hora_Pedido between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

        case FrmConsulta_Pedido.RGStatus.ItemIndex of
          1: Parameters.ParamByName('Status').Value:= 'PENDENTE';
          2: Parameters.ParamByName('Status').Value:= 'MONTAGEM';
          3: Parameters.ParamByName('Status').Value:= 'PRONTO PARA ENTREGA';
          4: Parameters.ParamByName('Status').Value:= 'SAIU PARA ENTREGA';
          5: Parameters.ParamByName('Status').Value:= 'FECHADO';
        end;

          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
          Parameters.ParamByName('HI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Inicial.Text);
          Parameters.ParamByName('HF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Final.Text);
        open;

      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 3 then
    begin
      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Status = :Status and P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Status = :Status and P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Status = :Status and P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Status = :Status and P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Status = :Status and P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Status = :Status and P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Status = :Status and P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Status = :Status and P.Hora_Fabricacao between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

        case FrmConsulta_Pedido.RGStatus.ItemIndex of
          1: Parameters.ParamByName('Status').Value:= 'PENDENTE';
          2: Parameters.ParamByName('Status').Value:= 'MONTAGEM';
          3: Parameters.ParamByName('Status').Value:= 'PRONTO PARA ENTREGA';
          4: Parameters.ParamByName('Status').Value:= 'SAIU PARA ENTREGA';
          5: Parameters.ParamByName('Status').Value:= 'FECHADO';
        end;

          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
          Parameters.ParamByName('HI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Inicial.Text);
          Parameters.ParamByName('HF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Final.Text);
        open;
      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 4 then
    begin
      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Status = :Status and P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Status = :Status and P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Status = :Status and P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Status = :Status and P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Status = :Status and P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Status = :Status and P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Status = :Status and P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Status = :Status and P.Hora_Termino between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

        case FrmConsulta_Pedido.RGStatus.ItemIndex of
          1: Parameters.ParamByName('Status').Value:= 'PENDENTE';
          2: Parameters.ParamByName('Status').Value:= 'MONTAGEM';
          3: Parameters.ParamByName('Status').Value:= 'PRONTO PARA ENTREGA';
          4: Parameters.ParamByName('Status').Value:= 'SAIU PARA ENTREGA';
          5: Parameters.ParamByName('Status').Value:= 'FECHADO';
        end;

          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
          Parameters.ParamByName('HI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Inicial.Text);
          Parameters.ParamByName('HF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Final.Text);
        open;

      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 5 then
    begin
      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Status = :Status and P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Status = :Status and P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Status = :Status and P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Status = :Status and P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Status = :Status and P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Status = :Status and P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Status = :Status and P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Status = :Status and P.Hora_Entrega between :HI and :HF and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

        case FrmConsulta_Pedido.RGStatus.ItemIndex of
          1: Parameters.ParamByName('Status').Value:= 'PENDENTE';
          2: Parameters.ParamByName('Status').Value:= 'MONTAGEM';
          3: Parameters.ParamByName('Status').Value:= 'PRONTO PARA ENTREGA';
          4: Parameters.ParamByName('Status').Value:= 'SAIU PARA ENTREGA';
          5: Parameters.ParamByName('Status').Value:= 'FECHADO';
        end;

          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
          Parameters.ParamByName('HI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Inicial.Text);
          Parameters.ParamByName('HF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtHora_Final.Text);
        open;

      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 6 then
    begin

      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Status = :Status and P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Status = :Status and P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Status = :Status and P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Status = :Status and P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Status = :Status and P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Status = :Status and P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Status = :Status and P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Status = :Status and P.Codigo_Atendente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

        case FrmConsulta_Pedido.RGStatus.ItemIndex of
          1: Parameters.ParamByName('Status').Value:= 'PENDENTE';
          2: Parameters.ParamByName('Status').Value:= 'MONTAGEM';
          3: Parameters.ParamByName('Status').Value:= 'PRONTO PARA ENTREGA';
          4: Parameters.ParamByName('Status').Value:= 'SAIU PARA ENTREGA';
          5: Parameters.ParamByName('Status').Value:= 'FECHADO';
        end;

          Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Pedido.EdtCodigo_Parametro.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
        open;

      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 7 then
    begin
      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Status = :Status and P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Status = :Status and P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Status = :Status and P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Status = :Status and P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Status = :Status and P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Status = :Status and P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Status = :Status and P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Status = :Status and P.Codigo_Cliente = :Parametro and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

        case FrmConsulta_Pedido.RGStatus.ItemIndex of
          1: Parameters.ParamByName('Status').Value:= 'PENDENTE';
          2: Parameters.ParamByName('Status').Value:= 'MONTAGEM';
          3: Parameters.ParamByName('Status').Value:= 'PRONTO PARA ENTREGA';
          4: Parameters.ParamByName('Status').Value:= 'SAIU PARA ENTREGA';
          5: Parameters.ParamByName('Status').Value:= 'FECHADO';
        end;

          Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Pedido.EdtCodigo_Parametro.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
        open;

      end;
    end
    else if FrmConsulta_Pedido.RGConsulta_Por.ItemIndex = 8 then
    begin

      with ADOQuery1, Sql do
      begin
        close;
        Clear;
        Add('select P.*, IP.*, CP.Descricao as Condicao_Pagamento, CM.Descricao as Mesa, CPP.Descricao as Produto,');
        Add('CC1.Nome as Cliente, CC2.Nome as Atendente, CC3.Nome as Entregador,');
        Add('convert (varchar(8),P.Hora_Pedido,114) as Hora_Ped,');
        Add('convert (varchar(8),P.Hora_Fabricacao,114) as Hora_Fab,');
        Add('convert (varchar(8),P.Hora_Termino,114) as Hora_Term,');
        Add('convert (varchar(8),P.Hora_Entrega,114) as Hora_Ent,');
        Add('convert (varchar(8),P.Hora_Fechamento,114) as Hora_Fec from Pedido P');

        Add('left join Itens_Pedido IP on (P.Codigo = IP.Codigo)');
        Add('left join Cadastro_Produto CPP on (IP.Codigo_Produto = CPP.Codigo)');
        Add('left join Condicao_Pagamento CP on (P.Codigo_Condicao_Pagamento = CP.Codigo)');
        Add('left join Cadastro_Mesa CM on (P.Codigo_Mesa = CM.Codigo)');
        Add('left join Cadastro_Cliente CC1 on (P.Codigo_Cliente = CC1.Codigo)');
        Add('left join Cadastro_Cliente CC2 on (P.Codigo_Atendente = CC2.Codigo)');
        Add('left join Cadastro_Cliente CC3 on (P.Codigo_Entregador = CC3.Codigo)');

        case FrmConsulta_Pedido.RGOrdena_Por.ItemIndex of
          0: Add('where P.Status = :Status and P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by P.N_Pedido');
          1: Add('where P.Status = :Status and P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Pedido');
          2: Add('where P.Status = :Status and P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Fabricacao');
          3: Add('where P.Status = :Status and P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Termino');
          4: Add('where P.Status = :Status and P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by P.Hora_Entrega');
          5: Add('where P.Status = :Status and P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by CC1.Nome');
          6: Add('where P.Status = :Status and P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by CC3.Nome');
          7: Add('where P.Status = :Status and P.Codigo_Entregador = :Parametro and P.Data_Movimento between :DI and :DF order by P.Data_Movimento');
        end;

        case FrmConsulta_Pedido.RGStatus.ItemIndex of
          1: Parameters.ParamByName('Status').Value:= 'PENDENTE';
          2: Parameters.ParamByName('Status').Value:= 'MONTAGEM';
          3: Parameters.ParamByName('Status').Value:= 'PRONTO PARA ENTREGA';
          4: Parameters.ParamByName('Status').Value:= 'SAIU PARA ENTREGA';
          5: Parameters.ParamByName('Status').Value:= 'FECHADO';
        end;

          Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Pedido.EdtCodigo_Parametro.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Pedido.MEdtData_Final.Text);
        open;

      end;
    end;
  end;
end;
end.
