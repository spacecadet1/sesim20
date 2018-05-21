program sesim20;

uses
  Forms,
  Main in 'Main.pas' {Form4},
  ABOUT in 'ABOUT.pas' {AboutBox},
  Member in 'Member.pas',
  Feat in 'Feat.pas',
  Skill in 'Skill.pas',
  Task in 'Task.pas',
  GenerateTeam in 'GenerateTeam.pas' {Form1},
  CreateTask in 'CreateTask.pas' {GenerateTask},
  splashunit in 'splashunit.pas' {Splash};

{$R *.res}




begin
  Application.Initialize;



  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TGenerateTask, GenerateTask);
  Application.CreateForm(TSplash, Splash);
  Application.Run;
end.
