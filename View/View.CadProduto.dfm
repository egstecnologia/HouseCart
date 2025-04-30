object frmCadastroProduto: TfrmCadastroProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 491
  ClientWidth = 834
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlConteiner: TPanel
    Left = 0
    Top = 0
    Width = 834
    Height = 491
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnlMenuLateral: TPanel
      Left = 1
      Top = 1
      Width = 88
      Height = 413
      Align = alLeft
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object pnlCampos: TPanel
      Left = 89
      Top = 1
      Width = 744
      Height = 413
      Align = alClient
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object pnlCamposProdutos: TPanel
        Left = 32
        Top = 30
        Width = 617
        Height = 377
        BevelOuter = bvNone
        TabOrder = 0
        object lblDescricaoProduto: TLabel
          Left = 90
          Top = 95
          Width = 93
          Height = 28
          Caption = 'Descri'#231#227'o: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object shpDescricaoProduto: TShape
          Left = 184
          Top = 93
          Width = 417
          Height = 28
          Shape = stRoundRect
        end
        object lblUnd: TLabel
          Left = 133
          Top = 125
          Width = 52
          Height = 28
          Caption = 'UND: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object shpUnd: TShape
          Left = 184
          Top = 125
          Width = 75
          Height = 28
          Shape = stRoundRect
        end
        object lblUltValorCompra: TLabel
          Left = 21
          Top = 190
          Width = 164
          Height = 28
          Caption = 'Valor Ult. Compra: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object shpUltValorCompra: TShape
          Left = 184
          Top = 189
          Width = 75
          Height = 28
          Shape = stRoundRect
        end
        object lblValorAtual: TLabel
          Left = 79
          Top = 158
          Width = 105
          Height = 28
          Caption = 'Valor Atual: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object shpValorAtual: TShape
          Left = 184
          Top = 157
          Width = 75
          Height = 28
          Shape = stRoundRect
        end
        object lblQtde: TLabel
          Left = 261
          Top = 125
          Width = 57
          Height = 28
          Caption = 'QTDE: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object shpQtde: TShape
          Left = 316
          Top = 125
          Width = 75
          Height = 28
          Shape = stRoundRect
        end
        object lblValidade: TLabel
          Left = 398
          Top = 125
          Width = 84
          Height = 28
          Caption = 'Validade: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object shpEstMinimo: TShape
          Left = 486
          Top = 163
          Width = 115
          Height = 28
          Shape = stRoundRect
        end
        object lblEstMinimo: TLabel
          Left = 370
          Top = 159
          Width = 111
          Height = 28
          Caption = 'Est. Minimo: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 134
          Top = 224
          Width = 49
          Height = 28
          Caption = 'Casa: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtDescricaoProduto: TEdit
          Left = 195
          Top = 95
          Width = 396
          Height = 23
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtUnd: TEdit
          Left = 191
          Top = 127
          Width = 60
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtUltValorCompra: TEdit
          Left = 193
          Top = 192
          Width = 60
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtValorAtual: TEdit
          Left = 193
          Top = 160
          Width = 60
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object edtQtde: TEdit
          Left = 323
          Top = 127
          Width = 60
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object edtEstMinimo: TEdit
          Left = 493
          Top = 166
          Width = 100
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object btnEdtCasa: TButtonedEdit
          Left = 184
          Top = 224
          Width = 89
          Height = 28
          Images = imgList
          LeftButton.DisabledImageIndex = 0
          LeftButton.HotImageIndex = 0
          LeftButton.ImageIndex = 0
          LeftButton.PressedImageIndex = 0
          RightButton.HotImageIndex = 0
          RightButton.ImageIndex = 0
          RightButton.PressedImageIndex = 0
          RightButton.Visible = True
          TabOrder = 6
          OnRightButtonClick = btnEdtCasaRightButtonClick
        end
        object dtValidade: TDateTimePicker
          Left = 486
          Top = 127
          Width = 114
          Height = 26
          Date = 45775.000000000000000000
          Time = 0.802905578704667300
          TabOrder = 7
        end
      end
    end
    object pnlBotoes: TPanel
      Left = 1
      Top = 414
      Width = 832
      Height = 76
      Align = alBottom
      TabOrder = 2
      object pnlBtnAlterar: TPanel
        Left = 234
        Top = 6
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
          ExplicitLeft = 36
          ExplicitTop = 0
        end
      end
      object pnlBtnDesvincular: TPanel
        Left = 413
        Top = 6
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
          ExplicitTop = -3
        end
      end
      object pnlInluir: TPanel
        Left = 88
        Top = 6
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
        Left = 562
        Top = 6
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
  object imgList: TImageList
    Left = 96
    Top = 8
    Bitmap = {
      494C010101000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000002F5B9ADC2B5EA9FF2F8BDFEC0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F3A61894EACF5FF38A4FFFF2C72
      BBE1000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000326F9C9E448CD5FF2D60
      ABFF244E8FD90000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000022406A963A6C
      B5FF2D60ABFF244E8FD900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002342
      6F9C3A6CB5FF2C5FAAFF1F457CBC000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000022406B973A6CB5FF255297E60000000068510EC782660DFF846710FF7F62
      05FF7F6205FF3025095A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001127373790732BFC997C38FFF2DFB1FFF6E2B6FFF4DF
      AEFFE7D1A4FF806409FF795F0DEC000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000876D2DE9A88D4FFFFFF3DCFFFFF3DCFFFFF3DCFFFFF3
      DCFFFEF1D6FFF4DFAEFF816509FF4F3E0C960000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000605020B947731FFFFF3DCFFFFF3DCFFFFF3DCFFFFF3DCFFFFF3
      DCFFFFF3DCFFEEE1B8FFF1DDB0FF7E6204FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000493B187E9E8342FFFFF3DCFFFFF3DCFFFFF3DCFFFFF3DCFFFFF3
      DCFFFFF3DCFFF1E3BDFFF5E0B1FF82660DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005C4A1E9EB19960FFFFF3DCFFFFF3DCFFFFF3DCFFFFF3DCFFFFF3
      DCFFFFF3DCFFECDEB5FFF9E8C4FF8B6E1FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000382D1260967A34FFFFF3DCFFFFF3DCFFFFF3DCFFFFF3DCFFFFF3
      DCFFFFF3DCFFD7C687FFF9E8C2FF8B6E1FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000947731FFFCEFD7FFFFF3DCFFFFF3DCFFFFF3DCFFFFF3
      DCFFE6D7A6FFFDF1D8FFD7C290FF82660FFD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000055451C93947731FFFEF1DAFFFFF3DCFFFAEED3FFEDDF
      B7FFFFF3DCFFE4D3AFFF947731FF110E03210000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005F4D20A4947731FFA98F52FFD5C399FFCDBA
      8CFF977B36FF947731FF211A0A3B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000050402085F4C1FA38E722FF5876C
      2DE8443717760000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
