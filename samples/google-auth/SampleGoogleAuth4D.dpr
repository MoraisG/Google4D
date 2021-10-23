program SampleGoogleAuth4D;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Model.Adapters.OAuth2.OAuthGoogle4D;

begin
  try
    TOAuth2Google4D.New.Credentials;
    ReadLn;
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
      ReadLn;
    end;
  end;
end.
