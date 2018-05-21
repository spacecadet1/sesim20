unit GenerateTeam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Spin, ComCtrls, CheckLst, Grids, ValEdit;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    txtName: TEdit;
    Label2: TLabel;
    txtSalary: TEdit;
    Bevel1: TBevel;
    SpinEdit1: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    SpinEdit2: TSpinEdit;
    Label5: TLabel;
    SpinEdit3: TSpinEdit;
    txtAllocation: TEdit;
    spProjectExperience: TSpinEdit;
    Label6: TLabel;
    Button1: TButton;
    Label10: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    FeatListBox: TCheckListBox;
    SkillListBox: TCheckListBox;
    SkillRankingList: TValueListEditor;
    Label8: TLabel;
    txtNumOfSkills: TEdit;
    NumFeats: TEdit;
    Label7: TLabel;
    Label9: TLabel;
    txtSkillRank: TEdit;
    procedure OnChangeSpinEdit1(Sender: TObject);
    procedure OnChangeSpinEdit2(Sender: TObject);
    procedure OnChangeSpinEdit3(Sender: TObject);
    function IsAllocationOK() : Boolean;
    procedure TallyAllocation();
    procedure TallyNumberOfSkillChoices();
    procedure TallyNumberOfFeatChoices();
    procedure OnChangeSPProjectExperience(Sender: TObject);
    procedure OnClickCheckSkills(Sender: TObject);
    procedure ApplyTemplate(selected : integer);
    procedure AddSkillToRankList(selected: integer);
    procedure OnClickCheckFeats(Sender: TObject);
    function NumberOfCheckedFeats() : Integer;
    function NumberOfCheckedSkills() : Integer;
    function CountFeatBonus():Integer;
    function CountSkillRankings ():Integer;
    procedure OnKeyUpSkillRankingList(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    function IsFeatBonus(bonus : string) : Boolean ;
    procedure OnCreate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  TotalSkillBonus : Integer;
  TotalFeatBonus : Integer;
  SkillRanks : Integer;

implementation

{$R *.dfm}

function TForm1.CountSkillRankings;
var
i : integer;
count: integer;
begin
count :=0;
for i := 1 to SkillRankingList.RowCount - 1 do
  begin

    count := count + StrToInt(SkillRankingList.Cells[1, i]);
  end;


Result := count - SkillRankingList.RowCount;

end;

function TForm1.NumberOfCheckedSkills;
var
i : integer;
count : integer;
begin
  count := 0;
  for I := 0 to SkillListBox.Items.Count-1 do
  begin
      if (SkillListBox.Checked[i] = TRUE) then count := count + 1;
    end;

   Result :=count;
end;

function TForm1.IsFeatBonus(bonus: string):Boolean;
begin

  if bonus = 'Skill Focus:Craft-Chemical' then result := true


  else if bonus = 'Skill Focus:Craft-Mechancial' then result := true


  else if bonus = 'Skill Focus:Craft-Electronic' then result := true


  else if bonus = 'Skill Focus:Craft-Structural' then result := true


  else if bonus = 'Skill Focus:Business' then  result := true


  else if bonus = 'Skill Focus:Physical Sciences' then  result := true


  else if bonus = 'Skill Focus:Earth and Life Sciences' then result := true


  else if bonus = 'Skill Focus:Technology' then  result := true

  else if bonus = 'Inventor' then  result := true

  else result:=false;


end;

function TForm1.CountFeatBonus;
var
count : integer;
i : integer;
begin
count :=0;

for I := 0 to FeatListBox.Items.Count - 1 do
  begin
    if FeatListBox.Checked[i] = True then
    begin
      if self.IsFeatBonus(FeatListBox.Items[i]) then  count := count + 1;

    end
  end;

Result := count;
end;

function TForm1.NumberOfCheckedFeats;
var
i : integer;
count : integer;
begin
  count := 0;
  for I := 0 to FeatListBox.Items.Count-1 do
  begin
      if (FeatListBox.Checked[i] = TRUE) then count := count + 1;
  end;

   Result :=count;

end;

procedure TForm1.AddSkillToRankList(selected: Integer);
begin

  if StrToInt(txtNumOfSkills.Text) < 1 then
    begin


    exit;
    end;

  SkillRankingList.InsertRow(SkillListBox.Items[selected],'1', True);

  TotalSkillBonus := 2;
  if SpinEdit1.Value > 0 then TotalSkillBonus := 2 + SpinEdit1.Value;
  txtNumOfSkills.Text := IntToStr(TotalSkillBonus - SkillRankingList.RowCount+1);

end;


procedure TForm1.ApplyTemplate (selected: integer);
begin

if SkillListBox.Items[selected] = 'Craft-Chemical' then
  FeatListBox.Checked[FeatListBox.Items.IndexOf('Skill Focus:Craft-Chemical')] := True;

  if SkillListBox.Items[selected] = 'Craft-Mechancial' then
  FeatListBox.Checked[FeatListBox.Items.IndexOf('Skill Focus:Craft-Mechancial')] := True;

  if SkillListBox.Items[selected] = 'Craft-Electronic' then
  FeatListBox.Checked[FeatListBox.Items.IndexOf('Skill Focus:Craft-Electronic')] := True;

  if SkillListBox.Items[selected] = 'Craft-Structural' then
  FeatListBox.Checked[FeatListBox.Items.IndexOf('Skill Focus:Craft-Structural')] := True;

  if SkillListBox.Items[selected] = 'Business' then
  FeatListBox.Checked[FeatListBox.Items.IndexOf('Skill Focus:Business')] := True;

  if SkillListBox.Items[selected] = 'Physical Sciences' then
  FeatListBox.Checked[FeatListBox.Items.IndexOf('Skill Focus:Physical Sciences')] := True;

  if SkillListBox.Items[selected] = 'Earth and Life Sciences' then
  FeatListBox.Checked[FeatListBox.Items.IndexOf('Skill Focus:Earth and Life Sciences')] := True;

  if SkillListBox.Items[selected] = 'Technology' then
  FeatListBox.Checked[FeatListBox.Items.IndexOf('Skill Focus:Technology')] := True;

end;

procedure TForm1.TallyNumberOfFeatChoices;
begin
  TotalFeatBonus := 1;
  NumFeats.Text := IntToStr(TotalFeatBonus * spProjectExperience.Value);
  NumFeats.Tag := StrToInt(NumFeats.Text);
end;

procedure TForm1.TallyNumberOfSkillChoices;
begin
  TotalSkillBonus := 2;
  if SpinEdit1.Value > 0 then TotalSkillBonus := 2 + SpinEdit1.Value;

  txtNumOfSkills.Text := IntToStr(TotalSkillBonus);

  txtSkillRank.Text :=  IntToStr(TotalSkillBonus * spProjectExperience.Value);
  SkillRanks := StrtoInt(txtSkillRank.Text);
  txtNumOfSkills.Text := IntToStr(TotalSkillBonus - SkillRankingList.RowCount+1);
end;

procedure TForm1.TallyAllocation;
begin
     txtAllocation.Text :=  IntToStr((StrtoInt(Spinedit1.Text)+ StrtoInt(Spinedit2.Text)+ StrtoInt(Spinedit3.Text)));
end;

function TForm1.IsAllocationOK() : Boolean;
begin
  if (StrtoInt(Spinedit1.Text)+ StrtoInt(Spinedit2.Text)+ StrtoInt(Spinedit3.Text))>3 then
  begin
  Result := False;
  ShowMessage('Too much allocation. You only have 3 points to allocate');

  end
  else
  begin
  Result := True;

  end;

end;

procedure TForm1.OnChangeSpinEdit1(Sender: TObject);


begin

  if StrtoInt(Spinedit1.Text) >2 then
    begin
      ShowMessage('You can only allocate a maximum of 2 points');
      SpinEdit1.Text := '2';
    end
  else

    begin

        if IsAllocationOK = False then

           SpinEdit1.Text :=  IntToStr(StrtoInt(Spinedit1.Text)-1);





   end;

   SpinEdit1.Tag := StrToInt(SpinEdit1.Text);
   TallyAllocation;
   TallyNumberOfSkillChoices;
end;

procedure TForm1.OnChangeSpinEdit2(Sender: TObject);
begin




if StrtoInt(Spinedit2.Text) >2 then
    begin
      ShowMessage('You can only allocate a maximum of 2 points');
      SpinEdit2.Text := '2';
    end
  else

    begin

   if IsAllocationOK = False then

      SpinEdit2.Text :=  IntToStr(StrtoInt(Spinedit2.Text)-1);



   end;

   SpinEdit2.Tag := StrToInt(SpinEdit2.Text);
   TallyAllocation;
   TallyNumberOfSkillChoices;

end;

procedure TForm1.OnChangeSpinEdit3(Sender: TObject);
begin


   if StrtoInt(Spinedit3.Text) >2 then
    begin
      ShowMessage('You can only allocate a maximum of 2 points');
      SpinEdit3.Text := '2';
    end
  else

    begin

 if IsAllocationOK = False then

    SpinEdit3.Text :=  IntToStr(StrtoInt(Spinedit3.Text)-1);



   end;

   SpinEdit3.Tag := StrToInt(SpinEdit3.Text);
   TallyAllocation;
   TallyNumberOfSkillChoices;




end;

procedure TForm1.OnChangeSPProjectExperience(Sender: TObject);
begin
TallyNumberOfFeatChoices;
TallyNumberOfSkillChoices;
end;

procedure TForm1.OnClickCheckFeats(Sender: TObject);
var
selected: integer;
bonuschecks : integer;
checks : integer;
begin



selected := FeatListBox.ItemIndex;
bonuschecks := self.CountFeatBonus;
checks := self.NumberOfCheckedFeats;
NumFeats.Text := IntToStr(self.spProjectExperience.Value- (checks-bonuschecks));


end;

procedure TForm1.OnClickCheckSkills(Sender: TObject);
var
selected : integer;
begin
selected := SkillListBox.ItemIndex;

//add template info
if (SkillListBox.Checked[selected]=True) AND (StrToInt(txtNumOfSkills.Text) > 0) then
  begin

    ApplyTemplate(selected);
    AddSkillToRankList(selected);

  end
else if (SkillListBox.Checked[selected]=False)  then
  begin

    TallyNumberOfSkillChoices;

  end
else exit;



end;

procedure TForm1.OnCreate(Sender: TObject);
begin

PageControl1.ActivePageIndex :=0;
end;

procedure TForm1.OnKeyUpSkillRankingList(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  total : integer;
  begin

  total := StrToInt(txtSkillRank.Text)- StrToInt(SkillRankingList.Cells[1,SkillRankingList.Row]);



if total<0 then
  begin

    SkillRankingList.RestoreCurrentRow;
    txtSkillRank.Text := IntToStr(SkillRanks - self.CountSkillRankings);
    exit;
  end
else
  begin

    txtSkillRank.Text := IntToStr(SkillRanks - self.CountSkillRankings);
  end;


end;

end.
