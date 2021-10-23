unit Adapters.Registers.RTTIGoogle4D;

interface

uses System.Generics.Collections;

Type
  TRegisterClass = class
  protected
    class var FRegister: TDictionary<TGUID, TClass>;
  public
    class procedure RegisterClass(AGUID: TGUID; AClass: TClass);
    class function GetClass<T: IInterface>: TClass;
    class function GetGUID<T: IInterface>: TGUID;

  end;

implementation

uses
  TypInfo;
{ TRegisterClass }

class function TRegisterClass.GetClass<T>: TClass;
begin
  Result := FRegister.Items[GetGUID<T>];
end;

class function TRegisterClass.GetGUID<T>: TGUID;
begin
  Result := GetTypeData(TypeInfo(T))^.GUID
end;

class procedure TRegisterClass.RegisterClass(AGUID: TGUID; AClass: TClass);
begin
  if FRegister = nil then
    FRegister := TDictionary<TGUID, TClass>.Create;
  FRegister.Add(AGUID, AClass);
end;

initialization

finalization

TRegisterClass.FRegister.Free;

end.
