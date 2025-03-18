object frmPerguntaResidencia: TfrmPerguntaResidencia
  Left = 0
  Top = 0
  ClientHeight = 145
  ClientWidth = 419
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
    Width = 419
    Height = 145
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 184
    ExplicitTop = 112
    ExplicitWidth = 185
    ExplicitHeight = 41
    object lblPergunta: TLabel
      Left = 40
      Top = 32
      Width = 333
      Height = 24
      Caption = 'Voc'#234' j'#225' '#233' membro de uma resid'#234'ncia?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object pnlBtnSim: TPanel
      Left = 95
      Top = 65
      Width = 90
      Height = 34
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object shpBtnSim: TShape
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
      object btnSim: TSpeedButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 84
        Height = 28
        Align = alClient
        AllowAllUp = True
        BiDiMode = bdLeftToRight
        Caption = 'Sim'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBiDiMode = False
        ExplicitLeft = -21
        ExplicitTop = -5
        ExplicitWidth = 99
        ExplicitHeight = 27
      end
    end
    object pnlBtnNao: TPanel
      Left = 211
      Top = 65
      Width = 90
      Height = 34
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object shpBtnNao: TShape
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
      object btnNao: TSpeedButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 84
        Height = 28
        Align = alClient
        AllowAllUp = True
        BiDiMode = bdLeftToRight
        Caption = 'N'#227'o'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentBiDiMode = False
        ExplicitLeft = -21
        ExplicitTop = -5
        ExplicitWidth = 99
        ExplicitHeight = 27
      end
    end
  end
end
