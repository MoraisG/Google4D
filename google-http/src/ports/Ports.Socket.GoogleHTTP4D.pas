unit Ports.Socket.GoogleHTTP4D;

interface

uses Types.Socket.GoogleHTTP4D;

type

  IHTTPSocketRequest = interface
    ['{8F94342F-6C64-43D1-B333-509EEB13D42D}']
    function GetQueryParams: IHTTPSocketRequest;
    function GetCode: String;
    function GetScope: String;
    function GetState: String;
  end;

  IHTTPSockerResponse = interface
    ['{D1224320-6BE7-4469-9461-ED090687A064}']
  end;

  IHTTPListener = interface
    ['{F6CA52CF-CF3C-49AF-A9AF-35990ABB7832}']
    function Start: IHTTPListener;
    function Stop: IHTTPListener;
    function FindPort: IHTTPListener;
    function Response: IHTTPSockerResponse;
  end;

implementation

end.
