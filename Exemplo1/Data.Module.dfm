object DMApp: TDMApp
  Height = 453
  Width = 593
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=D:\Danilo\Cursos\AcademiaDoCodigo\MelhorandoDesempEfici' +
        'enciaAplicDelphiCacheDados\DB\dados.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 112
    Top = 128
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from cliente')
    Left = 256
    Top = 128
  end
end
