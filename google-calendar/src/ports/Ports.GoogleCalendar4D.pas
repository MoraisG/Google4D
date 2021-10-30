unit Ports.GoogleCalendar4D;

interface

uses
  System.SysUtils;

type
  IGoogleCalendar4D = interface
    ['{2A43EEF1-A873-4B15-90C4-4DA2B1A1A5C4}']
    function GetCredential: IGoogleCalendar4D;
    function Events: IGoogleCalendar4D;
    function Display(AProc: TProc<String>): IGoogleCalendar4D;
  end;

implementation

end.
