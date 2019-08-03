---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/SpeedSize.md
schema: 2.0.0
---

# SpeedSize

## SYNOPSIS

Generates a \<SpeedSize\>\</SpeedSize\> XML tag for specifying the scaling factor of a channel value's speed in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
SpeedSize [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The SpeedSize tag specifies the speed scaling factor a channel Value has been specified in.

When the channel Mode is Difference, SpeedSize refers to the scaling factor of the value that will appear in the "Last Value (speed)" column of a sensor.
If the channel Mode is Absolute (the default) specifying this property will have no effect.

By default the channel speed will be displayed in terms of units per second. This can be modified by specifying the SpeedTime property.

## EXAMPLES

### Example 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value ([int]((Get-Date) - [DateTime]'1/1/17').TotalSeconds * 1000)
        SpeedSize Kilo
    }
}
```

Create a channel with a constant difference of around 1000, resulting in a speed value of 1/s (1000/Kilo = 1000/1000 = 1).

## PARAMETERS

### -Value
The scaling factor the channel value has been specified in.

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

[VolumeSize](VolumeSize.md)

[SpeedTime](SpeedTime.md)

[Mode](Mode.md)

[Unit](Unit.md)