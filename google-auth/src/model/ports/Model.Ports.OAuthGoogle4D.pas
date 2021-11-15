unit Model.Ports.OAuthGoogle4D;

interface

uses Model.AccessToken.OAuthGoogle4D;

type

  IOAuthJWT = interface;
  IOAuth2App = interface;
  IOAuth2ServiceAccount = interface;

  ICredentialsOAuth = interface
    ['{1BB3D440-F2CB-4B5E-B127-F459D4263EBE}']
    function Credentials: ICredentialsOAuth;
    function CredentialsDelegated(ASubject: String): ICredentialsOAuth;
    function GetScopes: String;
    function GetToken: IOAuthJWT;
    function SetScope(AValue: String): ICredentialsOAuth;
  end;

  IOAuth2App = interface
    ['{6559075B-5301-4254-8F91-1394FA823264}']
    function RevokeToken: IOAuth2App;
    function RefreshToken: IOAuth2App;
  end;

  IOAuth2ServiceAccount = interface
    ['{32F870F4-3BAC-475C-B3D6-C9F2E8FD301D}']
    function Auth: IOAuthJWT;
    function CreateServiceAccountRefreshPayload: IOAuth2ServiceAccount;
    function ParseServiceAccountCredentials: IOAuth2ServiceAccount;
    function ParseServiceAccountCredentialsDelegated: IOAuth2ServiceAccount;
    function ParseServiceAccountRefreshResponse: IOAuth2ServiceAccount;
  end;

  IOAuthActions<T: IInterface> = interface
    ['{AF5822E7-96A5-4D2C-8A63-F97D365AE5DB}']
    function Actions: T;
    function AssertionComponentsFromInfo: IOAuthActions<T>;
    function MakeJWTAssertion: IOAuthActions<T>;
    function RequestAuth: IOAuthActions<T>;
  end;

  IOAuthJWT = interface
    ['{9575CFEE-A97F-4F61-955B-B0D7C536F8A3}']
    function CreateToken: IOAuthJWT;
    function Send: IOAuthJWT;
    function Token: ITokenAcessGoogleOAuth2;
  end;

  IOAuth2 = interface
    ['{921B22ED-7679-424E-A3A0-5B0DDB11274D}']
    function InstalledAPP: IOAuthActions<IOAuth2App>;
    function ServiceAccount: IOAuthActions<IOAuth2ServiceAccount>;
  end;

implementation

end.
