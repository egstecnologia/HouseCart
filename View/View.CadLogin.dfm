object frmCadLogin: TfrmCadLogin
  Left = 0
  Top = 0
  Caption = 'Cadastro /Login'
  ClientHeight = 441
  ClientWidth = 712
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlContainerLogin: TPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 441
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 264
    ExplicitTop = 184
    ExplicitWidth = 185
    ExplicitHeight = 41
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 710
      Height = 41
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 264
      ExplicitTop = 200
      ExplicitWidth = 185
    end
    object pnlBottom: TPanel
      Left = 1
      Top = 399
      Width = 710
      Height = 41
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = 240
      ExplicitTop = 152
      ExplicitWidth = 185
    end
    object pnlClient: TPanel
      Left = 1
      Top = 42
      Width = 710
      Height = 357
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 208
      ExplicitTop = 176
      ExplicitWidth = 185
      ExplicitHeight = 41
      object tbcCadLogin: TTabControl
        Left = 1
        Top = 1
        Width = 708
        Height = 355
        Align = alClient
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TabPosition = tpBottom
        Tabs.Strings = (
          'Login'
          'Cadastro')
        TabIndex = 0
        StyleName = 'Windows'
        object lblSenha: TLabel
          Left = 32
          Top = 128
          Width = 57
          Height = 28
          Caption = 'Senha:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblNome: TLabel
          Left = 32
          Top = 80
          Width = 58
          Height = 28
          Caption = 'Nome:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
end
