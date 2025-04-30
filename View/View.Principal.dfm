object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Home'
  ClientHeight = 653
  ClientWidth = 1067
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 15
  object pnlContainer: TPanel
    Left = 0
    Top = 0
    Width = 1067
    Height = 653
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlGroupMenu: TPanel
      Left = 0
      Top = 0
      Width = 129
      Height = 653
      Align = alLeft
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 0
      object pnlBtnCasas: TPanel
        Left = 4
        Top = 45
        Width = 121
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Padding.Left = 3
        Padding.Top = 3
        Padding.Right = 3
        Padding.Bottom = 3
        TabOrder = 0
        object shpBtnCasa: TShape
          Left = 3
          Top = 3
          Width = 115
          Height = 35
          Align = alClient
          Pen.Style = psClear
          ExplicitLeft = 64
          ExplicitTop = -8
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnCasas: TSpeedButton
          Left = 3
          Top = 3
          Width = 115
          Height = 35
          Align = alClient
          Caption = 'Acessar Casas'
          OnClick = btnCasasClick
          ExplicitLeft = 4
        end
      end
      object pnlInfoUser: TPanel
        Left = 4
        Top = 4
        Width = 121
        Height = 41
        Align = alTop
        Caption = 'Usuario Logado'
        Padding.Left = 3
        Padding.Top = 3
        Padding.Right = 3
        Padding.Bottom = 3
        TabOrder = 1
      end
      object pnlBtnDadosPessoais: TPanel
        Left = 4
        Top = 86
        Width = 121
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Padding.Left = 3
        Padding.Top = 3
        Padding.Right = 3
        Padding.Bottom = 3
        TabOrder = 2
        object shpBtnDadosPessoais: TShape
          Left = 3
          Top = 3
          Width = 115
          Height = 35
          Align = alClient
          Pen.Style = psClear
          ExplicitLeft = 64
          ExplicitTop = -8
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnDadosPessoais: TSpeedButton
          Left = 3
          Top = 3
          Width = 115
          Height = 35
          Align = alClient
          Caption = 'Dados Pessoais'
          OnClick = btnDadosPessoaisClick
          ExplicitLeft = 80
          ExplicitTop = 8
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object pnlBtnProdutos: TPanel
        Left = 4
        Top = 127
        Width = 121
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Padding.Left = 3
        Padding.Top = 3
        Padding.Right = 3
        Padding.Bottom = 3
        TabOrder = 3
        ExplicitTop = 86
        object shpBtnProdutos: TShape
          Left = 3
          Top = 3
          Width = 115
          Height = 35
          Align = alClient
          Pen.Style = psClear
          ExplicitLeft = 64
          ExplicitTop = -8
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnProdutos: TSpeedButton
          Left = 3
          Top = 3
          Width = 115
          Height = 35
          Align = alClient
          Caption = 'Produtos'
          OnClick = btnProdutosClick
          ExplicitLeft = 80
          ExplicitTop = 8
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
    end
    object pnlForm: TPanel
      Left = 129
      Top = 0
      Width = 938
      Height = 653
      Align = alClient
      TabOrder = 1
    end
  end
end
