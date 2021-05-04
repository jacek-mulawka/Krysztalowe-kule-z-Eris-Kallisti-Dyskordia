program Krysztalowe_Kule_pr;

uses
  Vcl.Forms,
  Krysztalowe_Kule in 'Krysztalowe_Kule.pas' {Krysztalowe_Kule_Form},
  Klawisze_Konfiguracja in 'Klawisze_Konfiguracja.pas' {Klawisze_Konfiguracja_Form};

{$R *.res}

begin

  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.HintHidePause := 30000;

  Application.CreateForm( TKrysztalowe_Kule_Form, Krysztalowe_Kule_Form );
  Application.Run();

end.
