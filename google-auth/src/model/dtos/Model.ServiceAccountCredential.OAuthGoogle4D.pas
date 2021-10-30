unit Model.ServiceAccountCredential.OAuthGoogle4D;

interface

uses
  Types.Attributes.RTTIGoogle4D;
{$M+}

Type

  IServiceAccountCredential = interface
    ['{71C77CFC-B87B-4500-B418-6D8C731463EC}']
    function GetType: String;
    function GetAuthProviderX509CertURL: String;
    function GetAuthURI: String;
    function GetClientEmail: String;
    function GetClientid: String;
    function GetClientX509CertURL: String;
    function GetPrivateKey: String;
    function GetPrivateKeyID: String;
    function GetProjectID: String;
    function GetTokenURI: String;
    function GetScopes: String;
    function GetSubject: String;

    [JsonField('type')]
    function SetType(const AValue: String): IServiceAccountCredential;

    [JsonField('auth_provider_x509_cert_url')]
    function SetAuthProviderX509CertURL(const Value: String)
      : IServiceAccountCredential;

    [JsonField('auth_uri')]
    function SetAuthURI(const Value: String): IServiceAccountCredential;

    [JsonField('client_email')]
    function SetClientEmail(const Value: String): IServiceAccountCredential;

    [JsonField('client_id')]
    function SetClientid(const Value: String): IServiceAccountCredential;

    [JsonField('client_x509_cert_url')]
    function SetClientX509CertURL(const Value: String)
      : IServiceAccountCredential;

    [JsonField('private_key')]
    function SetPrivateKey(const Value: String): IServiceAccountCredential;

    [JsonField('private_key_id')]
    function SetPrivateKeyID(const Value: String): IServiceAccountCredential;

    [JsonField('project_id')]
    function SetProjectID(const Value: String): IServiceAccountCredential;

    [JsonField('token_uri')]
    function SetTokenURI(const Value: String): IServiceAccountCredential;

    function SetScopes(const Value: String): IServiceAccountCredential;

    function SetSubject(const Value: String): IServiceAccountCredential;

  end;

  TServiceAccountCrendential = class(TInterfacedObject,
    IServiceAccountCredential)
  private
    FClientEmail: String;
    FPrivateKey: String;
    FAuthProviderX509CertURL: String;
    FTokenURI: String;
    F_Type: String;
    FClientid: String;
    FPrivateKeyID: String;
    FProjectID: String;
    FClientX509CertURL: String;
    FAuthURI: String;
    FScopes: String;
    FSubject: String;
  public
    constructor Create;
    destructor Destroy; override;
    [New__]
    class function New: IServiceAccountCredential;
    function GetType: String;
    function GetAuthProviderX509CertURL: String;
    function GetAuthURI: String;
    function GetClientEmail: String;
    function GetClientid: String;
    function GetClientX509CertURL: String;
    function GetPrivateKey: String;
    function GetPrivateKeyID: String;
    function GetProjectID: String;
    function GetTokenURI: String;
    function GetScopes: String;
    function GetSubject: String;
    function SetType(const Value: String): IServiceAccountCredential;
    function SetAuthProviderX509CertURL(const Value: String)
      : IServiceAccountCredential;
    function SetAuthURI(const Value: String): IServiceAccountCredential;
    function SetClientEmail(const Value: String): IServiceAccountCredential;
    function SetClientid(const Value: String): IServiceAccountCredential;
    function SetClientX509CertURL(const Value: String)
      : IServiceAccountCredential;
    function SetPrivateKey(const Value: String): IServiceAccountCredential;
    function SetPrivateKeyID(const Value: String): IServiceAccountCredential;
    function SetProjectID(const Value: String): IServiceAccountCredential;
    function SetTokenURI(const Value: String): IServiceAccountCredential;
    function SetScopes(const Value: String): IServiceAccountCredential;
    function SetSubject(const Value: String): IServiceAccountCredential;
  end;

