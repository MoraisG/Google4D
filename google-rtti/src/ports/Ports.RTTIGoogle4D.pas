unit Ports.RTTIGoogle4D;

interface

type

  IRTTIGoogle4D<T: IInterface> = interface
    ['{D79057B7-A934-4DA9-9626-8E4EB3795165}']
    function AsInstance: T;
    function JsonToObject(AValue: String): T;
  end;

implementation

end.
