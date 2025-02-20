unit Cliente;

interface

uses
  SimpleAttributes;

type
  [Tabela('CLIENTE')]
  TClientes = class
    private
    Fbairro: String;
    Fcodigo: Integer;
    Fano: Integer;
    Fnome: String;
    Fendereco: String;
    Fcidade: String;
    Fsexo: String;
      [Campo('CODIGO')]
      property codigo: Integer read Fcodigo write Fcodigo;
      [Campo('NOME')]
      property nome: String read Fnome write Fnome;
      [Campo('ANO')]
      property ano: Integer read Fano write Fano;
      [Campo('ENDERECO')]
      property endereco: String read Fendereco write Fendereco;
      [Campo('BAIRRO')]
      property bairro: String read Fbairro write Fbairro;
      [Campo('CIDADE')]
      property cidade: String read Fcidade write Fcidade;
      [Campo('SEXO')]
      property sexo: String read Fsexo write Fsexo;

    public
  end;


implementation

end.
