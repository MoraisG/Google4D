unit Types.Auth.OAuth2Google4D;

interface

uses
  System.SysUtils;

type
  TGoogleReservedAUTH = class
  public const
    GRANT_TYPE = 'grant_type';
    GRANT_TYPE_VALUE = 'urn:ietf:params:oauth:grant-type:jwt-bearer';
    ASSERTION = 'assertion';
  end;

  EExceptionAuthGoogle = class(Exception);

implementation

end.
