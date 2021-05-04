unit Krysztalowe_Kule;{07.09.2017}

  //
  // MIT License
  //
  // Copyright (c) 2017 Jacek Mulawka
  //
  // j.mulawka@interia.pl
  //
  // https://github.com/jacek-mulawka
  //


// Do zrobienia: nic.

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  System.IniFiles, System.DateUtils, System.Math, Vcl.ComCtrls,
  GLScene, GLObjects, GLCoordinates, GLCadencer, GLCrossPlatform, GLBaseClasses, GLWin32Viewer,
  GLCollision, GLBitmapFont, GLWindowsFont, GLHUDObjects, GLSpaceText, GLFireFX,
  GLVectorGeometry, GLGeomObjects, GLKeyboard, GLColor, GLState, GLThorFX,
  GLSkydome;

const
  kula_kryszta�owa_promie� = 0.08;

type
  TBonus = ( b_Brak, b_Spowolnienie_Kul, b_Przy�pieszenie_Kul, b_Spowolnienie_Koszyka, b_Przy�pieszenie_Koszyka, b_Powi�kszenie_Koszyka, b_Pomniejszenie_Koszyka );

  TPodest = class( TGLDummyCube )
  private
    { Private declarations }
    czy_prawa_strona : boolean;
    Deska : TGLCube;
    Kula_Start,
    Kula_Cel,
    Kula_Pozycja_Koszyka
      : TGLSphere;
  public
    { Public declarations }
    constructor Create( AOwner : TComponent; Rodzic : TGLBaseSceneObject; pozycja_wektor : TVector; rozmiar : single; nazwa : string; czy_obr�cone : boolean );
    destructor Destroy(); override;
  end;

  TKula_Kryszta�owa = class( TGLSphere )
  private
    { Private declarations }
//    czas_istnienia : integer;
//    czas_utworzenia : TDateTime;
    czy_prawa_strona,
    czy_usun��,
    czy_z�apana
      : boolean;
    pr�dko�� : real;
    podest : TPodest;
    id_bonus : TBonus;
    efekt_uchwyt : TGLDummyCube;
  public
    { Public declarations }
    constructor Create( AOwner : TComponent );
    destructor Destroy(); override;
  end;

  TKrysztalowe_Kule_Form = class( TForm )
    MainMenu1: TMainMenu;
    Lewo_Panel: TPanel;
    Prawo_Panel: TPanel;
    Lewo_G�ra_Button: TButton;
    Lewo_�rodek_Button: TButton;
    Lewo_D�_Button: TButton;
    Prawo_G�ra_Button: TButton;
    Prawo_�rodek_Button: TButton;
    Prawo_D�_Button: TButton;
    Gra_MenuItem: TMenuItem;
    Gra__Nowa_MenuItem: TMenuItem;
    Gra__Nowa_Odst�p_MenuItem: TMenuItem;
    Gra__Wyczy��_MenuItem: TMenuItem;
    Gra__Wyczy��_Odst�p_MenuItem: TMenuItem;
    Gra__Zamknij_MenuItem: TMenuItem;
    Opcje_MenuItem: TMenuItem;
    Opcje__Rz�dy_2_MenuItem: TMenuItem;
    Opcje__Rz�dy_2_Odst�p_MenuItem: TMenuItem;
    Opcje__Rz�dy_3_MenuItem: TMenuItem;
    Opcje__Rz�dy_3_Odst�p_MenuItem: TMenuItem;
    Opcje__Odk�adaj_Kule_W_Tle_MenuItem: TMenuItem;
    Opcje__Odk�adaj_Kule_W_Tle_Odst�p_MenuItem: TMenuItem;
    Opcje__Pe�ny_Ekran_MenuItem: TMenuItem;
    Ustawienia_MenuItem: TMenuItem;
    Ustawienia__Zapisz_MenuItem: TMenuItem;
    Pe�ny_Ekran_MenuItem: TMenuItem;
    Pauza_MenuItem: TMenuItem;
    O_Programie_MenuItem: TMenuItem;
    O_Programie_Panel: TPanel;
    O_Programie_Label: TLabel;
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLCadencer1: TGLCadencer;
    GLLightSource1: TGLLightSource;
    GLCamera1: TGLCamera;
    Test_GLSphere: TGLSphere;
    GLCollisionManager1: TGLCollisionManager;
    Kul_Na_Planszy_Label: TLabel;
    Kul_Z�apanych_Label: TLabel;
    Kul_Nie_Z�apanych_Label: TLabel;
    Podest_Test_GLDummyCube: TGLDummyCube;
    Podest_Test__Deska_GLCube: TGLCube;
    Podest_Test__Kula_Start_GLSphere: TGLSphere;
    Podest_Test__Kula_Cel_GLSphere: TGLSphere;
    Gra_Panel: TPanel;
    Koszyk_GLDummyCube: TGLDummyCube;
    Koszyk_GLFrustrum: TGLFrustrum;
    Koszyk_GLCube: TGLCube;
    Wyniki_Panel: TPanel;
    Pod�o�e_GLCube: TGLCube;
    Pauza_GLHUDText: TGLHUDText;
    GLWindowsBitmapFont1: TGLWindowsBitmapFont;
    Pauza_GLSpaceText: TGLSpaceText;
    Pocz�tkowy_Timer: TTimer;
    GLFireFXManager1: TGLFireFXManager;
    GLThorFXManager1: TGLThorFXManager;
    GLSkyDome1: TGLSkyDome;
    Opcje__Pe�ny_Ekran_Odst�p_MenuItem: TMenuItem;
    Opcje__Bonusy_MenuItem: TMenuItem;
    Opcje__Bonusy_Odst�p_MenuItem: TMenuItem;
    Opcje__Bonusy_Tylko_Pozytywne_MenuItem: TMenuItem;
    Wsp�czynnik_Trudno�ci_Label: TLabel;
    Wsp�czynnik_Trudno�ci_Panel: TPanel;
    Wsp�czynnik_Trudno�ci_Najwy�szy_Osi�gni�ty_Label: TLabel;
    Wsp�czynnik_Trudno�ci_ProgressBar: TProgressBar;
    Wsp�czynnik_Trudno�ci_ProgressBar_Max_Label: TLabel;
    Ustawienia__Zapisz_Odst�p_MenuItem: TMenuItem;
    Ustawienia__Klawisze_MenuItem: TMenuItem;
    Lewo_G�ra_Odst�p_Panel: TPanel;
    Prawo_G�ra_Odst�p_Panel: TPanel;
    Gra__Maksymalizuj_MenuItem: TMenuItem;
    Gra__Maksymalizuj_Odst�p_1_MenuItem: TMenuItem;
    Gra__Minimalizuj_MenuItem: TMenuItem;
    Gra__Minimalizuj_Odst�p_1_MenuItem: TMenuItem;
    Gra__Maksymalizuj_Odst�p_2_MenuItem: TMenuItem;
    Gra__Minimalizuj_Odst�p_2_MenuItem: TMenuItem;
    Gra__Normalizuj_MenuItem: TMenuItem;
    Gra__Normalizuj_Odst�p_1_MenuItem: TMenuItem;
    Gra__Normalizuj_Odst�p_2_MenuItem: TMenuItem;
    Logo_Image: TImage;
    procedure FormShow( Sender: TObject );
    procedure FormClose( Sender: TObject; var Action: TCloseAction );
    procedure FormResize( Sender: TObject );
    procedure Zapisz_Ustawienia( Sender : TObject );
    procedure Przycisk_ButtonMouseEnter( Sender: TObject );
    procedure Przycisk_ButtonMouseLeave( Sender: TObject );
    procedure Gra__Nowa_MenuItemClick( Sender: TObject );
    procedure Gra__Wyczy��_MenuItemClick( Sender: TObject );
    procedure Gra__Maksymalizuj_MenuItemClick( Sender: TObject );
    procedure Gra__Normalizuj_MenuItemClick( Sender: TObject );
    procedure Gra__Minimalizuj_MenuItemClick( Sender: TObject );
    procedure Gra__Zamknij_MenuItemClick( Sender: TObject );
    procedure Opcje__Pe�ny_Ekran_MenuItemClick( Sender: TObject );
    procedure Ustawienia__Klawisze_MenuItemClick( Sender: TObject );
    procedure Pe�ny_Ekran_MenuItemClick( Sender: TObject );
    procedure O_Programie_MenuItemClick( Sender: TObject );
    procedure MainMenu1_MenuItemClick( Sender: TObject );
    procedure Pocz�tkowy_TimerTimer( Sender: TObject );

    procedure GLSceneViewer1MouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
    procedure GLCollisionManager1Collision( Sender: TObject; object1, object2: TGLBaseSceneObject );
    procedure GLCadencer1Progress( Sender: TObject; const deltaTime, newTime: Double );
  private
    { Private declarations }
    kul_z�apanych,
    kul_nie_z�apanych,
    kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci,
    kule_w_tle__piramida_poziom, // Ilo�� poziom�w (warstw) w piramidzie.
    kule_w_tle__piramida_poziom_od�o�enia_kuli, // Numer poziomu (warstwy), na kt�rej b�dzie odk�adana kolejna kula.
    kule_w_tle__piramida_strona, // Po kt�rej stronie u�o�y� kul� ( < 0 lewo).
    interwa�_dodania_kuli_pr�g, // Milisekundy.
    wsp�czynnik_trudno�ci_modyfikator
      : integer;
    wsp�czynnik_trudno�ci,
    wsp�czynnik_trudno�ci_mno�nik,
    wsp�czynnik_trudno�ci_najwy�szy_osi�gni�ty,
    koszyk_pr�dko��,
    koszyk_pr�dko��_warto��_pocz�tkowa,
    kule_bonus_pr�dko��
      : real;
    podesty_l,
    kule_kryszta�owe_l,
    kule_kryszta�owe_w_tle_l
      : TList;
    kule_kryszta�owe_poprzednie_dodanie,
    moment_wci�ni�cia_klawisza
      : TDateTime;
    pauza_zmiany_okna,
    klawisze_konfiguracja_korzystaj
      : boolean;
    koszyk_cel,
    koszyk_ograniczenie_g�rne,
    koszyk_ograniczenie_�rodkowe,
    koszyk_ograniczenie_dolne
      : TVector;
    window_state_kopia : TWindowState;
    k_lewo_g�ra,
    k_lewo_�rodek,
    k_lewo_d�,
    k_prawo_g�ra,
    k_prawo_�rodek,
    k_prawo_d�,
    k_pauza,
    k_pe�ny_ekran,
    k_zamknij
      : Word;
    procedure WMEnterSizeMove( var Message : TMessage ); message WM_ENTERSIZEMOVE;
    procedure WMExitSizeMove( var Message : TMessage ); message WM_EXITSIZEMOVE;


    procedure Wczytaj_Ustawienia();
    procedure Wczytaj_Klawisze_Konfiguracja();

    procedure Utw�rz_Podesty();
    procedure Zwolnij_Podesty();

    procedure Dodaj_Kul�();
    procedure Dodaj_Kul�_W_Tle( const kula_kryszta�owa_f : TKula_Kryszta�owa );
    procedure Od��cz_Kul�( kula_kryszta�owa_f : TKula_Kryszta�owa );
    procedure Zwolnij_Wszystkie_Kule();
    procedure Zwolnij_Wszystkie_Kule_W_Tle();
    procedure Kule_Kryszta�owe_Lot( const deltaTime : Double );
    procedure Wyniki_Wypisz();
    procedure Pauza( const aktywno��_f : boolean );
    procedure Dodaj_Bonus( const id_bonus_f : TBonus );
    function Czy_Bonus_Negatywny( const id_bonus_f : TBonus ) : boolean;
  public
    { Public declarations }
  end;

const
  moment_wci�ni�cia_klawisza_op�nienie_c : integer = 200;

var
  Krysztalowe_Kule_Form: TKrysztalowe_Kule_Form;

implementation

uses
  Klawisze_Konfiguracja;

{$R *.dfm}


//Konstruktor klasy TPodest.
constructor TPodest.Create( AOwner : TComponent; Rodzic : TGLBaseSceneObject; pozycja_wektor : TVector; rozmiar : single; nazwa : string; czy_obr�cone : boolean );
begin

  //
  // czy_obr�cone
  //   false - dla lewej strony.
  //   true - dla prawej strony.
  //

  inherited Create( AOwner );

  Self.Parent := Rodzic;

  Self.czy_prawa_strona := czy_obr�cone;
  Self.CubeSize := rozmiar;
  Self.Position.AsVector := pozycja_wektor;
  //Self.ShowAxes := true;

  if nazwa <> '' then
    Self.Name := nazwa;


  Self.RollAngle := -15;

  if czy_obr�cone then
    begin

      Self.RollAngle := -Self.RollAngle;
      Self.TurnAngle := 180;

    end;
  //---//if czy_obr�cone then


  Self.Deska := TGLCube.Create( AOwner );
  Self.Deska.Parent := Self;
  Self.Deska.Position.AsVector := GLVectorGeometry.PointMake( 0, 0, 0 );
  Self.Deska.CubeDepth := Self.CubeSize / 10;
  Self.Deska.CubeHeight := Self.CubeSize / 20;
  Self.Deska.CubeWidth := Self.CubeSize / 2;
  Self.Deska.RollAngle := 0;


  Self.Kula_Start := TGLSphere.Create( AOwner );
  Self.Kula_Start.Parent := Self;
  Self.Kula_Start.Radius := Self.CubeSize / 20;
  Self.Kula_Start.Position := Self.Deska.Position;
  Self.Kula_Start.Position.Y := Self.Kula_Start.Position.Y + 0.1;


  Self.Kula_Cel := TGLSphere.Create( AOwner );
  Self.Kula_Cel.Parent := Self;
  Self.Kula_Cel.Position := Self.Kula_Start.Position;
  Self.Kula_Cel.Radius := Self.CubeSize / 30;


  Self.Kula_Pozycja_Koszyka := TGLSphere.Create( AOwner );
  Self.Kula_Pozycja_Koszyka.Parent := Self;
  Self.Kula_Pozycja_Koszyka.Radius := Self.CubeSize / 40;
  Self.Kula_Pozycja_Koszyka.Position := Self.Deska.Position;
  Self.Kula_Pozycja_Koszyka.Position.Y := Self.Kula_Start.Position.Y - 0.2;


  Self.Kula_Start.Position.X := Self.Kula_Start.Position.X - Self.Deska.CubeWidth / 2;
  Self.Kula_Cel.Position.X := Self.Kula_Cel.Position.X + Self.Deska.CubeWidth / 2;
  Self.Kula_Pozycja_Koszyka.Position.X := Self.Kula_Cel.Position.X + Self.Deska.CubeWidth / 3;


  Self.Kula_Start.Visible := false;
  Self.Kula_Cel.Visible := false;
  Self.Kula_Pozycja_Koszyka.Visible := false;


  //Self.Deska.Material.FrontProperties.Diffuse.Color := ConvertRGBColor(  [ Random( 255 ), Random( 255 ), Random( 255 ) ]  );
  //Self.Deska.Material.FrontProperties.Ambient.Color := ConvertRGBColor(  [ Random( 255 ), Random( 255 ), Random( 255 ) ]  );
  Self.Deska.Material.FrontProperties.Diffuse.Color := clrDarkTurquoise;

