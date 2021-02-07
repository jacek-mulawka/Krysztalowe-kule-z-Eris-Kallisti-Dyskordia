object Klawisze_Konfiguracja_Form: TKlawisze_Konfiguracja_Form
  Left = 0
  Top = 0
  Caption = 
    'Kryszta'#322'owe kule z Eris Kallisti Dyskordia - konfiguracja klawis' +
    'zy'
  ClientHeight = 272
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Lewo_Góra_Etykieta_Label: TLabel
    Left = 15
    Top = 10
    Width = 50
    Height = 13
    Caption = 'Lewo g'#243'ra'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Lewo_Środek_Etykieta_Label: TLabel
    Left = 15
    Top = 40
    Width = 60
    Height = 13
    Caption = 'Lewo '#347'rodek'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Lewo_Dół_Etykieta_Label: TLabel
    Left = 15
    Top = 70
    Width = 43
    Height = 13
    Caption = 'Lewo d'#243#322
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Prawo_Góra_Etykieta_Label: TLabel
    Left = 335
    Top = 10
    Width = 55
    Height = 13
    Caption = 'Prawo g'#243'ra'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Prawo_Środek_Etykieta_Label: TLabel
    Left = 335
    Top = 40
    Width = 65
    Height = 13
    Caption = 'Prawo '#347'rodek'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Prawo_Dół_Etykieta_Label: TLabel
    Left = 335
    Top = 70
    Width = 54
    Height = 13
    Caption = 'Prawo gd'#243#322
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Pauza_Etykieta_Label: TLabel
    Left = 15
    Top = 135
    Width = 29
    Height = 13
    Caption = 'Pauza'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Pełny_Ekran_Etykieta_Label: TLabel
    Left = 15
    Top = 165
    Width = 57
    Height = 13
    Caption = 'Pe'#322'ny ekran'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Zamknij_Etykieta_Label: TLabel
    Left = 15
    Top = 195
    Width = 36
    Height = 13
    Caption = 'Zamknij'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Lewo_Góra_Edit: TEdit
    Left = 85
    Top = 10
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 0
    Text = 'Lewo_G'#243'ra_Edit'
    OnKeyDown = Klawisz_EditKeyDown
  end
  object Lewo_Góra_JvSpinEdit: TJvSpinEdit
    Left = 215
    Top = 10
    Width = 70
    Height = 21
    TabOrder = 1
    OnChange = Klawisz_JvSpinEditChange
  end
  object Lewo_Środek_Edit: TEdit
    Left = 85
    Top = 40
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = 'Lewo_'#346'rodek_Edit'
    OnKeyDown = Klawisz_EditKeyDown
  end
  object Lewo_Środek_JvSpinEdit: TJvSpinEdit
    Left = 215
    Top = 40
    Width = 70
    Height = 21
    TabOrder = 3
    OnChange = Klawisz_JvSpinEditChange
  end
  object Lewo_Dół_Edit: TEdit
    Left = 85
    Top = 70
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 4
    Text = 'Lewo_D'#243#322'_Edit'
    OnKeyDown = Klawisz_EditKeyDown
  end
  object Lewo_Dół_JvSpinEdit: TJvSpinEdit
    Left = 215
    Top = 70
    Width = 70
    Height = 21
    TabOrder = 5
    OnChange = Klawisz_JvSpinEditChange
  end
  object Prawo_Góra_Edit: TEdit
    Left = 405
    Top = 10
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 6
    Text = 'Prawo_G'#243'ra_Edit'
    OnKeyDown = Klawisz_EditKeyDown
  end
  object Prawo_Góra_JvSpinEdit: TJvSpinEdit
    Left = 535
    Top = 10
    Width = 70
    Height = 21
    TabOrder = 7
    OnChange = Klawisz_JvSpinEditChange
  end
  object Prawo_Środek_Edit: TEdit
    Left = 405
    Top = 40
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 8
    Text = 'Prawo_'#346'rodek_Edit'
    OnKeyDown = Klawisz_EditKeyDown
  end
  object Prawo_Środek_JvSpinEdit: TJvSpinEdit
    Left = 535
    Top = 40
    Width = 70
    Height = 21
    TabOrder = 9
    OnChange = Klawisz_JvSpinEditChange
  end
  object Prawo_Dół_Edit: TEdit
    Left = 405
    Top = 70
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 10
    Text = 'Prawo_D'#243#322'_Edit'
    OnKeyDown = Klawisz_EditKeyDown
  end
  object Prawo_Dół_JvSpinEdit: TJvSpinEdit
    Left = 535
    Top = 70
    Width = 70
    Height = 21
    TabOrder = 11
    OnChange = Klawisz_JvSpinEditChange
  end
  object Pauza_Edit: TEdit
    Left = 85
    Top = 130
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 12
    Text = 'Pauza_Edit'
    OnKeyDown = Klawisz_EditKeyDown
  end
  object Pauza_JvSpinEdit: TJvSpinEdit
    Left = 215
    Top = 130
    Width = 70
    Height = 21
    TabOrder = 13
    OnChange = Klawisz_JvSpinEditChange
  end
  object Pełny_Ekran_Edit: TEdit
    Left = 85
    Top = 160
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 14
    Text = 'Pe'#322'ny_Ekran_Edit'
    OnKeyDown = Klawisz_EditKeyDown
  end
  object Pełny_Ekran_JvSpinEdit: TJvSpinEdit
    Left = 215
    Top = 160
    Width = 70
    Height = 21
    TabOrder = 15
    OnChange = Klawisz_JvSpinEditChange
  end
  object Zamknij_Edit: TEdit
    Left = 85
    Top = 190
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 16
    Text = 'Zamknij_Edit'
    OnKeyDown = Klawisz_EditKeyDown
  end
  object Zamknij_JvSpinEdit: TJvSpinEdit
    Left = 215
    Top = 190
    Width = 70
    Height = 21
    TabOrder = 17
    OnChange = Klawisz_JvSpinEditChange
  end
  object Klawisze_Konfiguracja_Korzystaj_CheckBox: TCheckBox
    Left = 335
    Top = 194
    Width = 200
    Height = 17
    Hint = 
      'Prze'#322#261'cza mi'#281'dzy korzystaniem z konfiguracji klawiszy a ustawien' +
      'iami standardowymi.'
    Caption = 'Korzystaj z konfiguracji klawiszy'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
  end
  object Domyślne_Button: TButton
    Left = 40
    Top = 235
    Width = 75
    Height = 25
    Caption = 'Domy'#347'lne'
    TabOrder = 19
    OnClick = Domyślne_ButtonClick
  end
  object OK_Button: TButton
    Left = 185
    Top = 235
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 20
  end
  object Zapisz_Button: TButton
    Left = 330
    Top = 235
    Width = 75
    Height = 25
    Caption = 'Zapisz'
    TabOrder = 21
    OnClick = Zapisz_ButtonClick
  end
  object Anuluj_Button: TButton
    Left = 490
    Top = 235
    Width = 75
    Height = 25
    Caption = 'Anuluj'
    ModalResult = 2
    TabOrder = 22
    OnClick = Anuluj_ButtonClick
  end
end
