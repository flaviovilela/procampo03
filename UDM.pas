unit UDM;

interface

uses
  SysUtils, Classes, ImgList, Controls, DB, ADODB;

type
  TDM = class(TDataModule)
    ImgComandos: TImageList;
    ADOConnection1: TADOConnection;
    ImgChama: TImageList;
    ImgImagens_Consulta: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
