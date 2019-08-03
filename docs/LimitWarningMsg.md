---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/LimitWarningMsg.md
schema: 2.0.0
---

# LimitWarningMsg

## SYNOPSIS

Generates a \<LimitWarningMsg\>\</LimitWarningMsg\> XML tag for specifying the default warning limit message of a channel in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
LimitWarningMsg [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The LimitWarningMsg tag specifies the message to display when a channel's value has surpassed its LimitMaxWarning or LimitMinWarning.
This tag can be used alongside Limit Error tags including LimitMaxError, LimitMinError and LimitErrorMsg.

When a channel's value reaches an Error Limit threshold, the sensor's message will be replaced with the Error Limit Message.

This tag will only be considered when the channel is initially created. Once created, the warning message can be adjusted under the channel's settings.

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value 3
        LimitMode 1
        LimitMaxWarning 2
        LimitWarningMsg "System may be overheating!"
    }
}
```

Specify a warning message for a channel.

## PARAMETERS

### -Value
The message to display.

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

[LimitMode](LimitMode.md)

[LimitMinWarning](LimitMinWarning.md)

[LimitMaxWarning](LimitMaxWarning.md)

[LimitMinError](LimitMinError.md)

[LimitMaxError](LimitMaxError.md)

[LimitErrorMsg](LimitErrorMsg.md)