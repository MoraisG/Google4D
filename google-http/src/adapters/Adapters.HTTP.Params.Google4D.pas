unit Adapters.HTTP.Params.Google4D;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Ports.HTTP.GoogleHTTP4D;

type
  /// <summary>
  /// Classe de teste
  /// </summary>
  THTTPParams = class(TInterfacedObject, IHTTPParams)
  private
    FQuery: String;
    [weak]
    FHTTPCore: IHTTPCore;
    FParams: TList<string>;
    FValues: TList<string>;
  public
    constructor Create(Value: IHTTPCore);
    destructor Destroy; override;
    class function New(Value: IHTTPCore): IHTTPParams;
    function Key(Value: String): IHTTPParams;
    function MakeQuery: IHTTPParams;
    function Query: IHTTPParams;
    function Value(AValue: String): IHTTPParams;
    function &End: IHTTPCore;
  end;

implementation

{ THTTPParams }
uses
  IDUri;

function THTTPParams.&End: IHTTPCore;
begin
  Result := FHTTPCore;
end;

constructor THTTPParams.Create(Value: IHTTPCore);
begin
  FHTTPCore := Value;
  FParams := TList<string>.Create;
  FValues := TList<string>.Create;
end;

destructor THTTPParams.Destroy;
begin
  FParams.Free;
  FValues.Free;
  inherited;
end;

function THTTPParams.Key(Value: String): IHTTPParams;
begin
  Result := Self;
  FParams.Add(Value);
end;

class function THTTPParams.New(Value: IHTTPCore): IHTTPParams;
begin
  Result := Self.Create(Value);
end;

function THTTPParams.MakeQuery: IHTTPParams;
var
  I: Integer;
begin
  Result := Self;
  FQuery := EmptyStr;

  if FParams.Count <> FValues.Count then
    raise Exception.Create
      ('Número de parâmetros diferente para seus respectivos valores');
  for I := 0 to Pred(FParams.Count) do
  begin
    if I = 0 then
    begin
      FQuery := Format('%s%s%s%s', ['?', FParams.Items[I], '=',
        FValues.Items[I]]);
    end
    else
    begin
      FQuery := Format('%s%s%s%s%s', [FQuery, '&', FParams.Items[I], '=',
        FValues.Items[I]]);
    end;
  end;
end;

function THTTPParams.Query: IHTTPParams;
begin
  Result := Self;
  FHTTPCore.BaseURL(TIdURI.URLEncode(FHTTPCore.BaseURL + FQuery));
end;

function THTTPParams.Value(AValue: String): IHTTPParams;
begin
  Result := Self;
  FValues.Add(AValue);
end;

end.
