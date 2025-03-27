object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 661
  ClientWidth = 911
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnlContainer: TPanel
    Left = 0
    Top = 0
    Width = 911
    Height = 661
    Align = alClient
    TabOrder = 0
    ExplicitTop = -8
    ExplicitWidth = 822
    ExplicitHeight = 441
    object pnlLvResisdencias: TPanel
      Left = 1
      Top = 1
      Width = 909
      Height = 583
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 0
      ExplicitHeight = 432
      object lvResidencias: TListView
        Left = 1
        Top = 1
        Width = 907
        Height = 581
        Align = alClient
        Columns = <
          item
            Caption = 'ID'
          end
          item
            Caption = 'Descri'#231#227'o'
          end
          item
            Caption = 'Short ID'
          end>
        TabOrder = 0
        ExplicitLeft = 224
        ExplicitTop = 200
        ExplicitWidth = 250
        ExplicitHeight = 150
      end
    end
    object pnlBotoes: TPanel
      Left = 1
      Top = 584
      Width = 909
      Height = 76
      Align = alBottom
      TabOrder = 1
    end
  end
end
