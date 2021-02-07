unit Klawisze_Konfiguracja;{07.09.2017}

  //
  // MIT License
  //
  // Copyright (c) 2017 Jacek Mulawka
  //
  // j.mulawka@interia.pl
  //
  // https://github.com/jacek-mulawka
  //


interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, JvExMask, JvSpin, Vcl.StdCtrls,
  System.IniFiles;

type
  TKlawisze_Konfiguracja_Form = class( TForm )
    Lewo_Góra_Etykieta_Label: TLabel;
    Lewo_Góra_Edit: TEdit;
    Lewo_Góra_JvSpinEdit: TJvSpinEdit;
    Lewo_Œrodek_Etykieta_Label: TLabel;
    Lewo_Œrodek_Edit: TEdit;
    Lewo_Œrodek_JvSpinEdit: TJvSpinEdit;
    Lewo_Dó³_Etykieta_Label: TLabel;
    Lewo_Dó³_Edit: TEdit;
    Lewo_Dó³_JvSpinEdit: TJvSpinEdit;
    Prawo_Góra_Etykieta_Label: TLabel;
    Prawo_Œrodek_Etykieta_Label: TLabel;
    Prawo_Dó³_Etykieta_Label: TLabel;
    Prawo_Góra_Edit: TEdit;
    Prawo_Góra_JvSpinEdit: TJvSpinEdit;
    Prawo_Œrodek_Edit: TEdit;
    Prawo_Œrodek_JvSpinEdit: TJvSpinEdit;
    Prawo_Dó³_Edit: TEdit;
    Prawo_Dó³_JvSpinEdit: TJvSpinEdit;
    Pauza_Etykieta_Label: TLabel;
    Pe³ny_Ekran_Etykieta_Label: TLabel;
    Zamknij_Etykieta_Label: TLabel;
    Pauza_Edit: TEdit;
    Pauza_JvSpinEdit: TJvSpinEdit;
    Pe³ny_Ekran_Edit: TEdit;
    Pe³ny_Ekran_JvSpinEdit: TJvSpinEdit;
    Zamknij_Edit: TEdit;
    Zamknij_JvSpinEdit: TJvSpinEdit;
    Klawisze_Konfiguracja_Korzystaj_CheckBox: TCheckBox;
    Domyœlne_Button: TButton;
    OK_Button: TButton;
    Zapisz_Button: TButton;
    Anuluj_Button: TButton;
    procedure FormCreate( Sender: TObject );
    procedure FormShow( Sender: TObject );
    procedure Domyœlne_ButtonClick( Sender: TObject );
    procedure Zapisz_ButtonClick( Sender: TObject );
    procedure Anuluj_ButtonClick( Sender: TObject );
    procedure Klawisz_EditKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
    procedure Klawisz_JvSpinEditChange( Sender: TObject );
  private
    { Private declarations }
    procedure Wczytaj_Ustawienia();
    procedure Zapisz_Ustawienia();
    function Nazwa_Klawisza( const klawisz : word ) : string;
    procedure Podstaw_Nazwy_Klawiszy();
  public
    { Public declarations }
  end;

var
  Klawisze_Konfiguracja_Form: TKlawisze_Konfiguracja_Form;

implementation

{$R *.dfm}



//      ***      Funkcje      ***      //

//Funkcja Wczytaj_Ustawienia().
procedure TKlawisze_Konfiguracja_Form.Wczytaj_Ustawienia();
var
  plik_ini : TIniFile;
