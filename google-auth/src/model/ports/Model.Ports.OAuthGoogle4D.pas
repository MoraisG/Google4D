unit Model.Ports.OAuthGoogle4D;

interface

type

  IOAuthJWT = interface;

  ICredentialsOAuth = interface
    ['{1BB3D440-F2CB-4B5E-B127-F459D4263EBE}']
    function Credentials: ICredentialsOAuth;
    function CredentialsDelegated(ASubject: String): ICredentialsOAuth;
    function GetScopes : String;
    function SetToken(AValue: IOAuthJWT): ICredentialsOAuth;
    function SetScope(AValue : String) : ICredentialsOAuth;
  end;

  IOAuthActions = interface
    ['{AF5822E7-96A5-4D2C-8A63-F97D365AE5DB}']
    function AssertionComponentsFromInfo: IOAuthActions;
    function CreateServiceAccountRefreshPayload: IOAuthActions;
    function MakeJWTAssertion: IOAuthActions;
    function ParseServiceAccountCredentials: IOAuthActions;
    function ParseServiceAccountCredentialsDelegated: IOAuthActions;
    function ParseServiceAccountRefreshResponse: IOAuthActions;
  end;

  IOAuthJWT = interface
    ['{9575CFEE-A97F-4F61-955B-B0D7C536F8A3}']
    function CreateToken :  IOAuthJWT;
    function Token : String;
  end;

implementation

end.
