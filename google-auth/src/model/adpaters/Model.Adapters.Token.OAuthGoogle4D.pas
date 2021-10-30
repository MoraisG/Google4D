unit Model.Adapters.Token.OAuthGoogle4D;

interface

uses
  Model.Ports.OAuthGoogle4D,
  Types.JWT.OAuthGoogle4D,
  Model.ServiceAccountCredential.OAuthGoogle4D,
  Model.AccessToken.OAuthGoogle4D,
  Ports.HTTP.GoogleHTTP4D;

type

  TJWTOAuthGoogle4D = class(TInterfacedObject, IOAuthJWT)
  private
    FAcessToken: ITokenAcessGoogleOAuth2;
    FClaims: TGoogleClaims;
    FTokenJWT: TGoogleJWT;
    FSigner: TGoogleJWS;
    FKey: TGoogleJWK;
    FAlgoritm: TGoogleAlg;
    [weak]
    FServiceAccountCredential: IServiceAccountCredential;
  public
    constructor Create(AServiceAccount: IServiceAccountCredential);
    destructor Destroy; override;
    class function New(AServiceAccount: IServiceAccountCredential): IOAuthJWT;
    function CreateToken: IOAuthJWT;
    function Send: IOAuthJWT;
    function Token: ITokenAcessGoogleOAuth2;
  end;

implementation

uses
  System.SysUtils,
  System.DateUtils,
  Adapters.HTTP.Net.Google4D,
  Types.Auth.OAuth2Google4D,
  Types.HTTP.GoogleHTTP4D,
  Adapters.RTTIGoogle4D;

{ TJWTOAuthGoogle4D }

constructor TJWTOAuthGoogle4D.Create(AServiceAccount
  : IServiceAccountCredential);
begin
  FServiceAccountCredential := AServiceAccount;
  FTokenJWT := TGoogleJWT.Create(TGoogleClaims);
  FClaims := FTokenJWT.Claims as TGoogleClaims;
  FKey := TGoogleJWK.Create(FServiceAccountCredential.GetPrivateKey);
  FAlgoritm := TGoogleAlg.RS256;
  FSigner := TGoogleJWS.Create(FTokenJWT);
end;

function TJWTOAuthGoogle4D.CreateToken: IOAuthJWT;
begin
  Result := Self;
  FClaims.Issuer := FServiceAccountCredential.GetClientEmail;
  FClaims.Audience := FServiceAccountCredential.GetTokenURI;
  FClaims.Expiration := IncHour(Now, 1);
  FClaims.IssuedAt := Now;
  FClaims.Scope := FServiceAccountCredential.GetScopes;
  FSigner.Sign(FKey, FAlgoritm);
end;

destructor TJWTOAuthGoogle4D.Destroy;
begin
  FSigner.Free;
  FKey.Free;
  FTokenJWT.Free;
  inherited;
end;

class function TJWTOAuthGoogle4D.New(AServiceAccount: IServiceAccountCredential)
  : IOAuthJWT;
begin
  Result := Self.Create(AServiceAccount);
end;

function TJWTOAuthGoogle4D.Send: IOAuthJWT;
Var
  LResponse: String;
  LRequest : IHTTPCore;
begin
  Result := Self;
  LRequest := THTTPNetClient.New;
  try
    LRequest
      .Headers
        .Key(TGoogleContentType.CONTENT_TYPE).Value(TGoogleContentType.URL_ENCONDED).AddHeader
      .EndHeader
      .BaseURL(FServiceAccountCredential.GetTokenURI)
      .QueryParams
        .Key(TGoogleReservedAUTH.GRANT_TYPE).Value(TGoogleReservedAUTH.GRANT_TYPE_VALUE)
        .Key(TGoogleReservedAUTH.ASSERTION).Value(FSigner.CompactToken)
        .MakeQuery
        .Query
      .&End
      .Post;
    if LRequest.StatusCode  = 500 then
      raise Exception.Create('Erro na requisição' + LRequest.Response);
    LResponse := LRequest.Response;
    FAcessToken := TRTTIGoogle4D<ITokenAcessGoogleOAuth2>.New.JsonToObject
      (LResponse);
  except
    on E: Exception do
    begin
      raise EExceptionAuthGoogle.Create('Cannot obtaining access token!' +
        E.Message);
    end;
  end;
end;

function TJWTOAuthGoogle4D.Token: ITokenAcessGoogleOAuth2;
begin
  Result := FAcessToken;
end;

end.
