---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/NotifyChanged.md
schema: 2.0.0
---

# NotifyChanged

## SYNOPSIS

Generates a \<NotifyChanged\>\</NotifyChanged\> XML tag for triggering notifications when a channel value changes in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
NotifyChanged [<CommonParameters>]
```

## DESCRIPTION

The NotifyChanged tag causes a sensor to activate any Change Triggers that are defined on it.

Change Triggers will only activate when this tag is present and the the value of the channel is different to the previous scan.

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value ((Get-Date) - [DateTime]"1/1/17").TotalMinutes
        NotifyChanged
    }
}
```

Activate any Change Triggers that have been defined on the sensor. Sensor value is the number of minutes since January 1st, 2017.

## RELATED LINKS

[Prtg](Prtg.md)

[Result](Result.md)

[Channel](Channel.md)

[Value](Value.md)