begin

  plik_ini := TIniFile.Create(  ExtractFilePath( Application.ExeName ) + 'Kryszta³owe kule - klawisze konfiguracja.ini'  );

  if not plik_ini.ValueExists( 'Klawisze', 'lewo_góra' ) then
    plik_ini.WriteInteger(  'Klawisze', 'lewo_góra', Round( Lewo_Góra_JvSpinEdit.Value )  )
  else//if not plik_ini.ValueExists( 'Klawisze', 'lewo_góra' ) then
    Lewo_Góra_JvSpinEdit.Value := plik_ini.ReadInteger(  'Klawisze', 'lewo_góra', Round( Lewo_Góra_JvSpinEdit.Value )  ); // Je¿eli nie znajdzie to podstawia wartoœæ Lewo_Góra_JvSpinEdit.Value.

  if not plik_ini.ValueExists( 'Klawisze', 'lewo_œrodek' ) then
    plik_ini.WriteInteger(  'Klawisze', 'lewo_œrodek', Round( Lewo_Œrodek_JvSpinEdit.Value )  )
  else//if not plik_ini.ValueExists( 'Klawisze', 'lewo_œrodek' ) then
    Lewo_Œrodek_JvSpinEdit.Value := plik_ini.ReadInteger(  'Klawisze', 'lewo_œrodek',  Round( Lewo_Œrodek_JvSpinEdit.Value )  ); // Je¿eli nie znajdzie to podstawia wartoœæ Lewo_Œrodek_JvSpinEdit.Value.

  if not plik_ini.ValueExists( 'Klawisze', 'lewo_dó³' ) then
    plik_ini.WriteInteger(  'Klawisze', 'lewo_dó³', Round( Lewo_Dó³_JvSpinEdit.Value )  )
  else//if not plik_ini.ValueExists( 'Klawisze', 'lewo_dó³' ) then
    Lewo_Dó³_JvSpinEdit.Value := plik_ini.ReadInteger(  'Klawisze', 'lewo_dó³',  Round( Lewo_Dó³_JvSpinEdit.Value )  ); // Je¿eli nie znajdzie to podstawia wartoœæ Lewo_Dó³_JvSpinEdit.Value.



  if not plik_ini.ValueExists( 'Klawisze', 'prawo_góra' ) then
    plik_ini.WriteInteger(  'Klawisze', 'prawo_góra', Round( Prawo_Góra_JvSpinEdit.Value )  )
  else//if not plik_ini.ValueExists( 'Klawisze', 'prawo_góra' ) then
    Prawo_Góra_JvSpinEdit.Value := plik_ini.ReadInteger(  'Klawisze', 'prawo_góra', Round( Prawo_Góra_JvSpinEdit.Value )  ); // Je¿eli nie znajdzie to podstawia wartoœæ Prawo_Góra_JvSpinEdit.Value.

  if not plik_ini.ValueExists(  'Klawisze', 'prawo_œrodek' ) then
    plik_ini.WriteInteger(  'Klawisze', 'prawo_œrodek', Round( Prawo_Œrodek_JvSpinEdit.Value )  )
  else//if not plik_ini.ValueExists( 'Klawisze', 'prawo_œrodek' ) then
    Prawo_Œrodek_JvSpinEdit.Value := plik_ini.ReadInteger(  'Klawisze', 'prawo_œrodek', Round( Prawo_Œrodek_JvSpinEdit.Value )  ); // Je¿eli nie znajdzie to podstawia wartoœæ Prawo_Œrodek_JvSpinEdit.Value.

  if not plik_ini.ValueExists( 'Klawisze', 'prawo_dó³' ) then
    plik_ini.WriteInteger(  'Klawisze', 'prawo_dó³', Round( Prawo_Dó³_JvSpinEdit.Value )  )
  else//if not plik_ini.ValueExists( 'Klawisze', 'prawo_dó³' ) then
    Prawo_Dó³_JvSpinEdit.Value := plik_ini.ReadInteger(  'Klawisze', 'prawo_dó³', Round( Prawo_Dó³_JvSpinEdit.Value )  ); // Je¿eli nie znajdzie to podstawia wartoœæ Prawo_Dó³_JvSpinEdit.Value.



  if not plik_ini.ValueExists( 'Klawisze', 'pauza' ) then
    plik_ini.WriteInteger(  'Klawisze', 'pauza', Round( Pauza_JvSpinEdit.Value )  )
  else//if not plik_ini.ValueExists( 'Klawisze', 'pauza' ) then
    Pauza_JvSpinEdit.Value := plik_ini.ReadInteger(  'Klawisze', 'pauza', Round( Pauza_JvSpinEdit.Value )  ); // Je¿eli nie znajdzie to podstawia wartoœæ Pauza_JvSpinEdit.Value.

  if not plik_ini.ValueExists( 'Klawisze', 'pe³ny_ekran' ) then
    plik_ini.WriteInteger(  'Klawisze', 'pe³ny_ekran', Round( Pe³ny_Ekran_JvSpinEdit.Value )  )
  else//if not plik_ini.ValueExists( 'Klawisze', 'pe³ny_ekran' ) then
    Pe³ny_Ekran_JvSpinEdit.Value := plik_ini.ReadInteger(  'Klawisze', 'pe³ny_ekran', Round( Pe³ny_Ekran_JvSpinEdit.Value )  ); // Je¿eli nie znajdzie to podstawia wartoœæ Pe³ny_Ekran_JvSpinEdit.Value.

  if not plik_ini.ValueExists( 'Klawisze', 'zamknij' ) then
    plik_ini.WriteInteger(  'Klawisze', 'zamknij', Round( Zamknij_JvSpinEdit.Value )  )
  else//if not plik_ini.ValueExists( 'Klawisze', 'zamknij' ) then
    Zamknij_JvSpinEdit.Value := plik_ini.ReadInteger(  'Klawisze', 'zamknij', Round( Zamknij_JvSpinEdit.Value )  ); // Je¿eli nie znajdzie to podstawia wartoœæ Zamknij_JvSpinEdit.Value.



  if not plik_ini.ValueExists( 'Opcje', 'Klawisze_Konfiguracja_Korzystaj' ) then
    plik_ini.WriteBool( 'Opcje', 'Klawisze_Konfiguracja_Korzystaj', Klawisze_Konfiguracja_Korzystaj_CheckBox.Checked )
  else//if not plik_ini.ValueExists( 'Opcje', 'Klawisze_Konfiguracja_Korzystaj' ) then
    Klawisze_Konfiguracja_Korzystaj_CheckBox.Checked := plik_ini.ReadBool( 'Opcje', 'Klawisze_Konfiguracja_Korzystaj', Klawisze_Konfiguracja_Korzystaj_CheckBox.Checked ); // Je¿eli nie znajdzie to podstawia wartoœæ Klawisze_Konfiguracja_Korzystaj_CheckBox.Checked.

  plik_ini.Free();