implementation

uses
  Adapters.Registers.RTTIGoogle4D;
{ TServiceAccountCrendential }

constructor TServiceAccountCrendential.Create;
begin

end;

destructor TServiceAccountCrendential.Destroy;
begin

  inherited;
end;

function TServiceAccountCrendential.GetAuthProviderX509CertURL: String;
begin
  Result := FAuthProviderX509CertURL;
end;

function TServiceAccountCrendential.GetAuthURI: String;
begin
  Result := FAuthURI;
end;

function TServiceAccountCrendential.GetClientEmail: String;
begin
  Result := FClientEmail;
end;

function TServiceAccountCrendential.GetClientX509CertURL: String;
begin
  Result := FClientX509CertURL;
end;

function TServiceAccountCrendential.GetPrivateKey: String;
begin
  Result := FPrivateKey;
end;

function TServiceAccountCrendential.GetProjectID: String;
begin
  Result := FProjectID;
end;

function TServiceAccountCrendential.GetScopes: String;
begin
  Result := FScopes;
end;

function TServiceAccountCrendential.GetSubject: String;
begin
  Result := FSubject;
end;

function TServiceAccountCrendential.GetTokenURI: String;
begin
  Result := FTokenURI;
end;

function TServiceAccountCrendential.GetType: String;
begin
  Result := F_Type;
end;

function TServiceAccountCrendential.GetClientid: String;
begin
  Result := FClientid;
end;

function TServiceAccountCrendential.GetPrivateKeyID: String;
begin
  Result := FPrivateKeyID;
end;

class function TServiceAccountCrendential.New: IServiceAccountCredential;
begin
  Result := Self.Create;
end;

function TServiceAccountCrendential.SetAuthProviderX509CertURL
  (const Value: String): IServiceAccountCredential;
begin
  FAuthProviderX509CertURL := Value;
  Result := Self;
end;

function TServiceAccountCrendential.SetAuthURI(const Value: String)
  : IServiceAccountCredential;
begin
  FAuthURI := Value;
  Result := Self;
end;

function TServiceAccountCrendential.SetClientEmail(const Value: String)
  : IServiceAccountCredential;
begin
  FClientEmail := Value;
  Result := Self;
end;

function TServiceAccountCrendential.SetClientid(const Value: String)
  : IServiceAccountCredential;
begin
  FClientid := Value;
  Result := Self;
end;

function TServiceAccountCrendential.SetClientX509CertURL(const Value: String)
  : IServiceAccountCredential;
begin
  FClientX509CertURL := Value;
  Result := Self;
end;

function TServiceAccountCrendential.SetPrivateKey(const Value: String)
  : IServiceAccountCredential;
begin
  FPrivateKey := Value;
  Result := Self;
end;

function TServiceAccountCrendential.SetPrivateKeyID(const Value: String)
  : IServiceAccountCredential;
begin
  FPrivateKeyID := Value;
  Result := Self;
end;

function TServiceAccountCrendential.SetProjectID(const Value: String)
  : IServiceAccountCredential;
begin
  FProjectID := Value;
  Result := Self;
end;

function TServiceAccountCrendential.SetScopes(const Value: String)
  : IServiceAccountCredential;
begin
  FScopes := Value;
  Result := Self;
end;

function TServiceAccountCrendential.SetSubject(const Value: String)
  : IServiceAccountCredential;
begin
  FSubject := Value;
  Result := Self;
end;

function TServiceAccountCrendential.SetTokenURI(const Value: String)
  : IServiceAccountCredential;
begin
  FTokenURI := Value;
  Result := Self;
end;

function TServiceAccountCrendential.SetType(const Value: String)
  : IServiceAccountCredential;
begin
  F_Type := Value;
  Result := Self;
end;

initialization

TRegisterClass.RegisterClass(TRegisterClass.GetGUID<IServiceAccountCredential>,
  TServiceAccountCrendential);

finalization

end.
