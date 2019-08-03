---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/SpeedTime.md
schema: 2.0.0
---

# SpeedTime

## SYNOPSIS

Generates a \<SpeedTime\>\</SpeedTime\> XML tag for specifying the rate of a channel's value in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
SpeedTime [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The SpeedTime tag specifies the initial time range to use for the "Last Value (speed)" column of a channel when the channel is configured to use Difference Mode.
Once the channel has been created, the time unit cannot be changed.

## EXAMPLES

### Example 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value ((Get-Date) - [DateTime]"1/1/17").TotalMinutes
        SpeedTime Day
        Mode Difference
    }
}
```

Create a channel with a speed of 83,000/d.

## PARAMETERS

### -Value
The rate of time to use.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## RELATED LINKS

[Prtg](Prtg.md)

[Result](Result.md)

[Value](Value.md)

[SpeedSize](SpeedSize.md)

[Mode](Mode.md)