---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/VolumeSize.md
schema: 2.0.0
---

# VolumeSize

## SYNOPSIS

Generates a \<VolumeSize\>\</VolumeSize\> XML tag for specifying the scaling factor of a channel value's volume in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
VolumeSize [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The VolumeSize tag specifies the volume scaling factor a channel Value has been specified in.

When the channel Mode is Absolute (the default), the VolumeSize refers to the scaling factor of the value that will appear in the "Last Value" column of a sensor.

When defining a channel where the Mode is Difference, VolumeSize specifies the scaling factor of the channel Value that applies to the "Last Value (volume)" column,
while SpeedSize specifies the scaling factor of the value that applies to the "Last Value (speed)" column.

As all channels default to Absolute Mode by default, unless a Mode has been explicitly specified the VolumeSize property should always be used over the SpeedSize property.

## EXAMPLES

### Example 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value 1000
        Unit TimeSeconds
        VolumeSize Kilo
    }
}
```

Create a sensor with a value of 1s (1000/Kilo = 1000/1000 = 1).

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

[SpeedSize](SpeedSize.md)

[Mode](Mode.md)

[Unit](Unit.md)