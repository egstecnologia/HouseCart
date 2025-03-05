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
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 88
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 168
    Top = 88
  end
end
