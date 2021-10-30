unit Types.HTTP.GoogleHTTP4D;

interface

type
  THeaders = record
    Key: String;
    Value: String;
  end;

  TGoogleContentType = class
  public const
    CONTENT_TYPE = 'Content-Type';
    URL_ENCONDED = 'application/x-www-form-urlencoded';
  end;

implementation

end.
