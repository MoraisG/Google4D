unit Model.AccessToken.OAuthGoogle4D;

interface

uses
  Types.Attributes.RTTIGoogle4D;
{$M+}

type
  TTokenAcces = record
    FScope: String;
    FAccesToken: String;
    FExpiresIn: Integer;
    FType: String;
  end;

  ITokenAcessGoogleOAuth2 = interface
    ['{06DBE07C-64B5-4B91-AEEA-77875D80A34E}']
    function GetAccesToken(): String;
    function GetExpiresIn(): Integer;
    function GetType(): String;
    function GetScope(): String;
    [JsonField('access_token')]
    function SetAcessToken(const AValue: String): ITokenAcessGoogleOAuth2;
    [JsonField('expires_in')]
    function SetExpiresIn(const AValue: Integer): ITokenAcessGoogleOAuth2;

    [JsonField('scope', false)]
    function SetScope(const AValue: String): ITokenAcessGoogleOAuth2;

    [JsonField('token_type')]
    function SetType(const AValue: String): ITokenAcessGoogleOAuth2;
  end;

  TTokenAccesGoogleOAuth2 = class(TInterfacedObject, ITokenAcessGoogleOAuth2)
  private
    FTokenAcces: TTokenAcces;
  public
    constructor Create;
    destructor Destroy; override;
    [New__]
    class function New: ITokenAcessGoogleOAuth2;
    function GetAccesToken(): String;
    function GetExpiresIn(): Integer;
    function GetType(): String;
    function GetScope(): String;
    function SetAcessToken(const AValue: String): ITokenAcessGoogleOAuth2;
    function SetExpiresIn(const AValue: Integer): ITokenAcessGoogleOAuth2;
    function SetScope(const AValue: String): ITokenAcessGoogleOAuth2;
    function SetType(const AValue: String): ITokenAcessGoogleOAuth2;
  end;

implementation

Uses
  Adapters.Registers.RTTIGoogle4D;

{ TTokenAccesGoogleOAuth2 }

constructor TTokenAccesGoogleOAuth2.Create;
begin

end;

destructor TTokenAccesGoogleOAuth2.Destroy;
begin

  inherited;
end;

function TTokenAccesGoogleOAuth2.GetAccesToken: String;
begin
  Result := FTokenAcces.FAccesToken;
end;

function TTokenAccesGoogleOAuth2.GetExpiresIn: Integer;
begin
  Result := FTokenAcces.FExpiresIn;
end;

function TTokenAccesGoogleOAuth2.GetScope: String;
begin
  Result := FTokenAcces.FScope;
end;

function TTokenAccesGoogleOAuth2.GetType: String;
begin
  Result := FTokenAcces.FType;
end;

class function TTokenAccesGoogleOAuth2.New: ITokenAcessGoogleOAuth2;
begin
  Result := Self.Create;
end;

function TTokenAccesGoogleOAuth2.SetAcessToken(const AValue: String)
  : ITokenAcessGoogleOAuth2;
begin
  Result := Self;
  FTokenAcces.FAccesToken := AValue;
end;

function TTokenAccesGoogleOAuth2.SetExpiresIn(const AValue: Integer)
  : ITokenAcessGoogleOAuth2;
begin
  Result := Self;
  FTokenAcces.FExpiresIn := AValue;
end;

function TTokenAccesGoogleOAuth2.SetScope(const AValue: String)
  : ITokenAcessGoogleOAuth2;
begin
  Result := Self;
  FTokenAcces.FScope := AValue;
end;

function TTokenAccesGoogleOAuth2.SetType(const AValue: String)
  : ITokenAcessGoogleOAuth2;
begin
  Result := Self;
  FTokenAcces.FType := AValue;
end;

initialization

TRegisterClass.RegisterClass(TRegisterClass.GetGUID<ITokenAcessGoogleOAuth2>,
  TTokenAccesGoogleOAuth2);

finalization

end.
