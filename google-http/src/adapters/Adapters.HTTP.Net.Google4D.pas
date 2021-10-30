unit Adapters.HTTP.Net.Google4D;

interface

uses
  System.Classes,
  System.Generics.Collections,
  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  System.Net.Mime,
  Ports.HTTP.GoogleHTTP4D,
  Types.HTTP.GoogleHTTP4D;

type

  THTTPNetClient = class(TInterfacedObject, IHTTPCore, IHTTPHeader)
  private
    FBasic: String;
    FBaseURL: String;
    FBodyStrStream: TStringStream;
    FClientID: String;
    FClientSecret: String;
    FHTTPClient: TNetHTTPClient;
    FHeaders: TNetHeaders;
    FListHeaders: TList<TNetHeader>;
    FQueryParams: IHTTPParams;
    FResponse: IHTTPResponse;
    FHeader: THeaders;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IHTTPCore;
    function AddHeader : IHTTPHeader;
    function Headers: IHTTPHeader;
    function BaseURL(ABase: String): IHTTPCore; overload;
    function BaseURL: String; overload;
    function Base64: IHTTPCore;
    function BasicAuth: IHTTPCore;
    function BearerToken(Value: String): IHTTPCore;
    function Body(Value: TStringStream): IHTTPCore; overload;
    function Body(Value: TStringList): IHTTPCore; overload;
    function Body(Value: TStream): IHTTPCore; overload;
    function ClientID(AClient: String): IHTTPCore;
    function ClientSecret(ASecret: String): IHTTPCore;
    function ContentType(Value: String): IHTTPCore; overload;
    function Delete: IHTTPCore; overload;
    function Delete(Value: TStream): IHTTPCore; overload;
    function Response: String;
    function Resource(const AValue: String): IHTTPCore;
    function Get(Value: TStream): IHTTPCore; overload;
    function Get: IHTTPCore; overload;
    function Post: IHTTPCore; overload;
    function Post(Value: TStream): IHTTPCore; overload;
    function Post(Value: String): IHTTPCore; Overload;
    function Post(Value: TMultiPartFormData): IHTTPCore; Overload;
    function Put(Value: TStream): IHTTPCore; overload;
    function Put(Value: String): IHTTPCore; Overload;
    function Put(Value: TMultiPartFormData): IHTTPCore; Overload;
    function QueryParams: IHTTPParams;
    function StatusCode: Integer;
    function Key(AKey: String): IHTTPHeader;
    function Value(AValue: String): IHTTPHeader;
    function EndHeader: IHTTPCore;
  end;

implementation

{ THTTPNetClient }
uses
  System.SysUtils,
  System.NetEncoding,
  Adapters.HTTP.Params.Google4D;

function THTTPNetClient.Headers: IHTTPHeader;
begin
  Result := Self;
end;

function THTTPNetClient.AddHeader: IHTTPHeader;
begin
  Result := Self;
  FListHeaders.Add(TNetHeader.Create(FHeader.Key, FHeader.Value));
end;

function THTTPNetClient.Base64: IHTTPCore;
var
  LBase64: TBase64Encoding;
begin
  Result := Self;
  LBase64 := TBase64Encoding.Create(0);
  try
    FBasic := 'Basic ' + LBase64.Encode
      (Format('%s:%s', [FClientID, FClientSecret]));
  finally
    LBase64.Free;
  end;
end;

function THTTPNetClient.BaseURL: String;
begin
  Result := FBaseURL;
end;

function THTTPNetClient.BasicAuth: IHTTPCore;
begin
  Result := Self;
  FHTTPClient.CustomHeaders['Authorization'] := FBasic;
end;

function THTTPNetClient.BaseURL(ABase: String): IHTTPCore;
begin
  Result := Self;
  FBaseURL := ABase;
end;

function THTTPNetClient.BearerToken(Value: String): IHTTPCore;
begin
  Result := Self;
  FHTTPClient.CustomHeaders['Authorization'] := 'Bearer ' + Value;
end;

function THTTPNetClient.Body(Value: TStringStream): IHTTPCore;
begin
  Result := Self;
  if not Assigned(FBodyStrStream) then
    FBodyStrStream := TStringStream.Create;
  TStringStream(FBodyStrStream).CopyFrom(Value, Value.Size);
  FBodyStrStream.Position := 0;
end;

function THTTPNetClient.Body(Value: TStream): IHTTPCore;
begin
  Result := Self;
  if not Assigned(FBodyStrStream) then
    FBodyStrStream := TStringStream.Create;
  TStringStream(FBodyStrStream).CopyFrom(Value, Value.Size);
  FBodyStrStream.Position := 0;
end;

