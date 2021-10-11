unit uBulletin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StrUtils, StdCtrls, Buttons;

type
  TfResultat = class(TForm)
    sg: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    LScore: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure sgDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  fResultat: TfResultat;

implementation

{$R *.dfm}

procedure TfResultat.FormCreate(Sender: TObject);
begin
  ClientWidth:=635;  ClientHeight:=543;
  sg.DefaultColWidth:=200;
  sg.ColWidths[0]:=28;
  sg.Cells[0,0]:=' N°';
  sg.Cells[1,0]:='     Plante';
  sg.Cells[2,0]:='  Votre Réponse';
  sg.Cells[3,0]:='  Verdict';
end;

procedure TfResultat.sgDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow=sg.Row) and (ACol>0)
   then sg.Canvas.Font.color:=clWhite
   else if AnsiStartsText(' Faux', sg.Cells[ACol, ARow])
    then sg.Canvas.Font.color:=clRed
    else sg.Canvas.Font.color:=clGreen;
  sg.Canvas.FillRect(Rect);
  sg.Canvas.TextOut(Rect.Left, Rect.Top+2, sg.Cells[Acol, ARow]);
end;

end.


  Font.Color:=clGreen;
  if (ACol=3) and AnsiStartsText(' Faux', sg.Cells[ACol, ARow])
   then Font.Color:=clRed
{
  if (ACol=0) or (ARow=0) then
  begin
    Font.Color:=clBlack;
    Font.Style:=Font.Style + [fsBold];
  end;
}

