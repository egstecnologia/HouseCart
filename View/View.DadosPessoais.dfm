object frmAlterarDadosPessoais: TfrmAlterarDadosPessoais
  Left = 0
  Top = 0
  Caption = 'Alterar dados pessoais'
  ClientHeight = 697
  ClientWidth = 1037
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
    Width = 1037
    Height = 697
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 624
    ExplicitHeight = 441
    object pnlLateral: TPanel
      Left = 1
      Top = 1
      Width = 136
      Height = 695
      Align = alLeft
      TabOrder = 0
    end
    object pnlInfo: TPanel
      Left = 137
      Top = 1
      Width = 899
      Height = 695
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 143
      object pnlEmail: TPanel
        Left = 192
        Top = 267
        Width = 497
        Height = 34
        BevelOuter = bvNone
        Padding.Left = 2
        Padding.Top = 2
        Padding.Right = 2
        Padding.Bottom = 2
        TabOrder = 0
        object lblEmail: TLabel
          Left = 2
          Top = 2
          Width = 61
          Height = 30
          Align = alLeft
          Caption = 'Email:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 28
        end
        object shpEmail: TShape
          Left = 63
          Top = 2
          Width = 432
          Height = 30
          Align = alClient
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 216
          ExplicitTop = -16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object edtEmail: TEdit
          Left = 61
          Top = 4
          Width = 429
          Height = 24
          Align = alCustom
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
        end
      end
      object pnlSenha: TPanel
        Left = 183
        Top = 307
        Width = 235
        Height = 34
        BevelOuter = bvNone
        Padding.Left = 2
        Padding.Top = 2
        Padding.Right = 2
        Padding.Bottom = 2
        TabOrder = 1
        object lblSenha: TLabel
          Left = 2
          Top = 2
          Width = 67
          Height = 30
          Align = alLeft
          Caption = 'Senha:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 28
        end
        object shpSenha: TShape
          Left = 69
          Top = 2
          Width = 164
          Height = 30
          Align = alClient
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 216
          ExplicitTop = -16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object edtSenha: TEdit
          Left = 71
          Top = 4
          Width = 155
          Height = 24
          Align = alCustom
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
        end
      end
      object pnlConfSenha: TPanel
        Left = 419
        Top = 307
        Width = 268
        Height = 34
        BevelOuter = bvNone
        Padding.Left = 2
        Padding.Top = 2
        Padding.Right = 2
        Padding.Bottom = 2
        TabOrder = 2
        object lblConfSenha: TLabel
          Left = 2
          Top = 2
          Width = 117
          Height = 30
          Align = alLeft
          Caption = 'Conf. Senha:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 28
        end
        object shpConfSenha: TShape
          Left = 119
          Top = 2
          Width = 147
          Height = 30
          Align = alClient
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 216
          ExplicitTop = -16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object edtConfSenha: TEdit
          Left = 125
          Top = 3
          Width = 134
          Height = 24
          Align = alCustom
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
        end
      end
      object pnlNomeUser: TPanel
        Left = 183
        Top = 228
        Width = 504
        Height = 34
        BevelOuter = bvNone
        Padding.Left = 2
        Padding.Top = 2
        Padding.Right = 2
        Padding.Bottom = 2
        TabOrder = 3
        object lblNomeUser: TLabel
          Left = 2
          Top = 2
          Width = 68
          Height = 30
          Align = alLeft
          Caption = 'Nome:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 28
        end
        object shpNomeUser: TShape
          Left = 70
          Top = 2
          Width = 432
          Height = 30
          Align = alClient
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 216
          ExplicitTop = -16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object edtNomeUser: TEdit
          Left = 76
          Top = 3
          Width = 420
          Height = 24
          Align = alCustom
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
        end
      end
      object pnlBotoes: TPanel
        Left = 0
        Top = 619
        Width = 899
        Height = 76
        Align = alBottom
        TabOrder = 4
        object pnlBtnGravar: TPanel
          Left = 266
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
          object shpBtnGravar: TShape
            Left = 3
            Top = 3
            Width = 137
            Height = 35
            Align = alClient
            Brush.Color = clGreen
            Pen.Color = clGreen
            Pen.Style = psClear
            Shape = stRoundRect
            ExplicitLeft = 64
            ExplicitTop = -8
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object btnGravar: TSpeedButton
            Left = 3
            Top = 3
            Width = 137
            Height = 35
            Align = alClient
            Caption = 'Gravar'
            Flat = True
            ExplicitLeft = 27
          end
        end
        object pnlVoltar: TPanel
          Left = 441
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
            ExplicitLeft = 27
          end
        end
      end
    end
  end
end
