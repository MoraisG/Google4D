object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 492
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnList: TButton
    Left = 16
    Top = 16
    Width = 193
    Height = 73
    Caption = 'List Calendar'
    TabOrder = 0
    OnClick = btnListClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 192
    Width = 619
    Height = 233
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
end
