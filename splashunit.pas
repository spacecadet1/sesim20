unit splashunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls;

type
  TSplash = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure MakeSplash;

    procedure CloseSplashScreen(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Splash: TSplash;

implementation

procedure TSplash.CloseSplashScreen(Sender: TObject);
begin
self.Close;
end;

procedure TSplash.MakeSplash;
begin
  Show;
  Update;
end;



{$R *.dfm}

end.
