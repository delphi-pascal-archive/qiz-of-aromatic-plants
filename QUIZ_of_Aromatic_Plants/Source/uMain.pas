unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, ComCtrls, ExtCtrls, jpeg, Buttons;

type
  TElement = record
    Num : string[2];
    Nom : string[30];
  end;

Const
  nb = 50;
  Plantes: array [1..nb] of string[30]
   = (
	'Absinthe',
	'Aneth',
	'AngÂlique',
	'Anis vert',
	'Anis ÂtoilÂ ou Badiane',
	'Basilic',
	'Bourrache',
	'Caprier',
	'Cardamone',
	'Carvi',
	'Cerfeuil',
	'Ciboulette',
	'Coriandre',
	'Cornichon',
	'Cumin',
	'Curcuma',
	'CÂleri',
	'Estragon',
	'Fenouil',
	'Fenugrec',
	'Gingembre',
	'Giroflier',
	'Hysope',
	'Laurier',
	'Lavande',
	'LivÊche ou Ache des montagnes',
	'Marjolaine',
	'Menthe',
	'Monarde',
	'Moutarde',
	'Myrthe',
	'MÂlisse ou MÂlisse citronnelle',
	'Origan',
	'Oseille',
	'Persil',
	'Pimprenelle',
	'Raifort',
	'Rhubarbe',
	'Romarin',
	'Roquette',
	'Rue des jardins ou Rue fÂtide',
	'Sarriette',
	'Sauge',
	'Serpolet',
	'Soja',
	'Souci',
	'Sumac',
	'Sureau',
	'Thym',
	'Verveine'
   );

type
  TfMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pReponse1: TPanel;
    pReponse2: TPanel;
    pReponse3: TPanel;
    pReponse4: TPanel;
    pScore: TPanel;
    pCorrection: TPanel;

    Label1: TLabel;
    lb: TListBox;
    Image: TImage;

    procedure pReponseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure ImageClick(Sender: TObject);
  private
    { Déclarations privées }
    iNum, Q, T : integer;
    Tires : array[0..99] of boolean;
  public
    { Déclarations publiques }
    procedure NouvellePartie;
    procedure QSuivante;
  end;

var
  fMain: TfMain;

implementation

uses uBulletin, uAide, uZoom;

{$R *.dfm}

procedure TfMain.FormActivate(Sender: TObject);
begin
  NouvellePartie;
end;

procedure TfMain.NouvellePartie;
begin
  Randomize;
  Q:=0; T:=0;
  FillChar(Tires, SizeOf(Tires), #0);

  pCorrection.Caption:='';
  pCorrection.Color:=clYellow;
  pScore.Caption:='';
  QSuivante
end;

// Proposer la question suivante
procedure TfMain.QSuivante;
var i: byte;
begin
  inc(T);
  fResultat.sg.Cells[0, T]:=format(' %2d', [T]);

  Label1.Caption:=format(' Question n° %d :', [T]);
  repeat
   iNum:= 1+random(nb);
  until not Tires[iNum];
  Tires[iNum]:=true;
  fResultat.sg.Cells[1, T]:=' '+Plantes[iNum];

  // Tirage 1° plante
  repeat
   i:=1+random(nb);
  until Plantes[i] <> Plantes[iNum];  // plante différente
  pReponse1.Tag:=i;
  pReponse1.Caption:=Plantes[i];

  // Tirage 2° plante
  repeat
   i:=1+random(nb);
  until (Plantes[i] <> Plantes[iNum])   // plante différente
        and (pReponse1.Tag <> i);  // plante différente
  pReponse2.Tag:=i;
  pReponse2.Caption:=Plantes[i];

  // Tirage 3° plante
  repeat
   i:=1+random(nb);
  until (Plantes[i] <> Plantes[iNum])   // plante différente
        and (pReponse1.Tag <> i)  // plante différente
        and (pReponse2.Tag <> i);
  pReponse3.Tag:=i;
  pReponse3.Caption:=Plantes[i];

  // Tirage 4° plante
  repeat
   i:=1+random(nb);
  until (Plantes[i] <> Plantes[iNum]) // plante différente
        and (pReponse1.Tag <> i)      // plante différente
        and (pReponse2.Tag <> i)      // plante différente
        and (pReponse3.Tag <> i);
  pReponse4.Tag:=i;
  pReponse4.Caption:=Plantes[i];

  // Charger image
  Image.Picture.LoadFromFile('.\'+Plantes[iNum]+'.jpg');

  // Tirer réponse au hasard
  i:=Random(12); lb.Items.Add(InttoStr(i));
  if i>9 then pReponse1.Caption:=Plantes[iNum]
   else if i>6 then pReponse2.Caption:=Plantes[iNum]
   else if i>3 then pReponse3.Caption:=Plantes[iNum]
   else pReponse4.Caption:=Plantes[iNum];
end;

procedure TfMain.pReponseClick(Sender: TObject);
begin
  fResultat.sg.Cells[2, T]:=' '+TPanel(Sender).Caption;

  if TPanel(Sender).Caption = Plantes[iNum] then
  begin
    inc(Q);
    fResultat.sg.Cells[3, T]:=' Correct';
    pCorrection.Caption:='Correct';
    pCorrection.Color:=clGreen
  end
  else
  begin
    pCorrection.Caption:='Faux !';
    fResultat.sg.Cells[3, T]:=' Faux !';
    pCorrection.Color:=clRed
  end;

  pScore.Caption:=format('Votre score : %d / %d ', [Q, T]);

  if T<20 then QSuivante else
  begin
    fResultat.lScore.Caption:=pScore.Caption + '  -    Voulez-vous rejouer ?';
    if fResultat.ShowModal = mrYes
     then NouvellePartie
     else Application.Terminate
  end
end;

procedure TfMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if MessageDlg('Voulez-vous quitter ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo
    then CanClose:=false
end;

procedure TfMain.ImageClick(Sender: TObject);
begin
  with fZoom do
  begin
    Titre.Caption:='Fermer cette fenêtre pour revenir au QUIZZ';
    Image.Picture.Assign(TImage(Sender).Picture);
    ShowModal
  end
end;

end.