function THTTPNetClient.Body(Value: TStringList): IHTTPCore;
begin
  Result := Self;
  if Assigned(FBodyStrStream) then
    FBodyStrStream := TStringStream.Create(Value.Text);
  FBodyStrStream.Position := 0;
end;

function THTTPNetClient.ContentType(Value: String): IHTTPCore;
begin
  Result := Self;
  FHTTPClient.ContentType := Value;
end;

function THTTPNetClient.ClientID(AClient: String): IHTTPCore;
begin
  Result := Self;
  FClientID := AClient;
end;

function THTTPNetClient.ClientSecret(ASecret: String): IHTTPCore;
begin
  Result := Self;
  FClientSecret := ASecret;
end;

function THTTPNetClient.Delete: IHTTPCore;
begin
  Result := Self;
  FHTTPClient.Delete(FBaseURL);
end;

function THTTPNetClient.Delete(Value: TStream): IHTTPCore;
begin
  Result := Self;
  FHTTPClient.Delete(FBaseURL, Value, FListHeaders.ToArray);
end;

constructor THTTPNetClient.Create;
begin
  FHTTPClient := TNetHTTPClient.Create(nil);
  FListHeaders := TList<TNetHeader>.Create;
  FHTTPClient.SecureProtocols := [THTTPSecureProtocol.SSL3,
    THTTPSecureProtocol.TLS1, THTTPSecureProtocol.TLS11,
    THTTPSecureProtocol.TLS12];
  FBodyStrStream := TStringStream.Create;
end;

destructor THTTPNetClient.Destroy;
begin
  if Assigned(FBodyStrStream) then
    FBodyStrStream.Free;
  FListHeaders.Free;
  FHTTPClient.Free;
  inherited;
end;

function THTTPNetClient.EndHeader: IHTTPCore;
begin
  Result := Self;
end;

function THTTPNetClient.Get: IHTTPCore;
begin
  Result := Self;
  FResponse := FHTTPClient.Get(FBaseURL, nil, FHeaders);
end;

function THTTPNetClient.Key(AKey: String): IHTTPHeader;
begin
  Result := Self;
  FHeader.Key := AKey;
end;

function THTTPNetClient.Get(Value: TStream): IHTTPCore;
begin
  Result := Self;
  FResponse := FHTTPClient.Get(FBaseURL, Value, FListHeaders.ToArray)
end;

class function THTTPNetClient.New: IHTTPCore;
begin
  Result := Self.Create;
end;

function THTTPNetClient.Post(Value: TMultiPartFormData): IHTTPCore;
begin
  Result := Self;
  FResponse := FHTTPClient.Post(FBaseURL, Value, nil, FListHeaders.ToArray);
end;

function THTTPNetClient.Post: IHTTPCore;
begin
  Result := Self;
  FResponse := FHTTPClient.Post(FBaseURL, FBodyStrStream, nil,
    FListHeaders.ToArray);
end;

function THTTPNetClient.Post(Value: TStream): IHTTPCore;
begin
  Result := Self;
  FResponse := FHTTPClient.Post(FBaseURL, Value, nil, FListHeaders.ToArray)
end;

function THTTPNetClient.Post(Value: String): IHTTPCore;
begin
  Result := Self;
  FResponse := FHTTPClient.Post(FBaseURL, Value, nil, FListHeaders.ToArray);
end;

function THTTPNetClient.Put(Value: TStream): IHTTPCore;
begin
  Result := Self;
  FResponse := FHTTPClient.Put(FBaseURL, Value, nil, FListHeaders.ToArray);
end;

function THTTPNetClient.Put(Value: String): IHTTPCore;
begin
  Result := Self;
  FResponse := FHTTPClient.Put(FBaseURL, Value, nil, FListHeaders.ToArray);
end;

function THTTPNetClient.Put(Value: TMultiPartFormData): IHTTPCore;
begin
  Result := Self;
  FResponse := FHTTPClient.Put(FBaseURL, Value, nil, FListHeaders.ToArray);
end;

function THTTPNetClient.QueryParams: IHTTPParams;
begin
  if FQueryParams = nil then
    FQueryParams := THTTPParams.New(Self);
  Result := FQueryParams;
end;

function THTTPNetClient.Resource(const AValue: String): IHTTPCore;
begin
  Result := Self;
  FBaseURL := FBaseURL + AValue;
end;

function THTTPNetClient.Response: String;
begin
  Result := FResponse.ContentAsString(TEncoding.UTF8);
end;

function THTTPNetClient.StatusCode: Integer;
begin
  Result := FResponse.StatusCode;
end;

function THTTPNetClient.Value(AValue: String): IHTTPHeader;
begin
  Result := Self;
  FHeader.Value := AValue;
end;

end.
