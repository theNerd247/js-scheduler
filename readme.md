# Course Schedule

# Overview

TLDR; The scheduler program has been written to make planning the course easier
in the following sense:

  * enforcing business rules (course must be 12 weeks, outcomes are certain
    times, etc)
  * dependencies between lessons are respected
  * changes between cohorts are tracked
  * making minor schedule changes are light weight

## Why We Need the Scheduler

Historically the curriculum here at GA-ATL was managed using a Google Calendar
with links to seperate repositories where each repository had the contents
for a single lesson/assignment. There were several maintanence issues regarding
this method of managing the course material: 

  1. No cross cohort communication. When changes were made for one cohort there
     was no way to propigate changes to future or on-going cohorts. Inevitably
     bug fixes and material updates would occur and future cohorts never got
     those changes and so we ended up repeating our mistakes
  1. No valid way to track what changes were made in between cohorts. This
     resulted in situations where management could not recieve the answer to
     the question "What did you differently since the previous class?"
     Therefore as instructors we were told to not change anything in the
     material - even if it was absolutely incorrect information the was being
     delivered to the students.
  1. No dependency management of the lessons. Google calendar does no enforcing
     of the order in which events occur. Therefore when we had a 2 week holiday
     in the middle of the unit and decided to switch lessons around. In short
     accidently taught a lesson after the break that should have been taught
     before the break which resulted in many students nearly failing the
     project 2 and a lot of angry people.
  1. No flexibility in tweaking the schedule. Google calendar does not make
     moving weeks of a schedule forward.
  1. No easy way to maintain content dependencies. Because the material was
     managed across multiple repositories we had no way of "linking" these
     repos together except for manually copying and pasting URLs in text files.
     If a link was broken that material was likely lost forever. 
Over a small period of time we solved this problem by making the following
changes to our system:

  1. created a single repository where all content for the course is kept
  1. created this Unix style scheduling application to help generate course
     schedules.

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
