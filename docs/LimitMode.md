---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/LimitMode.md
schema: 2.0.0
---

# LimitMode

## SYNOPSIS

Generates a \<LimitMode\>\</LimitMode\> XML tag for specifying whether error and warning limits should be enabled by default for a channel in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
LimitMode [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The LimitMode tag specifies whether error/warming limits should be enabled by a channel by default. If a LimitMin* or LimitMax* value has been set, this value must also be specified.

This tag will only be considered when the channel is initially created. Once created, the limit mode can be adjusted under the channel's settings.

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value 3
        LimitMode 1
        LimitMaxError 2
    }
}
```

Specify an upper error limit for a channel with  error limits enabled.

## PARAMETERS

### -Value
The value to use. Either 1 (enable limits) or 0 (disable limits).

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

[LimitMinWarning](LimitMinWarning.md)

[LimitMaxWarning](LimitMaxWarning.md)

[LimitWarningMsg](LimitWarningMsg.md)

[LimitMinError](LimitMinError.md)

[LimitMaxError](LimitMaxError.md)

[LimitErrorMsg](LimitErrorMsg.md)