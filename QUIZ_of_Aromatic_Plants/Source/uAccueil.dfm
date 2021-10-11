object fAccueil: TfAccueil
  Left = 449
  Top = 248
  Width = 536
  Height = 277
  BorderIcons = [biSystemMenu, biMinimize]
  BorderWidth = 8
  Caption = 'QUIZZ des plantes aromatiques'
  Color = clBlack
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -26
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 31
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 512
    Height = 74
    Align = alTop
    Alignment = taLeftJustify
    Caption = '    Votre nom : '
    Color = clYellow
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -30
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object edName: TEdit
      Left = 217
      Top = 13
      Width = 284
      Height = 35
      TabOrder = 0
      Text = 'Joueur'
    end
  end
  object pResultat: TPanel
    Left = 0
    Top = 75
    Width = 512
    Height = 158
    Align = alBottom
    Color = 16711808
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -30
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object bClose: TBitBtn
      Left = 265
      Top = 89
      Width = 232
      Height = 57
      Cursor = crHandPoint
      Caption = 'Fermer'
      TabOrder = 0
      OnClick = bCloseClick
    end
    object bAbout: TBitBtn
      Left = 16
      Top = 89
      Width = 232
      Height = 57
      Cursor = crHandPoint
      Caption = 'A propos ...'
      TabOrder = 1
      OnClick = bAboutClick
    end
    object btQUIZZ: TBitBtn
      Left = 265
      Top = 17
      Width = 232
      Height = 57
      Cursor = crHandPoint
      Caption = 'QUIZZ'
      ModalResult = 1
      TabOrder = 2
      OnClick = pQUIZZClick
    end
    object bRevision: TBitBtn
      Left = 17
      Top = 17
      Width = 232
      Height = 57
      Cursor = crHandPoint
      Caption = 'Revision'
      ModalResult = 1
      TabOrder = 3
      OnClick = bRevisionClick
    end
  end
end
