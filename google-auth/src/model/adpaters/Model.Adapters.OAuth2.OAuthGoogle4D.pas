unit Model.Adapters.OAuth2.OAuthGoogle4D;

interface

uses
  Model.Ports.OAuthGoogle4D;

type

  TOAuth2Google4D = class(TInterfacedObject, ICredentialsOAuth)
  private
    FSubject: String;
    FScopes: String;
    FOAuth2Actions: IOAuthActions<IOAuth2ServiceAccount>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ICredentialsOAuth;
    function Credentials: ICredentialsOAuth;
    function CredentialsDelegated(ASubject: String): ICredentialsOAuth;
    function GetScopes: String;
    function GetToken: IOAuthJWT;
    function SetScope(AValue: String): ICredentialsOAuth;
  end;

implementation

{ TOAuth2Google4D }

uses Model.Adapters.OAuth2.ServerAccount.Actions.OAuthGoogle4D;

constructor TOAuth2Google4D.Create;
begin
  FOAuth2Actions := TOAuth2ServerAccountActionsGoogle4D.New(Self)
end;

function TOAuth2Google4D.Credentials: ICredentialsOAuth;
begin
  Result := Self;
  FOAuth2Actions.Actions.ParseServiceAccountCredentials;
end;

function TOAuth2Google4D.CredentialsDelegated(ASubject: String)
  : ICredentialsOAuth;
begin
  Result := Self;
  FSubject := ASubject;
  FOAuth2Actions.Actions.ParseServiceAccountCredentialsDelegated;
end;

destructor TOAuth2Google4D.Destroy;
begin

  inherited;
end;

function TOAuth2Google4D.GetScopes: String;
begin
  Result := FScopes;
end;

class function TOAuth2Google4D.New: ICredentialsOAuth;
begin
  Result := Self.Create;
end;

function TOAuth2Google4D.SetScope(AValue: String): ICredentialsOAuth;
begin
  Result := Self;
  FScopes := AValue;
end;

function TOAuth2Google4D.GetToken: IOAuthJWT;
begin
  Result := FOAuth2Actions.RequestAuth.Actions.Auth;
end;

end.
