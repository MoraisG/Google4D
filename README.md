# Google4D
 ## **Google's client library for Delphi**

> ## **Target**
> ### O Google4D é uma biblioteca que permite o usuário que programa em Delphi consumir as api's da Google de forma simples e segura. Este é um projeto de longo prazo que permitirá a comunidade Delphi contribuir e melhorar o código, seguindo de perto a documentação disponibilizada pela Google.

# GoogleOAuth24D

> ### A Google permite várias formas de autenticação como as que se segue:

> - OAuth2 for Webserver applications
> - OAuth2 for Installed applications
> - OAuth2 for Client-side (JavaScript) applications
> - OAuth2 for Applications on limited-input devices
> - OAuth2 for Service accounts (Server to Server Applications)

> #### Para mais informações consulte a documentações da Google [OAuth 2.0 to Access Google APIs](https://developers.google.com/identity/protocols/oauth2)

> ### Esta biblioteca por enquanto está habilitada para fazer requisições usando OAuth2 for Service accounts (Server to server applications).

> > ### Como configurar (How setting)
> > Create enviroment variable at path
> > 1. [Como configurar a variável de ambiente](https://cloud.google.com/docs/authentication/getting-started#windows)
> > 2. No seu código poderá realizar a seguinte chamada. 
> > 2.1 Exemplo baseado no Google Calendar

```pascal
interface
..
implemetation
uses
 Model.Adapters.OAuth2.OAuthGoogle4D;
var
 LToken : String; 
begin
 LToken := TOAuth2Google4D.New
            .SetScope(TScopesGoogleCalendar4D.READ_WRITE)
            .Credentials
            .GetToken
            .Token
            .GetAccesToken;
end;
```

> > 3. [Google Calendar Example](https://github.com/MoraisG/Google4D/tree/main/samples/google-calendar/vcl)

> ### To-do List
> > - [ ] Implementar api de IAM Credential
> > - [ ] Implementar OAuth2 WebServer Applications
> > - [ ] Implementar OAuth2 Installed applications
> > - [ ] Implementar API's Google Cloud
