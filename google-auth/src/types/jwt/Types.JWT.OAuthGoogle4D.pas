unit Types.JWT.OAuthGoogle4D;

interface

uses
  JOSE.Core.JWT,
  JOSE.Core.JWS,
  JOSE.Core.JWK,
  JOSE.Core.JWA;

Type
  TGoogleClaims = class(TJWTClaims)
  private
    function GetScope: String;
    procedure SetScope(const Value: String);
  public
    property Scope: String read GetScope write SetScope;
  end;

  TGoogleReservedClaims = class
  public const
    SCOPES = 'scope';
  end;

  TGoogleJWT = class(TJWT);
  TGoogleJWK = class(TJWK);
  TGoogleJWS = class(TJWS);

  TGoogleAlg = TJOSEAlgorithmId;

implementation

uses JOSE.Types.JSON;
{ TGoogleClaims }

function TGoogleClaims.GetScope: String;
begin
  Result := TJSONUtils.GetJSONValue(TGoogleReservedClaims.SCOPES, FJSON)
    .AsString;;
end;

procedure TGoogleClaims.SetScope(const Value: String);
begin
  TJSONUtils.SetJSONValueFrom<string>(TGoogleReservedClaims.SCOPES,
    Value, FJSON);
end;

end.
