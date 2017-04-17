unit UChama_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB, UConsulta, UUtilitarios;

type
  TFrmChama_Cliente = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qrychama_cliente: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    RGTipo: TRadioGroup;
    qrychama_clienteCodigo: TIntegerField;
    qrychama_clienteTipo: TStringField;
    qrychama_clienteTipo_Cliente: TStringField;
    qrychama_clienteNome: TStringField;
    qrychama_clienteRazao_Social: TStringField;
    qrychama_clienteCPF: TStringField;
    qrychama_clienteRG: TStringField;
    qrychama_clienteOrgao_Expedidor: TStringField;
    qrychama_clienteData_Emissao: TDateTimeField;
    qrychama_clienteCNPJ: TStringField;
    qrychama_clienteInscricao_Estadual: TStringField;
    qrychama_clienteInscricao_Municipal: TStringField;
    qrychama_clienteCodigo_Endereco: TIntegerField;
    qrychama_clienteNumero: TStringField;
    qrychama_clientePonto_Referencia: TStringField;
    qrychama_clienteComplemento: TStringField;
    qrychama_clienteCodigo_Setor: TIntegerField;
    qrychama_clienteE_Mail: TStringField;
    qrychama_clienteSite: TStringField;
    qrychama_clienteCodigo_Cidade: TIntegerField;
    qrychama_clienteProfissao: TStringField;
    qrychama_clienteData_Nascimento: TDateTimeField;
    qrychama_clienteEstado_Civil: TStringField;
    qrychama_clienteTelefone: TStringField;
    qrychama_clienteCelular: TStringField;
    qrychama_clienteContato: TStringField;
    qrychama_clienteTelefone_Contato: TStringField;
    qrychama_clienteData_Cadastro: TDateTimeField;
    qrychama_clienteLogradouro: TStringField;
    qrychama_clienteCEP: TStringField;
    qrychama_clienteTipo_Logradouro: TStringField;
    qrychama_clienteCidade: TStringField;
    qrychama_clienteUF: TStringField;
    qrychama_clienteDescricao: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    procedure Atualiza_Dados;
  public
    { Public declarations }
  end;

var
  FrmChama_Cliente: TFrmChama_Cliente;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Cliente, URetorno_Cotacao,
  UConsulta_Comparativo_Preco_Cotacao, UCompra, ULancamento_Financeiro,
  UConsulta_Lancamentos_Financeiros, UFolha_Pagamento,
  UConsulta_Folha_Pagamento, UConsulta_Cotacao_Preco_Produto,
  UConsulta_Retorno_Cotacao_Preco, UConsulta_Compra, URecibo, UCadastro_Cheque,
  UChama_Lancamentos_Financeiros, UTransfere_Lancamento;

{$R *.dfm}

procedure TFrmChama_Cliente.Atualiza_Dados;
begin
  with qrychama_cliente, sql do
  begin
    close;
    clear;
    add('select CC.*, CL.Logradouro, CL.CEP, CL.Tipo_Logradouro, ');
    add('CCi.Cidade, CCi.UF, CS.Descricao from Cadastro_Cliente CC');
    add('Left join Cadastro_Logradouro CL on (CC.Codigo_Endereco = CL.Codigo)');
    add('Left join Cadastro_Cidade CCi on (CC.Codigo_Cidade = CCi.Codigo)');
    add('Left join Cadastro_Setor CS on (CC.Codigo_Setor = CS.Codigo)');
    add('where CC.Tipo = :Tipo order by CC.Nome');

    if (RGTipo.ItemIndex = 0) then
      Parameters.ParamByName('Tipo').Value:= 'CLIENTE'
    else if (RGTipo.ItemIndex = 1) then
      Parameters.ParamByName('Tipo').Value:= 'FORNECEDOR'
    else if (RGTipo.ItemIndex = 2) then
      Parameters.ParamByName('Tipo').Value:= 'FUNCIONÁRIO';
    open;
  end;
end;

procedure TFrmChama_Cliente.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Cliente.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Cliente;
end;

