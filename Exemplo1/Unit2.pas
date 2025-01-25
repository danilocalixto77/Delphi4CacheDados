unit Unit2;

interface

uses
  Data.DB;

type
  iDAO = Interface
      Function Consultar : TDAtaSet;
      Function Inserir(Value : TDataSet): iDao;
      Function Atualizar(Value : TDataSet): iDao;
      Function Excluir(Value: Integer): IDao;
  End;

implementation

end.
