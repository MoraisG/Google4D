unit Adapters.RTTIGoogle4D;

interface

uses
  System.Json,
  Ports.RTTIGoogle4D,
  System.RTTI;

type

  TRTTIGoogle4D<T: IInterface> = class(TInterfacedObject, IRTTIGoogle4D<T>)
  private
    FContext: TRttiContext;
    FJSON: TJSONValue;
    function GetClass: TClass;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IRTTIGoogle4D<T>;
    function AsInstance: T;
    function JsonToObject(AValue: String): T;
  end;

implementation

uses
  System.SysUtils,
  Adapters.Registers.RTTIGoogle4D,
  Types.Attributes.RTTIGoogle4D;
{ TRTTIGoogle4D<T> }

constructor TRTTIGoogle4D<T>.Create;
begin
  FContext := TRttiContext.Create;
  FJSON := nil;
end;

destructor TRTTIGoogle4D<T>.Destroy;
begin
  FContext.Free;
  if Assigned(FJSON) then
    FJSON.Free;
  inherited;
end;

function TRTTIGoogle4D<T>.GetClass: TClass;
begin
  Result := TRegisterClass.GetClass<T>;
end;

function TRTTIGoogle4D<T>.JsonToObject(AValue: String): T;
var
  LType: TRttiType;
  LInstance: TRttiInstanceType;
  LInterface: TRttiInterfaceType;
  LMethods: TRttiMethod;
  LAttributes: TCustomAttribute;
begin
  Result := Self.AsInstance;
  FJSON := TJSONObject.ParseJSONValue(AValue);
  LType := FContext.GetType(GetClass);
  LInstance := LType.AsInstance;
  for LInterface in LInstance.GetDeclaredImplementedInterfaces do
  begin
    for LMethods in LInterface.GetDeclaredMethods do
    begin
      for LAttributes in LMethods.GetAttributes do
      begin
        if LAttributes is JsonField then
          LMethods.Invoke(TValue.From<T>(Result),
            [FJSON.GetValue<String>(JsonField(LAttributes).Nome)]);
      end;
    end;
  end;
end;

function TRTTIGoogle4D<T>.AsInstance: T;
var
  LType: TRttiType;
  LMethods: TRttiMethod;
  LAttributes: TCustomAttribute;
begin
  LType := FContext.GetType(GetClass);

  for LMethods in LType.GetDeclaredMethods do
    for LAttributes in LMethods.GetAttributes do
      if LAttributes is New__ then
        Result := LMethods.Invoke(GetClass, []).AsType<T>;

  if Result = nil then
    raise Exception.Create('O objeto n�o foi instanciado');
end;

class function TRTTIGoogle4D<T>.New: IRTTIGoogle4D<T>;
begin
  Result := Self.Create;
end;

end.
