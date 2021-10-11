unit uAide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg;

type
  TfAide = class(TForm)
    Planche: TPanel;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure ImageClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
    TabImages: array[1..50] of tImage;
  public
    { Déclarations publiques }
  end;

var
  fAide: TfAide;

implementation

uses uMain, uZoom;

{$R *.dfm}

procedure TfAide.FormCreate(Sender: TObject);
var
  l,c, n: byte;
  im: tImage;
begin
// Créer une planche de toutes les images
  for n:=1 to 50 do
    begin
      TabImages[n]:=tImage.Create(Planche);
      with TabImages[n] do
      begin
        Tag:=n;
        Name:='Image'+InttoStr(n);
        Parent:=Planche;
        Center:=true;
        Proportional:=true;
        Cursor:=crHandPoint;
        ShowHint:=true;
        // Charger image
        Picture.LoadFromFile('.\'+Plantes[n]+'.jpg');
        Hint:=Plantes[n];

        OnClick:=ImageClick;
      end;
    end;
end;

procedure TfAide.FormResize(Sender: TObject);
var
  l,c, n: byte;
  h,w: word;
begin
// Réorganiser la planche des images
  l:=0; c:=0;
  w:=Planche.ClientWidth div 10;
  h:=Planche.ClientHeight div 5;
//  fAide.ClientHeight:=h*6;
//  fAide.ClientWidth:=w*11;
  for n:=1 to 50 do
   with TabImages[n] do
   begin
     width:=w-10;   Left:=10+c*w;
     height:=h-10;  Top :=10+l*h;
     inc(c); if c=10 then begin c:=0; inc(l) end
   end
end;

procedure TfAide.FormShow(Sender: TObject);
begin
  FormResize(Sender)
end;

procedure TfAide.ImageClick(Sender: TObject);
begin
  with fZoom do
  begin
    Titre.Caption:=Plantes[TImage(Sender).Tag];
    Image.Picture.Assign(TImage(Sender).Picture);
    ShowModal
  end
end;

end.
