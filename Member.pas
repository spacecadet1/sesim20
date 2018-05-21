unit Member;

interface

uses Feat, SysUtils, Classes,Skill, Contnrs, Generics.Collections;

type
 TMember = Class
 name: string;
 intelligence : Integer;
     charimsa : Integer;
     wisdom: Integer;
     NumberOfProjects: Integer;
     Salary: Integer;
     FeatList : TStringList;

     procedure AddSkill(SkillName : String; Ranking : Integer);
     procedure AddFeat(FeatName : String);
private



 public


     constructor Create();



 End;

 var
    MemberSkill : TSkill;
    SkillList : TObjectList<TSkill>;


implementation

constructor TMember.Create;
begin
  SkillList := TObjectList<TSkill>.Create(True);
  FeatList := TStringList.Create;
end;

procedure TMember.AddSkill(SkillName : string; Ranking : integer);


begin
    MemberSkill := TSkill.Create;
    MemberSkill.Name := SkillName;
    MemberSkill.Rating := Ranking;

    SkillList.Add(MemberSkill);



end;

procedure TMember.AddFeat(FeatName: string);
begin


  FeatList.Add(FeatName);


end;


end.
