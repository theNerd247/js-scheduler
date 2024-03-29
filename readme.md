# JS Scheduler

# Overview

TLDR; The scheduler program has been written to make planning an educational
course easier in the following sense:

  * changes between semesters are tracked
  * making minor schedule changes are light weight
  * dependencies between lessons are respected (future feature)

# Schedule Creation Process

The scheduler program uses the following process to generate the schedule

1. import schedule file
1. import specified template
1. parse and apply overlays
1. parse and generate planned events
1. fill spaces between planned events
1. export as icalendar

# Schedule File

The schedule file is used to define:

  * template file to use
  * overlays to apply to the list of lessons
  * planned events
  * starting date of course
  * ending date of course

see the [sample schedule file][] for details about the contents.

# template.json

`template.json` contains data defining:

  * the name of each lesson
  * the amount of time to alot for that lesson (aka the "duration")
  * the order in which the lessons should be taught.
This file should remain the same between cohorts as it acts as the template for
building customized schedules for a cohort.

## Overlays

Overlays are operations that are performed on the template schedule before
autofill is performed. Currently the following overlays are available:

  * duration
  * replace
  * swap
  * add
  * remove
  * move
See the [sample schedule file][] for a cohort on details for these overlays.

## Planned Events

Planned events are exactly that: a set of events that are fixed in time.
Periodic events can be defined using the format strings below. see the
[sample config file][] for how to define planned events.

### Time Format Strings

__NOTE__: All times are to be noted in UTC time. The conversion to the locale
time is done by the scheduler application.

An augmented form of the ISO standard time format is used for time strings.
The following are the formats for the strings allowed:

    <weekday?>:<hour>:minute | <year>-<month>-<day>T<hour>-<minute>:00.0Z
Where `<weekday>` is one of: `sunday`, `monday`, ... `saturday`. Note: `start`
for for `once` planned events use ONLY the standard ISO time format (the second
one noted above).

[sample schedule file]: ./sample.json