end;//---//Konstruktor klasy TPodest.

//Destruktor klasy TPodest.
destructor TPodest.Destroy();
begin

  FreeAndNil( Self.Kula_Start );
  FreeAndNil( Self.Kula_Cel );
  FreeAndNil( Self.Deska );
  FreeAndNil( Kula_Pozycja_Koszyka );

  inherited;

end;//---//Destruktor klasy TPodest.

//Konstruktor klasy TKula_Kryszta�owa.
constructor TKula_Kryszta�owa.Create( AOwner : TComponent );
begin

  inherited Create( AOwner );

//???  Self.czas_istnienia := 7;
//  Self.czas_utworzenia := Now();

  Self.czy_usun�� := false;
  Self.czy_z�apana := false;

  Self.Radius := kula_kryszta�owa_promie�;

  pr�dko�� := 1;

  id_bonus := b_Brak;

  Self.Material.FrontProperties.Diffuse.Color := ConvertRGBColor(  [ Random( 255 ), Random( 255 ), Random( 255 ) ]  );
  Self.Material.FrontProperties.Ambient.Color := ConvertRGBColor(  [ Random( 255 ), Random( 255 ), Random( 255 ) ]  );

  Self.efekt_uchwyt := TGLDummyCube.Create( AOwner );
  Self.efekt_uchwyt.Parent := Self;
  Self.efekt_uchwyt.CubeSize :=  kula_kryszta�owa_promie� * 2;
  Self.efekt_uchwyt.Pickable := false;
  //Self.efekt_uchwyt.VisibleAtRunTime := true;

end;//---//Konstruktor klasy TKula_Kryszta�owa.

//Destruktor klasy TKula_Kryszta�owa.
destructor TKula_Kryszta�owa.Destroy();
begin

  if Self.czy_z�apana then
    begin

      inc( Krysztalowe_Kule_Form.kul_z�apanych );

      Krysztalowe_Kule_Form.Dodaj_Kul�_W_Tle( Self );
      Krysztalowe_Kule_Form.Dodaj_Bonus( Self.id_bonus );

    end
  else//if Self.czy_z�apana then
    if not Krysztalowe_Kule_Form.Czy_Bonus_Negatywny( Self.id_bonus ) then // Kul z negatywnym bonusem nie zlicza jako niez�apanych.
      inc( Krysztalowe_Kule_Form.kul_nie_z�apanych );

  Krysztalowe_Kule_Form.Wyniki_Wypisz();

  FreeAndNil( Self.efekt_uchwyt );
  //FreeAndNil( Self.Etykieta_Label );

  inherited;

end;//---//Destruktor klasy TKula_Kryszta�owa.


//      ***      Funkcje      ***      //

//Funckja WMEnterSizeMove().
procedure TKrysztalowe_Kule_Form.WMEnterSizeMove( var Message : TMessage );
begin

  // Podczas zmiany rozmiaru okna dziwnie skr�ca kule.

  if not Pauza_MenuItem.Checked then
    begin

      Pauza( true );
      GLCadencer1.Enabled := not Pauza_MenuItem.Checked;
      Application.ProcessMessages();
      pauza_zmiany_okna := true;

    end;
  //---//if not Pauza_MenuItem.Checked then

end;//---//Funckja WMEnterSizeMove().

//Funckja WMExitSizeMove().
procedure TKrysztalowe_Kule_Form.WMExitSizeMove( var Message : TMessage );
begin

  if pauza_zmiany_okna then
    begin

      Pauza( false );
      GLCadencer1.Enabled := not Pauza_MenuItem.Checked;
      pauza_zmiany_okna := false;

    end;
  //---//if pauza_zmiany_okna then

end;//---//Funckja WMExitSizeMove().

//Funkcja Wczytaj_Ustawienia().
procedure TKrysztalowe_Kule_Form.Wczytaj_Ustawienia();
var
  plik_ini : TIniFile;
begin

  plik_ini := TIniFile.Create(  ExtractFilePath( Application.ExeName ) + 'Kryszta�owe kule.ini'  );

  if not plik_ini.ValueExists( 'Opcje', '3_Rz�dy' ) then
    plik_ini.WriteBool( 'Opcje', '3_Rz�dy', Opcje__Rz�dy_3_MenuItem.Checked )
  else//if not plik_ini.ValueExists( 'Opcje', '3_Rz�dy' ) then
    Opcje__Rz�dy_3_MenuItem.Checked := plik_ini.ReadBool( 'Opcje', '3_Rz�dy', Opcje__Rz�dy_3_MenuItem.Checked ); // Je�eli nie znajdzie to podstawia warto�� Opcje__Rz�dy_3_MenuItem.Checked.

  if    ( not Opcje__Rz�dy_3_MenuItem.Checked )
    and ( not Opcje__Rz�dy_2_MenuItem.Checked ) then
    Opcje__Rz�dy_2_MenuItem.Checked := true;


  if not plik_ini.ValueExists( 'Opcje', 'Odk�adaj_Kule_W_Tle' ) then
    plik_ini.WriteBool( 'Opcje', 'Odk�adaj_Kule_W_Tle', Opcje__Odk�adaj_Kule_W_Tle_MenuItem.Checked )
  else//if not plik_ini.ValueExists( 'Opcje', 'Odk�adaj_Kule_W_Tle' ) then
    Opcje__Odk�adaj_Kule_W_Tle_MenuItem.Checked := plik_ini.ReadBool( 'Opcje', 'Odk�adaj_Kule_W_Tle', Opcje__Odk�adaj_Kule_W_Tle_MenuItem.Checked ); // Je�eli nie znajdzie to podstawia warto�� Opcje__Odk�adaj_Kule_W_Tle_MenuItem.Checked.


  if not plik_ini.ValueExists( 'Opcje', 'Pe�ny_Ekran' ) then
    plik_ini.WriteBool( 'Opcje', 'Pe�ny_Ekran', Opcje__Pe�ny_Ekran_MenuItem.Checked )
  else//if not plik_ini.ValueExists( 'Opcje', 'Pe�ny_Ekran' ) then
    Opcje__Pe�ny_Ekran_MenuItem.Checked := plik_ini.ReadBool( 'Opcje', 'Pe�ny_Ekran', Opcje__Pe�ny_Ekran_MenuItem.Checked ); // Je�eli nie znajdzie to podstawia warto�� Opcje__Pe�ny_Ekran_MenuItem.Checked.


  if not plik_ini.ValueExists( 'Opcje', 'Bonusy' ) then
    plik_ini.WriteBool( 'Opcje', 'Bonusy', Opcje__Bonusy_MenuItem.Checked )
  else//if not plik_ini.ValueExists( 'Opcje', 'Bonusy' ) then
    Opcje__Bonusy_MenuItem.Checked := plik_ini.ReadBool( 'Opcje', 'Bonusy', Opcje__Bonusy_MenuItem.Checked ); // Je�eli nie znajdzie to podstawia warto�� Opcje__Bonusy_MenuItem.Checked.

  if not plik_ini.ValueExists( 'Opcje', 'Bonusy_Tylko_Pozytywne' ) then
    plik_ini.WriteBool( 'Opcje', 'Bonusy_Tylko_Pozytywne', Opcje__Bonusy_Tylko_Pozytywne_MenuItem.Checked )
  else//if not plik_ini.ValueExists( 'Opcje', 'Bonusy_Tylko_Pozytywne' ) then
    Opcje__Bonusy_Tylko_Pozytywne_MenuItem.Checked := plik_ini.ReadBool( 'Opcje', 'Bonusy_Tylko_Pozytywne', Opcje__Bonusy_Tylko_Pozytywne_MenuItem.Checked ); // Je�eli nie znajdzie to podstawia warto�� Opcje__Bonusy_Tylko_Pozytywne_MenuItem.Checked.


  if not plik_ini.ValueExists( 'Opcje', 'kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci' ) then
    plik_ini.WriteInteger( 'Opcje', 'kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci', kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci )
  else//if not plik_ini.ValueExists( 'Opcje', 'kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci' ) then
    kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci := plik_ini.ReadInteger( 'Opcje', 'kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci', kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci ); // Je�eli nie znajdzie to podstawia warto�� kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci.

   if not plik_ini.ValueExists( 'Opcje', 'koszyk_pr�dko��_warto��_pocz�tkowa' ) then
    plik_ini.WriteFloat( 'Opcje', 'koszyk_pr�dko��_warto��_pocz�tkowa', koszyk_pr�dko��_warto��_pocz�tkowa )
  else//if not plik_ini.ValueExists( 'Opcje', 'koszyk_pr�dko��_warto��_pocz�tkowa' ) then
    koszyk_pr�dko��_warto��_pocz�tkowa := plik_ini.ReadFloat( 'Opcje', 'koszyk_pr�dko��_warto��_pocz�tkowa', koszyk_pr�dko��_warto��_pocz�tkowa ); // Je�eli nie znajdzie to podstawia warto�� koszyk_pr�dko��_warto��_pocz�tkowa.


  if not plik_ini.ValueExists( 'Opcje', 'interwa�_dodania_kuli_pr�g_milisekundy' ) then
    plik_ini.WriteInteger( 'Opcje', 'interwa�_dodania_kuli_pr�g_milisekundy',  interwa�_dodania_kuli_pr�g )
  else//if not plik_ini.ValueExists( 'Opcje', ' interwa�_dodania_kuli_pr�g_milisekundy' ) then
    interwa�_dodania_kuli_pr�g := plik_ini.ReadInteger( 'Opcje', 'interwa�_dodania_kuli_pr�g_milisekundy',  interwa�_dodania_kuli_pr�g ); // Je�eli nie znajdzie to podstawia warto��  interwa�_dodania_kuli_pr�g.

  if not plik_ini.ValueExists( 'Opcje', 'wsp�czynnik_trudno�ci_modyfikator' ) then
    plik_ini.WriteInteger( 'Opcje', 'wsp�czynnik_trudno�ci_modyfikator',  wsp�czynnik_trudno�ci_modyfikator )
  else//if not plik_ini.ValueExists( 'Opcje', ' wsp�czynnik_trudno�ci_modyfikator' ) then
    wsp�czynnik_trudno�ci_modyfikator := plik_ini.ReadInteger( 'Opcje', 'wsp�czynnik_trudno�ci_modyfikator',  wsp�czynnik_trudno�ci_modyfikator ); // Je�eli nie znajdzie to podstawia warto��  wsp�czynnik_trudno�ci_modyfikator.

  if not plik_ini.ValueExists( 'Opcje', 'wsp�czynnik_trudno�ci_mno�nik' ) then
    plik_ini.WriteFloat( 'Opcje', 'wsp�czynnik_trudno�ci_mno�nik',  wsp�czynnik_trudno�ci_mno�nik )
  else//if not plik_ini.ValueExists( 'Opcje', ' wsp�czynnik_trudno�ci_mno�nik' ) then
    wsp�czynnik_trudno�ci_mno�nik := plik_ini.ReadFloat( 'Opcje', 'wsp�czynnik_trudno�ci_mno�nik',  wsp�czynnik_trudno�ci_mno�nik ); // Je�eli nie znajdzie to podstawia warto��  wsp�czynnik_trudno�ci_mno�nik.

  plik_ini.Free();

end;//---//Funkcja Wczytaj_Ustawienia().

//Funkcja Zapisz_Ustawienia().
procedure TKrysztalowe_Kule_Form.Zapisz_Ustawienia( Sender : TObject );
var
  plik_ini : TIniFile;
