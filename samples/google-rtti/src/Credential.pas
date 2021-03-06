unit Credential;

interface

uses
  Types.Attributes.RTTIGoogle4D;
{$M+}

type

  IServiceAccountCredential = interface(IInvokable)
    ['{71C77CFC-B87B-4500-B418-6D8C731463EC}']
    [JsonField('type')]
    function SetType(AValue: String): IServiceAccountCredential;
    function GetType: String;
  end;

  TCredential = class(TInterfacedObject, IServiceAccountCredential)
  private
    FType: String;
  public
    constructor Create;
    destructor Destroy; override;
    [New__]
    class function New: IServiceAccountCredential;
    function SetType(AValue: String): IServiceAccountCredential;
    function GetType: String;

  end;

implementation

Uses
  System.TypInfo,
  Adapters.Registers.RTTIGoogle4D;
{ TCredential }

constructor TCredential.Create;
begin

end;

destructor TCredential.Destroy;
begin

  inherited;
end;

function TCredential.GetType: String;
begin
  Result := FType;
end;

class function TCredential.New: IServiceAccountCredential;
begin
  Result := Self.Create;
end;

function TCredential.SetType(AValue: String): IServiceAccountCredential;
begin
  Result := Self;
  FType := AValue;
end;

Initialization

TRegisterClass.RegisterClass(TRegisterClass.GetGUID<IServiceAccountCredential>, TCredential);

end.
