unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Ports.GoogleCalendar4D;

type
  TForm1 = class(TForm)
    btnList: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnListClick(Sender: TObject);
  private
    { Private declarations }
    FGoogleCalendar4D: IGoogleCalendar4D;
    procedure Display(AValue: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.DateUtils,
  Adapters.GoogleCalendar4D,
  System.Net.HttpClient,
  System.Net.Socket;
{$R *.dfm}

procedure TForm1.btnListClick(Sender: TObject);
var
  LData: TDateTime;
begin
  LData := IncHour(Now, 1);
  FGoogleCalendar4D.GetCredential.Events
end;

procedure TForm1.Display(AValue: String);
begin
  Memo1.Lines.Add(AValue);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  HTTPListener: TSocket;
  ENCODE_GOOGLE: TEncoding;
begin
  ReportMemoryLeaksOnShutdown := True;
  Memo1.Lines.Clear;
  FGoogleCalendar4D := TGoogleCalendar4D.New.Display(Self.Display);
  ENCODE_GOOGLE := TEncoding.UTF8;
  HTTPListener := TSocket.Create(TSocketType.TCP, TEncoding.UTF8);

end;

end.
