unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, Buttons, Member, Feat, Series,
  GanttCh, TeEngine, TeeProcs, Chart, DB, TeeData, GenerateTeam, Spin, CreateTask,
  Generics.Collections, Contnrs, Task, About, splashunit;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    HelpBtn: TButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    TabSheet4: TTabSheet;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    TabSheet5: TTabSheet;
    OutputBox: TListBox;
    Chart1: TChart;
    Series1: TLineSeries;
    ShowResults: TButton;
    TeamMemberView: TListView;
    CampaignTaskListView: TListView;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    spRuns: TSpinEdit;
    Label1: TLabel;
    DeleteTask: TSpeedButton;
    ExportResults: TButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure ShowResultsClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure OnCreateSESIM20(Sender: TObject);
    procedure OnDestroySESIM20(Sender: TObject);
    procedure DeleteTaskClick(Sender: TObject);
    procedure HelpBtnClick(Sender: TObject);

  private
    { Private declarations }
    TeamMember : TMember;
    MemberList: TObjectList <TMember>;
    TaskList: TObjectList <TTask>;
  public
    { Public declarations }
  end;



var
  Form4: TForm4;

implementation

{$R *.dfm}




procedure TForm4.Button1Click(Sender: TObject);
var
count : integer;
begin
count := spRuns.Value;
Label1.Visible := True;
end;

procedure TForm4.ShowResultsClick(Sender: TObject);
begin

    Chart1.Series[0].AddXY(10, 20, '', clTeeColor);
    Chart1.Series[0].AddXY(15, 50, '', clTeeColor);
    Chart1.Series[0].AddXY(20, 30, '', clTeeColor);
    Chart1.Series[0].AddXY(25, 70, '', clTeeColor);
    Chart1.Series[0].AddXY(30, 10, '', clTeeColor);
    Chart1.Series[0].AddXY(35, 50, '', clTeeColor);
    Chart1.Series[0].AddXY(40, 45, '', clTeeColor);
    Chart1.Series[0].AddXY(45, 10, '', clTeeColor);


end;

procedure TForm4.DeleteTaskClick(Sender: TObject);
var
index : integer;
  i: Integer;
  TaskName: string;

begin


index := CampaignTaskListView.Selected.Index;

if index<0 then
exit;

TaskName := CampaignTaskListView.Items[index].Caption;
CampaignTaskListView.Items.Delete(index);

ShowMessage('Count before delete: ' + IntToStr(TaskList.Count));


if TaskList.Count > 0 then
begin
  for I := 0 to TaskList.Count - 1 do
    begin
      if TaskList.Items[i].Name = TaskName then
        TaskList.Delete(i);
    end;
end;


 ShowMessage('Count after delete: ' + IntToStr(TaskList.Count));


end;

procedure TForm4.HelpBtnClick(Sender: TObject);
var
About : TAboutBox;
begin
About := TAboutBox.Create (Application);
About.ShowModal;
end;

procedure TForm4.OnCreateSESIM20(Sender: TObject);
var
SplashScreen : TSplash;
begin

SplashScreen := TSplash.Create(Application);
SplashScreen.MakeSplash;
SplashScreen.Timer1.Enabled:=True;

MemberLIst := TObjectList<TMember>.Create(False);
TaskLIst := TObjectList<TTask>.create(false);
PageControl1.ActivePageIndex :=0;



end;

procedure TForm4.OnDestroySESIM20(Sender: TObject);
begin
MemberList.Free;
TaskList.Free;
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
var
index : integer;
  i: Integer;
  MemberName: string;
begin

index := TeamMemberView.Selected.Index;

if index<0 then
exit;

MemberName := TeamMemberView.Items[index].Caption;
TeamMemberView.Items.Delete(index);

if MemberList.Count >0 then
  begin
    for i := 0 to MemberList.Count - 1 do
      begin

        if MemberList.Items[i].name = MemberName then
          MemberList.Delete(i);


      end;
  end;

