unit CreateTask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, CheckLst;

type
  TGenerateTask = class(TForm)
    Label1: TLabel;
    txtTaskName: TEdit;
    TaskTimeBegin: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    TaskTimeEnd: TDateTimePicker;
    Bevel1: TBevel;
    Label4: TLabel;
    txtCost: TEdit;
    DependencyCombo: TComboBox;
    Label5: TLabel;
    PhaseCombo: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Bevel2: TBevel;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    SkillListBox: TCheckListBox;
    Button1: TButton;
    ResourceListBox: TCheckListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GenerateTask: TGenerateTask;

implementation

{$R *.dfm}

end.
