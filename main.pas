unit main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    CircleMenu: TCircle;
    CircleApps: TCircle;
    Circle2: TCircle;
    CircleTransparent: TCircle;
    Circle5: TCircle;
    Circle6: TCircle;
    CircleButton: TCircle;
    FloatAnimationCallback: TFloatAnimation;
    procedure CircleButtonClick(Sender: TObject);
    procedure FloatAnimationCallbackFinish(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.CircleButtonClick(Sender: TObject);
begin
  CircleMenu.Visible := True;
  if CircleMenu.RotationAngle = 135 then
  begin
    FloatAnimationCallback.StartValue := 135;
    FloatAnimationCallback.StopValue := 0;
    FloatAnimationCallback.Enabled := True;
    FloatAnimationCallback.Start;
    CircleMenu.AnimateFloat('Opacity', 0);
    CircleButton.AnimateFloat('RotationAngle', 0);
  end
  else
  begin
    FloatAnimationCallback.StartValue := 0;
    FloatAnimationCallback.StopValue := 135;
    FloatAnimationCallback.Enabled := True;
    FloatAnimationCallback.Start;
    CircleMenu.AnimateFloat('Opacity', 0.8, 0.3);
    CircleButton.AnimateFloat('RotationAngle', 135, 0.3);
  end;
end;

procedure TForm1.FloatAnimationCallbackFinish(Sender: TObject);
begin
  if CircleMenu.RotationAngle = 0 then
  begin
    CircleMenu.Visible := False;
  end;
end;

end.
