object DMApp: TDMApp
  Height = 453
  Width = 593
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=D:\Danilo\Cursos\AcademiaDoCodigo\MelhorandoDesempEfici' +
        'enciaAplicDelphiCacheDados\DB\dados.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 112
    Top = 128
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 256
    Top = 128
  end
end
