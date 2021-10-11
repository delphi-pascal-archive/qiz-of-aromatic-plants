object fAide: TfAide
  Left = 207
  Top = 153
  Width = 911
  Height = 532
  Caption = 'R'#233'vision'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object Planche: TPanel
    Left = 0
    Top = 0
    Width = 895
    Height = 453
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 453
    Width = 895
    Height = 41
    Align = alBottom
    Caption = 
      'Survoler l'#39'image pour voir le nom de la plante repr'#233'sent'#233'e ou Cl' +
      'iquez pour l'#39'agrandir.'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
end
