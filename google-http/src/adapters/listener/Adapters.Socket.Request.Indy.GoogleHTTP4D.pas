unit Adapters.Socket.Request.Indy.GoogleHTTP4D;

interface

uses
  Ports.Socket.GoogleHTTP4D,
  IdCustomHTTPServer,
  Types.Socket.GoogleHTTP4D;

type

  TIndySocketRequestInfo = class(TInterfacedObject, IHTTPSocketRequest)
  private
    FReqInfo: TIdHTTPRequestInfo;
    FParamsInfo: TRequestInfoParams;

  const
    SCOPE = 'scope';
    STATE = 'state';
    CODE = 'code';
    AUTH_USER = 'authuser';
  public
    constructor Create(ARequestInfo: TIdHTTPRequestInfo);
    destructor Destroy; override;
    class function New(ARequestInfo: TIdHTTPRequestInfo): IHTTPSocketRequest;
    function GetQueryParams: IHTTPSocketRequest;
    function GetCode: String;
    function GetScope: String;
    function GetState: String;
  end;

implementation

uses
  System.SysUtils;
{ TIndySocketRequestInfo }

constructor TIndySocketRequestInfo.Create(ARequestInfo: TIdHTTPRequestInfo);
begin
  FReqInfo := ARequestInfo;
end;

destructor TIndySocketRequestInfo.Destroy;
begin
  inherited;
end;

function TIndySocketRequestInfo.GetCode: String;
begin
  Result := FParamsInfo.FCode;
end;

function TIndySocketRequestInfo.GetQueryParams: IHTTPSocketRequest;
begin
  Result := Self;
  if FReqInfo.Params.Text = EmptyStr then
    exit;
  FParamsInfo.FCode := FReqInfo.Params.Values[CODE];
  FParamsInfo.FState := FReqInfo.Params.Values[STATE];
  FParamsInfo.FScope := FReqInfo.Params.Values[SCOPE];
end;

function TIndySocketRequestInfo.GetScope: String;
begin
  Result := FParamsInfo.FScope;
end;

function TIndySocketRequestInfo.GetState: String;
begin
  Result := FParamsInfo.FState;
end;

class function TIndySocketRequestInfo.New(ARequestInfo: TIdHTTPRequestInfo)
  : IHTTPSocketRequest;
begin
  Result := Self.Create;
end;

end.
