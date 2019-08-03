---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/LimitMinError.md
schema: 2.0.0
---

# LimitMinError

## SYNOPSIS

Generates a \<LimitMinError\>\</LimitMinError\> XML tag for specifying the default lower error limit threshold of a channel in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
LimitMinError [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The LimitMinError tag specifies the minimum value a channel's value must stay above to avoid going into an error state.
A sensor will enter an error state when a channel's value goes below this threshold.

If LimitMode is not set to 1 when this channel is created, this value will not take effect until limits are manually enabled in the PRTG UI.

This tag can be used in conjunction with LimitMaxError and LimitErrorMsg.

This tag will only be considered when the channel is initially created. Once created, the lower error limit can be adjusted under the channel's settings.

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value 3
        LimitMode 1
        LimitMinError 3
    }
}
```

Specify a lower error limit for a channel.

## PARAMETERS

### -Value
The value to use.

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

[LimitMaxError](LimitMaxError.md)

[LimitErrorMsg](LimitErrorMsg.md)

[LimitMinWarning](LimitMinWarning.md)

[LimitMaxWarning](LimitMaxWarning.md)

[LimitWarningMsg](LimitWarningMsg.md)