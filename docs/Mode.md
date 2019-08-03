---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/Mode.md
schema: 2.0.0
---

# Mode

## SYNOPSIS

Generates a \<Mode\>\</Mode\> XML tag for specifying the mode of a channel in a PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
Mode [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The Mode tag specifies whether the channel should display Absolute values or Difference values. By default this value is Absolute.

When a channel is configured to use Difference mode, in addition to the typical Last Value, Minimum and Maximum statistics,
PRTG will also display the "Last Value (speed)" of the channel, reflecting the difference between the value emitted from the current and the previous scan.
Difference mode is typically used in sensors that monitor some type of flow, such as bandwidth sensors.

If channels specifying both Absolute and Difference are specified in a single channel definition, the Absolute channels will simply
omit their values from the "Last Value (speed)" column. By default values in the "Last Value (speed)" will be displayed in terms of units per second.
This can be changed by specifying the SpeedTime property.

## EXAMPLES

### Example 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value ((Get-Date) - [DateTime]"1/1/17").TotalMinutes
        Mode Difference
    }
}
```

Create a speed channel with "Last Value (volume)" and "Last Value (speed)" columns.

## PARAMETERS

### -Value
The channel mode to use. Either Absolute or Difference.

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

[Channel](Channel.md)

[Value](Value.md)