object frmVinculoResidencia: TfrmVinculoResidencia
  Left = 0
  Top = 0
  Caption = 'frmVinculoResidencia'
  ClientHeight = 414
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlContainer: TPanel
    Left = 0
    Top = 0
    Width = 582
    Height = 414
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lblVinculoResidencia: TLabel
      Left = 154
      Top = 91
      Width = 203
      Height = 21
      Caption = 'Digite o c'#243'digo de resid'#234'ncia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object shpDescricao: TShape
      Left = 154
      Top = 118
      Width = 249
      Height = 38
      Shape = stRoundRect
    end
    object pnlBtnSair: TPanel
      Left = 279
      Top = 162
      Width = 90
      Height = 34
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object shpBtnSair: TShape
        Left = 0
        Top = 0
        Width = 90
        Height = 34
        Align = alClient
        Brush.Color = 1542597
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = -24
        ExplicitWidth = 105
        ExplicitHeight = 33
      end
      object btnSair: TSpeedButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 84
        Height = 28
        Align = alClient
        AllowAllUp = True
        BiDiMode = bdLeftToRight
        Caption = 'Sair'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBiDiMode = False
        ExplicitLeft = -5
        ExplicitTop = 22
      end
    end
    object pnlBtnGravar: TPanel
      Left = 163
      Top = 162
      Width = 90
      Height = 34
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object shpBtnGravar: TShape
        Left = 0
        Top = 0
        Width = 90
        Height = 34
        Align = alClient
        Brush.Color = 1540344
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = -24
        ExplicitWidth = 105
        ExplicitHeight = 33
      end
      object btnGravar: TSpeedButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 84
        Height = 28
        Align = alClient
        AllowAllUp = True
        BiDiMode = bdLeftToRight
        Caption = 'Gravar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBiDiMode = False
        OnClick = btnGravarClick
        ExplicitLeft = -21
        ExplicitTop = -5
        ExplicitWidth = 99
        ExplicitHeight = 27
      end
    end
    object edtShortId: TEdit
      Left = 160
      Top = 121
      Width = 236
      Height = 32
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
    end
  end
end
