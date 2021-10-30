unit Adapters.GoogleCalendar4D;

interface

uses Ports.GoogleCalendar4D, System.SysUtils;

type

  TGoogleCalendar4D = class(TInterfacedObject, IGoogleCalendar4D)
  private
    FToken : String;
    FProc : TProc<String>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IGoogleCalendar4D;
    function GetCredential: IGoogleCalendar4D;
    function Events: IGoogleCalendar4D;
    function Display(AProc : TProc<String>) : IGoogleCalendar4D;
  end;

implementation

uses
  Adapters.HTTP.Net.Google4D,
  Model.Adapters.OAuth2.OAuthGoogle4D,
  Types.Scopes.GoogleCalendar4D,
  Types.GoogleCalendar4D;
{ TGoogleCalendar4D }

constructor TGoogleCalendar4D.Create;
begin

end;

destructor TGoogleCalendar4D.Destroy;
begin

  inherited;
end;

function TGoogleCalendar4D.Display(AProc: TProc<String>): IGoogleCalendar4D;
begin
  Result := Self;
  FProc := AProc;
end;

function TGoogleCalendar4D.Events: IGoogleCalendar4D;
begin
  Result := Self;
  FProc(
  THTTPNetClient.New
    .BearerToken(FToken)
    .BaseURL(TGoogleCalendar4DRouter.ROUTER)
    .Resource(TCalendarList.LIST)
    .Get
    .Response);
end;

function TGoogleCalendar4D.GetCredential: IGoogleCalendar4D;
begin
  Result := Self;
  FToken := TOAuth2Google4D.New
    .SetScope(TScopesGoogleCalendar4D.READ_WRITE)
    .Credentials
    .GetToken
    .Token
    .GetAccesToken;
end;

class function TGoogleCalendar4D.New: IGoogleCalendar4D;
begin
  Result := Self.Create;
end;

end.
