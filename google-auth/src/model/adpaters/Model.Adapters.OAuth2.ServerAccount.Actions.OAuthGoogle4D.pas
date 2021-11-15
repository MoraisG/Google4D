unit Model.Adapters.OAuth2.ServerAccount.Actions.OAuthGoogle4D;

interface

uses
  Model.Ports.OAuthGoogle4D,
  Model.ServiceAccountCredential.OAuthGoogle4D;

type

  TOAuth2ServerAccountActionsGoogle4D = class(TInterfacedObject,
    IOAuthActions<IOAuth2ServiceAccount>, IOAuth2ServiceAccount)
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
    class function New(AParent: ICredentialsOAuth)
      : IOAuthActions<IOAuth2ServiceAccount>;
    function Auth: IOAuthJWT;
    function CreateServiceAccountRefreshPayload: IOAuth2ServiceAccount;
    function ParseServiceAccountCredentials: IOAuth2ServiceAccount;
    function ParseServiceAccountCredentialsDelegated: IOAuth2ServiceAccount;
    function ParseServiceAccountRefreshResponse: IOAuth2ServiceAccount;
    function Actions: IOAuth2ServiceAccount;
    function AssertionComponentsFromInfo: IOAuthActions<IOAuth2ServiceAccount>;
    function MakeJWTAssertion: IOAuthActions<IOAuth2ServiceAccount>;
    function RequestAuth: IOAuthActions<IOAuth2ServiceAccount>;
  end;

implementation

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Adapters.RTTIGoogle4D,
  Model.Adapters.Token.OAuthGoogle4D;
{ TOAuth2ServerAccountActionsGoogle4D }

function TOAuth2ServerAccountActionsGoogle4D.Actions: IOAuth2ServiceAccount;
begin
  Result := Self;
end;

function TOAuth2ServerAccountActionsGoogle4D.AssertionComponentsFromInfo
  : IOAuthActions<IOAuth2ServiceAccount>;
begin
  Result := Self;
end;

function TOAuth2ServerAccountActionsGoogle4D.Auth: IOAuthJWT;
begin
  Result := FOAuth2;
end;

constructor TOAuth2ServerAccountActionsGoogle4D.Create
  (AParent: ICredentialsOAuth);
begin
  FParent := AParent;
end;

function TOAuth2ServerAccountActionsGoogle4D.CreateServiceAccountRefreshPayload
  : IOAuth2ServiceAccount;
begin
  Result := Self;
end;

destructor TOAuth2ServerAccountActionsGoogle4D.Destroy;
begin
  inherited;
end;

procedure TOAuth2ServerAccountActionsGoogle4D.GetVarEnviroment;
var
  LSize: Cardinal;
begin
  LSize := 0;
  LSize := GetEnvironmentVariable(PWideChar(GOOGLE_APPLICATION_CREDENTIALS),
    nil, LSize);
  if LSize = 0 then
    raise Exception.Create
      ('Variável de ambiente não informada para ServiceAccount Credentials');

  SetLength(FPathJson, LSize - 1);
  GetEnvironmentVariable(PWideChar(GOOGLE_APPLICATION_CREDENTIALS),
    PWideChar(FPathJson), LSize);
end;

function TOAuth2ServerAccountActionsGoogle4D.MakeJWTAssertion
  : IOAuthActions<IOAuth2ServiceAccount>;
begin
  Result := Self;
end;

class function TOAuth2ServerAccountActionsGoogle4D.New
  (AParent: ICredentialsOAuth): IOAuthActions<IOAuth2ServiceAccount>;
begin
  Result := Self.Create(AParent);
end;

function TOAuth2ServerAccountActionsGoogle4D.ParseServiceAccountCredentials
  : IOAuth2ServiceAccount;
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

function TOAuth2ServerAccountActionsGoogle4D.
  ParseServiceAccountCredentialsDelegated: IOAuth2ServiceAccount;
begin
  Result := Self;
  Self.ParseServiceAccountCredentials;
end;

function TOAuth2ServerAccountActionsGoogle4D.ParseServiceAccountRefreshResponse
  : IOAuth2ServiceAccount;
begin
  Result := Self;
end;

function TOAuth2ServerAccountActionsGoogle4D.RequestAuth
  : IOAuthActions<IOAuth2ServiceAccount>;
begin
  Result := Self;
  FServiceAccount.SetScopes(FParent.GetScopes);
  FOAuth2 := TJWTOAuthGoogle4D.New(FServiceAccount).CreateToken.Send;
end;

end.