procedure TFrmChama_Cliente.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Cliente <> NIl) and (FrmCadastro_Cliente.ativo = true) then
  begin
    FrmCadastro_Cliente.EdtCodigo.Text:= qrychama_clienteCodigo.AsString;

    if qrychama_clienteTipo.AsString = 'CLIENTE' then
      FrmCadastro_Cliente.RGTipo.ItemIndex:= 0
    else if qrychama_clienteTipo.AsString = 'FORNECEDOR' then
      FrmCadastro_Cliente.RGTipo.ItemIndex:= 1
    else if qrychama_clienteTipo.AsString = 'FUNCIONÁRIO' then
      FrmCadastro_Cliente.RGTipo.ItemIndex:= 2;

    if qrychama_clienteTipo_Cliente.AsString = 'FÍSICO' then
      FrmCadastro_Cliente.CBTipo.Checked:= true
    else
      FrmCadastro_Cliente.CBTipo.Checked:= false;

    FrmCadastro_Cliente.EdtNome.Text:= qrychama_clienteNome.AsString;
    FrmCadastro_Cliente.EdtRazao_Social.Text:= qrychama_clienteRazao_Social.AsString;
    FrmCadastro_Cliente.EdtCPF.Text:= qrychama_clienteCPF.AsString;
    FrmCadastro_Cliente.EdtRG.Text:= qrychama_clienteRG.AsString;
    FrmCadastro_Cliente.EdtOrgao_Expedidor.Text:= qrychama_clienteOrgao_Expedidor.AsString;
    FrmCadastro_Cliente.EdtData_Emissao.Text:= qrychama_clienteData_Emissao.AsString;
    FrmCadastro_Cliente.EdtCNPJ.Text:= qrychama_clienteCNPJ.AsString;
    FrmCadastro_Cliente.EdtInsc_Estadual.Text:= qrychama_clienteInscricao_Estadual.AsString;
    FrmCadastro_Cliente.EdtInsc_Municipal.Text:= qrychama_clienteInscricao_Municipal.AsString;

    if (qrychama_clienteCodigo_Endereco.AsString <> null) then
    begin
      FrmCadastro_Cliente.EdtCodigo_Endereco.Text:= qrychama_clienteCodigo_Endereco.AsString;
      FrmCadastro_Cliente.EdtEndereco.Text:= qrychama_clienteLogradouro.AsString;
      FrmCadastro_Cliente.EdtTipo_Logradouro.Text:= qrychama_clienteTipo_Logradouro.AsString;
      FrmCadastro_Cliente.EdtCEP.Text:= qrychama_clienteCEP.AsString;
      FrmCadastro_Cliente.achou_endereco:= true;
    end
    else
    begin
      FrmCadastro_Cliente.EdtCodigo_Endereco.Text:= '';
      FrmCadastro_Cliente.EdtEndereco.Text:= '';
      FrmCadastro_Cliente.EdtTipo_Logradouro.Text:= '';
      FrmCadastro_Cliente.EdtCEP.Text:= '';
      FrmCadastro_Cliente.achou_endereco:= false;
    end;

    FrmCadastro_Cliente.EdtNumero.Text:= qrychama_clienteNumero.AsString;
    FrmCadastro_Cliente.EdtReferencia.Text:= qrychama_clientePonto_Referencia.AsString;
    FrmCadastro_Cliente.EdtComplemento.Text:= qrychama_clienteComplemento.AsString;

    if (qrychama_clienteCodigo_Setor.AsString <> null) then
    begin
      FrmCadastro_Cliente.EdtCodigo_Setor.Text:= qrychama_clienteCodigo_Setor.AsString;
      FrmCadastro_Cliente.EdtSetor.Text:= qrychama_clienteDescricao.AsString;
      FrmCadastro_Cliente.achou_setor:= true;
    end
    else
    begin
      FrmCadastro_Cliente.EdtCodigo_Setor.Text:= '';
      FrmCadastro_Cliente.EdtSetor.Text:= '';
      FrmCadastro_Cliente.achou_setor:= false;
    end;

    FrmCadastro_Cliente.EdtEmail.Text:= qrychama_clienteE_Mail.AsString;
    FrmCadastro_Cliente.EdtSite.Text:= qrychama_clienteSite.AsString;

    if (qrychama_clienteCodigo_Cidade.AsString <> null) then
    begin
      FrmCadastro_Cliente.EdtCodigo_Cidade.Text:= qrychama_clienteCodigo_Cidade.AsString;
      FrmCadastro_Cliente.EdtCidade.Text:= qrychama_clienteCidade.AsString;
      FrmCadastro_Cliente.EdtUF.Text:= qrychama_clienteUF.AsString;
      FrmCadastro_Cliente.achou_cidade:= true;
    end
    else
    begin
      FrmCadastro_Cliente.EdtCodigo_Cidade.Text:= '';
      FrmCadastro_Cliente.EdtCidade.Text:= '';
      FrmCadastro_Cliente.EdtUF.Text:= '';
      FrmCadastro_Cliente.achou_cidade:= false;
    end;

    FrmCadastro_Cliente.EdtProfissao.Text:= qrychama_clienteProfissao.AsString;
    FrmCadastro_Cliente.MEdtData_Nascimento.Text:= qrychama_clienteData_Nascimento.AsString;
    FrmCadastro_Cliente.CmbEstado_Civil.Text:= qrychama_clienteEstado_Civil.AsString;
    FrmCadastro_Cliente.MEdtTelefone.Text:= qrychama_clienteTelefone.AsString;
    FrmCadastro_Cliente.MEdtCelular.Text:= qrychama_clienteCelular.AsString;
    FrmCadastro_Cliente.EdtContato.Text:= qrychama_clienteContato.AsString;
    FrmCadastro_Cliente.MEdtTelefone_Contato.Text:= qrychama_clienteTelefone_Contato.AsString;
    FrmCadastro_Cliente.MEdtData_Cadastro.Text:= qrychama_clienteData_Cadastro.AsString;
    FrmCadastro_Cliente.BBtnSalvar.Enabled:= true;
    FrmCadastro_Cliente.BBtnExcluir.Enabled:= true;
    FrmCadastro_Cliente.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Cliente.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmCadastro_Cliente);
    FrmCadastro_Cliente.achei:= true;
  end
  else if (FrmRetorno_Cotacao <> nil) and (FrmRetorno_Cotacao.ativo) then
  begin
    FrmRetorno_Cotacao.EdtCodigo_Fornecedor.Text:= qrychama_clienteCodigo.AsString;
    FrmRetorno_Cotacao.EdtFornecedor.Text:= qrychama_clienteNome.AsString;
  end
  else if (FrmConsulta_Comparativo_Preco_Cotacao <> nil) and (FrmConsulta_Comparativo_Preco_Cotacao.ativo) then
  begin
    FrmConsulta_Comparativo_Preco_Cotacao.EdtCodigo.Text:= qrychama_clienteCodigo.AsString;
    FrmConsulta_Comparativo_Preco_Cotacao.EdtConsulta.Text:= qrychama_clienteNome.AsString;
  end
  else if (FrmCompra <> nil) and (FrmCompra.ativo) then
  begin
    FrmCompra.EdtCodigo_Fornecedor.Text:= qrychama_clienteCodigo.AsString;
    FrmCompra.EdtFornecedor.Text:= qrychama_clienteNome.AsString;
  end
  else if (FrmLancamento_Financeiro <> nil) and (FrmLancamento_Financeiro.ativo) then
  begin
    FrmLancamento_Financeiro.EdtCodigo_Cli_Forn.Text:= qrychama_clienteCodigo.AsString;
    FrmLancamento_Financeiro.EdtCli_Forn.Text:= qrychama_clienteNome.AsString;
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> nil) and (FrmConsulta_Lancamentos_Financeiros.ativo) then
  begin
    FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text:= qrychama_clienteCodigo.AsString;
    FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text:= qrychama_clienteNome.AsString;
  end
  else if (FrmFolha_Pagamento <> nil) and (FrmFolha_Pagamento.ativo) then
  begin
    FrmFolha_Pagamento.EdtCodigo_Funcionario.Text:= qrychama_clienteCodigo.AsString;
    FrmFolha_Pagamento.EdtFuncionario.Text:= qrychama_clienteNome.AsString;
    FrmFolha_Pagamento.LblCPF.Caption:= qrychama_clienteCPF.AsString;
    FrmFolha_Pagamento.LblCidade.Caption:= qrychama_clienteCidade.AsString;
    FrmFolha_Pagamento.LblSetor.Caption:= qrychama_clienteDescricao.AsString;
    FrmFolha_Pagamento.LblEndereco.Caption:= qrychama_clienteLogradouro.AsString;
    FrmFolha_Pagamento.LblUF.Caption:= qrychama_clienteUF.AsString;
    FrmFolha_Pagamento.LblTipo_Logradouro.Caption:= qrychama_clienteTipo_Logradouro.AsString;
    FrmFolha_Pagamento.LblNumero.Caption:= qrychama_clienteNumero.AsString;
    FrmFolha_Pagamento.LblTelefone.Caption:= qrychama_clienteTelefone.AsString;
  end
  else if (FrmConsulta_Folha_Pagamento <> nil) and (FrmConsulta_Folha_Pagamento.ativo) then
  begin
    FrmConsulta_Folha_Pagamento.EdtCodigo_Funcionario.Text:= qrychama_clienteCodigo.AsString;
    FrmConsulta_Folha_Pagamento.EdtFuncionario.Text:= qrychama_clienteNome.AsString;
  end
  else if (FrmConsulta_Retorno_Cotacao_Preco <> nil) and (FrmConsulta_Retorno_Cotacao_Preco.ativo) then
  begin
    FrmConsulta_Retorno_Cotacao_Preco.EdtCodigo_Funcionario.Text:= qrychama_clienteCodigo.AsString;
    FrmConsulta_Retorno_Cotacao_Preco.EdtFuncionario.Text:= qrychama_clienteNome.AsString;
  end
  else if (FrmConsulta_Compra <> nil) and (FrmConsulta_Compra.ativo) then
  begin
    FrmConsulta_Compra.EdtCodigo_Fornecedor.Text:= qrychama_clienteCodigo.AsString;
    FrmConsulta_Compra.EdtFornecedor.Text:= qrychama_clienteNome.AsString;
  end
  else if (FrmRecibo <> nil) and (FrmRecibo.ativo) then
  begin
    FrmRecibo.EdtCliente.Text:= qrychama_clienteNome.AsString;
    FrmRecibo.EdtEndereco.Text:= qrychama_clienteLogradouro.AsString;
    FrmRecibo.EdtNumero_Cliente.Text:= qrychama_clienteNumero.AsString;
  end
  else if (FrmCadastro_Cheque <> nil) and (FrmCadastro_Cheque.ativo) and (FrmCadastro_Cheque.cli = 1) then
  begin
    FrmCadastro_Cheque.EdtEmitente.Text:= qrychama_clienteNome.AsString;
  end
  else if (FrmCadastro_Cheque <> nil) and (FrmCadastro_Cheque.ativo) and (FrmCadastro_Cheque.cli = 2) then
  begin
    FrmCadastro_Cheque.EdtRecebido_De.Text:= qrychama_clienteNome.AsString;
  end
  else if (FrmCadastro_Cheque <> nil) and (FrmCadastro_Cheque.ativo) and (FrmCadastro_Cheque.cli = 3) then
  begin
    FrmCadastro_Cheque.EdtEnviado_A.Text:= qrychama_clienteNome.AsString;
  end
  else if (FrmChama_Lancamentos_Financeiros <> nil) and (FrmChama_Lancamentos_Financeiros.ativo) then
  begin
    FrmChama_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text:= qrychama_clienteCodigo.AsString;
    FrmChama_Lancamentos_Financeiros.EdtConsulta.Text:= qrychama_clienteNome.AsString;
  end;

    FrmChama_Cliente.Close;

end;

procedure TFrmChama_Cliente.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Cliente.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Cliente.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qrychama_cliente, Column);
end;

procedure TFrmChama_Cliente.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Cliente;
end;

procedure TFrmChama_Cliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Cliente.Release;
end;

procedure TFrmChama_Cliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f4) then
  begin
    if (RGConsulta_Por.ItemIndex = 0) then
      RGConsulta_Por.ItemIndex:= 1
    else if (RGConsulta_Por.ItemIndex = 1) then
      RGConsulta_Por.ItemIndex:= 2
    else if (RGConsulta_Por.ItemIndex = 2) then
      RGConsulta_Por.ItemIndex:= 0;
  end;
end;

procedure TFrmChama_Cliente.FormShow(Sender: TObject);
begin
  Atualiza_Dados;
end;

procedure TFrmChama_Cliente.RGTipoClick(Sender: TObject);
begin
  Atualiza_Dados;
end;

end.
