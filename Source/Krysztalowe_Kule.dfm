object Krysztalowe_Kule_Form: TKrysztalowe_Kule_Form
  Left = 0
  Top = 0
  Caption = 'Kryszta'#322'owe kule z Eris Kallisti Dyskordia'
  ClientHeight = 362
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Lewo_Panel: TPanel
    Left = 0
    Top = 151
    Width = 100
    Height = 211
    Align = alLeft
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    object Wyniki_Panel: TPanel
      Left = 1
      Top = 110
      Width = 98
      Height = 100
      Align = alBottom
      Color = clNavy
      ParentBackground = False
      TabOrder = 3
      object Kul_Na_Planszy_Label: TLabel
        Left = 5
        Top = 5
        Width = 68
        Height = 26
        Caption = 'Kul na planszy'#13#10'<?>.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Kul_Nie_Złapanych_Label: TLabel
        Left = 5
        Top = 65
        Width = 83
        Height = 26
        Caption = 'Kul nie z'#322'apanych'#13#10'<?>.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Kul_Złapanych_Label: TLabel
        Left = 5
        Top = 35
        Width = 66
        Height = 26
        Caption = 'Kul z'#322'apanych'#13#10'<?>.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object Lewo_Góra_Button: TButton
      Left = 0
      Top = 20
      Width = 100
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Przycisk_ButtonMouseEnter
      OnMouseEnter = Przycisk_ButtonMouseEnter
      OnMouseLeave = Przycisk_ButtonMouseLeave
    end
    object Lewo_Środek_Button: TButton
      Left = 0
      Top = 45
      Width = 100
      Height = 25
      TabOrder = 1
      OnClick = Przycisk_ButtonMouseEnter
      OnMouseEnter = Przycisk_ButtonMouseEnter
      OnMouseLeave = Przycisk_ButtonMouseLeave
    end
    object Lewo_Dół_Button: TButton
      Left = 0
      Top = 70
      Width = 100
      Height = 25
      TabOrder = 2
      OnClick = Przycisk_ButtonMouseEnter
      OnMouseEnter = Przycisk_ButtonMouseEnter
      OnMouseLeave = Przycisk_ButtonMouseLeave
    end
    object Lewo_Góra_Odstęp_Panel: TPanel
      Left = 1
      Top = 1
      Width = 98
      Height = 20
      Align = alTop
      Color = clNavy
      ParentBackground = False
      TabOrder = 4
    end
  end
  object Prawo_Panel: TPanel
    Left = 484
    Top = 151
    Width = 100
    Height = 211
    Align = alRight
    Color = clNavy
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      100
      211)
    object Współczynnik_Trudności_ProgressBar_Max_Label: TLabel
      Left = 55
      Top = 75
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '<?>.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Współczynnik_Trudności_ProgressBar: TProgressBar
      Left = 85
      Top = 75
      Width = 15
      Height = 63
      Orientation = pbVertical
      Step = 1
      TabOrder = 4
    end
    object Prawo_Góra_Button: TButton
      Left = 0
      Top = 20
      Width = 100
      Height = 25
      TabOrder = 0
      OnClick = Przycisk_ButtonMouseEnter
      OnMouseEnter = Przycisk_ButtonMouseEnter
      OnMouseLeave = Przycisk_ButtonMouseLeave
    end
    object Prawo_Środek_Button: TButton
      Left = 0
      Top = 45
      Width = 100
      Height = 25
      TabOrder = 1
      OnClick = Przycisk_ButtonMouseEnter
      OnMouseEnter = Przycisk_ButtonMouseEnter
      OnMouseLeave = Przycisk_ButtonMouseLeave
    end
    object Prawo_Dół_Button: TButton
      Left = 0
      Top = 70
      Width = 100
      Height = 25
      TabOrder = 2
      OnClick = Przycisk_ButtonMouseEnter
      OnMouseEnter = Przycisk_ButtonMouseEnter
      OnMouseLeave = Przycisk_ButtonMouseLeave
    end
    object Współczynnik_Trudności_Panel: TPanel
      Left = 1
      Top = 140
      Width = 98
      Height = 70
      Align = alBottom
      Color = clNavy
      ParentBackground = False
      TabOrder = 3
      DesignSize = (
        98
        70)
      object Współczynnik_Trudności_Label: TLabel
        Left = 45
        Top = 35
        Width = 44
        Height = 26
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Trudno'#347#263#13#10'<?>.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Współczynnik_Trudności_Najwyższy_Osiągnięty_Label: TLabel
        Left = 8
        Top = 5
        Width = 81
        Height = 26
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Rekord trudno'#347'ci'#13#10'<?>.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 16777081
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object Prawo_Góra_Odstęp_Panel: TPanel
      Left = 1
      Top = 1
      Width = 98
      Height = 20
      Align = alTop
      Color = clNavy
      ParentBackground = False
      TabOrder = 5
    end
  end
  object O_Programie_Panel: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 151
    Align = alTop
    TabOrder = 2
    Visible = False
    object O_Programie_Label: TLabel
      Left = 1
      Top = 1
      Width = 582
      Height = 149
      Align = alClient
      Caption = 
        'Kryszta'#322'owe kule z Eris Kallisti Dyskordia'#13#10'wersja 2021.02.07.'#13#10 +
        #13#10'MIT License'#13#10#13#10'Copyright (c) 2017 Jacek Mulawka'#13#10#13#10'j.mulawka@i' +
        'nteria.pl'#13#10#13#10'https://github.com/jacek-mulawka'#13#10#13#10#13#10'Program jest ' +
        'darmowy, udost'#281'pniony w postaci takiej jakiej jest wraz ze wszys' +
        'tkimi b'#322#281'dami. U'#380'ytkownik zyskuje dost'#281'p do programu, u'#380'ywa prog' +
        'ramu na w'#322'asne ryzyko i ponosi wy'#322#261'czn'#261' odpowiedzialno'#347#263' za wsze' +
        'lkie szkody (w'#322'asne i niew'#322'asne) materialne i niematerialne oraz' +
        ' utrat'#281' danych w zwi'#261'zku z u'#380'ywaniem programu.'
      WordWrap = True
      ExplicitWidth = 578
      ExplicitHeight = 195
    end
  end
  object Gra_Panel: TPanel
    Left = 100
    Top = 151
    Width = 384
    Height = 211
    Align = alClient
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    DesignSize = (
      384
      211)
    object GLSceneViewer1: TGLSceneViewer
      Left = 110
      Top = 0
      Width = 100
      Height = 100
      Camera = GLCamera1
      FieldOfView = 90.000000000000000000
      Anchors = [akLeft, akTop, akRight, akBottom]
      OnMouseMove = GLSceneViewer1MouseMove
      TabOrder = 0
    end
  end
  object MainMenu1: TMainMenu
    Left = 135
    Top = 25
    object Gra_MenuItem: TMenuItem
      Caption = '      Gra      '
      OnClick = MainMenu1_MenuItemClick
      object Gra__Nowa_MenuItem: TMenuItem
        Caption = 'Nowa gra'
        OnClick = Gra__Nowa_MenuItemClick
      end
      object Gra__Nowa_Odstęp_MenuItem: TMenuItem
        OnClick = MainMenu1_MenuItemClick
      end
      object Gra__Wyczyść_MenuItem: TMenuItem
        Caption = 'Wyczy'#347#263
        OnClick = Gra__Wyczyść_MenuItemClick
      end
      object Gra__Wyczyść_Odstęp_MenuItem: TMenuItem
        OnClick = MainMenu1_MenuItemClick
      end
      object Gra__Maksymalizuj_MenuItem: TMenuItem
        Caption = 'Maksymalizuj okno'
        OnClick = Gra__Maksymalizuj_MenuItemClick
      end
      object Gra__Maksymalizuj_Odstęp_1_MenuItem: TMenuItem
        OnClick = Gra__Maksymalizuj_MenuItemClick
      end
      object Gra__Maksymalizuj_Odstęp_2_MenuItem: TMenuItem
        OnClick = Gra__Maksymalizuj_MenuItemClick
      end
      object Gra__Normalizuj_MenuItem: TMenuItem
        Caption = 'Normalizuj okno'
        OnClick = Gra__Normalizuj_MenuItemClick
      end
      object Gra__Normalizuj_Odstęp_1_MenuItem: TMenuItem
        OnClick = Gra__Normalizuj_MenuItemClick
      end
      object Gra__Normalizuj_Odstęp_2_MenuItem: TMenuItem
        OnClick = Gra__Normalizuj_MenuItemClick
      end
      object Gra__Minimalizuj_MenuItem: TMenuItem
        Caption = 'Minimalizuj okno'
        OnClick = Gra__Minimalizuj_MenuItemClick
      end
      object Gra__Minimalizuj_Odstęp_1_MenuItem: TMenuItem
        OnClick = Gra__Minimalizuj_MenuItemClick
      end
      object Gra__Minimalizuj_Odstęp_2_MenuItem: TMenuItem
        OnClick = Gra__Minimalizuj_MenuItemClick
      end
      object Gra__Zamknij_MenuItem: TMenuItem
        Caption = 'Zamknij'
        OnClick = Gra__Zamknij_MenuItemClick
      end
    end
    object Opcje_MenuItem: TMenuItem
      Caption = '      Opcje      '
      OnClick = MainMenu1_MenuItemClick
      object Opcje__Rzędy_2_MenuItem: TMenuItem
        AutoCheck = True
        Caption = '2 rz'#281'dy'
        Checked = True
        RadioItem = True
        OnClick = MainMenu1_MenuItemClick
      end
      object Opcje__Rzędy_2_Odstęp_MenuItem: TMenuItem
        OnClick = MainMenu1_MenuItemClick
      end
      object Opcje__Rzędy_3_MenuItem: TMenuItem
        AutoCheck = True
        Caption = '3 rz'#281'dy'
        RadioItem = True
        OnClick = MainMenu1_MenuItemClick
      end
      object Opcje__Rzędy_3_Odstęp_MenuItem: TMenuItem
        OnClick = MainMenu1_MenuItemClick
      end
      object Opcje__Odkładaj_Kule_W_Tle_MenuItem: TMenuItem
        AutoCheck = True
        Caption = 'Odk'#322'adaj kule w tle'
        OnClick = MainMenu1_MenuItemClick
      end
      object Opcje__Odkładaj_Kule_W_Tle_Odstęp_MenuItem: TMenuItem
        OnClick = MainMenu1_MenuItemClick
      end
      object Opcje__Pełny_Ekran_MenuItem: TMenuItem
        AutoCheck = True
        Caption = 'Pe'#322'ny ekran'
        OnClick = Opcje__Pełny_Ekran_MenuItemClick
      end
      object Opcje__Pełny_Ekran_Odstęp_MenuItem: TMenuItem
        OnClick = MainMenu1_MenuItemClick
      end
      object Opcje__Bonusy_MenuItem: TMenuItem
        AutoCheck = True
        Caption = 'Bonusy'
        Checked = True
        OnClick = MainMenu1_MenuItemClick
      end
      object Opcje__Bonusy_Odstęp_MenuItem: TMenuItem
        OnClick = MainMenu1_MenuItemClick
      end
      object Opcje__Bonusy_Tylko_Pozytywne_MenuItem: TMenuItem
        AutoCheck = True
        Caption = 'Bonusy - tylko pozytywne'
        OnClick = MainMenu1_MenuItemClick
      end
    end
    object Ustawienia_MenuItem: TMenuItem
      Caption = '      Ustawienia'
      OnClick = MainMenu1_MenuItemClick
      object Ustawienia__Zapisz_MenuItem: TMenuItem
        Caption = 'Zapisz'
        OnClick = Zapisz_Ustawienia
      end
      object Ustawienia__Zapisz_Odstęp_MenuItem: TMenuItem
        OnClick = MainMenu1_MenuItemClick
      end
      object Ustawienia__Klawisze_MenuItem: TMenuItem
        Caption = 'Klawisze'
        OnClick = Ustawienia__Klawisze_MenuItemClick
      end
    end
    object Pełny_Ekran_MenuItem: TMenuItem
      Caption = '      Pe'#322'ny ekran      '
      OnClick = Pełny_Ekran_MenuItemClick
    end
    object Pauza_MenuItem: TMenuItem
      Caption = '      Pauza      '
      OnClick = MainMenu1_MenuItemClick
    end
    object O_Programie_MenuItem: TMenuItem
      Caption = '     O programie      '
      OnClick = O_Programie_MenuItemClick
    end
  end
  object GLScene1: TGLScene
    Left = 145
    Top = 170
    object GLSkyDome1: TGLSkyDome
      Direction.Coordinates = {000000000000803F0000008000000000}
      Position.Coordinates = {00000000000080BF000000000000803F}
      Scale.Coordinates = {CDCC4C3DCDCC4C3DCDCC4C3D00000000}
      Up.Coordinates = {00000000000000000000803F00000000}
      Bands = <
        item
          StartColor.Color = {0000803F0000803F0000803F0000803F}
          StopAngle = 5.000000000000000000
          StopColor.Color = {9190903E9190903E0000803F0000803F}
        end
        item
          StartAngle = 5.000000000000000000
          StartColor.Color = {4E62903E4E62903E0000803F0000803F}
          StopAngle = 10.000000000000000000
          StopColor.Color = {938C0C3E938C0C3E938E0E3F0000803F}
        end
        item
          StartAngle = 10.000000000000000000
          StartColor.Color = {938C0C3E938C0C3E938E0E3F0000803F}
          StopAngle = 12.000000000000000000
          StopColor.Color = {D6D5553F000000008B8A0A3F0000803F}
        end
        item
          StartAngle = 12.000000000000000000
          StartColor.Color = {CBCA4A3F00000000CBCA4A3F0000803F}
          StopAngle = 13.000000000000000000
          StopColor.Color = {029F1F3FBEBEBE3E999F1F3F0000803F}
        end
        item
          StartAngle = 13.000000000000000000
          StartColor.Color = {029F1F3FBEBEBE3E999F1F3F0000803F}
          StopAngle = 14.000000000000000000
          StopColor.Color = {CBCA4A3FCBCACA3E000000000000803F}
        end
        item
          StartAngle = 14.000000000000000000
          StartColor.Color = {C2C1413FF1F0F03EBDBC3C3E0000803F}
          StopAngle = 15.000000000000000000
          StopColor.Color = {0000000000000000F4FDD43E0000803F}
        end
        item
          StartAngle = 15.000000000000000000
          StartColor.Color = {0000000000000000D5D4D43E0000803F}
          StopAngle = 20.000000000000000000
          StopColor.Color = {0000000000000000000000000000803F}
        end
        item
          StartAngle = 20.000000000000000000
          StartColor.Color = {0000000000000000000000000000803F}
          StopAngle = 30.000000000000000000
          StopColor.Color = {0000000000000000000000000000803F}
        end>
      Stars = <>
    end
    object GLLightSource1: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {0000000000000000000020410000803F}
      SpotCutOff = 180.000000000000000000
    end
    object GLCamera1: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      CameraStyle = csOrthogonal
      Position.Coordinates = {0000000000000000000020410000803F}
    end
    object Test_GLSphere: TGLSphere
      Visible = False
      Radius = 0.079999998211860660
      EffectsData = {
        0458434F4C02010202060A54474C424669726546580201020012000000000200
        02000610474C4669726546584D616E6167657231060A54474C4254686F724658
        020102001200000000020002000610474C54686F7246584D616E6167657231}
    end
    object Podest_Test_GLDummyCube: TGLDummyCube
      Direction.Coordinates = {FFFFFFB2000000000000803F00000000}
      Visible = False
      CubeSize = 1.000000000000000000
      object Podest_Test__Deska_GLCube: TGLCube
        Position.Coordinates = {00000000CDCC4C3D000000000000803F}
        RollAngle = -10.000000000000000000
        Up.Coordinates = {D3D0313E5C1C7C3F0000000000000000}
        CubeSize = {0000003FCDCCCC3DCDCCCC3D}
      end
      object Podest_Test__Kula_Start_GLSphere: TGLSphere
        Position.Coordinates = {000080BECDCC4C3E000000000000803F}
        Radius = 0.050000000745058060
      end
      object Podest_Test__Kula_Cel_GLSphere: TGLSphere
        Position.Coordinates = {0000803ECDCCCC3D000000000000803F}
        Radius = 0.050000000745058060
      end
    end
    object Koszyk_GLDummyCube: TGLDummyCube
      CubeSize = 1.000000000000000000
      object Koszyk_GLFrustrum: TGLFrustrum
        Material.FrontProperties.Diffuse.Color = {9A99993E9A99993E0000803F0000803F}
        RollAngle = 180.000000000000000000
        Up.Coordinates = {2EBDBB33000080BF0000000000000000}
        FrustrumSize = {0000803F0000803E0000803ECDCCCC3D}
      end
      object Koszyk_GLCube: TGLCube
        BehavioursData = {
          0458434F4C02010201060D54474C42436F6C6C6973696F6E0202020012000000
          0002000613474C436F6C6C6973696F6E4D616E616765723102030200}
        CubeSize = {0AD7233CCDCCCC3DCDCCCC3D}
      end
    end
    object Podłoże_GLCube: TGLCube
      Material.FrontProperties.Diffuse.Color = {9A99193FCDCC4C3FACC8483E0000803F}
      Position.Coordinates = {00000000000080BF000000000000803F}
      CubeSize = {0000A040CDCCCC3D0000803F}
    end
    object Pauza_GLHUDText: TGLHUDText
      Visible = False
      BitmapFont = GLWindowsBitmapFont1
      Text = 'PAUZA'
      Rotation = 0.000000000000000000
      Alignment = taCenter
      Layout = tlCenter
      ModulateColor.Color = {EBE0E03EE4DB5B3FE4DB5B3F0000803F}
    end
    object Pauza_GLSpaceText: TGLSpaceText
      Material.FrontProperties.Diffuse.Color = {EBE0E03EE4DB5B3FE4DB5B3F0000803F}
      Position.Coordinates = {0AD763BFEC5138BE0000803F0000803F}
      Scale.Coordinates = {9A99193F9A99193F9A99193F00000000}
      Visible = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Georgia'
      Font.Style = []
      Lines.Strings = (
        'PAUZA')
    end
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 145
    Top = 235
  end
  object GLCollisionManager1: TGLCollisionManager
    OnCollision = GLCollisionManager1Collision
    Left = 145
    Top = 305
  end
  object GLWindowsBitmapFont1: TGLWindowsBitmapFont
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    Left = 280
    Top = 305
  end
  object Początkowy_Timer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Początkowy_TimerTimer
    Left = 520
    Top = 305
  end
  object GLFireFXManager1: TGLFireFXManager
    FireDir.Coordinates = {000000009A99993E0000000000000000}
    InitialDir.Coordinates = {00000000CDCC4C3E0000000000000000}
    Cadencer = GLCadencer1
    MaxParticles = 128
    ParticleSize = 0.150000005960464500
    InnerColor.Color = {00000000F8FEFE3E0000803F0000803F}
    OuterColor.Color = {EBE0E03EE4DB5B3FE4DB5B3F0000803F}
    FireDensity = 0.300000011920929000
    FireEvaporation = 0.860000014305114800
    FireCrown = 0.100000001490116100
    ParticleLife = 1
    FireBurst = 0.001000000047497451
    FireRadius = 0.100000001490116100
    Disabled = False
    Paused = False
    ParticleInterval = 0.039999999105930330
    UseInterval = True
    Left = 400
    Top = 305
  end
  object GLThorFXManager1: TGLThorFXManager
    Target.Coordinates = {00000000000000000000000000000000}
    Cadencer = GLCadencer1
    Maxpoints = 2
    GlowSize = 0.090000003576278680
    Vibrate = 0.009999999776482582
    InnerColor.Color = {00000000000000000000000000000000}
    OuterColor.Color = {0000803F00000000000000000000803F}
    CoreColor.Color = {00000000000000000000000000000000}
    Disabled = False
    Core = False
    Glow = True
    Wildness = 0.009999999776482582
    Left = 400
    Top = 250
  end
end
