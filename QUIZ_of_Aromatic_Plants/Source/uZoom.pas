unit uZoom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TfZoom = class(TForm)
    PZoom: TPanel;
    Image: TImage;
    Titre: TLabel;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  fZoom: TfZoom;

implementation

{$R *.dfm}

end.
