---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/Channel.md
schema: 2.0.0
---

# Channel

## SYNOPSIS

Generates a \<Channel\>\</Channel\> XML tag for specifying the name of a channel in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
Channel [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The Channel tag specifies the name of the channel that will be displayed within PRTG. This value must be unique within the sensor it applies to.
If a Result is being returned, this value is mandatory.

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value 1
    }
}
```

Generate a sensor with one channel.

## PARAMETERS

### -Value
The name to use for the channel.

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