end;//---//Funkcja Wczytaj_Ustawienia().

//Funkcja Zapisz_Ustawienia().
procedure TKlawisze_Konfiguracja_Form.Zapisz_Ustawienia();
var
  plik_ini : TIniFile;
begin

  plik_ini := TIniFile.Create(  ExtractFilePath( Application.ExeName ) + 'Kryszta³owe kule - klawisze konfiguracja.ini'  );

  plik_ini.WriteInteger(  'Klawisze', 'lewo_góra', Round( Lewo_Góra_JvSpinEdit.Value )  );
  plik_ini.WriteInteger(  'Klawisze', 'lewo_œrodek', Round( Lewo_Œrodek_JvSpinEdit.Value )  );
  plik_ini.WriteInteger(  'Klawisze', 'lewo_dó³', Round( Lewo_Dó³_JvSpinEdit.Value )  );

  plik_ini.WriteInteger(  'Klawisze', 'prawo_góra', Round( Prawo_Góra_JvSpinEdit.Value )  );
  plik_ini.WriteInteger(  'Klawisze', 'prawo_œrodek', Round( Prawo_Œrodek_JvSpinEdit.Value )  );
  plik_ini.WriteInteger(  'Klawisze', 'prawo_dó³', Round( Prawo_Dó³_JvSpinEdit.Value )  );

  plik_ini.WriteInteger(  'Klawisze', 'pauza', Round( Pauza_JvSpinEdit.Value )  );
  plik_ini.WriteInteger(  'Klawisze', 'pe³ny_ekran', Round( Pe³ny_Ekran_JvSpinEdit.Value )  );
  plik_ini.WriteInteger(  'Klawisze', 'zamknij', Round( Zamknij_JvSpinEdit.Value )  );

  plik_ini.WriteBool( 'Opcje', 'Klawisze_Konfiguracja_Korzystaj', Klawisze_Konfiguracja_Korzystaj_CheckBox.Checked );

  plik_ini.Free();

end;//---//Funkcja Zapisz_Ustawienia().

//Funkcja Nazwa_Klawisza().
function TKlawisze_Konfiguracja_Form.Nazwa_Klawisza( const klawisz : word ) : string;
var
  bufor : array [ 0..255 ] of Char;
begin

  if klawisz = 19 then
    Result := 'Pause Break'
  else
  if klawisz = 37 then
    Result := 'Kursor lewo'
  else
  if klawisz = 38 then
    Result := 'Kursor góra'
  else
  if klawisz = 39 then
    Result := 'Kursor prawo'
  else
  if klawisz = 40 then
    Result := 'Kursor dó³'
  else
  if klawisz = 91 then
    Result := 'Windows lewy'
  else
  if klawisz = 92 then
    Result := 'Windows prawy'
  else
  if klawisz = 93 then
    Result := 'Menu'
  else
  if klawisz = 144 then
    Result := 'Num Lock'
  else
    begin

      GetKeyNameText(  MapVirtualKey( klawisz, 0  ) shl 16, bufor, 256  );
      Result := bufor;

    end;
  //---//

end;//---//Funkcja Nazwa_Klawisza().

//Funkcja Podstaw_Nazwy_Klawiszy().
procedure TKlawisze_Konfiguracja_Form.Podstaw_Nazwy_Klawiszy();
var
  i : integer;
  zts : string;
  zt_component : TComponent;
begin

  //
  // Funkcja okreœla nazwê klawisza, którego kod jest w JvSpinEdit.
  //

  if Klawisze_Konfiguracja_Form = nil then
    Exit;


  for i := 0 to Klawisze_Konfiguracja_Form.ControlCount - 1 do // Tylko wizualne.
    if Klawisze_Konfiguracja_Form.Controls[ i ].ClassType = TEdit then
      begin

        zts := TEdit(Klawisze_Konfiguracja_Form.Controls[ i ]).Name;
        zts := StringReplace( zts, 'Edit', 'JvSpinEdit', [ rfReplaceAll ] );

        zt_component := nil;
        zt_component := TEdit(Klawisze_Konfiguracja_Form.Controls[ i ]).Owner.FindComponent( zts ); // Wa¿ny jest w³aœciciel (owner) zt_component := TEdit.Create( ScrollBox1 );

        if    ( zt_component <> nil )
          and ( zt_component is TJvSpinEdit ) then
          TEdit(Klawisze_Konfiguracja_Form.Controls[ i ]).Text :=  Nazwa_Klawisza(  Round( TJvSpinEdit(zt_component).Value )  );

      end;
    //---//if Klawisze_Konfiguracja_Form.Controls[ i ].ClassType = TEdit then

