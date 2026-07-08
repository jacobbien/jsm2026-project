# Export events to a .ics file that can be imported to Google Calendar, etc.

This will represent the events in the standardized iCalendar format and
export as a .ics file that can then be imported into most calendar apps
(including Google Calendar). To do so, go to
https://calendar.google.com/calendar/u/0/r/settings/export and then
click "Select file from your computer", and find the file created by
this function. Then choose which calendar you want these events added to
and click "Import."

## Usage

``` r
export_calendar_to_ics(schedule, file = NULL)
```

## Arguments

- schedule:

  output of a call to
  [`get_talks()`](https://jacobbien.github.io/jsm2026-project/reference/get_talks.md)

- file:

  filename (should end with .ics) that will be created
