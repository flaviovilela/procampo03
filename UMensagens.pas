unit UMensagens;

interface

  type
    TMensagens = class
      public
        class procedure MensagemInformacao(Mensagem: String);
        class procedure MensagemWarning(Mensagem: String);
        class procedure MensagemErro(Mensagem: String);

    end;

implementation

uses
  Forms, Windows;

{ TMensagens }

class procedure TMensagens.MensagemErro(Mensagem: String);
begin
  Application.MessageBox(PWideChar(Mensagem), 'Aviso. Por favor, leia!', MB_OK+MB_ICONHAND);
end;

class procedure TMensagens.MensagemInformacao(Mensagem: String);
begin
  Application.MessageBox(PWideChar(Mensagem), 'Aviso. Por favor, leia!', MB_OK+MB_ICONQUESTION);
end;

class procedure TMensagens.MensagemWarning(Mensagem: String);
begin
  Application.MessageBox(PWideChar(Mensagem), 'Aviso. Por favor, leia!', MB_OK+MB_ICONEXCLAMATION);
end;

end.
