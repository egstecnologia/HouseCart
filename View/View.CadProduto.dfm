object frmCadastroProduto: TfrmCadastroProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 441
  ClientWidth = 782
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
    Width = 782
    Height = 441
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnlMenuLateral: TPanel
      Left = 1
      Top = 1
      Width = 88
      Height = 439
      Align = alLeft
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object pnlCampos: TPanel
      Left = 89
      Top = 1
      Width = 692
      Height = 439
      Align = alClient
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 95
      object pnlCamposProdutos: TPanel
        Left = 32
        Top = 31
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
        object shpValidade: TShape
          Left = 480
          Top = 124
          Width = 121
          Height = 28
          Shape = stRoundRect
        end
        object lblEstMinimo: TLabel
          Left = 370
          Top = 162
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
        object shpEstMinimo: TShape
          Left = 480
          Top = 163
          Width = 121
          Height = 28
          Shape = stRoundRect
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
        object edtValidade: TEdit
          Left = 488
          Top = 127
          Width = 106
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
        object edtEstMinimo: TEdit
          Left = 489
          Top = 166
          Width = 106
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
          TabOrder = 6
        end
      end
    end
  end
end
