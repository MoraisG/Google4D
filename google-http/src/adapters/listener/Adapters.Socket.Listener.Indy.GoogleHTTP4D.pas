unit Adapters.Socket.Listener.Indy.GoogleHTTP4D;

interface

uses
  Ports.Socket.GoogleHTTP4D,
  IdBaseComponent,
  IdComponent,
  IdCustomTCPServer,
  IdCustomHTTPServer,
  IdHTTPServer,
  IdTCPServer,
  IdSocketHandle,
  IdContext;

type

  TSocketListentIndy = class(TInterfacedObject, IHTTPListener)
  private
    FIdHTTPServer: TIdHTTPServer;
    FRequest: IHTTPSocketRequest;
    procedure OnCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure OnCommandOther(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IHTTPListener;
    function Start: IHTTPListener;
    function Stop: IHTTPListener;
    function FindPort: IHTTPListener;
    function Response: IHTTPSockerResponse;
  end;

implementation

uses
  System.SysUtils,
  Adapters.Socket.Request.Indy.GoogleHTTP4D;
{ TSocketListentIndy }

constructor TSocketListentIndy.Create;
begin
  FIdHTTPServer := TIdHTTPServer.Create(nil);
  FIdHTTPServer.OnCommandGet := OnCommandGet;
  FIdHTTPServer.OnCommandOther := OnCommandOther;
end;

destructor TSocketListentIndy.Destroy;
begin
  FIdHTTPServer.Free;
  inherited;
end;

function TSocketListentIndy.FindPort: IHTTPListener;
begin
  Result := Self;
end;

class function TSocketListentIndy.New: IHTTPListener;
begin
  Result := Self.Create;
end;

procedure TSocketListentIndy.OnCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin
  if FRequest = nil then
    TIndySocketRequestInfo.New(ARequestInfo);
  FRequest.GetQueryParams;
end;

procedure TSocketListentIndy.OnCommandOther(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin
  if FRequest = nil then
    TIndySocketRequestInfo.New(ARequestInfo);
end;

function TSocketListentIndy.Response: IHTTPSockerResponse;
begin

end;

function TSocketListentIndy.Start: IHTTPListener;
begin
  Result := Self;
  try

  except
    on E: Exception do
    begin

    end;
  end;
end;

function TSocketListentIndy.Stop: IHTTPListener;
begin
  Result := Self;
  try
    if FIdHTTPServer.Active then
    begin
      FIdHTTPServer.Active := False;
      FIdHTTPServer.Bindings.Clear;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.
