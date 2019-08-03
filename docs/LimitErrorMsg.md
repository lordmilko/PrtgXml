---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/LimitErrorMsg.md
schema: 2.0.0
---

# LimitErrorMsg

## SYNOPSIS

Generates a \<LimitErrorMsg\>\</LimitErrorMsg\> XML tag for specifying the default error limit message of a channel in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
LimitErrorMsg [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The LimitErrorMsg tag specifies the message to display when a channel's value has surpassed its LimitMaxError or LimitMinError.
This tag can be used alongside Limit Warning tags including LimitMaxWarning, LimitMinWarning and LimitWarningMsg.

If the channel's value reaches a Warning Limit threshold, the sensor's message will be replaced with the Warning Limit Message.

This tag will only be considered when the channel is initially created. Once created, the error message can be adjusted under the channel's settings.

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value 3
        LimitMode 1
        LimitMaxError 2
        LimitErrorMsg "System is about to explode!"
    }
}
```

Specify an error message for a channel.

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

[LimitMinError](LimitMinError.md)

[LimitMaxError](LimitMaxError.md)

[LimitMinWarning](LimitMinWarning.md)

[LimitMaxWarning](LimitMaxWarning.md)

[LimitWarningMsg](LimitWarningMsg.md)