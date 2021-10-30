unit Types.Scopes.GoogleCalendar4D;

interface

type
  TScopesGoogleCalendar4D = class
  public const
    READ_WRITE = 'https://www.googleapis.com/auth/calendar';
    READ_ONLY = 'https://www.googleapis.com/auth/calendar.readonly';
    READ_WRITE_EVENTS = 'https://www.googleapis.com/auth/calendar.events';
    READ_ONLY_EVENTS = 'https://www.googleapis.com/auth/calendar.events.readonly';
    READ_ONLY_SETTINGS = 'https://www.googleapis.com/auth/calendar.settings.readonly';
    RUN = 'https://www.googleapis.com/auth/calendar.addons.execute';
  end;

implementation

end.
