unit Task;

interface

uses Skill, Generics.Collections, Classes, Contnrs, SysUtils;

type
  TTask = class
    Resource : TStringList;
    Duration : Double;
    Name : String;

    Cost : Integer;
    Skills: TStringList;
    PhaseCategory : String;
    procedure AddSkill(Name : string);
    procedure AddResource(Name : string);

    private

    public

    constructor OnCreate();


  end;

implementation




constructor TTask.OnCreate;
begin



end;

procedure TTask.AddSkill(Name: string);

begin
Skills := TStringList.Create;
Skills.Add(Name);


end;

procedure TTask.AddResource(Name: string);
begin
Resource := TStringList.Create;
Resource.Add(Name);
end;

end.
