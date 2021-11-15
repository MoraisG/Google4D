unit Model.Adapters.OAuth2.App.OAuthGoogle4D;

interface

uses
  Model.Ports.OAuthGoogle4D;

type

  TOAuth2AppGoogle4D = class(TInterfacedObject, IOAuthActions<IOAuth2App>,
    IOAuth2App)
  private

  public
    constructor Create;
    destructor Destroy; override;
    class function New: IOAuthActions<IOAuth2App>;
    function Actions: IOAuth2App;
    function AssertionComponentsFromInfo: IOAuthActions<IOAuth2App>;
    function MakeJWTAssertion: IOAuthActions<IOAuth2App>;
    function RequestAuth: IOAuthActions<IOAuth2App>;
    function RevokeToken: IOAuth2App;
    function RefreshToken: IOAuth2App;
  end;

implementation

{ TOAuth2AppGoogle4D }

function TOAuth2AppGoogle4D.Actions: IOAuth2App;
begin
  Result := Self;
end;

function TOAuth2AppGoogle4D.AssertionComponentsFromInfo
  : IOAuthActions<IOAuth2App>;
begin
  Result := Self;
end;

constructor TOAuth2AppGoogle4D.Create;
begin

end;

destructor TOAuth2AppGoogle4D.Destroy;
begin

  inherited;
end;

function TOAuth2AppGoogle4D.MakeJWTAssertion: IOAuthActions<IOAuth2App>;
begin
  Result := Self;
end;

class function TOAuth2AppGoogle4D.New: IOAuthActions<IOAuth2App>;
begin
  Result := Self.Create;
end;

function TOAuth2AppGoogle4D.RefreshToken: IOAuth2App;
begin
  Result := Self;
end;

function TOAuth2AppGoogle4D.RequestAuth: IOAuthActions<IOAuth2App>;
begin
  Result := Self;

end;

function TOAuth2AppGoogle4D.RevokeToken: IOAuth2App;
begin
  Result := Self;
end;

end.
