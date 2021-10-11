{
QUIZ des plantes aromatiques.
Programmé par Martin AJARD
(c) 2017
}

program QUIZPlantes;

uses
  Forms,
  uMain in 'uMain.pas' {fMain},
  uBulletin in 'uBulletin.pas' {fResultat},
  uAide in 'uAide.pas' {fAide},
  uZoom in 'uZoom.pas' {fZoom},
  uAccueil in 'uAccueil.pas' {fAccueil};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'QUIZZ des plantes aromatiques';
  Application.CreateForm(TfAccueil, fAccueil);
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfAide, fAide);
  Application.CreateForm(TfResultat, fResultat);
  Application.CreateForm(TfZoom, fZoom);
  Application.Run;
end.
