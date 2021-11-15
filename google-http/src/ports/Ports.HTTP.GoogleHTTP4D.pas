unit Ports.HTTP.GoogleHTTP4D;

interface

Uses
  System.Classes,
  System.Net.Mime;

Type
  IHTTPParams = interface;
  IHTTPHeader = interface;

  IHTTPCore = interface
    ['{F0C06A2D-6590-45FB-91DF-E47F17104994}']
    function Headers: IHTTPHeader;
    function BearerToken(Value: String): IHTTPCore;
    function BaseURL(ABase: String): IHTTPCore; overload;
    function BaseURL: String; overload;
    function Base64: IHTTPCore;
    function BasicAuth: IHTTPCore;
    function Body(Value: TStringStream): IHTTPCore; overload;
    function Body(Value: TStringList): IHTTPCore; overload;
    function Body(Value: TStream): IHTTPCore; overload;
    function ClientID(AClient: String): IHTTPCore; overload;
    function ClientSecret(ASecret: String): IHTTPCore; overload;
    function ContentType(Value: String): IHTTPCore; overload;
    function Delete: IHTTPCore; overload;
    function Delete(Value: TStream): IHTTPCore; overload;
    function Get(Value: TStream): IHTTPCore; overload;
    function Get: IHTTPCore; overload;
    function Post: IHTTPCore; overload;
    function Post(Value: TStream): IHTTPCore; overload;
    function Post(Value: String): IHTTPCore; Overload;
    function Put(Value: TStream): IHTTPCore; overload;
    function Post(Value: TMultiPartFormData): IHTTPCore; Overload;
    function Put(Value: String): IHTTPCore; Overload;
    function Put(Value: TMultiPartFormData): IHTTPCore; Overload;
    function QueryParams: IHTTPParams;
    function Response: String;
    function Resource(const AValue: String): IHTTPCore;
    function StatusCode: Integer;
  end;

  IHTTPParams = interface
    ['{B25AFFD4-3F12-4B99-A380-93F687DFCF27}']
    function Key(Value: String): IHTTPParams;
    function MakeQuery: IHTTPParams;
    function Query: IHTTPParams;
    function Value(AValue: String): IHTTPParams;
    function &End: IHTTPCore;
  end;

  IHTTPHeader = interface
    ['{38D34CA1-6505-4EBE-AED1-EC39EB67E642}']
    function AddHeader: IHTTPHeader;
    function Key(AKey: String): IHTTPHeader;
    function Value(AValue: String): IHTTPHeader;
    function EndHeader: IHTTPCore;
  end;
implementation

end.
