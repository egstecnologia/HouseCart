unit Model.Usuario;

interface

uses
  SysUtils;

type
  TUsuario = class

    private
      FIDUsuario: Integer;
      FNome: String;
      FEmail: String;
      FSenha: String;

    public
      property IDUsuario: Integer read FIDUsuario write FIDUsuario;
      property Nome: String read FNome write FNome;
      property Email: String read FEmail write FEmail;
      property Senha: String read FSenha write FSenha;

  end;
      //id_usuario, nome, email e senha


implementation

end.
