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
    ExplicitLeft = 304
    ExplicitTop = 224
    ExplicitWidth = 185
    ExplicitHeight = 41
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
        Left = 56
        Top = 24
        Width = 553
        Height = 377
        BevelOuter = bvNone
        TabOrder = 0
        object lblDescricaoProduto: TLabel
          Left = 0
          Top = 39
          Width = 92
          Height = 29
          Caption = 'Descri'#231#227'o: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object shpDescricaoProduto: TShape
          Left = 94
          Top = 37
          Width = 417
          Height = 28
          Shape = stRoundRect
        end
        object lblUnd: TLabel
          Left = 40
          Top = 70
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
          Left = 94
          Top = 69
          Width = 75
          Height = 28
          Shape = stRoundRect
        end
        object edtDescricaoProduto: TEdit
          Left = 105
          Top = 39
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
          Left = 101
          Top = 71
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
      end
    end
  end
end
