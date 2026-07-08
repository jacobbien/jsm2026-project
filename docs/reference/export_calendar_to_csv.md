# Export events to a .csv format that can be imported to Google Calendar

This will create a .csv file that can then be imported into Google
Calendar. To do so, go to
https://calendar.google.com/calendar/u/0/r/settings/export and then
click "Select file from your computer", and find the file created by
this function. Then choose which calendar you want these events added to
and click "Import." The disadvantage of this approach is that the times
(which are ET) will be entered in the local time of your calendar. So if
your calendar is in a different time zone when you enter these, the
events will be at the wrong time. Using
[`export_calendar_to_ics()`](https://jacobbien.github.io/jsm2026-project/reference/export_calendar_to_ics.md)
does not have this problem so is the recommended function to use rather
than this one.

## Usage

``` r
export_calendar_to_csv(schedule, file = NULL)
```

## Arguments

- schedule:

  output of a call to
  [`get_talks()`](https://jacobbien.github.io/jsm2026-project/reference/get_talks.md)

- file:

  filename of .csv that will be created

## See also

[`export_calendar_to_ics`](https://jacobbien.github.io/jsm2026-project/reference/export_calendar_to_ics.md)
