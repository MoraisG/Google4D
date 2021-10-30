unit Model.Adapters.OAuth2Actions.OAuthGoogle4D;

interface

uses
  Model.Ports.OAuthGoogle4D,
  Model.ServiceAccountCredential.OAuthGoogle4D;

type

  TOauth2ActionGoogle4D = class(TInterfacedObject, IOAuthActions)
  private
    [Weak]
    FParent: ICredentialsOAuth;
    FPathJson: String;
    FServiceAccount: IServiceAccountCredential;
    FOAuth2: IOAuthJWT;

  const
    GOOGLE_APPLICATION_CREDENTIALS = 'GOOGLE_APPLICATION_CREDENTIALS';
    procedure GetVarEnviroment;
  public
    constructor Create(AParent: ICredentialsOAuth);
    destructor Destroy; override;
    class function New(AParent: ICredentialsOAuth): IOAuthActions;
    function Auth: IOAuthJWT;
    function AssertionComponentsFromInfo: IOAuthActions;
    function CreateServiceAccountRefreshPayload: IOAuthActions;
    function MakeJWTAssertion: IOAuthActions;
    function ParseServiceAccountCredentials: IOAuthActions;
    function ParseServiceAccountCredentialsDelegated: IOAuthActions;
    function ParseServiceAccountRefreshResponse: IOAuthActions;
    function RequestAuth: IOAuthActions;
  end;

implementation

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Adapters.RTTIGoogle4D,
  Model.Adapters.Token.OAuthGoogle4D;
{ TOauth2ActionGoogle4D }

function TOauth2ActionGoogle4D.AssertionComponentsFromInfo: IOAuthActions;
begin
  Result := Self;
end;

function TOauth2ActionGoogle4D.Auth: IOAuthJWT;
begin
  Result := FOAuth2;
end;

constructor TOauth2ActionGoogle4D.Create(AParent: ICredentialsOAuth);
begin
  FParent := AParent;
end;

function TOauth2ActionGoogle4D.CreateServiceAccountRefreshPayload
  : IOAuthActions;
begin
  Result := Self;
end;

destructor TOauth2ActionGoogle4D.Destroy;
begin
  inherited;
end;

procedure TOauth2ActionGoogle4D.GetVarEnviroment;
var
  LSize: Cardinal;
begin
  LSize := 0;
  LSize := GetEnvironmentVariable(PWideChar(GOOGLE_APPLICATION_CREDENTIALS),
    nil, LSize);
  if LSize = 0 then
    raise Exception.Create
      ('Vari�vel de ambiente n�o informada para ServiceAccount Credentials');

  SetLength(FPathJson, LSize - 1);
  GetEnvironmentVariable(PWideChar(GOOGLE_APPLICATION_CREDENTIALS),
    PWideChar(FPathJson), LSize);
end;

function TOauth2ActionGoogle4D.MakeJWTAssertion: IOAuthActions;
begin
  Result := Self;
end;

class function TOauth2ActionGoogle4D.New(AParent: ICredentialsOAuth)
  : IOAuthActions;
begin
  Result := Self.Create(AParent);
end;

function TOauth2ActionGoogle4D.ParseServiceAccountCredentials: IOAuthActions;
var
  LFile: TStringList;
begin
  Result := Self;
  GetVarEnviroment;
  LFile := TStringList.Create;
  try
    LFile.LoadFromFile(FPathJson);
    FServiceAccount := TRTTIGoogle4D<IServiceAccountCredential>.New.JsonToObject
      (LFile.Text);
  finally
    LFile.Free;
  end;
end;

function TOauth2ActionGoogle4D.ParseServiceAccountCredentialsDelegated
  : IOAuthActions;
begin
  Result := Self;
  Self.ParseServiceAccountCredentials;
end;

function TOauth2ActionGoogle4D.ParseServiceAccountRefreshResponse
  : IOAuthActions;
begin
  Result := Self;
end;

function TOauth2ActionGoogle4D.RequestAuth: IOAuthActions;
begin
  Result := Self;
  FServiceAccount.SetScopes(FParent.GetScopes);
  FOAuth2 := TJWTOAuthGoogle4D.New(FServiceAccount).CreateToken.Send;
end;

end.
