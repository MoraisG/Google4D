program SampleRTTIGoogle4D;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.Classes,
  System.SysUtils,
  Adapters.RTTIGoogle4D,
  Credential in 'src\Credential.pas',
  Utils.Test in 'src\Utils.Test.pas';

var
  FCredential: IServiceAccountCredential;
  FFile : TStringList;
begin
  FFile := TStringList.Create;
  try
    try
      FFile.LoadFromFile(Utils.Test.GetEnviroment);
      FCredential := TRTTIGoogle4D<IServiceAccountCredential>.New.
        JsonToObject(FFile.Text);
      Writeln(FCredential.GetType);
      Readln;
    except
      on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
    end;
  finally
    FFile.Free;
  end;

end.