end;//---//Funkcja Podstaw_Nazwy_Klawiszy().

//---//      ***      Funkcje      ***      //---//


//FormCreate().
procedure TKlawisze_Konfiguracja_Form.FormCreate( Sender: TObject );
begin

  Domyœlne_ButtonClick( Sender );

  Wczytaj_Ustawienia();

end;//---//FormCreate().

//FormShow().
procedure TKlawisze_Konfiguracja_Form.FormShow( Sender: TObject );
begin

  Podstaw_Nazwy_Klawiszy();

end;//---//FormShow().

//Domyœlne_ButtonClick().
procedure TKlawisze_Konfiguracja_Form.Domyœlne_ButtonClick( Sender: TObject );
begin

  Lewo_Góra_JvSpinEdit.Value := VK_NUMPAD7;
  Lewo_Œrodek_JvSpinEdit.Value := VK_NUMPAD4;
  Lewo_Dó³_JvSpinEdit.Value := VK_NUMPAD1;

  Prawo_Góra_JvSpinEdit.Value := VK_NUMPAD9;
  Prawo_Œrodek_JvSpinEdit.Value := VK_NUMPAD6;
  Prawo_Dó³_JvSpinEdit.Value := VK_NUMPAD3;

  Pauza_JvSpinEdit.Value := Ord( 'P' ); // P = 80, p = 112.
  Pe³ny_Ekran_JvSpinEdit.Value := VK_RETURN;
  Zamknij_JvSpinEdit.Value := VK_ESCAPE;

  Podstaw_Nazwy_Klawiszy();

end;//---//Domyœlne_ButtonClick().

//Zapisz_ButtonClick().
procedure TKlawisze_Konfiguracja_Form.Zapisz_ButtonClick( Sender: TObject );
begin

  if Application.MessageBox( 'Zapisaæ ustawienia?', 'Potwierdzenie', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) <> IDYES then
    Exit;

  Zapisz_Ustawienia();

end;//---//Zapisz_ButtonClick().

//Anuluj_ButtonClick().
procedure TKlawisze_Konfiguracja_Form.Anuluj_ButtonClick( Sender: TObject );
begin
 //
end;//---//Anuluj_ButtonClick().

//Klawisz_EditKeyDown().
procedure TKlawisze_Konfiguracja_Form.Klawisz_EditKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
var
  zts : string;
  zt_component : TComponent;
begin

  if   ( Sender = nil )
    or (  not ( Sender is TEdit )  ) then
    Exit;

  TEdit(Sender).Text := Nazwa_Klawisza( Key );

  zts := TEdit(Sender).Name;
  zts := StringReplace( zts, 'Edit', 'JvSpinEdit', [ rfReplaceAll ] );


  zt_component := nil;
  zt_component := TEdit(Sender).Owner.FindComponent( zts ); // Wa¿ny jest w³aœciciel (owner) zt_component := TEdit.Create( ScrollBox1 );

  if    ( zt_component <> nil )
    and ( zt_component is TJvSpinEdit ) then
    TJvSpinEdit(zt_component).Value := Key;

end;//---//Klawisz_EditKeyDown().

//Klawisz_JvSpinEditChange().
procedure TKlawisze_Konfiguracja_Form.Klawisz_JvSpinEditChange( Sender: TObject );
var
  zts : string;
  zt_component : TComponent;
begin

  if   ( Sender = nil )
    or (  not ( Sender is TJvSpinEdit )  ) then
    Exit;

  zts := TJvSpinEdit(Sender).Name;
  zts := StringReplace( zts, 'JvSpinEdit', 'Edit', [ rfReplaceAll ] );


  zt_component := nil;
  zt_component := TJvSpinEdit(Sender).Owner.FindComponent( zts ); // Wa¿ny jest w³aœciciel (owner) zt_component := TEdit.Create( ScrollBox1 );

  if    ( zt_component <> nil )
    and ( zt_component is TEdit ) then
    TEdit(zt_component).Text := Nazwa_Klawisza(  Round( TJvSpinEdit(Sender).Value )  ); // Nie sprawdza czy kod jest poprawnym klawiszem.

end;//---//Klawisz_JvSpinEditChange().

end.