begin

  moment_wci�ni�cia_klawisza := IncSecond( Now() );

  if Application.MessageBox( 'Zapisa� ustawienia?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) <> IDYES then
    begin

      moment_wci�ni�cia_klawisza := IncSecond( Now() );
      Exit;

    end;
  //---//if Application.MessageBox( 'Zapisa� ustawienia?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) <> IDYES then

  moment_wci�ni�cia_klawisza := IncSecond( Now() );


  plik_ini := TIniFile.Create(  ExtractFilePath( Application.ExeName ) + 'Kryszta�owe kule.ini'  );

  plik_ini.WriteBool( 'Opcje', '3_Rz�dy', Opcje__Rz�dy_3_MenuItem.Checked );
  plik_ini.WriteBool( 'Opcje', 'Odk�adaj_Kule_W_Tle', Opcje__Odk�adaj_Kule_W_Tle_MenuItem.Checked );
  plik_ini.WriteBool( 'Opcje', 'Pe�ny_Ekran', Opcje__Pe�ny_Ekran_MenuItem.Checked );
  plik_ini.WriteBool( 'Opcje', 'Bonusy', Opcje__Bonusy_MenuItem.Checked );
  plik_ini.WriteBool( 'Opcje', 'Bonusy_Tylko_Pozytywne', Opcje__Bonusy_Tylko_Pozytywne_MenuItem.Checked );
  //plik_ini.WriteInteger( 'Opcje', 'kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci', kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci );
  //plik_ini.WriteFloat( 'Opcje', 'koszyk_pr�dko��_warto��_pocz�tkowa', koszyk_pr�dko��_warto��_pocz�tkowa );
  //plik_ini.WriteInteger( 'Opcje', 'interwa�_dodania_kuli_pr�g_milisekundy',  interwa�_dodania_kuli_pr�g );
  //plik_ini.WriteInteger( 'Opcje', 'wsp�czynnik_trudno�ci_modyfikator',  wsp�czynnik_trudno�ci_modyfikator );
  //plik_ini.WriteFloat( 'Opcje', 'wsp�czynnik_trudno�ci_mno�nik',  wsp�czynnik_trudno�ci_mno�nik );

  plik_ini.Free();

end;//---//Funkcja Zapisz_Ustawienia().

//Funkcja Wczytaj_Klawisze_Konfiguracja().
procedure TKrysztalowe_Kule_Form.Wczytaj_Klawisze_Konfiguracja();
var
  czy_utworzy�_form� : boolean;
begin

  czy_utworzy�_form� := Klawisze_Konfiguracja_Form = nil;

  if czy_utworzy�_form� then
    Klawisze_Konfiguracja_Form := TKlawisze_Konfiguracja_Form.Create( Application );


  klawisze_konfiguracja_korzystaj := Klawisze_Konfiguracja_Form.Klawisze_Konfiguracja_Korzystaj_CheckBox.Checked;

  k_lewo_g�ra := Round( Klawisze_Konfiguracja_Form.Lewo_G�ra_JvSpinEdit.Value );
  k_lewo_�rodek := Round( Klawisze_Konfiguracja_Form.Lewo_�rodek_JvSpinEdit.Value );
  k_lewo_d� := Round( Klawisze_Konfiguracja_Form.Lewo_D�_JvSpinEdit.Value );

  k_prawo_g�ra := Round( Klawisze_Konfiguracja_Form.Prawo_G�ra_JvSpinEdit.Value );
  k_prawo_�rodek := Round( Klawisze_Konfiguracja_Form.Prawo_�rodek_JvSpinEdit.Value );
  k_prawo_d� := Round( Klawisze_Konfiguracja_Form.Prawo_D�_JvSpinEdit.Value );

  k_pauza := Round( Klawisze_Konfiguracja_Form.Pauza_JvSpinEdit.Value );
  k_pe�ny_ekran := Round( Klawisze_Konfiguracja_Form.Pe�ny_Ekran_JvSpinEdit.Value );
  k_zamknij := Round( Klawisze_Konfiguracja_Form.Zamknij_JvSpinEdit.Value );


  if czy_utworzy�_form� then
    FreeAndNil( Klawisze_Konfiguracja_Form );

end;//---//Funkcja Wczytaj_Klawisze_Konfiguracja().

//Funkcja Utw�rz_Podesty().
procedure TKrysztalowe_Kule_Form.Utw�rz_Podesty();
var
  zt_podest : TPodest;
const
  podest_rozmiar = 1.4;
begin

  if   ( kule_kryszta�owe_l = nil )
    or (  not Assigned( kule_kryszta�owe_l )  ) then
    Exit;


  // Lewo g�ra.
  //zt_podest := TPodest.Create( Application, GLScene1.Objects, Podest_Test__Kula_Start_GLSphere.Position.AsVector, 1 );
  zt_podest := TPodest.Create(  Application, GLScene1.Objects, GLVectorGeometry.PointMake( -0.7, 0.7, 0 ), podest_rozmiar, 'Lewo_G�ra', false  );
  koszyk_ograniczenie_g�rne := zt_podest.Kula_Pozycja_Koszyka.AbsolutePosition;
  podesty_l.Add( zt_podest );
  //Exit;//???

  // Lewo �rodek.
  zt_podest := TPodest.Create(  Application, GLScene1.Objects, GLVectorGeometry.PointMake( -0.945, 0.35, 0 ), podest_rozmiar, 'Lewo_�rodek', false  );
  koszyk_ograniczenie_�rodkowe := zt_podest.Kula_Pozycja_Koszyka.AbsolutePosition;
  podesty_l.Add( zt_podest );


  // Lewo d�.
  if Opcje__Rz�dy_3_MenuItem.Checked then
    begin

      zt_podest := TPodest.Create(  Application, GLScene1.Objects, GLVectorGeometry.PointMake( -1.2, 0, 0 ), podest_rozmiar, 'Lewo_D�', false  );
      koszyk_ograniczenie_dolne := zt_podest.Kula_Pozycja_Koszyka.AbsolutePosition;
      podesty_l.Add( zt_podest );

    end
  else//if Opcje__Rz�dy_3_MenuItem.Checked then
    koszyk_ograniczenie_dolne := koszyk_ograniczenie_�rodkowe;


  // Prawo g�ra.
  zt_podest := TPodest.Create(  Application, GLScene1.Objects, GLVectorGeometry.PointMake( 0.7, 0.7, 0 ), podest_rozmiar, 'Prawo_G�ra', true  );
  podesty_l.Add( zt_podest );

  // Prawo �rodek.
  zt_podest := TPodest.Create(  Application, GLScene1.Objects, GLVectorGeometry.PointMake( 0.945, 0.35, 0 ), podest_rozmiar, 'Prawo_�rodek', true  );
  podesty_l.Add( zt_podest );

  // Prawo d�.
  if Opcje__Rz�dy_3_MenuItem.Checked then
    begin

      zt_podest := TPodest.Create(  Application, GLScene1.Objects, GLVectorGeometry.PointMake( 1.2, 0, 0 ), podest_rozmiar, 'Prawo_D�', true  );
      podesty_l.Add( zt_podest );

    end;
  //---//if Opcje__Rz�dy_3_MenuItem.Checked then

end;//---//Funkcja Utw�rz_Podesty()

//Funkcja Zwolnij_Podesty().
procedure TKrysztalowe_Kule_Form.Zwolnij_Podesty();
var
  i : integer;
begin

  if   ( podesty_l = nil )
    or (  not Assigned( podesty_l )  ) then
    Exit;

  for i := podesty_l.Count - 1 downto 0 do
    begin

      TPodest(podesty_l[ i ]).Free();
      podesty_l.Delete( i );

    end;
  //---//for i := podesty_l.Count - 1 downto 0 do

end;//---//Funkcja Zwolnij_Podesty().


//Funkcja Dodaj_Kul�().
procedure TKrysztalowe_Kule_Form.Dodaj_Kul�();
var
  zt_kula_kryszta�owa : TKula_Kryszta�owa;
  zti : integer;
begin

  if   ( kule_kryszta�owe_l = nil )
    or (  not Assigned( kule_kryszta�owe_l )  )
    or ( podesty_l = nil )
    or (  not Assigned( podesty_l )  )
    or ( podesty_l.Count <= 0 )
    or ( Pauza_MenuItem.Checked ) then
    Exit;


  //if podesty_l <> nil then
    zti := Random( podesty_l.Count ); // Losuje, na kt�rym pode�cie pojawi si� kula.

  zt_kula_kryszta�owa := TKula_Kryszta�owa.Create( Application );
  //zt_kula_kryszta�owa := TGLTorus.Create( nil );

  zt_kula_kryszta�owa.Parent := GLScene1.Objects;
  zt_kula_kryszta�owa.podest := podesty_l[ zti ];
  zt_kula_kryszta�owa.czy_prawa_strona := zt_kula_kryszta�owa.podest.czy_prawa_strona;

  //zt_kula_kryszta�owa.Position.AsVector := Podest_Test__Kula_Start_GLSphere.AbsolutePosition;
  ////zt_kula_kryszta�owa.Direction := GLCamera1.Direction;
  ////zt_kula_kryszta�owa.Direction := Podest_Test__Deska_GLCube.Direction;
  //zt_kula_kryszta�owa.Direction.SetVector
  //  (
  //      Podest_Test__Kula_Cel_GLSphere.AbsolutePosition.X - zt_kula_kryszta�owa.AbsolutePosition.X
  //    , Podest_Test__Kula_Cel_GLSphere.AbsolutePosition.Y - zt_kula_kryszta�owa.AbsolutePosition.Y
  //    , Podest_Test__Kula_Cel_GLSphere.AbsolutePosition.Z - zt_kula_kryszta�owa.AbsolutePosition.Z
  //  );
  ////zt_kula_kryszta�owa.Tag := 1;

  zt_kula_kryszta�owa.Position.AsVector := TPodest(podesty_l[ zti ]).Kula_Start.AbsolutePosition;
  zt_kula_kryszta�owa.Direction.SetVector
    (
        TPodest(podesty_l[ zti ]).Kula_Cel.AbsolutePosition.X - zt_kula_kryszta�owa.AbsolutePosition.X
      , TPodest(podesty_l[ zti ]).Kula_Cel.AbsolutePosition.Y - zt_kula_kryszta�owa.AbsolutePosition.Y
      , TPodest(podesty_l[ zti ]).Kula_Cel.AbsolutePosition.Z - zt_kula_kryszta�owa.AbsolutePosition.Z
    );

  zt_kula_kryszta�owa.efekt_uchwyt.Direction.SetVector( 1, 1, 0 ); // Ustawienie Direction sprawia, �e nie wida� efektu.


  // Dynamiczne dodanie zdarzenia kolizji.
  with TGLBCollision.Create( zt_kula_kryszta�owa.Behaviours ) do
    begin

      GroupIndex := 0;
      BoundingMode := cbmSphere;
      Manager := GLCollisionManager1;

    end;
  //---//with TGLBCollision.Create( zt_kula_kryszta�owa.Behaviours ) do

//  // Dynamiczne dodanie zdarzenia kolizji.
//  with TGLBCollision.Create( zt_kula_kryszta�owa.Behaviours ) do
//    begin
//
//      GroupIndex := 0;
//      BoundingMode := cbmCube;
//      Manager := GLCollisionManager1;
//
//    end;
//  //---//with TGLBCollision.Create( zt_kula_kryszta�owa.Behaviours ) do

  if Opcje__Bonusy_MenuItem.Checked then
    begin

      zti := Random(  10  ); // Losuje szans� na bonus < 0, 9 >.

      if zti >= 9 then // 9
        begin

          zti := Random(  integer(High( TBonus )) + 1  ); // Losuje bonus.

          if Opcje__Bonusy_Tylko_Pozytywne_MenuItem.Checked then
            begin

              if not Czy_Bonus_Negatywny( TBonus(zti) ) then
                zt_kula_kryszta�owa.id_bonus := TBonus(zti);

            end
          else//if Opcje__Bonusy_Tylko_Pozytywne_MenuItem.Checked then
            zt_kula_kryszta�owa.id_bonus := TBonus(zti);


          // Dynamiczne dodanie efektu.
          if Czy_Bonus_Negatywny( zt_kula_kryszta�owa.id_bonus ) then
            TGLBThorFX(zt_kula_kryszta�owa.efekt_uchwyt.AddNewEffect( TGLBThorFX )).Manager := GLThorFXManager1
          else//if Czy_Bonus_Negatywny( zt_kula_kryszta�owa.id_bonus ) then
            TGLBFireFX(zt_kula_kryszta�owa.efekt_uchwyt.AddNewEffect( TGLBFireFX )).Manager := GLFireFXManager1;

          if zt_kula_kryszta�owa.id_bonus in [ b_Powi�kszenie_Koszyka, b_Pomniejszenie_Koszyka ] then
            zt_kula_kryszta�owa.Scale.Y := 1.2;

          //if zt_kula_kryszta�owa.id_bonus in [ b_Spowolnienie_Koszyka, b_Przy�pieszenie_Koszyka ] then
          //  zt_kula_kryszta�owa.Scale.Y := 0.8;

          //if zt_kula_kryszta�owa.id_bonus in [ b_Spowolnienie_Kul, b_Przy�pieszenie_Kul ] then
          //  zt_kula_kryszta�owa.Material.PolygonMode := TPolygonMode(2);

          //zt_kula_kryszta�owa.Material.PolygonMode := GLState.pmLines; // uses GLState.

          //zt_kula_kryszta�owa.Radius := zt_kula_kryszta�owa.Radius - 0.01;
          //zt_kula_kryszta�owa.Material.FrontProperties.Ambient.Color := clrGreen;
          //zt_kula_kryszta�owa.Material.FrontProperties.Diffuse.Color := clrGreen;
          //zt_kula_kryszta�owa.Material.FrontProperties.Emission.Color := clrGreen;

          //zt_kula_kryszta�owa.Material.FrontProperties.Emission.Color := clrRed;

        end;
      //---//if zti >= 9 then

    end;
  //---//if Opcje__Bonusy_MenuItem.Checked then


  //TGLBFireFX(zt_kula_kryszta�owa.efekt_uchwyt.AddNewEffect( TGLBFireFX )).Manager := GLFireFXManager1;
  //TGLBThorFX(zt_kula_kryszta�owa.efekt_uchwyt.AddNewEffect( TGLBThorFX )).Manager := GLThorFXManager1;

  kule_kryszta�owe_l.Add( zt_kula_kryszta�owa );

  kule_kryszta�owe_poprzednie_dodanie := Now();

  Wyniki_Wypisz();

//???
//  Button1.Caption := IntToStr( kule_kryszta�owe_l.Count );

end;//---//Funkcja Dodaj_Kul�().

//Funkcja Dodaj_Kul�_W_Tle().
procedure TKrysztalowe_Kule_Form.Dodaj_Kul�_W_Tle( const kula_kryszta�owa_f : TKula_Kryszta�owa );
var
  zt_kula_kryszta�owa : TKula_Kryszta�owa;
  x_0,
  y_0
    : real;
begin

  // Schemat uk�adania kul:
  //    0
  //
  //   00
  //
  //   000
  //
  //    0
  //   000
  //
  //    0
  //   000
  //  00000
  //
  //    9
  //   748
  //  52136

  if   ( not Opcje__Odk�adaj_Kule_W_Tle_MenuItem.Checked )
    or ( kula_kryszta�owa_f = nil )
    or ( kule_kryszta�owe_w_tle_l = nil )
    or (  not Assigned( kule_kryszta�owe_w_tle_l )  ) then
    Exit;


  zt_kula_kryszta�owa := TKula_Kryszta�owa.Create( Application );

  zt_kula_kryszta�owa.Parent := GLScene1.Objects;
  //zt_kula_kryszta�owa.podest := podesty_l[ zti ];
  //zt_kula_kryszta�owa.czy_prawa_strona := zt_kula_kryszta�owa.podest.czy_prawa_strona;


  zt_kula_kryszta�owa.Radius := kula_kryszta�owa_promie� / 2;

  zt_kula_kryszta�owa.Material.FrontProperties.Diffuse.Color := kula_kryszta�owa_f.Material.FrontProperties.Diffuse.Color;
  zt_kula_kryszta�owa.Material.FrontProperties.Ambient.Color := kula_kryszta�owa_f.Material.FrontProperties.Ambient.Color;

  // x = -1 (lewo) do 1 (prawo)
  // y = -1 (d�)

  kule_w_tle__piramida_strona := -kule_w_tle__piramida_strona; // Od�o�y kul� po przeciwnej stronie ni� ostatnio (dla zera nic si� nie zmieni).

  //x_0 := -1 + zt_kula_kryszta�owa.Radius * 2;
  x_0 := 0;
  y_0 := -1 + zt_kula_kryszta�owa.Radius * 2; // Wysoko��, na kt�rej uk�ada kule.

  //x_0 := kule_w_tle__piramida_strona * ( kule_w_tle__piramida_poziom + kule_w_tle__piramida_poziom_od�o�enia_kuli ) * zt_kula_kryszta�owa.Radius * 2;
  x_0 := kule_w_tle__piramida_strona * ( kule_w_tle__piramida_poziom - kule_w_tle__piramida_poziom_od�o�enia_kuli  ) * zt_kula_kryszta�owa.Radius * 2;

  y_0 := y_0 + kule_w_tle__piramida_poziom_od�o�enia_kuli * zt_kula_kryszta�owa.Radius * 2;


  zt_kula_kryszta�owa.Position.SetPoint( x_0, y_0, -1 );


  if kule_w_tle__piramida_strona = 0 then
    begin

      // Je�eli od�o�y� kul� na �rodku zwi�kszy ilo�� poziom�w piramidy i zacznie uk�ada� od do�u z lewej strony.

      inc( kule_w_tle__piramida_poziom );
      kule_w_tle__piramida_strona := 1;
      kule_w_tle__piramida_poziom_od�o�enia_kuli := 0;

    end
  else//if kule_w_tle__piramida_strona = 0 then
    if kule_w_tle__piramida_strona > 0 then
      begin

        // Je�eli od�o�y� kule po stronie prawej, przejdzie na wy�szy poziom.

        inc( kule_w_tle__piramida_poziom_od�o�enia_kuli );


        // Je�eli kolejny poziom u�o�enia kuli jest ostatnim poziomem to u�o�y kule na �rodku.
        if kule_w_tle__piramida_poziom_od�o�enia_kuli >= kule_w_tle__piramida_poziom then
          kule_w_tle__piramida_strona := 0;

      end;
    //---//if kule_w_tle__piramida_strona > 0 then



  //zt_kula_kryszta�owa.Position.SetPoint( 0, y_0, kule_kryszta�owe_w_tle_l.Count );
//  zt_kula_kryszta�owa.Position.AsVector := TPodest(podesty_l[ zti ]).Kula_Start.AbsolutePosition;
//  zt_kula_kryszta�owa.Direction.SetVector
//    (
//        TPodest(podesty_l[ zti ]).Kula_Cel.AbsolutePosition.X - zt_kula_kryszta�owa.AbsolutePosition.X
//      , TPodest(podesty_l[ zti ]).Kula_Cel.AbsolutePosition.Y - zt_kula_kryszta�owa.AbsolutePosition.Y
//      , TPodest(podesty_l[ zti ]).Kula_Cel.AbsolutePosition.Z - zt_kula_kryszta�owa.AbsolutePosition.Z
//    );



  kule_kryszta�owe_w_tle_l.Add( zt_kula_kryszta�owa );

end;//---//Funkcja Dodaj_Kul�_W_Tle().

//Funkcja Od��cz_Kul�().
procedure TKrysztalowe_Kule_Form.Od��cz_Kul�( kula_kryszta�owa_f : TKula_Kryszta�owa  );
begin

  // Usuwa� tylko w jednym miejscu. !!!
  // Wywo�anie tej funkcji w kliku miejscach mo�e co� zepsu�.

  if   ( kule_kryszta�owe_l = nil )
    or (  not Assigned( kule_kryszta�owe_l )  )
    or ( kula_kryszta�owa_f = nil )
    {or ( pociski_magiczne_blokada )} then
    Exit;

  //pociski_magiczne_blokada := true;

  kule_kryszta�owe_l.Remove( kula_kryszta�owa_f );
  FreeAndNil( kula_kryszta�owa_f );

  //pociski_magiczne_blokada := false;

end;//---//Funkcja Od��cz_Kul�().

//Funkcja Zwolnij_Wszystkie_Kule().
procedure TKrysztalowe_Kule_Form.Zwolnij_Wszystkie_Kule();
var
  i : integer;
begin

  if   ( kule_kryszta�owe_l = nil )
    or (  not Assigned( kule_kryszta�owe_l )  ) then
    Exit;

  for i := kule_kryszta�owe_l.Count - 1 downto 0 do
    begin

      TKula_Kryszta�owa(kule_kryszta�owe_l[ i ]).Free();
      kule_kryszta�owe_l.Delete( i );

    end;
  //---//for i := kule_kryszta�owe_l.Count - 1 downto 0 do

end;//---//Funkcja Zwolnij_Wszystkie_Kule().

//Funkcja Zwolnij_Wszystkie_Kule_W_Tle().
procedure TKrysztalowe_Kule_Form.Zwolnij_Wszystkie_Kule_W_Tle();
var
  i : integer;
begin

  if   ( kule_kryszta�owe_w_tle_l = nil )
    or (  not Assigned( kule_kryszta�owe_w_tle_l )  ) then
    Exit;

  for i := kule_kryszta�owe_w_tle_l.Count - 1 downto 0 do
    begin

      TKula_Kryszta�owa(kule_kryszta�owe_w_tle_l[ i ]).Free();
      kule_kryszta�owe_w_tle_l.Delete( i );

    end;
  //---//for i := kule_kryszta�owe_l.Count - 1 downto 0 do

end;//---//Funkcja Zwolnij_Wszystkie_Kule_W_Tle().

//Funkcja Kule_Kryszta�owe_Lot().
procedure TKrysztalowe_Kule_Form.Kule_Kryszta�owe_Lot( const deltaTime : Double );
var
  i : integer;
  k�t,
  pr�dko��
    : real;
  zt_kula_kryszta�owa : TKula_Kryszta�owa;
begin

  if   ( kule_kryszta�owe_l = nil )
    or (  not Assigned( kule_kryszta�owe_l )  )
    or ( Pauza_MenuItem.Checked ) then
    Exit;


  for i := kule_kryszta�owe_l.Count - 1 downto 0 do
    begin

      //TKula_Kryszta�owa(kule_kryszta�owe_l[ i ]).Move( deltaTime * 0.3 );

      zt_kula_kryszta�owa := TKula_Kryszta�owa(kule_kryszta�owe_l[ i ]);

      if    ( zt_kula_kryszta�owa <> nil )
        and (  Assigned( zt_kula_kryszta�owa )  ) then
        begin

          pr�dko�� := ( zt_kula_kryszta�owa.pr�dko�� + kule_bonus_pr�dko�� );

          if pr�dko�� < 2 then
            pr�dko�� := 2;

          zt_kula_kryszta�owa.Move(  deltaTime * 0.1 * pr�dko�� + 0.00001 * wsp�czynnik_trudno�ci  );
          //zt_kula_kryszta�owa.Move( deltaTime * 0.3 * 4 );


    //      if    (   Abs( zt_kula_kryszta�owa.AbsolutePosition.X ) < Abs( zt_kula_kryszta�owa.podest.Kula_Cel.AbsolutePosition.X )   )
    //        and (
    //                 (     ( not zt_kula_kryszta�owa.czy_prawa_strona )
    //                   and ( zt_kula_kryszta�owa.PitchAngle < 90 )
    //                 )
    //              or (
    //                      ( zt_kula_kryszta�owa.czy_prawa_strona )
    //                  and (
    //                           ( zt_kula_kryszta�owa.PitchAngle > 90 )
    //                        or ( zt_kula_kryszta�owa.PitchAngle = 0 )
    //                      )
    //                 )
    //            ) then
    //        zt_kula_kryszta�owa.Pitch( -deltaTime * 120 );
    //      //Caption := FloatToStr( zt_kula_kryszta�owa.PitchAngle );
          if Abs( zt_kula_kryszta�owa.AbsolutePosition.X ) < Abs( zt_kula_kryszta�owa.podest.Kula_Cel.AbsolutePosition.X ) then
            begin

              // W locie.

              if zt_kula_kryszta�owa.pr�dko�� < 4 then // Przy�pieszanie w locie.
                zt_kula_kryszta�owa.pr�dko�� := zt_kula_kryszta�owa.pr�dko�� + 0.005;


              // PitchAngle kul (zakres -180 do 180).
              // Lewa strona od 0 do 90.
              // Prawa strona od 180 do 90

              if zt_kula_kryszta�owa.PitchAngle <> 90 then
                begin

                  k�t := deltaTime * 280 * ( 90 - zt_kula_kryszta�owa.PitchAngle ) / 90;

                  if not zt_kula_kryszta�owa.czy_prawa_strona then
                    k�t := -k�t;

                  // Ma zapobiega� zbyt g��bokiemu skr�caniu kul (np. gdy gra zwalnia).
                  if not zt_kula_kryszta�owa.czy_prawa_strona then
                    begin

                      // Lewa strona.

                      if   ( zt_kula_kryszta�owa.PitchAngle + k�t > 90 )
                        or ( zt_kula_kryszta�owa.PitchAngle + k�t < 0 ) then
                        k�t := 0;

                    end
                  else//if not zt_kula_kryszta�owa.czy_prawa_strona then
                    begin

                      // Prawa strona.

                    end;
                  //---//if not zt_kula_kryszta�owa.czy_prawa_strona then


                  zt_kula_kryszta�owa.Pitch( k�t );


                  // Ma zapobiega� zbyt g��bokiemu skr�caniu kul (np. gdy gra zwalnia).
                  if not zt_kula_kryszta�owa.czy_prawa_strona then
                    begin

                      // Lewa strona.

                    end
                  else//if not zt_kula_kryszta�owa.czy_prawa_strona then
                    begin

                      // Prawa strona.

                      if zt_kula_kryszta�owa.PitchAngle < 90 then
                        zt_kula_kryszta�owa.PitchAngle := 90;

                    end;
                  //---//if not zt_kula_kryszta�owa.czy_prawa_strona then

                end;
              //---//if zt_kula_kryszta�owa.PitchAngle <> 90 then


              if not zt_kula_kryszta�owa.czy_prawa_strona then
                zt_kula_kryszta�owa.efekt_uchwyt.RollAngle := -zt_kula_kryszta�owa.PitchAngle
              else//if not zt_kula_kryszta�owa.czy_prawa_strona then
                zt_kula_kryszta�owa.efekt_uchwyt.RollAngle := 180 + zt_kula_kryszta�owa.PitchAngle;

            end
          else//if Abs( zt_kula_kryszta�owa.AbsolutePosition.X ) < Abs( zt_kula_kryszta�owa.podest.Kula_Cel.AbsolutePosition.X ) then
            begin

              // Na pode�cie.

              if zt_kula_kryszta�owa.pr�dko�� < 4 then // Przy�pieszanie na pode�cie.
                zt_kula_kryszta�owa.pr�dko�� := zt_kula_kryszta�owa.pr�dko�� + 0.0025;

            end;
          //---//if Abs( zt_kula_kryszta�owa.AbsolutePosition.X ) < Abs( zt_kula_kryszta�owa.podest.Kula_Cel.AbsolutePosition.X ) then

          //if i = 1 then
          //  Caption := FloatToStr( zt_kula_kryszta�owa.PitchAngle );

          if   ( zt_kula_kryszta�owa.czy_usun�� )
            or ( zt_kula_kryszta�owa.Position.Y < Pod�o�e_GLCube.Position.Y )
            or (   Abs(  Test_GLSphere.DistanceTo( zt_kula_kryszta�owa )  ) > 5   ) then // Gdy dziwnie poleci.
            begin

              Od��cz_Kul�( zt_kula_kryszta�owa );

            end;
          //---//if zt_kula_kryszta�owa.czy_usun�� then

          //TKula_Kryszta�owa(kule_kryszta�owe_l[ i ]).Move( deltaTime * 3 );

        end;
      //---//if    ( zt_kula_kryszta�owa <> nil ) (...)

    end;
  //---//for i := kule_kryszta�owe_l.Count - 1 downto 0 do

  //pociski_magiczne_blokada := false;

end;//---//Funkcja Kule_Kryszta�owe_Lot().

//Funkcja Wyniki_Wypisz().
procedure TKrysztalowe_Kule_Form.Wyniki_Wypisz();
//var
//  zti : integer;
begin

//  zti := kul_z�apanych + kul_nie_z�apanych;

//  if zti <> 0 then
//    wsp�czynnik_trudno�ci_procent := 100 * kul_z�apanych / zti
//  else
//    wsp�czynnik_trudno�ci_procent := 0;

  //if kul_z�apanych - kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci + wsp�czynnik_trudno�ci_modyfikator > kul_nie_z�apanych then
  //  wsp�czynnik_trudno�ci := kul_z�apanych - kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci + wsp�czynnik_trudno�ci_modyfikator - kul_nie_z�apanych
  //else//if kul_z�apanych - kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci > kul_nie_z�apanych then
  //  wsp�czynnik_trudno�ci := 0;


  wsp�czynnik_trudno�ci := ( kul_z�apanych - kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci + wsp�czynnik_trudno�ci_modyfikator - kul_nie_z�apanych ) * wsp�czynnik_trudno�ci_mno�nik;

  if wsp�czynnik_trudno�ci < 0 then
    wsp�czynnik_trudno�ci := 0;


  if wsp�czynnik_trudno�ci_najwy�szy_osi�gni�ty < wsp�czynnik_trudno�ci then
    begin

      wsp�czynnik_trudno�ci_najwy�szy_osi�gni�ty := wsp�czynnik_trudno�ci;

      if Wsp�czynnik_Trudno�ci_ProgressBar.Max <= wsp�czynnik_trudno�ci_najwy�szy_osi�gni�ty then
        begin

          Wsp�czynnik_Trudno�ci_ProgressBar.Max := Wsp�czynnik_Trudno�ci_ProgressBar.Max * 2;

          Wsp�czynnik_Trudno�ci_ProgressBar_Max_Label.Caption := Trim(  FormatFloat( '### ### ##0', Wsp�czynnik_Trudno�ci_ProgressBar.Max )  ) + '.';

        end;
      //---//if Wsp�czynnik_Trudno�ci_ProgressBar.Max <= wsp�czynnik_trudno�ci_najwy�szy_osi�gni�ty then

    end;
  //---//if wsp�czynnik_trudno�ci_najwy�szy_osi�gni�ty < wsp�czynnik_trudno�ci then


  //Caption := Trim(  FormatFloat( '### ### ##0', wsp�czynnik_trudno�ci )  );

  Kul_Z�apanych_Label.Caption := 'Kul z�apanych' + #13 + Trim(  FormatFloat( '### ### ##0', kul_z�apanych )  ) + '.';
  Kul_Nie_Z�apanych_Label.Caption := 'Kul nie z�apanych' + #13 + Trim(  FormatFloat( '### ### ##0', kul_nie_z�apanych )  ) + '.';

  if    ( kule_kryszta�owe_l <> nil )
    and (  Assigned( kule_kryszta�owe_l )  ) then
    Kul_Na_Planszy_Label.Caption := 'Kul na planszy' + #13 + Trim(  FormatFloat( '### ### ##0', kule_kryszta�owe_l.Count - 1 )  ) + '.'
  else//if    ( kule_kryszta�owe_l <> nil ) (...)
    Kul_Na_Planszy_Label.Caption := 'Kul na planszy' + #13 + '<?>.';

  Wsp�czynnik_Trudno�ci_Label.Caption := 'Trudno��' + #13 + Trim(  FormatFloat( '### ### ##0.000', wsp�czynnik_trudno�ci )  ) + '.';

  Wsp�czynnik_Trudno�ci_Najwy�szy_Osi�gni�ty_Label.Caption := 'Rekord trudno�ci' + #13 + Trim(  FormatFloat( '### ### ##0.000', wsp�czynnik_trudno�ci_najwy�szy_osi�gni�ty )  ) + '.';


  Wsp�czynnik_Trudno�ci_ProgressBar.Position := Round( wsp�czynnik_trudno�ci );


  if wsp�czynnik_trudno�ci < wsp�czynnik_trudno�ci_najwy�szy_osi�gni�ty then
    Wsp�czynnik_Trudno�ci_Najwy�szy_Osi�gni�ty_Label.Font.Color := $00FFFF79
  else//if wsp�czynnik_trudno�ci < wsp�czynnik_trudno�ci_najwy�szy_osi�gni�ty then
    Wsp�czynnik_Trudno�ci_Najwy�szy_Osi�gni�ty_Label.Font.Color := clWhite;

end;//---//Funkcja Wyniki_Wypisz().

//Funkcja Pauza().
procedure TKrysztalowe_Kule_Form.Pauza( const aktywno��_f : boolean );
begin

  //
  // Funkcja ustawia aktywno�� pauzy.
  //
  // Parametry:
  //   aktywno��_f:
  //     true - pauza aktywna.
  //     false - pauza nie aktywna.
  //

  Pauza_MenuItem.Checked := aktywno��_f;
  //GLCadencer1.Enabled := not Pauza_MenuItem.Checked;

  //Pauza_GLHUDText.Visible := aktywno��_f;
  Pauza_GLSpaceText.Visible := aktywno��_f;

end;//---//Funkcja Pauza().

//Funkcja Dodaj_Bonus().
procedure TKrysztalowe_Kule_Form.Dodaj_Bonus( const id_bonus_f : TBonus );
begin

  //
  // Funkcja ustawia aktywno�� pauzy.
  //
  // Parametry:
  //   aktywno��_f:
  //     true - pauza aktywna.
  //     false - pauza nie aktywna.
  //

  if id_bonus_f = b_Brak then
    Exit;

  // b_Brak, b_Spowolnienie_Kul, b_Przy�pieszenie_Kul, b_Spowolnienie_Koszyka, b_Przy�pieszenie_Koszyka, b_Powi�kszenie_Koszyka, b_Pomniejszenie_Koszyka

  case id_bonus_f of
//      b_Brak :
//        begin
//          //daty_graniczne[ 1, 1 ] := dzien;
//        end;
//      //---//b_Brak :

      b_Przy�pieszenie_Kul :
        if kule_bonus_pr�dko�� < 20 then
          kule_bonus_pr�dko�� := kule_bonus_pr�dko�� + 1;

      b_Spowolnienie_Kul :
        if kule_bonus_pr�dko�� > -10 then
          kule_bonus_pr�dko�� := kule_bonus_pr�dko�� - 1;


      b_Przy�pieszenie_Koszyka :
        if koszyk_pr�dko�� < 4 then
          koszyk_pr�dko�� := koszyk_pr�dko�� + 0.2;

      b_Spowolnienie_Koszyka :
        if koszyk_pr�dko�� > 0.5 then
          koszyk_pr�dko�� := koszyk_pr�dko�� - 0.2;


      b_Powi�kszenie_Koszyka :
        if Koszyk_GLDummyCube.Scale.Z <= 2 then
          Koszyk_GLDummyCube.Scale.Z := Koszyk_GLDummyCube.Scale.Z + 0.2;

      b_Pomniejszenie_Koszyka :
        if Koszyk_GLDummyCube.Scale.Z >= 0.25 then
          Koszyk_GLDummyCube.Scale.Z := Koszyk_GLDummyCube.Scale.Z - 0.2;

    end;
  //---//case id_bonus_f of
  //Caption := FloatToStr( kule_bonus_pr�dko�� );
end;//---//Funkcja Dodaj_Bonus().

//Funkcja Czy_Bonus_Negatywny().
function TKrysztalowe_Kule_Form.Czy_Bonus_Negatywny( const id_bonus_f : TBonus ) : boolean;
begin

  //
  // Funkcja sprawdza czy bonus jest negatywny.
  //
  // Zwraca prawd� gdy bonus jest negatywny.
  //
  // Parametry:
  //   id_bonus_f.
  //


  // b_Brak, b_Spowolnienie_Kul, b_Przy�pieszenie_Kul, b_Spowolnienie_Koszyka, b_Przy�pieszenie_Koszyka, b_Powi�kszenie_Koszyka, b_Pomniejszenie_Koszyka

  if id_bonus_f in [ b_Przy�pieszenie_Kul, b_Spowolnienie_Koszyka, b_Pomniejszenie_Koszyka ] then
    Result := true
  else//if id_bonus_f in [ b_Przy�pieszenie_Kul, b_Spowolnienie_Koszyka, b_Pomniejszenie_Koszyka ] then
    Result := false;

end;//---//Funkcja Czy_Bonus_Negatywny().

//---//      ***      Funkcje      ***      //---//


//FormShow().
procedure TKrysztalowe_Kule_Form.FormShow( Sender: TObject );
begin

  pauza_zmiany_okna := false;

  kule_ilo��_bez_zwi�kszania_stopnia_trudno�ci := 50;
  koszyk_pr�dko��_warto��_pocz�tkowa := 1;
  interwa�_dodania_kuli_pr�g := 70;
  wsp�czynnik_trudno�ci_modyfikator := 0;
  wsp�czynnik_trudno�ci_mno�nik := 0.7;

  Koszyk_GLDummyCube.Direction.SetVector( 1, 0, 0 ); // Aby mia� odpowiednie ustawienie do p�niejszych ruch�w.
  Koszyk_GLCube.CubeDepth := 2 * kula_kryszta�owa_promie�;
  Koszyk_GLCube.CubeHeight := 0.01;
  Koszyk_GLCube.CubeWidth := 2 * kula_kryszta�owa_promie�;

  //GLSceneViewer1.Align := alClient;
  GLSceneViewer1.Top := 0;

  O_Programie_Panel.Align := alClient;

  GLThorFXManager1.GlowSize := kula_kryszta�owa_promie� + 0.01;

  moment_wci�ni�cia_klawisza := Now();

  Wczytaj_Ustawienia();

  //Opcje__Pe�ny_Ekran_MenuItemClick( Sender ); // Wywo�anie tutaj sprawia, �e menu g��wne jest przys�oni�te (wychodzi poza ekran) i wida� dolny pasek Windows.

  podesty_l := TList.Create();
  kule_kryszta�owe_l := TList.Create();
  kule_kryszta�owe_w_tle_l := TList.Create();

  GLSkyDome1.Stars.AddRandomStars( 1000, clWhite );

  GLThorFXManager1.GlowSize := kula_kryszta�owa_promie� - 0.012;

  Wczytaj_Klawisze_Konfiguracja();

  Pocz�tkowy_Timer.Enabled := true;

  //Gra__Nowa_MenuItemClick( Sender ); //???
  //Opcje__Rz�dy_3_MenuItem.Checked := true;//???
  //Utw�rz_Podesty();//???
  //Dodaj_Kul�(); //???
  //Krysztalowe_Kule_Form.WindowState := wsNormal; //???

end;//---//FormShow().

//FormClose().
procedure TKrysztalowe_Kule_Form.FormClose( Sender: TObject; var Action: TCloseAction );
begin

  if not Pauza_MenuItem.Checked then
    Pauza( true );


  moment_wci�ni�cia_klawisza := IncSecond( Now() );

  if Application.MessageBox( 'Zako�czy� dzia�anie programu?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) <> IDYES then
    begin

      moment_wci�ni�cia_klawisza := IncSecond( Now() );

      Action := caNone;
      Pauza( false );
      Exit;

    end;
  //---//if Application.MessageBox( 'Zako�czy� dzia�anie programu?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) <> IDYES then

  moment_wci�ni�cia_klawisza := IncSecond( Now() );


  Zwolnij_Wszystkie_Kule();
  Zwolnij_Wszystkie_Kule_W_Tle();

  FreeAndNil( kule_kryszta�owe_l );
  FreeAndNil( kule_kryszta�owe_w_tle_l );

  Zwolnij_Podesty();

  FreeAndNil( podesty_l );

end;//---//FormClose().

//FormResize().
procedure TKrysztalowe_Kule_Form.FormResize( Sender: TObject );
var
  zti : integer;
begin

//  if not Pauza_MenuItem.Checked then
//    Pauza_MenuItem.Checked := true;

  if    ( not Opcje__Rz�dy_2_MenuItem.Checked )
    and ( not Opcje__Rz�dy_3_MenuItem.Checked ) then
    Opcje__Rz�dy_2_MenuItem.Checked := true; // Drugie klikni�cie na zaznaczon� pozycje sprawia, �e �adna nie jest zaznaczona.


  Lewo_G�ra_Odst�p_Panel.Height := Round( Lewo_Panel.Height * 0.1 ); // 10%.
  Prawo_G�ra_Odst�p_Panel.Height := Lewo_G�ra_Odst�p_Panel.Height;


  //if Opcje__Rz�dy_3_MenuItem.Checked then
  //  zti := 6
  //else//if Opcje__Rz�dy_3_MenuItem.Checked then
  //  zti := 4;
  //
  //zti := Round(  ( Lewo_Panel.Height - Lewo_G�ra_Odst�p_Panel.Height ) / zti  );

  zti := Round( Lewo_Panel.Height * 0.15 ); // 15%.

  if zti <= 0 then
    zti := 1;


  Lewo_G�ra_Button.Top := Lewo_G�ra_Odst�p_Panel.Top + Lewo_G�ra_Odst�p_Panel.Height;

  Lewo_D�_Button.Visible := Opcje__Rz�dy_3_MenuItem.Checked;
  Prawo_D�_Button.Visible := Opcje__Rz�dy_3_MenuItem.Checked;

  Lewo_G�ra_Button.Height := zti;
  Lewo_�rodek_Button.Height := Lewo_G�ra_Button.Height;
  Lewo_D�_Button.Height := Lewo_G�ra_Button.Height;

  Prawo_G�ra_Button.Height := Lewo_G�ra_Button.Height;
  Prawo_�rodek_Button.Height := Lewo_G�ra_Button.Height;
  Prawo_D�_Button.Height := Lewo_G�ra_Button.Height;


  if Opcje__Rz�dy_3_MenuItem.Checked then
    begin

      Lewo_�rodek_Button.Top := zti + Lewo_G�ra_Button.Top;
      Lewo_D�_Button.Top := 2 * zti + Lewo_G�ra_Button.Top;

    end
  else//if Opcje__Rz�dy_3_MenuItem.Checked then
    begin

      Lewo_�rodek_Button.Top := zti + Lewo_G�ra_Button.Top;

    end;
  //---//if Opcje__Rz�dy_3_MenuItem.Checked then


  Prawo_G�ra_Button.Top := Lewo_G�ra_Button.Top;
  Prawo_�rodek_Button.Top := Lewo_�rodek_Button.Top;
  Prawo_D�_Button.Top := Lewo_D�_Button.Top;


  GLSceneViewer1.Height := Min( Gra_Panel.Width, Gra_Panel.Height );
  GLSceneViewer1.Width := GLSceneViewer1.Height;
  GLSceneViewer1.Left := Round(  ( Gra_Panel.Width - GLSceneViewer1.Width ) / 2  );


  Pauza_GLHUDText.Position.X := Round( GLSceneViewer1.Width / 2 );
  Pauza_GLHUDText.Position.Y := Round( GLSceneViewer1.Height / 2 );


  if Opcje__Rz�dy_3_MenuItem.Checked then
    begin

      Wsp�czynnik_Trudno�ci_ProgressBar.Top := Prawo_D�_Button.Top + Prawo_D�_Button.Height + 2;

    end
  else//if Opcje__Rz�dy_3_MenuItem.Checked then
    begin

      Wsp�czynnik_Trudno�ci_ProgressBar.Top := Prawo_�rodek_Button.Top + Prawo_�rodek_Button.Height + 2;

    end;
  //---//if Opcje__Rz�dy_3_MenuItem.Checked then

  Wsp�czynnik_Trudno�ci_ProgressBar.Height := Wsp�czynnik_Trudno�ci_Panel.Top - Wsp�czynnik_Trudno�ci_ProgressBar.Top - 2;

  Wsp�czynnik_Trudno�ci_ProgressBar_Max_Label.Top := Wsp�czynnik_Trudno�ci_ProgressBar.Top;

end;//---//FormResize().

//Przycisk_ButtonMouseEnter().
procedure TKrysztalowe_Kule_Form.Przycisk_ButtonMouseEnter( Sender: TObject );
var
  i : integer;
begin

  if    ( Sender <> nil )
    and ( Sender is TButton ) then
    begin

      //TButton(Sender).Caption := 'O'; //???

      if    ( podesty_l <> nil )
        and (  Assigned( podesty_l )  ) then
        for i := 0 to podesty_l.Count - 1 do
          if Pos( TPodest(podesty_l[ i ]).Name, TButton(Sender).Name ) = 1 then
            begin

              koszyk_cel := TPodest(podesty_l[ i ]).Kula_Pozycja_Koszyka.AbsolutePosition;
              Break;

            end;
          //---//if Pos( TPodest(podesty_l[ i ]).Name, TButton(Sender).Name ) = 1 then

    end;
  //---//if    ( Sender <> nil ) (...)

  //koszyk_cel := GLVectorGeometry.PointMake( -0.7, 0.7, 0 );

end;//---//Przycisk_ButtonMouseEnter().

//Przycisk_ButtonMouseLeave().
procedure TKrysztalowe_Kule_Form.Przycisk_ButtonMouseLeave( Sender: TObject );
begin

  //???
  //if    ( Sender <> nil )
  //  and ( Sender is TButton ) then
  //  TButton(Sender).Caption := '';

end;//---//Przycisk_ButtonMouseLeave().

//Gra__Nowa_MenuItemClick().
procedure TKrysztalowe_Kule_Form.Gra__Nowa_MenuItemClick( Sender: TObject );
begin

  moment_wci�ni�cia_klawisza := IncSecond( Now() );


  if not Pauza_MenuItem.Checked then
    Pauza( true );

  koszyk_pr�dko�� := koszyk_pr�dko��_warto��_pocz�tkowa; // 1.8
  kule_bonus_pr�dko�� := 0;// 20
  kul_z�apanych := 0;
  kul_nie_z�apanych := 0;
  wsp�czynnik_trudno�ci := 0;
  wsp�czynnik_trudno�ci_najwy�szy_osi�gni�ty := 0;
  kule_w_tle__piramida_poziom := 0;
  kule_w_tle__piramida_strona := 0;
  kule_w_tle__piramida_poziom_od�o�enia_kuli := kule_w_tle__piramida_poziom;

  Wyniki_Wypisz();

  koszyk_cel := GLVectorGeometry.PointMake( 0, 0, 0 );
  Koszyk_GLDummyCube.Position.SetPoint( 0, 0, 0 );
  Koszyk_GLDummyCube.Scale.Z := 1;

  Opcje__Rz�dy_2_MenuItem.Enabled := false;
  Opcje__Rz�dy_3_MenuItem.Enabled := false;

  Zwolnij_Wszystkie_Kule();
  Zwolnij_Wszystkie_Kule_W_Tle();
  Zwolnij_Podesty();

  Utw�rz_Podesty();


  FormResize( Sender );

  Wsp�czynnik_Trudno�ci_ProgressBar.Position := 0;
  Wsp�czynnik_Trudno�ci_ProgressBar.Max := 10;
  Wsp�czynnik_Trudno�ci_ProgressBar_Max_Label.Caption := Trim(  FormatFloat( '### ### ##0', Wsp�czynnik_Trudno�ci_ProgressBar.Max )  ) + '.';

  kule_kryszta�owe_poprzednie_dodanie := Now();

  Randomize();

  //if Pauza_MenuItem.Checked then
    Pauza( false );

end;//---//Gra__Nowa_MenuItemClick().

//Gra__Wyczy��_MenuItemClick().
procedure TKrysztalowe_Kule_Form.Gra__Wyczy��_MenuItemClick( Sender: TObject );
begin

  moment_wci�ni�cia_klawisza := IncSecond( Now() );


  Opcje__Rz�dy_2_MenuItem.Enabled := true;
  Opcje__Rz�dy_3_MenuItem.Enabled := true;

  Zwolnij_Wszystkie_Kule();
  Zwolnij_Wszystkie_Kule_W_Tle();

end;//---//Gra__Wyczy��_MenuItemClick().

//Gra__Maksymalizuj_MenuItemClick().
procedure TKrysztalowe_Kule_Form.Gra__Maksymalizuj_MenuItemClick( Sender: TObject );
begin

  WindowState := wsMaximized;

end;//---//Gra__Maksymalizuj_MenuItemClick().

//Gra__Normalizuj_MenuItemClick().
procedure TKrysztalowe_Kule_Form.Gra__Normalizuj_MenuItemClick( Sender: TObject );
begin

  WindowState := wsNormal;

end;//---//Gra__Normalizuj_MenuItemClick().

//Gra__Minimalizuj_MenuItemClick().
procedure TKrysztalowe_Kule_Form.Gra__Minimalizuj_MenuItemClick( Sender: TObject );
begin

  WindowState := wsMinimized;

end;//---//Gra__Minimalizuj_MenuItemClick().

//Gra__Zamknij_MenuItemClick().
procedure TKrysztalowe_Kule_Form.Gra__Zamknij_MenuItemClick( Sender: TObject );
begin

  moment_wci�ni�cia_klawisza := IncSecond( Now() );


//  if not Pauza_MenuItem.Checked then
//    Pauza_MenuItem.Checked := true;
//
//
//  if Application.MessageBox( 'Zako�czy� dzia�anie programu?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES then
    Close();

end;//---//Gra__Zamknij_MenuItemClick().

//Opcje__Pe�ny_Ekran_MenuItemClick().
procedure TKrysztalowe_Kule_Form.Opcje__Pe�ny_Ekran_MenuItemClick( Sender: TObject );
begin

  moment_wci�ni�cia_klawisza := IncSecond( Now() );


  if Opcje__Pe�ny_Ekran_MenuItem.Checked then
    begin

      window_state_kopia := Krysztalowe_Kule_Form.WindowState;

      Krysztalowe_Kule_Form.BorderStyle := bsNone;
      Krysztalowe_Kule_Form.WindowState := wsMaximized;
      Krysztalowe_Kule_Form.Left := 0;
      Krysztalowe_Kule_Form.Top := 0;
      Krysztalowe_Kule_Form.Height := Screen.Height;
      Krysztalowe_Kule_Form.Width := Screen.Width;

      Krysztalowe_Kule_Form.BringToFront();

    end
  else//if Opcje__Pe�ny_Ekran_MenuItem.Checked then
    begin

      //Krysztalowe_Kule_Form.WindowState := wsNormal;
      Krysztalowe_Kule_Form.WindowState := window_state_kopia;
      Krysztalowe_Kule_Form.BorderStyle := bsSizeable;

    end
  //---//if Opcje__Pe�ny_Ekran_MenuItem.Checked then

end;//---//Opcje__Pe�ny_Ekran_MenuItemClick().

//Ustawienia__Klawisze_MenuItemClick().
procedure TKrysztalowe_Kule_Form.Ustawienia__Klawisze_MenuItemClick( Sender: TObject );
var
  czy_pauza : boolean;
begin

  moment_wci�ni�cia_klawisza := IncSecond( Now() );


  czy_pauza := Pauza_MenuItem.Checked;

  if not Pauza_MenuItem.Checked then
    Pauza( true );


  Klawisze_Konfiguracja_Form := TKlawisze_Konfiguracja_Form.Create( Application );


  Klawisze_Konfiguracja_Form.Klawisze_Konfiguracja_Korzystaj_CheckBox.Checked := klawisze_konfiguracja_korzystaj;

  Klawisze_Konfiguracja_Form.Lewo_G�ra_JvSpinEdit.Value := k_lewo_g�ra;
  Klawisze_Konfiguracja_Form.Lewo_�rodek_JvSpinEdit.Value := k_lewo_�rodek;
  Klawisze_Konfiguracja_Form.Lewo_D�_JvSpinEdit.Value := k_lewo_d�;

  Klawisze_Konfiguracja_Form.Prawo_G�ra_JvSpinEdit.Value := k_prawo_g�ra;
  Klawisze_Konfiguracja_Form.Prawo_�rodek_JvSpinEdit.Value := k_prawo_�rodek;
  Klawisze_Konfiguracja_Form.Prawo_D�_JvSpinEdit.Value := k_prawo_d�;

  Klawisze_Konfiguracja_Form.Pauza_JvSpinEdit.Value := k_pauza;
  Klawisze_Konfiguracja_Form.Pe�ny_Ekran_JvSpinEdit.Value := k_pe�ny_ekran;
  Klawisze_Konfiguracja_Form.Zamknij_JvSpinEdit.Value := k_zamknij;


  Klawisze_Konfiguracja_Form.ShowModal();

  if Klawisze_Konfiguracja_Form.ModalResult = mrOk then
    begin

      Wczytaj_Klawisze_Konfiguracja();

    end;
  //---//if Klawisze_Konfiguracja_Form.ModalResult = mrOk then

  FreeAndNil( Klawisze_Konfiguracja_Form );


  if not czy_pauza then
    Pauza( false );

end;//---//Ustawienia__Klawisze_MenuItemClick().

//Pe�ny_Ekran_MenuItemClick().
procedure TKrysztalowe_Kule_Form.Pe�ny_Ekran_MenuItemClick( Sender: TObject );
begin

  moment_wci�ni�cia_klawisza := IncSecond( Now() );


  Opcje__Pe�ny_Ekran_MenuItem.Checked := not Opcje__Pe�ny_Ekran_MenuItem.Checked;

  Opcje__Pe�ny_Ekran_MenuItemClick( Sender );

end;//---//Pe�ny_Ekran_MenuItemClick().

//O_Programie_MenuItemClick().
procedure TKrysztalowe_Kule_Form.O_Programie_MenuItemClick( Sender: TObject );
begin

  // Tutaj specjalnie po zamkni�ciu mo�na lata� koszykiem.

  moment_wci�ni�cia_klawisza := IncSecond( Now() );


  O_Programie_Panel.Visible := not O_Programie_Panel.Visible;

  if    ( O_Programie_Panel.Visible )
    and ( not Pauza_MenuItem.Checked ) then
    Pauza_MenuItem.Checked := true;

  if O_Programie_Panel.Visible then
    O_Programie_Panel.BringToFront();

end;//---//O_Programie_MenuItemClick().

//MainMenu1_MenuItemClick().
procedure TKrysztalowe_Kule_Form.MainMenu1_MenuItemClick( Sender: TObject );
begin

  // Po klikni�ciu na menu g��wne obraz gry si� nie od�wie�a ale elementy s� przeliczane (przesuwaj� si�).

  moment_wci�ni�cia_klawisza := IncSecond( Now() );


  if    ( Sender <> nil )
    and ( TComponent(Sender).Name = Pauza_MenuItem.Name ) then
    Pauza_MenuItem.Checked := not Pauza_MenuItem.Checked
  else//if    ( Sender <> nil ) (...)
    if not Pauza_MenuItem.Checked then
      Pauza_MenuItem.Checked := true;

  //GLCadencer1.Enabled := not Pauza_MenuItem.Checked;

  //Pauza_GLHUDText.Visible := Pauza_MenuItem.Checked;
  Pauza_GLSpaceText.Visible := Pauza_MenuItem.Checked;


  if    ( Sender <> nil )
    and (
             ( TComponent(Sender).Name = Opcje__Rz�dy_2_MenuItem.Name )
          or ( TComponent(Sender).Name = Opcje__Rz�dy_3_MenuItem.Name )
        ) then
    FormResize( Sender )

end;//---//MainMenu1_MenuItemClick().

//Pocz�tkowy_TimerTimer().
procedure TKrysztalowe_Kule_Form.Pocz�tkowy_TimerTimer( Sender: TObject );
begin

  Pocz�tkowy_Timer.Enabled := false;
  Opcje__Pe�ny_Ekran_MenuItemClick( Sender );

end;//---//Pocz�tkowy_TimerTimer().

//GLSceneViewer1MouseMove().
procedure TKrysztalowe_Kule_Form.GLSceneViewer1MouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );

  //Funkcja Prosta_1() w GLSceneViewer1MouseMove().
  procedure Prosta_1();
  var
    xA_xB : real;
  begin

    Exit; // Nieu�ywane.

    Caption := FloatToStr( koszyk_cel.X );
    xA_xB := koszyk_ograniczenie_g�rne.X - koszyk_ograniczenie_�rodkowe.X;

    if xA_xB = 0 then
      Exit;

    koszyk_cel.X := GLSceneViewer1.Buffer.ScreenToWorld( X, Y ).X;

    koszyk_cel.Y :=
      koszyk_cel.X * ( koszyk_ograniczenie_g�rne.Y - koszyk_ograniczenie_�rodkowe.Y ) / xA_xB +
      (
      koszyk_ograniczenie_g�rne.Y -
      koszyk_ograniczenie_g�rne.X * ( koszyk_ograniczenie_g�rne.Y - koszyk_ograniczenie_�rodkowe.Y ) / xA_xB
      );


    //if koszyk_cel.X > 0 then
    //  koszyk_cel.Y := -koszyk_cel.Y;

  end;//Funkcja Prosta_1() w GLSceneViewer1MouseMove().

  //Funkcja Prosta() w GLSceneViewer1MouseMove().
  function Prosta( xA, yA, xB, yB : real ) : real;
  var
    xA_xB,
    A,
    B
      : real;
  begin


    //
    // Funkcja wylicza parametry prostej przechodz�cej przez dwa punkty (tutaj s�siednie punkty pozycji koszyka na podestach).
    //
    // Zwraca warto�� X.
    // Zwraca maksymalne przesuni�cie (x) na danej wysoko�ci (y). Je�eli cel koszyka jest poza prost� to b�dzie to punkt na prostej.
    //
    // y = Ax + B
    // x = ( y - B ) / A
    // 0 = Ax - y + B;
    //

    Result := koszyk_cel.X;

    xA_xB := xA - xB;

    if xA_xB = 0 then
      Exit;

    A := ( yA - yB ) / xA_xB;
    B :=  yA - xA * ( yA - yB ) / xA_xB;

    if A = 0 then
      Exit;

    Result := ( koszyk_cel.Y - B ) / A;

    //Result :=
    //  koszyk_cel.X * ( yA - yB ) / xA_xB +
    //  (
    //  yA -
    //  xA * ( yA - yB ) / xA_xB
    //  );

  end;//---//Funkcja Prosta() w GLSceneViewer1MouseMove().

var
  koszyk_cel__x : real;
begin//GLSceneViewer1MouseMove().

  //Prosta_1();
  koszyk_cel.X := GLSceneViewer1.Buffer.ScreenToWorld( X, Y ).X;
  koszyk_cel.Y := GLSceneViewer1.Buffer.ScreenToWorld( X, Y ).Y;

  koszyk_cel__x := koszyk_cel.X;

  if koszyk_cel.Y > koszyk_ograniczenie_g�rne.Y then
    koszyk_cel.Y := koszyk_ograniczenie_g�rne.Y;

  if koszyk_cel.Y > koszyk_ograniczenie_�rodkowe.Y then
    begin

      if koszyk_cel.X > 0 then
        koszyk_cel__x := Prosta( -koszyk_ograniczenie_g�rne.X, koszyk_ograniczenie_g�rne.Y, -koszyk_ograniczenie_�rodkowe.X, koszyk_ograniczenie_�rodkowe.Y )
      else//if koszyk_cel.X > 0 then
        koszyk_cel__x := Prosta( koszyk_ograniczenie_g�rne.X, koszyk_ograniczenie_g�rne.Y, koszyk_ograniczenie_�rodkowe.X, koszyk_ograniczenie_�rodkowe.Y );

      if Abs( koszyk_cel.X ) > Abs( koszyk_cel__x ) then
        koszyk_cel.X := koszyk_cel__x;

    end
  else//if koszyk_cel.Y > koszyk_ograniczenie_�rodkowe.Y then
  if koszyk_cel.Y > koszyk_ograniczenie_dolne.Y then
    begin

      if koszyk_cel.X > 0 then
        koszyk_cel__x := Prosta( -koszyk_ograniczenie_�rodkowe.X, koszyk_ograniczenie_�rodkowe.Y, -koszyk_ograniczenie_dolne.X, koszyk_ograniczenie_dolne.Y )
      else//if koszyk_cel.X > 0 then
        koszyk_cel__x := Prosta( koszyk_ograniczenie_�rodkowe.X, koszyk_ograniczenie_�rodkowe.Y, koszyk_ograniczenie_dolne.X, koszyk_ograniczenie_dolne.Y );

      if Abs( koszyk_cel.X ) > Abs( koszyk_cel__x ) then
        koszyk_cel.X := koszyk_cel__x;

    end;
  //---//if koszyk_cel.Y > koszyk_ograniczenie_dolne.Y then

  Exit;

  koszyk_cel.X := GLSceneViewer1.Buffer.ScreenToWorld( X, Y ).X;
  koszyk_cel.Y := GLSceneViewer1.Buffer.ScreenToWorld( X, Y ).Y;



  if koszyk_cel.Y > koszyk_ograniczenie_g�rne.Y then
    koszyk_cel.Y := koszyk_ograniczenie_g�rne.Y;

  if koszyk_cel.Y > koszyk_ograniczenie_�rodkowe.Y then
    begin
      //Caption := FloatToStr( Koszyk_GLDummyCube.Position.X ) + ' ' + FloatToStr( koszyk_ograniczenie_g�rne.X );
      //Caption := FloatToStr( Sign(koszyk_cel.X) );
      if Abs( koszyk_cel.X ) > Abs( koszyk_ograniczenie_�rodkowe.X ) then
        if koszyk_cel.X < 0 then
          koszyk_cel.X := koszyk_ograniczenie_�rodkowe.X
        else//if koszyk_cel.X < 0 then
          koszyk_cel.X := -koszyk_ograniczenie_�rodkowe.X;
    end
  else//if koszyk_cel.Y > koszyk_ograniczenie_�rodkowe.Y then
  if koszyk_cel.Y > koszyk_ograniczenie_dolne.Y then
    begin
      if Abs( koszyk_cel.X ) > Abs( koszyk_ograniczenie_dolne.X ) then
        if koszyk_cel.X < 0 then
          koszyk_cel.X := koszyk_ograniczenie_dolne.X
        else//if koszyk_cel.X < 0 then
          koszyk_cel.X := -koszyk_ograniczenie_dolne.X;
    end;
  //---//if koszyk_cel.Y > koszyk_ograniczenie_dolne.Y then

end;//---//GLSceneViewer1MouseMove().

//GLCollisionManager1Collision().
procedure TKrysztalowe_Kule_Form.GLCollisionManager1Collision( Sender: TObject; object1, object2: TGLBaseSceneObject );

  //Funkcja Oznacz_Kolizj�() w GLCollisionManager1Collision().
  procedure Oznacz_Kolizj�( object_1_f, object_2_f : TGLBaseSceneObject );
  begin

    if    ( object_1_f <> nil )
      and ( object_1_f is TKula_Kryszta�owa )
      and ( object_2_f <> nil )
      and (  not ( object_2_f is TKula_Kryszta�owa )  )
      and ( TGLCube(object_2_f).Name = 'Koszyk_GLCube' )
      and ( not Pauza_MenuItem.Checked ) then
      begin

        //if not VectorEquals( TKula_Kryszta�owa(object2).Material.FrontProperties.Emission.Color, clrRed ) then // uses GLVectorGeometry.
        //  TKula_Kryszta�owa(object2).Material.FrontProperties.Emission.Color := clrRed // uses GLColor.
        //else//if not VectorEquals( TGLTorus(object2).Material.FrontProperties.Emission.Color, clrRed ) then
        //  TKula_Kryszta�owa(object2).Material.FrontProperties.Emission.Color := clrYellowGreen;


        //Od��cz_Pocisk( TKula_Kryszta�owa(object_1_f) );
        TKula_Kryszta�owa(object_1_f).czy_z�apana := true;
        TKula_Kryszta�owa(object_1_f).czy_usun�� := true;

      end;
    //---//if    ( object1 <> nil ) (...)

  end;//---//Funkcja Oznacz_Kolizj�() w GLCollisionManager1Collision().

begin//GLCollisionManager1Collision().

  Oznacz_Kolizj�( object1, object2 );
  Oznacz_Kolizj�( object2, object1 );

end;//---//GLCollisionManager1Collision().

//GLCadencer1Progress().
procedure TKrysztalowe_Kule_Form.GLCadencer1Progress( Sender: TObject; const deltaTime, newTime: Double );

  //Funkcja Koszyk_Ruch() w GLCadencer1Progress().
  procedure Koszyk_Ruch();
  var
    zt_podest : TPodest;
  begin

    if   ( podesty_l = nil )
      or (  not Assigned( podesty_l )  )
      or ( podesty_l.Count <= 0 )
      {//???or ( Pauza_MenuItem.Checked )} then
      Exit;

    zt_podest := TPodest(podesty_l[ 0 ]);

    if   ( zt_podest = nil )
      or (  not Assigned( zt_podest )  ) then
      Exit;

    //Koszyk_GLDummyCube.Scale.Z := 2;
    //Koszyk_GLDummyCube.Scale.Y := 2;
    //Caption := FloatToStr( Koszyk_GLDummyCube.DistanceTo( koszyk_cel ) );

    //Koszyk_GLDummyCube.Position.AsVector := zt_podest.Kula_Pozycja_Koszyka.AbsolutePosition;
//    Koszyk_GLDummyCube.di

    //Koszyk_GLDummyCube.Direction.SetVector
    //  (
    //      koszyk_cel.X - Koszyk_GLDummyCube.Position.X
    //    , koszyk_cel.Y - Koszyk_GLDummyCube.Position.Y
    //    //, koszyk_cel.Z - Koszyk_GLDummyCube.Position.Z
    //    , 0
    //  );

//      (
//          zt_podest.Kula_Pozycja_Koszyka.AbsolutePosition.X - Koszyk_GLDummyCube.Position.X
//        , zt_podest.Kula_Pozycja_Koszyka.AbsolutePosition.Y - Koszyk_GLDummyCube.Position.Y
//        , zt_podest.Kula_Pozycja_Koszyka.AbsolutePosition.Z - Koszyk_GLDummyCube.Position.Z
//      );

//      (
//          zt_podest.Kula_Pozycja_Koszyka.Position.X - Koszyk_GLDummyCube.Position.X
//        , zt_podest.Kula_Pozycja_Koszyka.Position.Y - Koszyk_GLDummyCube.Position.Y
//        , zt_podest.Kula_Pozycja_Koszyka.Position.Z - Koszyk_GLDummyCube.Position.Z
//      );
    //---// Celowanie w obiekt innym obiektem.

    //Caption := FloatToStr( Koszyk_GLDummyCube.Position.Y ) + ' ' + FloatToStr( koszyk_ograniczenie_g�rne.Y ) + ' ' + FloatToStr( Koszyk_GLDummyCube.Position.Y - koszyk_ograniczenie_g�rne.Y );
    //Koszyk_GLDummyCube.Direction.Z := 0;

    //if Koszyk_GLDummyCube.DistanceTo( zt_podest.Kula_Pozycja_Koszyka ) > 0.1 then
    if Koszyk_GLDummyCube.DistanceTo( koszyk_cel ) > 0.01 then
      begin

        Koszyk_GLDummyCube.Direction.SetVector( 1, 0, 0 ); // Najpierw prostuje, gdy� ustawienie wektora obraca w najkr�tsza stron� i koszyk mo�e ustawi� si� do g�ry nagami.


        Koszyk_GLDummyCube.Direction.SetVector
          (
              koszyk_cel.X - Koszyk_GLDummyCube.Position.X
            , koszyk_cel.Y - Koszyk_GLDummyCube.Position.Y
            //, koszyk_cel.Z - Koszyk_GLDummyCube.Position.Z
            , 0
          );


        Koszyk_GLDummyCube.Move( deltaTime * 2 * koszyk_pr�dko�� + 0.00001 * wsp�czynnik_trudno�ci );

        //if Abs( Koszyk_GLDummyCube.Up.Z ) = 1 then
        //  Koszyk_GLDummyCube.Up.SetVector( 0, 1, 0 );

      end
    else//if Koszyk_GLDummyCube.DistanceTo( koszyk_cel ) > 0.01 then
      begin

        //Koszyk_GLDummyCube.Direction.SetVector( 1, 0, 0 );
        Koszyk_GLDummyCube.Direction.SetVector( 1, 0, 0 );

        //Koszyk_GLDummyCube.Up.SetVector( 0, 1, 0 );

//        //if Koszyk_GLDummyCube.PitchAngle <> 0 then
////        if Koszyk_GLDummyCube.Direction.X <> 1 then
//        if Abs( Koszyk_GLDummyCube.Direction.X ) - 1 > -0.1 then
////          //Koszyk_GLDummyCube.Pitch( -Koszyk_GLFrustrum.PitchAngle );
//          if Koszyk_GLDummyCube.Direction.X > 0 then
//            Koszyk_GLDummyCube.Pitch( -0.05 )
//          else//if Koszyk_GLDummyCube.AbsoluteDirection.X > 0 then
//            Koszyk_GLDummyCube.Pitch( 0.05 );
//          //Koszyk_GLDummyCube.Pitch( Koszyk_GLDummyCube.AbsoluteDirection.X );

      end;
    //---//if Koszyk_GLDummyCube.DistanceTo( koszyk_cel ) > 0.01 then


    if Abs( Koszyk_GLDummyCube.Up.Z ) = 1 then // Czasami koszyk przekr�ca si� (g�r� do ekranu/kamery).
      Koszyk_GLDummyCube.Up.SetVector( 0, 1, 0 );

    //Caption := FloatToStr( ( 1 - Koszyk_GLDummyCube.Direction.X ) / 2 ) + ' ' + FloatToStr( Koszyk_GLDummyCube.Direction.X ) + ' ' + FloatToStr( Koszyk_GLDummyCube.Direction.Y ) + ' ' + FloatToStr( Koszyk_GLDummyCube.Direction.Z ) + ' ' + FloatToStr( Koszyk_GLDummyCube.Direction.W );
    //Caption := FloatToStr( Koszyk_GLDummyCube.AbsoluteDirection.X ) + ' ' + FloatToStr( Koszyk_GLDummyCube.AbsoluteDirection.Y ) + ' ' + FloatToStr( Koszyk_GLDummyCube.AbsoluteDirection.Z ) + ' ' + FloatToStr( Koszyk_GLDummyCube.AbsoluteDirection.W );
    //Caption := FloatToStr( Koszyk_GLDummyCube.Up.X ) + ' ' + FloatToStr( Koszyk_GLDummyCube.Up.Y ) + ' ' + FloatToStr( Koszyk_GLDummyCube.Up.Z );
    //Caption := FloatToStr( Koszyk_GLDummyCube.Position.X ) + ' ' + FloatToStr( Koszyk_GLDummyCube.Position.Y ) + ' ' + FloatToStr( Koszyk_GLDummyCube.Position.Z );
    //Caption := FloatToStr( Koszyk_GLDummyCube.Direction.X ) + ' ' + FloatToStr( Koszyk_GLDummyCube.AbsoluteDirection.X );
    //Caption := FloatToStr( Koszyk_GLDummyCube.PitchAngle.z );

  end;//---//Funkcja Koszyk_Ruch() w GLCadencer1Progress().

  //Funkcja Klawisze_Obs�uga_0() w GLCadencer1Progress().
  procedure Klawisze_Obs�uga_0( d : double );
  begin

    Exit; // Nieu�ywane.

    if    (  IsKeyDown( 'N' )  )
      and ( IsKeyDown( VK_CONTROL )  ) then
      Gra__Nowa_MenuItemClick( Sender );


    if   (  IsKeyDown( VK_NUMPAD7 )  ) // uses GLKeyboard.
      or (  IsKeyDown( VK_NUMPAD8 )  ) then
      Przycisk_ButtonMouseEnter( Lewo_G�ra_Button );

    if   (  IsKeyDown( VK_NUMPAD4 )  )
      or (  IsKeyDown( VK_NUMPAD5 )  ) then
      Przycisk_ButtonMouseEnter( Lewo_�rodek_Button );

    if   (  IsKeyDown( VK_NUMPAD1 )  )
      or (  IsKeyDown( VK_NUMPAD2 )  ) then
      Przycisk_ButtonMouseEnter( Lewo_D�_Button );


    if IsKeyDown( VK_NUMPAD9 ) then
      Przycisk_ButtonMouseEnter( Prawo_G�ra_Button );

    if IsKeyDown( VK_NUMPAD6 ) then
      Przycisk_ButtonMouseEnter( Prawo_�rodek_Button );

    if IsKeyDown( VK_NUMPAD3 ) then
      Przycisk_ButtonMouseEnter( Prawo_D�_Button );


    if IsKeyDown( 'P' ) then
      begin

        if MilliSecondsBetween( Now(), moment_wci�ni�cia_klawisza ) >= moment_wci�ni�cia_klawisza_op�nienie_c then
          begin

            // Bez op�nienia bardzo szybko wykrywa (jak trzymanie przycisku) i trudno si� prze��cza.

            moment_wci�ni�cia_klawisza := Now();

            Pauza( not Pauza_MenuItem.Checked );

          end;
        //---//if MilliSecondsBetween( Now(), moment_wci�ni�cia_klawisza ) >= moment_wci�ni�cia_klawisza_op�nienie_c then

      end;
    //---//if IsKeyDown( 'P' ) then


    if IsKeyDown( VK_RETURN ) then
      begin

        if    ( Now() > moment_wci�ni�cia_klawisza ) // Enter jako potwierdzenie komunikatu, te� jest �apane jako naci�ni�cie klawisza.
          and (  MilliSecondsBetween( Now(), moment_wci�ni�cia_klawisza ) >= moment_wci�ni�cia_klawisza_op�nienie_c  ) then
          begin

            // Bez op�nienia bardzo szybko wykrywa (jak trzymanie przycisku) i trudno si� prze��cza.

            moment_wci�ni�cia_klawisza := Now();

            Pe�ny_Ekran_MenuItemClick( Sender );

          end;
        //---//if    ( Now() > moment_wci�ni�cia_klawisza ) (...)

      end;
    //---//if IsKeyDown( VK_RETURN ) then

    if IsKeyDown( VK_ESCAPE ) then
      begin

        if MilliSecondsBetween( Now(), moment_wci�ni�cia_klawisza ) >= moment_wci�ni�cia_klawisza_op�nienie_c then
          begin

            // Bez op�nienia bardzo szybko wykrywa (jak trzymanie przycisku) i trudno si� prze��cza.

            moment_wci�ni�cia_klawisza := Now();

            Gra__Zamknij_MenuItemClick( Sender );

          end;
        //---//if MilliSecondsBetween( Now(), moment_wci�ni�cia_klawisza ) >= moment_wci�ni�cia_klawisza_op�nienie_c then

      end;
    //---//if IsKeyDown( VK_ESCAPE ) then

      //GLCamera1.Move( d );

  end;//---//Funkcja Klawisze_Obs�uga_0() w GLCadencer1Progress().

  //Funkcja Klawisze_Obs�uga() w GLCadencer1Progress().
  procedure Klawisze_Obs�uga( d : double );
  begin

    if    (  IsKeyDown( 'N' )  )
      and ( IsKeyDown( VK_CONTROL )  ) then
      Gra__Nowa_MenuItemClick( Sender );


    if    (
                ( not klawisze_konfiguracja_korzystaj)
            and (
                     (  IsKeyDown( VK_NUMPAD7 )  )  // uses GLKeyboard.
                  or (  IsKeyDown( VK_NUMPAD8 )  )
                )
          )
       or (
                ( klawisze_konfiguracja_korzystaj)
            and IsKeyDown( k_lewo_g�ra )
          )
      then
      Przycisk_ButtonMouseEnter( Lewo_G�ra_Button );

    if    (
                ( not klawisze_konfiguracja_korzystaj)
            and (
                     (  IsKeyDown( VK_NUMPAD4 )  )
                  or (  IsKeyDown( VK_NUMPAD5 )  )
                )
          )
       or (
                ( klawisze_konfiguracja_korzystaj)
            and IsKeyDown( k_lewo_�rodek )
          )
      then
      Przycisk_ButtonMouseEnter( Lewo_�rodek_Button );


    if    (
                ( not klawisze_konfiguracja_korzystaj)
            and (
                     (  IsKeyDown( VK_NUMPAD1 )  )
                  or (  IsKeyDown( VK_NUMPAD2 )  )
                )
          )
       or (
                ( klawisze_konfiguracja_korzystaj)
            and IsKeyDown( k_lewo_d� )
          )
      then
      Przycisk_ButtonMouseEnter( Lewo_D�_Button );


    if    (
                ( not klawisze_konfiguracja_korzystaj)
            and IsKeyDown( VK_NUMPAD9 )
          )
       or (
                ( klawisze_konfiguracja_korzystaj)
            and IsKeyDown( k_prawo_g�ra )
          )
      then
      Przycisk_ButtonMouseEnter( Prawo_G�ra_Button );

    if    (
                ( not klawisze_konfiguracja_korzystaj)
            and IsKeyDown( VK_NUMPAD6 )
          )
       or (
                ( klawisze_konfiguracja_korzystaj)
            and IsKeyDown( k_prawo_�rodek )
          )
      then
      Przycisk_ButtonMouseEnter( Prawo_�rodek_Button );


    if    (
                ( not klawisze_konfiguracja_korzystaj)
            and IsKeyDown( VK_NUMPAD3 )
          )
       or (
                ( klawisze_konfiguracja_korzystaj)
            and IsKeyDown( k_prawo_d� )
          )
      then
      Przycisk_ButtonMouseEnter( Prawo_D�_Button );


    if    (
                ( not klawisze_konfiguracja_korzystaj)
            and IsKeyDown( 'P' )
          )
       or (
                ( klawisze_konfiguracja_korzystaj)
            and IsKeyDown( k_pauza )
          )
      then
      begin

        if MilliSecondsBetween( Now(), moment_wci�ni�cia_klawisza ) >= moment_wci�ni�cia_klawisza_op�nienie_c then
          begin

            // Bez op�nienia bardzo szybko wykrywa (jak trzymanie przycisku) i trudno si� prze��cza.

            moment_wci�ni�cia_klawisza := Now();

            Pauza( not Pauza_MenuItem.Checked );

          end;
        //---//if MilliSecondsBetween( Now(), moment_wci�ni�cia_klawisza ) >= moment_wci�ni�cia_klawisza_op�nienie_c then

      end;
    //---//if IsKeyDown( 'P' ) then


    if    (
                ( not klawisze_konfiguracja_korzystaj)
            and IsKeyDown( VK_RETURN )
          )
       or (
                ( klawisze_konfiguracja_korzystaj)
            and IsKeyDown( k_pe�ny_ekran )
          )
      then
      begin

        if    ( Now() > moment_wci�ni�cia_klawisza ) // Enter jako potwierdzenie komunikatu, te� jest �apane jako naci�ni�cie klawisza.
          and (  MilliSecondsBetween( Now(), moment_wci�ni�cia_klawisza ) >= moment_wci�ni�cia_klawisza_op�nienie_c  ) then
          begin

            // Bez op�nienia bardzo szybko wykrywa (jak trzymanie przycisku) i trudno si� prze��cza.

            moment_wci�ni�cia_klawisza := Now();

            Pe�ny_Ekran_MenuItemClick( Sender );

          end;
        //---//if    ( Now() > moment_wci�ni�cia_klawisza ) (...)

      end;
    //---//if IsKeyDown( VK_RETURN ) then


    if    (
                ( not klawisze_konfiguracja_korzystaj)
            and IsKeyDown( VK_ESCAPE )
          )
       or (
                ( klawisze_konfiguracja_korzystaj)
            and IsKeyDown( k_zamknij )
          )
      then
      begin

        if MilliSecondsBetween( Now(), moment_wci�ni�cia_klawisza ) >= moment_wci�ni�cia_klawisza_op�nienie_c then
          begin

            // Bez op�nienia bardzo szybko wykrywa (jak trzymanie przycisku) i trudno si� prze��cza.

            moment_wci�ni�cia_klawisza := Now();

            Gra__Zamknij_MenuItemClick( Sender );

          end;
        //---//if MilliSecondsBetween( Now(), moment_wci�ni�cia_klawisza ) >= moment_wci�ni�cia_klawisza_op�nienie_c then

      end;
    //---//if IsKeyDown( VK_ESCAPE ) then

  end;//---//Funkcja Klawisze_Obs�uga() w GLCadencer1Progress().

var
  interwa�_dodania_kuli : real;
begin//GLCadencer1Progress().

  Klawisze_Obs�uga( deltaTime * 5 );


  if    ( not Pauza_MenuItem.Checked )
    and ( not Krysztalowe_Kule_Form.Active ) then
    Pauza( true );


  if Pauza_MenuItem.Checked then
    Exit;


  Koszyk_Ruch();


  GLCollisionManager1.CheckCollisions();


  interwa�_dodania_kuli := 1000 - 5 * wsp�czynnik_trudno�ci;

  if interwa�_dodania_kuli < interwa�_dodania_kuli_pr�g then // Gdy za cz�sto si� pojawiaj� to tworz� si� w�e i gra zwalnia.
    interwa�_dodania_kuli := interwa�_dodania_kuli_pr�g;

  if MilliSecondsBetween( Now(), kule_kryszta�owe_poprzednie_dodanie ) > interwa�_dodania_kuli then
    Dodaj_Kul�();


  Kule_Kryszta�owe_Lot( deltaTime );


  //???
//  Podest_Test_GLDummyCube.Slide( 0.001 );
//  Podest_Test_GLDummyCube.Turn( 0.1 );


//  if    ( podesty_l <> nil )
//    and ( podesty_l[ 1 ] <> nil ) then
//    //TGLDummyCube(podesty_l[ 1 ]).Slide( 0.0001 );
//    TPodest(podesty_l[ 1 ]).Turn( 0.1 );

end;//---//GLCadencer1Progress().

end.
