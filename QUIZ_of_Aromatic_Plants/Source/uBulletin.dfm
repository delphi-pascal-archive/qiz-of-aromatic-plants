object fResultat: TfResultat
  Left = 649
  Top = 180
  BorderStyle = bsDialog
  Caption = 'R'#233'sultat'
  ClientHeight = 536
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clGreen
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sg: TStringGrid
    Left = 0
    Top = 49
    Width = 632
    Height = 439
    Align = alClient
    ColCount = 4
    DefaultColWidth = 100
    DefaultRowHeight = 20
    RowCount = 21
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 0
    OnDrawCell = sgDrawCell
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 49
    Align = alTop
    Caption = 'Voici votre bulletin :'
    Color = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 488
    Width = 632
    Height = 48
    Align = alBottom
    Color = clMoneyGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object LScore: TLabel
      Left = 32
      Top = 16
      Width = 97
      Height = 16
      Caption = 'Votre score : '
    end
    object BitBtn1: TBitBtn
      Left = 424
      Top = 12
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkYes
    end
    object BitBtn2: TBitBtn
      Left = 544
      Top = 12
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkNo
    end
  end
end
