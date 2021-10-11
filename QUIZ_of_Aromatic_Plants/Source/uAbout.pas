unit uAbout;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
     Buttons, ExtCtrls, ShellAPI, Dialogs, jpeg;

type
  TfAbout = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    ProductName: TLabel;
    Version: TLabel;
    Photo: TImage;
    Image2: TImage;
    Copyright: TLabel;
    Adresse: TLabel;
    Tel: TLabel;
    email: TLabel;
    btFermer: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure emailClick(Sender: TObject);
    procedure btFermerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  fAbout: TfAbout;

implementation

{$R *.DFM}

procedure TfAbout.FormCreate(Sender: TObject);
begin
  Copyright.Caption := 'Développé par Wahib HAJJAR';
  Adresse.Caption := '7, rue Didier Daurat'^M
                    +'93100 - MONTREUIL'#13#10
                    +'  FRANCE';
  Tel.Caption   := 'Tél : 33.6.6478.2102';
  Email.Caption := 'wahib.hajjar@free.fr';
end;
{
utilisation :
=============
 var
  fAbout : TfAbout;
begin
  fAbout:=TfAbout.Create(Self);
  with fAbout do
  begin
     ProductName.Caption:='Mastermind';
     Version.Caption := 'Version 1.0';
  end;
  fAbout.ShowModal;
  fAbout.Free;
end;
}

procedure TfAbout.emailClick(Sender: TObject);
var s: pChar;
begin
  s:= pchar('mailto:' + email.Caption
           +'?Subject=A propos de : '+ProductName.Caption+' '+Version.Caption);
  if ShellExecute(GetDeskTopWindow(), 'open', s, nil, nil, SW_SHOWNORMAL) <= 32
    then ShowMessage('Erreur de messagerie !!');
end;

procedure TfAbout.btFermerClick(Sender: TObject);
begin
  Close
end;

end.

