@if (@X)==(@Y) @end  /* harmless hybrid line that begins a JScript comment
::
::::BgetDescription#Computes and displays a formatted timestamp.
::::BgetAuthor#DaveBenham
::::BgetCategory#library
::jTimestamp.bat version 2.1 by Dave Benham
::
::  Release History:
::    2018-01-16 v2.1 - Bug fix: computation of -D ISO 8601 week date when
::                      week is 08 or 09.
::    2017-01-23 v2.0 - Added support for ISO 8601 format to the -D option.
::                    - Added -CZ option to specify timezone for computations.
::                    - Bug fix: computation of ISO 8601 week numbering year,
::                      week number, and ordinal day when -Z or -U is used.
::                    - Fixed some documentation errors for -D option with
::                      "'Date [Time] [TimeZone]'" argument.
::    2016-11-02 v1.1 - Remove getTimestamp from documentation and code
::    2016-11-01 v1.0 - Initial release derived from v2.6 of getTimestamp.bat
::                      Syntax and behavior of computations changed, plus added
::                      more computation options.
::
::============ Documentation ===========
:::
:::jTimestamp.bat  [-option [value]]...
:::
:::  Computes and displays a formatted timestamp. Defaults to the current local
:::  date and time using an ISO 8601 format with milliseconds, time zone
:::  and punctuation, using period as a decimal mark.
:::
:::  Returned ERRORLEVEL is 0 upon success, 1 if failure.
:::
:::  Options may be prefaced with - or /
:::
:::  All options have default values. The default value can be overridden by
:::  defining an evironment variable of the form "jTimestamp-OPTION=VALUE".
:::  For example, upper case English weekday abbreviations can be specified as
:::  the default by defining "jTimestamp-WKD=SUN MON TUE WED THU FRI SAT".
:::
:::  Command line option values take precedence, followed by environment variable
:::  defaults, followed by built in defaults.
:::
:::  The following options are all case insensitive:
:::
:::    -?  : Prints this documentation for jTimestamp
:::
:::    -?? : Prints this documentation with pagination via MORE
:::
:::    -V  : Prints the version of jTimeStamp
:::
:::    -D DateSpec
:::
:::       Specify the base date and time.
:::       Default value is current local date and time.
:::       The DateSpec supports many formats:
:::
:::         ""    (no value)
:::
:::           Current date and time - the default
:::
:::         milliseconds
:::
:::           A JScript numeric expression that represents the number of
:::           milliseconds since 1970-01-01 00:00:00 UTC.
:::           Decimal values are truncated.
:::           Negative values represent dates prior to 1970-01-01.
:::
:::         "'Date [Time] [TimeZone]'"
:::
:::           A string representation of the date and time. The date information
:::           is required, the time and time zone are optional. Missing time info
:::           is assumed to be 0 (midnight). Missing time zone info is assumed to
:::           be local time zone.
:::
:::           The Date, Time, and TimeZone information can be represented as any
:::           string that is accepted by the JScript Date.Parse() method.
:::           There are many formatting options. Documentation is available at:
:::           http://msdn.microsoft.com/en-us/library/k4w173wk(v=vs.84).aspx
:::
:::           Examples of equivalent representations of Midnight on January 4,
:::           2013 assuming local time zone is U.S Eastern Standard Time (EST):
:::
:::             '1-4-2013'                    Defaults to local time zone
:::             "'January 4, 2013 EST'"       Explicit Eastern Std Time (US)
:::             "'2013/4/1 00:00 -05'"        Explicit Eastern Std Time (US)
:::             "'Jan 3 2013 23: CST'"        Central Standard Time (US)
:::             "'2013 3 Jan 9:00 pm -0800'"  Pacific Standard Time (US)
:::             "'01/04/2013 05:00:00 UTC'"   Universal Coordinated Time
:::             "'1/4/2013 10:30 +0530'"      India Standard Time
:::
:::         "year, month[, day[, hour[, minute[, second[, millisecond]]]]]"
:::
:::           A comma delimited list of numeric JScript expressions representing
:::           various components of date and time. Year and month are required,
:::           the rest are optional. Missing values are treated as 0.
:::           Decimal values are truncated. A 0 month represents January.
:::           A 1 day represents the first day of the month. A 0 day represents
:::           the last day of the prior month. The date/time value is always
:::           in local time. There is no mechanism to specify a time zone.
:::
:::           Examples: (all in local time)
:::             "2012,0,1,12,45,3,121"  12:45:03.121 on Jan 1, 2012
:::             "2012,0,1,12"           Noon on Jan 1, 2012
:::             "2012,1,1"              Midnight on Feb 1, 2012
:::             "2012,2,0"              Midnight on Feb 29, 2012 (last day of Feb)
:::             "2012,2"                Midnight on Feb 29, 2012 (last day of Feb)
:::
:::           The ability to use JScript expressions makes it convenient to do
:::           date and time offset computations in a very compact form.
:::
:::           For example, starting with:
:::             "2015,8,7,14,5"        Sep 7, 2015 at 14:05:00
:::
:::           It is simple to subtract 30 days and 30 minutes from the above:
:::             "2015,8,7-30,14,5-30"  Aug 8, 2015 at 13:35:00
:::
:::         "ISO {date}[T{time}[{zone}]]"
:::
:::           Any valid ISO 8601 formatted date with optional time
:::           and time zone.
:::
:::             ISO  = Literal string indicating ISO 8601 format
:::             T    = Literal string indicating presence of time info
:::
:::           {date} = {calendarDate}|{weekDate}|{ordinalDate}
:::
:::           {calendarDate} = yyyy[[-]mm[[-]dd]]
:::             yyyy = Year         (0000-9999)
:::             mm   = Month        (01-12)
:::             dd   = Day of Month (01-31)
:::
:::           {weekDate} = yyyy[-]Www[-]d
:::             yyyy = Week-numbering Year (0000-9999)
:::             W    = Literal string indicating an Ordinal week follows
:::             ww   = Week number (01-53)
:::             d    = Day of Week (1-7)
:::
:::           {ordinalDate} = yyyy[-]ddd
:::             yyyy = Year        (0000-9999)
:::             ddd  = Day of Year (001-366)
:::
:::           {time} = hh[[:]mm[[:]ss[{.|,}f...]]
:::             hh   = Hour   (00-23)
:::             mm   = Minute (00-59)
:::             ss   = Second (00-59)
:::             f... = Fractional Second, any number of digits
:::
:::           {zone} = Z|+hh[[:]mm]|-hh[[:]mm]
:::             Z    = Literal string indicating UTC
:::             hh   = Hour offset from UTC   (00-23)
:::             mm   = Minute offset from UTC (00-59)
:::
:::           Unspecified Month defaults to 01
:::           Unspecified Day of Month defaults to 01
:::           Unspecified {time} defaults to midnight local time
:::           Unspecified Minute defaults to 00
:::           Unspecified Second defaults to 00
:::           Unspecified Fractional Second defaults to .000
:::           Unspecified {zone} defaults to local time
:::           Unspecified Minute offset defaults to 00
:::           Fractional Seconds are truncated to milliseconds
:::
:::    -U  : Returns a UTC timestamp instead of local timestamp.
:::          Default is a local timestamp.
:::
:::    -Z TimeZoneMinuteOffset
:::
:::       Returns the timestamp using the specified time zone offset.
:::       TimeZoneMinuteOffset is a JScript numeric expression that
:::       represents the number of minutes offset from UTC.
:::       The TimeZoneMinuteOffset is truncated to an integral value.
:::       Default is empty, meaning local timezone.
:::
:::    -CZ TimeZoneMinuteOffset
:::
:::       Specifies the timezone to use for local time computations performed
:::       by the -C option. TimeZoneMinuteOffset is a JScript numeric expression
:::       that represents the number of minutes offset from UTC. The value is
:::       truncated to an integral value.
:::       Default is empty, meaning the machine's local timezone.
:::
:::    -C "Operation=Value[,Operation=Value]..."
:::
:::       Change the timestamp by applying a comma delimited list of one or more
:::       computations. The computation list must be enclosed within double
:::       quotes.
:::
:::       Each computation consists of an Operation, followed by =, followed
:::       by a Value.
:::
:::       The last character of the Operation specifies the timestamp component
:::       that is being modified:
:::          Y=Year, M=Month, D=Day of month,
:::          H=Hour, N=miNute, S=Second, F=millisecond (Fractional second)
:::
:::       If the character before the end is U, then the operation uses UTC time,
:::       otherwise local time is used. The local time defaults to the timezone
:::       specified by the machines locale. An alternate timezone may be chosen
:::       via the -CZ option. Note that local time computations are only affected
:::       by daylight savings if the default local timezone is used.
:::
:::       If the first character of the Operation is O, then the Operation adds
:::       an Offset to the current value. If not O, then the Operation sets an
:::       absolute value.
:::
:::       Offset operations can impact multiple components. Absolute operations
:::       generally set only the specified component, except that absolute Year
:::       and Month changes have the potential to modify the Day of the month.
:::
:::       All numeric Values are interpreted as JScript numerical expressions.
:::       Standard JScript arithmetic may be used, and the end result is
:::       truncated to an integral value.
:::
:::       Computations are performed from left to right. There is no limit to
:::       the number of computations - Operations may be repeated.
:::
:::       Details of every possible Operation are listed below:
:::
:::       OY=LocalYearOffset
:::
:::         Adds the LocalYearOffset to the local year.
:::         The offset value may be positive or negative.
:::
:::         The change will be a multiple of 24 hours, unless the operation
:::         crosses an odd number of local standard/daylightSavings boundries.
:::
:::       OUY=UTCYearOffset
:::
:::         Adds the UTCYearOffset to the UTC year.
:::         The offset value may be positive or negative.
:::
:::         The change is guaranteed to be a multiple of 24 hours.
:::
:::       OM=LocalMonthOffset
:::
:::         Adds the LocalMonthOffset to the local month.
:::         The offset value may be positive or negative.
:::
:::         The change will be a multiple of 24 hours, unless the operation
:::         crosses an odd number of local standard/daylightSavings boundries.
:::
:::       OUM=UTCMonthOffset
:::
:::         Adds the UTCMonthOffset to the UTC month.
:::
:::         The change is guaranteed to be a multiple of 24 hours.
:::
:::       OD=LocalDayOffset
:::
:::         Adds the LocalDayOffset to the current local day of the month.
:::         The offset value may be positive or negative.
:::
:::         The change will be a multiple of 24 hours, unless the operation
:::         crosses an odd number of local standard/daylightSavings boundries.
:::
:::       OD=LocalDayOfWeek:Occurrence
:::
:::         Sets the local date to a prior or subsequent LocalDayOfWeek,
:::         depending on the Occurrence. An Occurrence of 1 finds the next
:::         instance of the LocalDayOfWeek (no change if current local date
:::         already matches LocalDayOfWeek). An Occurrence of 2 finds the 2nd
:::         instance, etc. An Occurrence of -1 finds the prior LocalDayOfWeek,
:::         -2 the 2nd prior instance, etc.
:::
:::         The LocalDayOfWeek may be specified as the Weekday abbreviation or
:::         name (case ignored), or as a number, with 1=Sunday, and 7=Saturday.
:::
:::         The change will be a multiple of 24 hours, unless the operation
:::         crosses an odd number of local standard/daylightSavings boundries.
:::
:::       OUD=UTCDayOffset
:::
:::         Adds the UTCDayOffset to the current UTC day of the month.
:::         The offset value may be positive or negative.
:::
:::         The change is guaranteed to be a multiple of 24 hours.
:::
:::       OUD=UTCDayOfWeek:Occurrence
:::
:::         Sets the UTC date to a prior or subsequent UTCDayOfWeek,
:::         depending on the Occurrence. An Occurrence of 1 finds the next
:::         instance of the UTCDayOfWeek (no change if current UTC date
:::         already matches UTCDayOfWeek). An Occurrence of 2 finds the 2nd
:::         instance, etc. An Occurrence of -1 finds the prior UTCDayOfWeek,
:::         -2 the 2nd prior instance, etc.
:::
:::         The UTCDayOfWeek may be specified as the Weekday abbreviation or
:::         name (case ignored), or as a number, with 1=Sunday, and 7=Saturday.
:::
:::         The change is guaranteed to be a multiple of 24 hours.
:::
:::       OH=HourOffset
:::       OUH=HourOffset
:::
:::         Adds the HourOffset to the current timestamp.
:::         The offset value may be positive or negative.
:::         UTC and local hour offsets are handled the same way - the offset
:::         represents a fixed time interval, irrespective of timezone.
:::
:::       ON=MinuteOffset
:::       OUN=MinuteOffset
:::
:::         Adds the MinuteOffset to the current timestamp.
:::         The offset value may be positive or negative.
:::         UTC and local minute offsets are handled the same way - the offset
:::         represents a fixed time interval, irrespective of timezone.
:::
:::       OS=SecondOffset
:::       OUS=SecondOffset
:::
:::         Adds the SecondOffset to the current timestamp.
:::         The offset value may be positive or negative.
:::         UTC and local second offsets are handled the same way - the offset
:::         represents a fixed time interval, irrespective of timezone.
:::
:::       OF=MillisecondOffset
:::       OUF=MillisecondOffset
:::
:::         Adds the MillisecondOffset to the current timestamp.
:::         The offset value may be positive or negative.
:::         UTC and local millisecond offsets are handled the same way - the
:::         offset represents a fixed time interval, irrespective of timezone.
:::
:::       Y=LocalYear
:::
:::         Sets the local year value to LocalYear, without changing any other
:::         local values, with one possible exception - February 29 may become
:::         Feb 28 if the resultant year is not a leap year.
:::
:::       UY=UTCYear
:::
:::         Sets the UTC year value to UTCYear, without changing any other
:::         UTC values, with one possible exception - February 29 may become
:::         Feb 28 if the resultant year is not a leap year.
:::
:::       M=LocalMonth
:::
:::         Sets the local month to LocalMonth without changing any other values,
:::         except the date will be reduced to the last day of the month if the
:::         resultant month is shorter than the original day of month value.
:::         The LocalMonth value must be in the range 1 to 12.
:::
:::       UM=UTCMonth
:::
:::         Sets the UTC month to UTCMonth without changing any other values,
:::         except the date will be reduced to the last day of the month if the
:::         resultant month is shorter than the original day of month value.
:::         The UTCMonth value must be in the range 1 to 12.
:::
:::       D=LocalDay
:::
:::         Sets the local day of month according to the LocalDay value.
:::         The value may be positive or negative.
:::
:::         A positive value in the range 1 to 31, simply sets the date as
:::         specified. If the month has fewer days then LocalDay, then the date
:::         is set to the last day of the month.
:::
:::         A negative value in the range -1 to -32 is counted backward from the
:::         end of the month, where -1 represents the last day of the month.
:::         If the absolute value of LocalDay exceeds the number of days in the
:::         month, then the date is set to the first day of the month.
:::
:::       D=LocalDayOfWeek:Occurrence
:::
:::         Sets the local date to a specific day of the week within the current
:::         local month. The LocalDayOfWeek may be specified as the weekday name
:::         or abbreviation (case ignored), or as a number between 1 and 7, where
:::         1=Sunday, and 7=Saturday.
:::
:::         The Occurrence may be positive, in the range 1 to 5, where 1 is the
:::         first occurrence of the LocalDayOfWeek, 2 the 2nd, etc. If Occurrence
:::         is 5, but there are only 4 instances, then the date is set to the
:::         last occurence within the month.
:::
:::         The Occurrence may also be negative, in the range -1 to -5, where -1
:::         represents the last occurrence of the LocalDayOfWeek, -2 the next-to-
:::         last, etc. If the Occurrence is -5, but there are only 4 instances,
:::         then the date is set to the first occurence within the month.
:::
:::       UD=UTCDay
:::
:::         Sets the UTC day of month according to the UTCDay value.
:::         The value may be positive or negative.
:::
:::         A positive value in the range 1 to 31 simply sets the date as
:::         specified. If the month has fewer days then UTCDay, then the date
:::         is set to the last day of the month.
:::
:::         A negative value in the range -1 to -32 is counted backward from the
:::         end of the month, where -1 represents the last day of the month.
:::         If the absolute value of UTCDay exceeds the number of days in the
:::         month, then the date is set to the first day of the month.
:::
:::       UD=UTCDayOfWeek:Occurrence
:::
:::         Sets the UTC date to a specific day of the week within the current
:::         UTC month. The UTCDayOfWeek may be specified as the weekday name
:::         or abbreviation (case ignored), or as a number between 1 and 7, where
:::         1=Sunday, and 7=Saturday.
:::
:::         The Occurrence may be positive, in the range 1 to 5, where 1 is the
:::         first occurrence of the UTCDayOfWeek, 2 the 2nd, etc. If Occurrence
:::         is 5, but there are only 4 instances, then the date is set to the
:::         last occurence within the month.
:::
:::         The Occurrence may also be negative, in the range -1 to -5, where -1
:::         represents the last occurrence of the UTCDayOfWeek, -2 the next-to-
:::         last, etc. If the Occurrence is -5, but there are only 4 instances,
:::         then the date is set to the first occurence within the month.
:::
:::       H=LocalHour
:::
:::         Sets the local hour to LocalHour.
:::         The value must be in the range 0 to 23.
:::
:::       UH=UTCHour
:::
:::         Sets the UTC hour to UTCHour.
:::         The value must be in the range 0 to 23.
:::
:::       N=LocalMinute
:::
:::         Sets the local minute to LocalMinute
:::         The value must be in the range 0 to 59.
:::
:::       UN=UTCMinute
:::
:::         Sets the UTC minute to UTCMinute
:::         The value must be in the range 0 to 59.
:::
:::       S=LocalSecond
:::
:::         Sets the local second to LocalSecond.
:::         The value must be in the range 0 to 59.
:::
:::       US=UTCSecond
:::
:::         Sets the UTC second to UTCSecond.
:::         The value must be in the range 0 to 59.
:::
:::       F=LocalMillisecond
:::
:::         Sets the local millisecond to LocalMillisecond.
:::         The value must be in the range 0 to 999.
:::
:::       UF=UTCMillisecond
:::
:::         Sets the UTC millisecond to UTCMillisecond.
:::         The value must be in the range 0 to 999.
:::
:::    -F FormatString
:::
:::       Specify the returned timestamp format.
:::       Default is "{ISO-TS.}"
:::       Strings within braces are dynamic components.
:::       All other strings are literals.
:::       Available components (case ignored) are:
:::
:::         {YYYY}  4 digit year, zero padded
:::
:::         {YY}    2 digit year, zero padded
:::
:::         {Y}     year without zero padding
:::
:::         {MONTH} month name, as preferentially specified by:
:::                    1) -MONTH option
:::                    2) jTimestamp-MONTH environment variable
:::                    3) Mixed case, English month names
:::
:::         {MTH}   month abbreviation, as preferentially specified by:
:::                    1) -MTH option
:::                    2) jTimestamp-MTH environment variable
:::                    3) Mixed case, English month abbreviations
:::
:::         {MM}    2 digit month number, zero padded
:::
:::         {M}     month number without zero padding
:::
:::         {WEEKDAY} day of week name, as preferentially specified by:
:::                    1) -WEEKDAY option
:::                    2) jTimestamp-WEEKDAY environment variable
:::                    3) Mixed case, English day names
:::
:::         {WKD}   day of week abbreviation, as preferentially specified by:
:::                    1) -WKD option
:::                    2) jTimestamp-WKD environment variable
:::                    3) Mixed case, English day abbreviations
:::
:::         {W}     day of week number: 0=Sunday, 6=Saturday
:::
:::         {DD}    2 digit day of month number, zero padded
:::
:::         {D}     day of month number, without zero padding
:::
:::         {DDY}   3 digit day of year number, zero padded
:::
:::         {DY}    day of year number, without zero padding
:::
:::         {HH}    2 digit hours, 24 hour format, zero padded
:::
:::         {H}     hours, 24 hour format without zero padding
:::
:::         {HH12}  2 digit hours, 12 hour format, zero padded
:::
:::         {H12}   hours, 12 hour format without zero padding
:::
:::         {NN}    2 digit minutes, zero padded
:::
:::         {N}     minutes without padding
:::
:::         {SS}    2 digit seconds, zero padded
:::
:::         {S}     seconds without padding
:::
:::         {FFF}   3 digit milliseconds, zero padded
:::
:::         {F}     milliseconds without padding
:::
:::         {AM}    AM or PM in upper case
:::
:::         {PM}    am or pm in lower case
:::
:::         {ZZZZ}  timezone expressed as minutes offset from UTC,
:::                 zero padded to 3 digits with sign
:::
:::         {Z}     timzone expressed as minutes offset from UTC without padding
:::
:::         {ZS}    ISO 8601 timezone sign
:::
:::         {ZH}    ISO 8601 timezone hours (no sign)
:::
:::         {ZM}    ISO 8601 timezone minutes (no sign)
:::
:::         {TZ}    ISO 8601 timezone in +/-hh:mm format
:::
:::         {ISOTS}  same as {ISOTS.}
:::
:::         {ISOTS.} YYYYMMDDThhmmss.fff+hhss
:::                  Compressed ISO 8601 date/time (timestamp) with milliseconds
:::                  and time zone, using . as decimal mark
:::
:::         {ISOTS,} YYYYMMDDThhmmss,fff+hhss
:::                  Compressed ISO 8601 date/time (timestamp) with milliseconds
:::                  and time zone, using , as decimal mark
:::
:::         {ISODT}  YYYYMMDD
:::                  Compressed ISO 8601 date format
:::
:::         {ISOTM}  same as {ISOTM.}
:::
:::         {ISOTM.} hhmmss.fff
:::                  Compressed ISO 8601 time format with milliseconds,
:::                  using . as decimal mark
:::
:::         {ISOTM,} hhmmss,fff
:::                  Compressed ISO 8601 time format with milliseconds,
:::                  using , as decimal mark
:::
:::         {ISOTZ}  +hhmm
:::                  Compressed ISO 8601 timezone format
:::
:::         {ISOWY}  yyyy
:::                  ISO 8601 week numbering year
:::                  Dec 29, 30, or 31 may belong to the next Jan year
:::                  Jan 01, 02, or 03 may belong to the prior Dec year
:::
:::         {ISOWK}  ww
:::                  ISO 8601 week number
:::                  Week 01 is the week with the year's first Thursday
:::
:::         {ISOWD}  d
:::                  ISO 8601 day of week: 1=Monday, 7=Sunday
:::
:::         {ISODTW} yyyyWwwd
:::                  Compressed ISO 8601 week date format
:::
:::         {ISODTO} YYYYDDD
:::                  Compressed ISO 8601 ordinal date format
:::
:::         {ISO-TS} same as {ISO-TS.}
:::
:::         {ISO-TS.} YYYY-MM-DDThh:mm:ss.fff+hh:ss
:::                  ISO 8601 date/time (timestamp) with milliseconds and time zone
:::                  using . as decimal mark
:::
:::         {ISO-TS,} YYYY-MM-DDThh:mm:ss,fff+hh:ss
:::                  ISO 8601 date/time (timestamp) with milliseconds and time zone
:::                  using , as decimal mark
:::
:::         {ISO-DT} YYYY-MM-DD
:::                  ISO 8601 date format
:::
:::         {ISO-TM} same as {ISO-TM.}
:::
:::         {ISO-TM.} hh:mm:ss.fff
:::                  ISO 8601 time format with milliseconds,
:::                  using . as decimal mark
:::
:::         {ISO-TM,} hh:mm:ss,fff
:::                  ISO 8601 time format with milliseconds,
:::                  using , as decimal mark
:::
:::         {ISO-TZ} +hh:mm
:::                  ISO 8601 timezone  (same as {TZ})
:::
:::         {ISO-DTW} yyyy-Www-d
:::                  ISO 8601 week date format
:::
:::         {ISO-DTO} YYYY-DDD
:::                  ISO 8601 ordinal date format
:::
:::         {UMS}   Milliseconds since 1970-01-01 00:00:00.000 UTC.
:::                 Negative numbers represent days prior to 1970-01-01.
:::                 This value is unaffected by the -U option.
:::                 This value should not be used with the -Z option
:::
:::         {U}     Same as {US}
:::
:::         {US}    Seconds since 1970-01-01 00:00:00.000 UTC.
:::                 Negative numbers represent days prior to 1970-01-01.
:::                 This value is unaffected by the -U option.
:::                 This value should not be used with the -Z option
:::
:::         {UM}    Minutes since 1970-01-01 00:00:00.000 UTC.
:::                 Negative numbers represent days prior to 1970-01-01.
:::                 This value is unaffected by the -U option.
:::                 This value should not be used with the -Z option
:::
:::         {UH}    Hours since 1970-01-01 00:00:00.000 UTC.
:::                 Negative numbers represent days prior to 1970-01-01.
:::                 This value is unaffected by the -U option.
:::                 This value should not be used with the -Z option
:::
:::         {UD}    Days since 1970-01-01 00:00:00.000 UTC.
:::                 Negative numbers represent days prior to 1970-01-01.
:::                 This value is unaffected by the -U option.
:::                 This value should not be used with the -Z option
:::
:::         {USD}   Decimal seconds since 1970-01-01 00:00:00.000 UTC.
:::                 Negative numbers represent days prior to 1970-01-01.
:::                 This value is unaffected by the -U option.
:::                 This value should not be used with the -Z option
:::
:::         {UMD}   Decimal minutes since 1970-01-01 00:00:00.000 UTC.
:::                 Negative numbers represent days prior to 1970-01-01.
:::                 This value is unaffected by the -U option.
:::                 This value should not be used with the -Z option
:::
:::         {UHD}   Decimal hours since 1970-01-01 00:00:00.000 UTC.
:::                 Negative numbers represent days prior to 1970-01-01.
:::                 This value is unaffected by the -U option.
:::                 This value should not be used with the -Z option
:::
:::         {UDD}   Decimal days since 1970-01-01 00:00:00.000 UTC.
:::                 Negative numbers represent days prior to 1970-01-01.
:::                 This value is unaffected by the -U option.
:::                 This value should not be used with the -Z option
:::
:::         {{}     A { character
:::
:::    -R ReturnVariable
:::
:::       Save the timestamp in ReturnVariable instead of displaying it.
:::       ReturnVariable is unchanged if an error occurs.
:::       Default is empty, meaning write to stdout.
:::
:::    -WKD "Abbreviated day of week list"
:::
:::       Override the default day abbreviations with a space delimited,
:::       quoted list, starting with Sun.
:::       Default is mixed case, 3 character English day abbreviations.
:::
:::    -WEEKDAY "Day of week list"
:::
:::       Override the default day names with a space delimited, quoted list,
:::       starting with Sunday.
:::       Default is mixed case English day names.
:::
:::    -MTH "Abbreviated month list"
:::
:::       Override the default month abbreviations with a space delimited,
:::       quoted list, starting with Jan.
:::       Default is mixed case, 3 character English month abbreviations.
:::
:::    -MONTH "Month list"
:::
:::       Override the default month names with a space delimited, quoted list,
:::       starting with January.
:::       Default is mixed case English month names.
:::
:::
:::  jTimestamp.bat was written by Dave Benham and originally posted at
:::  http://www.dostips.com/forum/viewtopic.php?f=3&t=7523
:::

============= :Batch portion ===========
@echo off
setlocal enableDelayedExpansion

:: Define options
set ^"options=^
 -?:^
 -??:^
 -v:^
 -u:^
 -z:""^
 -cz:""^
 -f:"{ISO-TS}"^
 -d:""^
 -c:""^
 -r:""^
 -wkd:"Sun Mon Tue Wed Thu Fri Sat"^
 -weekday:"Sunday Monday Tuesday Wednesday Thursday Friday Saturday"^
 -mth:"Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec"^
 -month:"January February March April May June July August September October November December"^"

:: Set default option values
for %%O in (%options%) do for /f "tokens=1,* delims=:" %%A in ("%%O") do (
  if defined jTimestamp%%A (set "%%A=!jTimestamp%%A!") else set "%%A=%%~B"
)
set "-?="
set "-??="

:: Get options
:loop
if not "%~1"=="" (
  set "arg=%~1"
  if "!arg:~0,1!" equ "/" set "arg=-!arg:~1!"
  for /f delims^=^ eol^= %%A in ("!arg!") do set "test=!options:*%%A:=! "
  if "!test!"=="!options! " (
      >&2 echo Error: Invalid option %~1. Use %~nx0 -? to get help.
      exit /b 1
  ) else if "!test:~0,1!"==" " (
      set "!arg!=1"
      if /i "!arg!" equ "-U" set "-z="
  ) else (
      set "!arg!=%~2"
      shift /1
  )
  shift /1
  goto :loop
)
if defined -z set "-u=1"
if defined -r set "%-r%="

:: Display paged help
if defined -?? (
  (for /f "delims=: tokens=*" %%A in ('findstr "^:::" "%~f0"') do @echo(%%A)|more /e
  exit /b 0
) 2>nul

:: Display help
if defined -? (
  for /f "delims=: tokens=*" %%A in ('findstr "^:::" "%~f0"') do echo(%%A
  exit /b 0
)

:: Display version
if defined -v (
  for /f "tokens=* delims=:" %%A in ('findstr "^::jTimestamp\.bat" "%~f0"') do @echo(%%A
  exit /b 0
)

:: Execute the JScript script and return the result
for /f "delims=" %%A in ('cscript //E:JScript //nologo "%~f0"') do (
  endlocal
  if "%-R%" neq "" (set "%-R%=%%A") else (echo(%%A)
  exit /b 0
)
exit /b 1;


************ JScript portion ***********/
var _g = new Object();
_g.eval=function(str){return eval(str);}
_g.main=function(){
  var env  = WScript.CreateObject("WScript.Shell").Environment("Process"),
      wkd     = env('-WKD').split(' '),
      weekday = env('-WEEKDAY').split(' '),
      mth     = env('-MTH').split(' '),
      month   = env('-MONTH').split(' '),
      stderr  = WScript.StdErr,
      utc,y,m,d,w,h,h12,n,s,f,u,z,zs,za,
      pc=':', pcm=',', pd='-', pp='.', p2='00', p3='000', p4='0000',
      dt, isoDt, isoTmStr, isoDtTest;

  if (wkd.length!=7)     badOp('-WKD');
  if (weekday.length!=7) badOp('-WEEKDAY');
  if (mth.length!=12)    badOp('-MTH');
  if (month.length!=12)  badOp('-MONTH');

  // Extend Date prototype
  Date.prototype.getYr   = function(utc){ return utc ? this.getUTCFullYear()    : this.getFullYear();}
  Date.prototype.getMo   = function(utc){ return utc ? this.getUTCMonth()       : this.getMonth();}
  Date.prototype.getDt   = function(utc){ return utc ? this.getUTCDate()        : this.getDate();}
  Date.prototype.getDy   = function(utc){ return utc ? this.getUTCDay()         : this.getDay();}
  Date.prototype.getHr   = function(utc){ return utc ? this.getUTCHours()       : this.getHours();}
  Date.prototype.getMin  = function(utc){ return utc ? this.getUTCMinutes()     : this.getMinutes();}
  Date.prototype.getSec  = function(utc){ return utc ? this.getUTCSeconds()     : this.getSeconds();}
  Date.prototype.getMsec = function(utc){ return utc ? this.getUTCMilliseconds(): this.getMilliseconds();}
  Date.prototype.setYr   = function(utc,y){   if(utc) this.setUTCFullYear(y);     else this.setFullYear(y);}
  Date.prototype.setMo   = function(utc,m,d){ if(utc) this.setUTCMonth(m,d);      else this.setMonth(m,d);}
  Date.prototype.setDt   = function(utc,d){   if(utc) this.setUTCDate(d);         else this.setDate(d);}
  Date.prototype.setHr   = function(utc,h){   if(utc) this.setUTCHours(h);        else this.setHours(h);}
  Date.prototype.setMin  = function(utc,m){   if(utc) this.setUTCMinutes(m);      else this.setMinutes(m);}
  Date.prototype.setSec  = function(utc,s){   if(utc) this.setUTCSeconds(s);      else this.setSeconds(s);}
  Date.prototype.setMsec = function(utc,f){   if(utc) this.setUTCMilliseconds(f); else this.setMilliseconds(f);}

  function newDate(utc,y,m,d,h,n,s,f) {
    var dt = new Date(0);
    if(utc) dt.setUTCFullYear(y,m,d); else dt.setFullYear(y,m,d);
    if(utc) dt.setUTCHours(h,n,s,f);  else dt.setHours(h,n,s,f);
    return dt;
  }

  // Establish base date dt
  isoDt = env('-D').match( new RegExp(
    //                    1=year        2=week                    3=weekDay
    "^\\s*[Ii][Ss][Oo]\\s+(\\d{4})(?:-?W(0[1-9]|[1-4]\\d|5[0-3])-?([1-7])" +
    //  4=ordinalDay                                          5=month             6=monthDay                     7=hour
    "|-?(00[1-9]|0[1-9]\\d|[12]\\d\\d|3[0-5]\\d|36[0-6])|(?:-?(0[1-9]|1[0-2])(?:-?(0[1-9]|[12]\\d|3[01]))?)?)(?:T([01]\\d|2[0-3])" +
    //    8=minute       9=second            10=fraction                11=Z   12=sgn 13=zoneHourOffset       14=zoneMinuteOffset
    "(?::?([0-5]\\d)(?::?([0-5]\\d)(?:[.,](?:(\\d\\d?\\d?)\\d*))?)?)?(?:(Z)|(?:([+-])([01]\\d|[+-]2[0-3])(?::?([0-5]\\d))?))?)?\\s*$", ""
  ));

  if (isoDt) {
    utc = (isoDt[11]||isoDt[12]);
    y = parseInt(isoDt[1],10);
    h = isoDt[7]  ? parseInt(isoDt[7],10) : 0;
    n = isoDt[8]  ? parseInt(isoDt[8],10) : 0;
    s = isoDt[9]  ? parseInt(isoDt[9],10) : 0;
    f = isoDt[10] ? parseInt((isoDt[10]+'000').substring(0,3),10) : 0;
    if (isoDt[2]) {
      // Week Date
      dt = newDate(utc,y,0,1,h,n,s,f);
      w = dt.getDy(utc);
      if (isoDt[2]=='53') {
        y = parseInt(isoDt[1],10);
        if (w!=4 && (w!=3||y%4||(!(y%100)&&y%400))) badOp('-D');
      }
      d = (w<=4)?1-w:(w==5)?3:2;
      dt.setDt( utc, ((parseInt(isoDt[2],10)-1)*7) + parseInt(isoDt[3],10) + d );
    } else if (isoDt[4]) {
      // Ordinal Date
      if (isoDt[4]=='366' && (y%4||(!(y%100)&&y%400)) ) badOp('-D');
      dt = newDate(utc,y,0,parseInt(isoDt[4],10),h,n,s,f);
    } else {
      // Calendar Date
      d = isoDt[6]?parseInt(isoDt[6],10):1
      dt = newDate(utc,y,isoDt[5]?parseInt(isoDt[5],10)-1:0,d,h,n,s,f);
      if ( d>=29 && dt.getDt(utc)<10 ) badOp('-D');
    }
    if (isoDt[12]) {
      dt.setUTCHours( dt.getUTCHours()-parseInt(isoDt[12]+isoDt[13],10) );
      if (isoDt[14]) dt.setUTCMinutes( dt.getUTCMinutes()-parseInt(isoDt[12]+isoDt[14],10) );
    }
  } else {
    try {
      dt = _g.eval('new Date('+env('-D')+')');
    } catch(e) {
    } finally {
      if (isNaN(dt)) badOp('-D');
    }
  }

  compute(env('-C'));
  function compute(comp) {
    var i, op, val, mnth, day, num, unit, tz, utc0, utc, offset, mem ;
    function lookup(ar,val) {
      var i;
      val=val.toUpperCase();
      for (i=ar.length-1; i>=0; i-- ) if (ar[i].toUpperCase()==val) return i;
      return i;
    }
    if (!comp) return;
    comp=comp.split(',');
    if (env('-CZ')) tz=getNum(env('-CZ'),'-CZ value');
    for (i=0; i<comp.length; i++) {
      mem='-C['+i+'] - '
      op=comp[i].split('=');
      if (!op[0]) badOp(mem+'Missing operation');
      if (op.length==1) badOp(mem+'Missing value');
      if (op.length>2) badOp(mem+'Invalid syntax');
      val=op[1].split(':');
      op=op[0].toUpperCase();
      unit=op.charAt(op.length-1);
      offset=(op.charAt(0)=='O');
      utc0=(op.charAt(op.length-2)=='U');
      utc=( utc0 || env('-CZ') );
      switch (val.length) {
        case 1:
          if (!val[0]) badOp(mem+'Missing value');
          num=getNum(val[0],mem+'Invalid value');
          if (!offset) switch (unit) {
            case 'M': if (num<1 || num>12)             badOp(mem+'Invalid month');       break;
            case 'D': if (num<-31 || num==0 || num>31) badOp(mem+'Invalid month date');  break;
            case 'H': if (num<0 || num>23)             badOp(mem+'Invalid hour');        break;
            case 'N': if (num<0 || num>59)             badOp(mem+'Invalid minute');      break;
            case 'S': if (num<0 || num>59)             badOp(mem+'Invalid second');      break;
            case 'F': if (num<0 || num>999)            badOp(mem+'Invalid millisecond'); break;
          }
          day=undefined;
          break;
        case 2:
          if (unit!='D') badOp(mem+'Invalid syntax');
          if (!val[0]) badOp(mem+'Missing day');
          if (!val[1]) badOp(mem+'Missing occurrence');
          day=lookup(wkd,val[0])+1;
          if (!day) day=lookup(weekday,val[0])+1;
          if (!day) day=getNum(val[0],mem+'Invalid day');
          num=getNum(val[1],mem+'Invalid occurrence');
          if (day<1 || day>7) badOp(mem+'Invalid day');
          if (!offset) if (num<-5 || num==0 || num>5) badOp(mem+'Invalid occurrence')
          break;
        default:
          badOp(mem+'Invalid syntax');
      }
      if (!utc0 && utc) dt.setUTCMinutes( dt.getUTCMinutes()+tz );
      switch(unit) {
        case 'Y':
          day= dt.getDt(utc);
          dt.setYr( utc, num+(offset?dt.getYr(utc):0) );
          if (dt.getDt(utc)!=day) dt.setDt(utc,0);
          break;
        case 'M':
          day=dt.getDt(utc);
          dt.setMo( utc, (offset?num:num-1)+(offset?dt.getMo(utc):0), dt.getDt(utc) );
          if (dt.getDt(utc)!=day) dt.setDt(utc,0);
          break;
        case 'D':
          if (offset) {
            if (day) {
              day=day-1-dt.getDy(utc);
              num=(num-(num>0?1:0))*7 + (day<0?day+7:day);
            }
            dt.setDt( utc, dt.getDt(utc)+num );
          } else {
            if (day) {
              if (num>0) {
                dt.setDt(utc,1);
                day=day-dt.getDy(utc);
                num = (day<=0?day:day-7) + num*7;
                dt.setDt(utc,num);
                if (dt.getDt(utc)!=num) dt.setDt( utc, dt.getDt(utc)-7 );
              } else {
                num=-num;
                dt.setMo( utc, dt.getMo(utc)+1, 0 );
                day=day-dt.getDy(utc)-1;
                num = dt.getDt(utc) + (day<=0?day+7:day) - num*7
                dt.setDt( utc, num<1?num+7:num );
              }
            } else {
              if (num>0) {
                dt.setDt( utc, num )
                if (dt.getDt(utc)!=num) dt.setDt(utc,0);
              } else {
                mnth=dt.getMo(utc);
                dt.setMo( utc, mnth+1, num+1 );
                if (dt.getMo(utc)!=mnth) dt.setMo( utc, dt.getMo(utc)+1, 1 );
              }
            }
          }
          break;
        case 'H':
          if (offset) dt.setUTCHours(num+dt.getUTCHours());
          else dt.setHr(utc,num);
          break;
        case 'N':
          if (offset) dt.setUTCMinutes(num+dt.getUTCMinutes());
          else dt.setMin(utc,num);
          break;
        case 'S':
          if (offset) dt.setUTCSeconds(num+dt.getUTCSeconds());
          else dt.setSec(utc,num);
          break;
        case 'F':
          if (offset) dt.setUTCMilliseconds(num+dt.getUTCMilliseconds());
          else dt.setMsec(utc,num);
          break;
        default:
          badOp(mem+'Invalid operation');
      }
      if (!utc0 && utc) dt.setUTCMinutes( dt.getUTCMinutes()-tz );
    }
  }

  utc = env('-U')!='';
  if (env('-Z')) {
    dt.setUTCMinutes( dt.getUTCMinutes() + (z=getNum(env('-Z'),'-Z value')) );
  } else if (utc) z=0; else z=-dt.getTimezoneOffset();
  zs = z<0 ? '-' : '+';
  za = Math.abs(z);

  y = dt.getYr(utc);
  m = dt.getMo(utc);
  d = dt.getDt(utc);
  w = dt.getDy(utc);
  h = dt.getHr(utc);
  n = dt.getMin(utc);
  s = dt.getSec(utc);
  f = dt.getMsec(utc);
  u = dt.getTime();

  h12 = h%12;
  if (!h12) h12=12;

  WScript.echo( env('-F').replace( /\{(.*?)\}/gi, repl ) );
  WScript.Quit(0);

  function lpad( val, pad ) {
    var rtn=val.toString();
    return (rtn.length<pad.length) ? (pad+rtn).slice(-pad.length) : val;
  }

  function getNum( str, name ) {
    var rtn;
    try {
      rtn = Number(_g.eval(str));
    } catch(e) {
    } finally {
      if (isNaN(rtn-rtn)) badOp(name);
      return rtn;
    }
  }
  
  function writeErr(str) {
    stderr.WriteLine(str);
  }

  function badOp(str) {
    writeErr('Error: Invalid '+str);
    WScript.Quit(1);
  }
  
  function trunc( n ) { return Math[n>0?"floor":"ceil"](n); }
  
  function weekNum(dt) {
    var dt2, day, now;
    dt2 = new Date(dt.valueOf());
    day = (dt2.getDy(utc)+6)%7;
    dt2.setDt( utc, dt2.getDt(utc)-day+3);
    now = dt2.valueOf();
    dt2.setMo( utc, 0, 1 );
    if (dt2.getDy(utc) != 4) dt2.setMo( utc, 0, (11-dt2.getDy(utc))%7 + 1 );
    return 1 + Math.ceil((now-dt2.valueOf())/604800000);
  }

  function weekYr(dt) {
    var dt2 = new Date(dt.valueOf());
    dt2.setDt( utc, dt2.getDt(utc)+3-(dt2.getDy(utc)+6)%7 );
    return dt2.getYr(utc);
  }
  
  function ordDt() {
    return trunc( ( (new Date(0)).setUTCFullYear(y,m,d) - (new Date(0)).setUTCFullYear(y,0,0) ) / 86400000 )
  }
  
  function repl($0,$1) {
    switch ($1.toUpperCase()) {
      case 'YYYY' : return lpad(y,p4);
      case 'YY'   : return (p2+y.toString()).slice(-2);
      case 'Y'    : return y.toString();
      case 'MM'   : return lpad(m+1,p2);
      case 'M'    : return (m+1).toString();
      case 'DD'   : return lpad(d,p2);
      case 'D'    : return d.toString();
      case 'W'    : return w.toString();
      case 'DY'   : return ordDt().toString();
      case 'DDY'  : return lpad( ordDt(), p3);
      case 'HH'   : return lpad(h,p2);
      case 'H'    : return h.toString();
      case 'HH12' : return lpad(h12,p2);
      case 'H12'  : return h12.toString();
      case 'NN'   : return lpad(n,p2);
      case 'N'    : return n.toString();
      case 'SS'   : return lpad(s,p2);
      case 'S'    : return s.toString();
      case 'FFF'  : return lpad(f,p3);
      case 'F'    : return f.toString();
      case 'AM'   : return h>=12 ? 'PM' : 'AM';
      case 'PM'   : return h>=12 ? 'pm' : 'am';
      case 'UMS'  : return u.toString();
      case 'USD'  : return (u/1000).toString();
      case 'UMD'  : return (u/1000/60).toString();
      case 'UHD'  : return (u/1000/60/60).toString();
      case 'UDD'  : return (u/1000/60/60/24).toString();
      case 'U'    :
      case 'US'   : return trunc(u/1000).toString();
      case 'UM'   : return trunc(u/1000/60).toString();
      case 'UH'   : return trunc(u/1000/60/60).toString();
      case 'UD'   : return trunc(u/1000/60/60/24).toString();
      case 'ZZZZ' : return zs+lpad(za,p3);
      case 'Z'    : return z.toString();
      case 'ZS'   : return zs;
      case 'ZH'   : return lpad(trunc(za/60),p2);
      case 'ZM'   : return lpad(za%60,p2);
      case 'TZ'   :
      case 'ISO-TZ' : return ''+zs+lpad(trunc(za/60),p2)+pc+lpad(za%60,p2);
      case 'ISOTS'  :
      case 'ISOTS.' : return ''+lpad(y,p4)+lpad(m+1,p2)+lpad(d,p2)+'T'+lpad(h,p2)+lpad(n,p2)+lpad(s,p2)+pp
                             +lpad(f,p3)+zs+lpad(trunc(za/60),p2)+lpad(za%60,p2);
      case 'ISOTS,' : return ''+lpad(y,p4)+lpad(m+1,p2)+lpad(d,p2)+'T'+lpad(h,p2)+lpad(n,p2)+lpad(s,p2)+pcm
                             +lpad(f,p3)+zs+lpad(trunc(za/60),p2)+lpad(za%60,p2);
      case 'ISODT'  : return ''+lpad(y,p4)+lpad(m+1,p2)+lpad(d,p2);
      case 'ISOTM'  :
      case 'ISOTM.' : return ''+lpad(h,p2)+lpad(n,p2)+lpad(s,p2)+pp+lpad(f,p3);
      case 'ISOTM,' : return ''+lpad(h,p2)+lpad(n,p2)+lpad(s,p2)+pcm+lpad(f,p3);
      case 'ISOTZ'  : return ''+zs+lpad(trunc(za/60),p2)+lpad(za%60,p2);
      case 'ISO-TS' :
      case 'ISO-TS.': return ''+lpad(y,p4)+pd+lpad(m+1,p2)+pd+lpad(d,p2)+'T'+lpad(h,p2)+pc+lpad(n,p2)+pc
                             +lpad(s,p2)+pp+lpad(f,p3)+zs+lpad(trunc(za/60),p2)+pc+lpad(za%60,p2);
      case 'ISO-TS,': return ''+lpad(y,p4)+pd+lpad(m+1,p2)+pd+lpad(d,p2)+'T'+lpad(h,p2)+pc+lpad(n,p2)+pc
                             +lpad(s,p2)+pcm+lpad(f,p3)+zs+lpad(trunc(za/60),p2)+pc+lpad(za%60,p2);
      case 'ISO-DT' : return ''+lpad(y,p4)+pd+lpad(m+1,p2)+pd+lpad(d,p2);
      case 'ISO-TM' :
      case 'ISO-TM.': return ''+lpad(h,p2)+pc+lpad(n,p2)+pc+lpad(s,p2)+pp+lpad(f,p3);
      case 'ISO-TM,': return ''+lpad(h,p2)+pc+lpad(n,p2)+pc+lpad(s,p2)+pcm+lpad(f,p3);
      case 'ISOWY'  : return ''+lpad(weekYr(dt),p4);
      case 'ISOWK'  : return ''+lpad(weekNum(dt),p2);
      case 'ISOWD'  : return ''+((w+6)%7+1);
      case 'ISODTW' : return ''+lpad(weekYr(dt),p4)+'W'+lpad(weekNum(dt),p2)+((w+6)%7+1);
      case 'ISODTO' : return ''+lpad(y,p4)+lpad(ordDt(),p3);
      case 'ISO-DTW': return ''+lpad(weekYr(dt),p4)+pd+'W'+lpad(weekNum(dt),p2)+pd+((w+6)%7+1);
      case 'ISO-DTO': return ''+lpad(y,p4)+pd+lpad(ordDt(),p3);
      case 'WEEKDAY': return weekday[w];
      case 'WKD'    : return wkd[w];
      case 'MONTH'  : return month[m];
      case 'MTH'    : return mth[m];
      case '{'      : return $1;
      default       : return $0;
    }
  }
}
_g.main();
