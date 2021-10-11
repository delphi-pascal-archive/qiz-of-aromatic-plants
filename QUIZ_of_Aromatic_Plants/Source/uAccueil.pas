unit uAccueil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfAccueil = class(TForm)
    Panel1: TPanel;
    pResultat: TPanel;
    bClose: TBitBtn;
    bAbout: TBitBtn;
    edName: TEdit;
    btQUIZZ: TBitBtn;
    bRevision: TBitBtn;
    procedure pQUIZZClick(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure bAboutClick(Sender: TObject);
    procedure bRevisionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAccueil: TfAccueil;

implementation

uses uMain, uAbout, uAide;

{$R *.dfm}

procedure TfAccueil.bRevisionClick(Sender: TObject);
begin
  fAide.ShowModal;
end;

procedure TfAccueil.pQUIZZClick(Sender: TObject);
begin
  fMain.NouvellePartie;
  fMain.ShowModal
end;

procedure TfAccueil.bCloseClick(Sender: TObject);
begin
  Close
end;

procedure TfAccueil.bAboutClick(Sender: TObject);
 var
  fAbout : TfAbout;
begin
  fAbout:=TfAbout.Create(Self);
  with fAbout do
  begin
     ProductName.Caption:='QUIZZ des plantes aromatiques';
     Version.Caption := 'Version 1.0';
     Copyright.Caption := 'Développé par Martin AJARD';
     Adresse.Caption := 'Inspiré du QUIZ du site :,'^M
                       +'http://www.qcmquiz.com';
     Tel.Caption   := 'Merci aux concepteurs.';
     Email.Caption := 'Pour me contacter : martin.ajard@free.fr';
  end;
  fAbout.ShowModal;
  fAbout.Free;
end;

end.