end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
var

 i,j : integer;
 Modal: TForm1;

 NewTeamMember: TListItem;
begin

  Modal := TForm1.Create (Application);


  Label5.Caption := 'Click on each indiviual team member to modify';


      if Modal.FeatListBox.Items.IndexOf('Inventor') > -1 then
      begin
           j := Modal.FeatListBox.Items.IndexOf('Inventor');
           Modal.FeatListBox.Checked[j] := True;
      end;



  if Modal.ShowModal = mrOK then
  begin


    NewTeamMember := TeamMemberView.Items.Add;
    NewTeamMember.Caption := Modal.txtName.Text;
    NewTeamMember.SubItems.Add(Modal.SpinEdit1.Text);
    NewTeamMember.SubItems.Add(Modal.SpinEdit2.Text);
    NewTeamMember.SubItems.Add(Modal.SpinEdit3.Text);
    NewTeamMember.SubItems.Add(Modal.txtSalary.Text);
    NewTeamMember.SubItems.Add(Modal.spProjectExperience.Text);



    TeamMember := TMember.Create;
    TeamMember.name := Modal.txtName.Text;
    TeamMember.intelligence := StrToInt(Modal.SpinEdit1.Text);
    TeamMember.wisdom := StrToInt(Modal.SpinEdit2.Text);
    TeamMember.charimsa := StrToInt(Modal.SpinEdit3.Text);
    TeamMember.Salary := StrToInt(Modal.txtSalary.Text);
    TeamMember.NumberOfProjects := StrToInt(Modal.spProjectExperience.Text);


    for i := 0 to Modal.FeatListBox.Count - 1 do
      begin

      if (Modal.FeatListBox.Checked[i] = TRUE) then
      begin

         TeamMember.AddFeat(Modal.FeatListBox.Items[i]);
      end;

      end;


    for i := 1 to Modal.SkillRankingList.RowCount - 1 do
    begin
      TeamMember.AddSkill(Modal.SkillRankingList.Cells[0, i], StrToInt(Modal.SkillRankingList.Cells[1, i]));
    end;

    MemberList.Add(TeamMember);



  end;


end;

procedure TForm4.SpeedButton4Click(Sender: TObject);
var
Modal : TGenerateTask;
i : integer;
TaskItem : TTask;
NewTaskListing: TListItem;
DeltaTime : Double;
begin

Modal := TGenerateTask.Create (Application);

for i := 0 to MemberList.Count - 1 do
  begin

    Modal.ResourceListBox.Items.Add(MemberList.Items[i].name);
  end;

for i := 0 to CampaignTaskListView.Items.Count - 1 do
  begin
    Modal.DependencyCombo.Items.Add(CampaignTaskListView.Items[i].Caption);
  end;

if Modal.ShowModal = mrOk then
begin

  NewTaskListing := CampaignTaskListView.Items.Add;
  NewTaskListing.Caption:= Modal.txtTaskName.Text;
  NewTaskListing.SubItems.Add(Modal.DependencyCombo.Text);
  DeltaTime := Modal.TaskTimeEnd.DateTime - Modal.TaskTimeBegin.DateTime;

  NewTaskListing.SubItems.Add(FloatToStr(deltatime));


  TaskItem := TTask.Create;
  TaskItem.Name := Modal.txtTaskName.Text;
  TaskItem.Cost := StrToInt(Modal.txtCost.Text);
  TaskItem.PhaseCategory := Modal.PhaseCombo.SelText;
  TaskItem.Duration := DeltaTime;

  for i := 0 to Modal.SkillListBox.Count - 1 do
    begin
       if Modal.SkillListBox.Checked[i]=true then TaskItem.AddSkill(Modal.SkillListBox.Items[i]);

    end;

  for i := 0 to Modal.ResourceListBox.Count - 1 do
    begin
       if Modal.ResourceListBox.Checked[i] = true then TaskItem.AddResource(Modal.ResourceListBox.Items[i]);
    end;

  TaskList.Add(TaskItem);

end;


end;

end.
