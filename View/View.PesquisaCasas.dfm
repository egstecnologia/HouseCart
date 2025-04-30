object frmPesquisaCasa: TfrmPesquisaCasa
  Left = 0
  Top = 0
  Caption = 'Pesquisas Casas'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object pnlContainer: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    TabOrder = 0
    object pnlLvCasas: TPanel
      Left = 1
      Top = 1
      Width = 622
      Height = 363
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 439
      object lvCasas: TListView
        Left = 1
        Top = 1
        Width = 620
        Height = 361
        Align = alClient
        BevelKind = bkFlat
        Color = clWhite
        Columns = <
          item
            Caption = 'ID'
          end
          item
            Caption = 'Descri'#231#227'o'
            Width = 150
          end
          item
            Caption = 'Short ID'
            Width = 150
          end>
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        ExplicitLeft = 2
        ExplicitTop = 5
      end
    end
    object pnlBotoes: TPanel
      Left = 1
      Top = 364
      Width = 622
      Height = 76
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 589
      ExplicitWidth = 992
      object pnlBtnSelecionar: TPanel
        Left = 180
        Top = 9
        Width = 143
        Height = 41
        Align = alCustom
        BevelOuter = bvNone
        Padding.Left = 3
        Padding.Top = 3
        Padding.Right = 3
        Padding.Bottom = 3
        TabOrder = 0
        object shpBtnDesvincular: TShape
          Left = 3
          Top = 3
          Width = 137
          Height = 35
          Align = alClient
          Pen.Style = psClear
          ExplicitLeft = 64
          ExplicitTop = -8
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnBtnSelecionar: TSpeedButton
          Left = 3
          Top = 3
          Width = 137
          Height = 35
          Align = alClient
          Caption = 'Selecionar'
          OnClick = btnBtnSelecionarClick
          ExplicitLeft = -29
          ExplicitTop = 11
        end
      end
      object pnlVoltar: TPanel
        Left = 334
        Top = 9
        Width = 143
        Height = 41
        Align = alCustom
        BevelOuter = bvNone
        Padding.Left = 3
        Padding.Top = 3
        Padding.Right = 3
        Padding.Bottom = 3
        TabOrder = 1
        object shpBtnVoltar: TShape
          Left = 3
          Top = 3
          Width = 137
          Height = 35
          Align = alClient
          Pen.Style = psClear
          ExplicitLeft = 64
          ExplicitTop = -8
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnVoltar: TSpeedButton
          Left = 3
          Top = 3
          Width = 137
          Height = 35
          Align = alClient
          Caption = 'Voltar'
          OnClick = btnVoltarClick
          ExplicitLeft = 107
          ExplicitTop = 19
        end
      end
    end
  end
end
