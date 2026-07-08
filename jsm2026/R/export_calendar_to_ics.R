# Generated from create-jsm2026.Rmd: do not edit by hand

#' Export events to a .ics file that can be imported to Google Calendar, etc.
#' 
#' This will represent the events in the standardized iCalendar format and export
#' as a .ics file that can then be imported into most calendar apps (including 
#' Google Calendar). To do so, go to 
#' https://calendar.google.com/calendar/u/0/r/settings/export
#' and then click "Select file from your computer", and find the file created by
#' this function. Then choose which calendar you want these events added to and
#' click "Import."
#' 
#' @param schedule output of a call to `get_talks()`
#' @param file filename (should end with .ics) that will be created
#' 
#' @export
export_calendar_to_ics <- function(schedule, file = NULL) {
  if (is.null(file)) 
    file <- paste0("jsm2026-cal-", 
                   stringr::str_replace_all(Sys.time(), " ", "-"),
                   ".ics")
  cal <- schedule %>% 
    dplyr::rowwise() %>% 
    dplyr::mutate(
      event = calendar::ic_event(
        start_time = .data$start_time,
        end_time = as.numeric(difftime(time1 = .data$end_time,
                                       time2 = .data$start_time,
                                       units = "hours")),
        summary = paste0(.data$speaker, ": ", .data$title)
      )
    )
  cal$event$LOCATION <- schedule$room
  cal$event$DESCRIPTION <- stringr::str_glue_data(
    schedule, 
    "Authors: {author}\\nSession: <a href='ww3.aievolution.com/JSMAnnual2026/Events/viewEv?ev={session_number}' target='_blank'>{session_title}</a> ({session_type})\\nChair: {chair}")
  ics <- cal$event %>%
    calendar::ic_character() %>%
    stringr::str_replace_all("^DTSTART", "DTSTART;TZID=America/New_York") %>%
    stringr::str_replace_all("^DTEND", "DTEND;TZID=America/New_York")
  # Insert a VTIMEZONE definition for America/New_York (before the first event)
  # so that every calendar app -- not just Google -- resolves the TZID and shows
  # each talk at its correct Eastern time, regardless of the importer's own time
  # zone.
  vtimezone <- c(
    "BEGIN:VTIMEZONE",
    "TZID:America/New_York",
    "BEGIN:DAYLIGHT",
    "TZOFFSETFROM:-0500",
    "TZOFFSETTO:-0400",
    "TZNAME:EDT",
    "DTSTART:19700308T020000",
    "RRULE:FREQ=YEARLY;BYMONTH=3;BYDAY=2SU",
    "END:DAYLIGHT",
    "BEGIN:STANDARD",
    "TZOFFSETFROM:-0400",
    "TZOFFSETTO:-0500",
    "TZNAME:EST",
    "DTSTART:19701101T020000",
    "RRULE:FREQ=YEARLY;BYMONTH=11;BYDAY=1SU",
    "END:STANDARD",
    "END:VTIMEZONE"
  )
  first_event <- grep("^BEGIN:VEVENT", ics)[1]
  ics <- append(ics, vtimezone, after = first_event - 1)
  writeLines(ics, file)
}
