object frmResidencias: TfrmResidencias
  Left = 0
  Top = 0
  Caption = 'Resid'#234'ncias'
  ClientHeight = 661
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object pnlContainer: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 661
    Align = alClient
    TabOrder = 0
    object pnlLvResisdencias: TPanel
      Left = 1
      Top = 1
      Width = 992
      Height = 583
      Align = alClient
      TabOrder = 0
      object lvResidencias: TListView
        Left = 1
        Top = 1
        Width = 990
        Height = 581
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clWhite
        Columns = <
          item
            Caption = 'ID'
          end
          item
            Caption = 'Descri'#231#227'o'
            Width = 100
          end
          item
            Caption = 'Short ID'
            Width = 100
          end>
        HideSelection = False
        StyleName = 'Windows'
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object pnlBotoes: TPanel
      Left = 1
      Top = 584
      Width = 992
      Height = 76
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 589
      object pnlBtnAlterar: TPanel
        Left = 31
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
        object shpBtnAlterar: TShape
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
        object btnAlterar: TSpeedButton
          Left = 3
          Top = 3
          Width = 137
          Height = 35
          Align = alClient
          Caption = 'Alterar'
          OnClick = btnAlterarClick
          ExplicitLeft = 27
          ExplicitTop = 11
        end
      end
      object pnlBtnDesvincular: TPanel
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
        TabOrder = 1
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
        object btnDesvincular: TSpeedButton
          Left = 3
          Top = 3
          Width = 137
          Height = 35
          Align = alClient
          Caption = 'Desvincular'
          OnClick = btnDesvincularClick
          ExplicitLeft = 43
          ExplicitTop = 11
        end
      end
      object pnlInluir: TPanel
        Left = 326
        Top = 9
        Width = 143
        Height = 41
        Align = alCustom
        BevelOuter = bvNone
        Padding.Left = 3
        Padding.Top = 3
        Padding.Right = 3
        Padding.Bottom = 3
        TabOrder = 2
        object shpBtnIncluir: TShape
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
        object btnIncluir: TSpeedButton
          Left = 3
          Top = 3
          Width = 137
          Height = 35
          Align = alClient
          Caption = 'Incluir'
          OnClick = btnIncluirClick
          ExplicitLeft = 43
          ExplicitTop = 11
        end
      end
      object pnlVoltar: TPanel
        Left = 473
        Top = 9
        Width = 143
        Height = 41
        Align = alCustom
        BevelOuter = bvNone
        Padding.Left = 3
        Padding.Top = 3
        Padding.Right = 3
        Padding.Bottom = 3
        TabOrder = 3
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
