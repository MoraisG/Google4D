unit Types.GoogleCalendar4D;

interface

type
  TGoogleCalendar4DRouter = class
  public const
    ROUTER = 'https://www.googleapis.com/calendar/v3';
  end;

  TCalendarList = class
  public const
    DELETE = '/users/me/calendarList/%d';
    GET = '/users/me/calendarList/%d';
    INSERT = '/users/me/calendarList';
    LIST = '/users/me/calendarList';
    PATCH = '/users/me/calendarList/%d';
    UPDATE = '/users/me/calendarList/%d';
    WATCH = '/users/me/calendarList/watch';
  end;

implementation

end.
