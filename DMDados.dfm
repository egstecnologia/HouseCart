object DM_Dados: TDM_Dados
  OnCreate = DataModuleCreate
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
    Left = 48
    Top = 88
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 168
    Top = 88
  end
  object FDConnection2: TFDConnection
    ConnectionName = 'HOUSE.FDB'
    Params.Strings = (
      'Database=C:\Estudos\DelphiEstudos\AulasErick\Banco\HOUSE.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=fB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 168
  end
end
