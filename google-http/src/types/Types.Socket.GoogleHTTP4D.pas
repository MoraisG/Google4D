unit Types.Socket.GoogleHTTP4D;

interface

type
  TServerInfo = record
  private
    FPort: Word;
    FIP: String;
    FURL: String;
  public
    function ServerInfo: TServerInfo;
    class operator Implicit(AValue: String): TServerInfo;
    class operator Add(AWord: Word; AValue: TServerInfo): TServerInfo;
  end;

  TRequestInfoParams = record
    FScope: String;
    FCode: String;
    FState: String;
  end;

implementation

uses
  SysUtils;
{ TServerInfo }

class operator TServerInfo.Add(AWord: Word; AValue: TServerInfo): TServerInfo;
begin
  Result.FPort := AWord;
  Result.FIP := AValue.FIP;
  Result.FURL := Format('http://%s:%d', [Result.FIP, Result.FPort]);
end;

class operator TServerInfo.Implicit(AValue: String): TServerInfo;
begin
  Result.FIP := AValue;
end;

function TServerInfo.ServerInfo: TServerInfo;
begin
  Result := Self
end;

end.
