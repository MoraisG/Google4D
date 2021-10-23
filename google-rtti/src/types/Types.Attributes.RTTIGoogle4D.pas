unit Types.Attributes.RTTIGoogle4D;

interface

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
    procedure SetNome(const Value: String);
    function GetNome: String;
  public
    constructor Create(AName: String);
    destructor Destroy; override;
    property Nome: String read GetNome write SetNome;
  end;

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

constructor JsonField.Create(AName: String);
begin
  Nome := AName;
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

end.
