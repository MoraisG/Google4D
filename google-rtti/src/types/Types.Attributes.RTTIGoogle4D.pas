unit Types.Attributes.RTTIGoogle4D;

interface

uses
  REST.Json.Types;

type
  New__ = class(TCustomAttribute)
  private
  public
    constructor Create;
    destructor Destroy; override;
  end;

  JsonField = class(TCustomAttribute)
  private
    FNome: String;
    FRequired: Boolean;
    procedure SetNome(const Value: String);
    function GetNome: String;
    procedure SetRequired(const Value: Boolean);
  public
    constructor Create(AName: String; ARequired: Boolean = True);
    destructor Destroy; override;
    property Nome: String read GetNome write SetNome;
    property Required: Boolean read FRequired write SetRequired;
  end;

  JsonBoolean = JSONBooleanAttribute;

implementation

{ New__ }

constructor New__.Create;
begin

end;

destructor New__.Destroy;
begin

  inherited;
end;

{ JsonField }

//constructor JsonField.Create(AName: String);
//begin
//  Nome := AName;
//end;

constructor JsonField.Create(AName: String; ARequired: Boolean = True);
begin
  Nome := AName;
  Required := ARequired;
end;

destructor JsonField.Destroy;
begin

  inherited;
end;

function JsonField.GetNome: String;
begin
  Result := FNome;
end;

procedure JsonField.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure JsonField.SetRequired(const Value: Boolean);
begin
  FRequired := Value;
end;

end.
