---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/Result.md
schema: 2.0.0
---

# Result

## SYNOPSIS

Generates a \<Result\>\</Result\> XML tag for defining a single channel in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
Result [[-ScriptBlock] <ScriptBlock>] [<CommonParameters>]
```

## DESCRIPTION

The Result tag specifies channels that should be included in the sensor response. Each channel must have a value and unique name,
along with any optional formatting tags that may be used to customize the channel's configuration.

The Result tag must be specified in a sensor response unless the sensor is returning an error. For more information, see Get-Help Error.

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

### -ScriptBlock
A ScriptBlock containing a single channel definition.

```yaml
Type: ScriptBlock
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

[Channel](Channel.md)

[Value](Value.md)

[Error](Error.md)

[Text](Text.md)