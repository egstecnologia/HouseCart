object DM_Dados: TDM_Dados
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    ConnectionName = 'HOUSE.FDB'
    Params.Strings = (
      'Database=C:\Estudos\DelphiEstudos\AulasErick\Banco\HOUSE.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=fB')
    LoginPrompt = False
    Left = 80
    Top = 88
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 168
    Top = 88
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 272
    Top = 88
  end
end
