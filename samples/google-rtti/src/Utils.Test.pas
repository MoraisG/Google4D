unit Utils.Test;

interface

uses
  Winapi.Windows,
  System.SysUtils;

const
  GOOGLE_APPLICATION_CREDENTIALS = 'GOOGLE_APPLICATION_CREDENTIALS';

function GetEnviroment: String;

implementation

function GetEnviroment: String;
var
  LSize: Cardinal;
  FPathJson : String;
begin
  LSize := 0;
  LSize := GetEnvironmentVariable(PWideChar(GOOGLE_APPLICATION_CREDENTIALS),
    nil, LSize);
  if LSize = 0 then
    raise Exception.Create
      ('Variável de ambiente não informada para ServiceAccount Credentials');

  SetLength(FPathJson, LSize - 1);
  GetEnvironmentVariable(PWideChar(GOOGLE_APPLICATION_CREDENTIALS),
    PWideChar(FPathJson), LSize);
  Result := FPathJson;
end;

end.
