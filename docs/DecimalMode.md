---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/DecimalMode.md
schema: 2.0.0
---

# DecimalMode

## SYNOPSIS

Generates a \<DecimalMode\>\</DecimalMode\> XML tag for specifying the decimal mode of a channel in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
DecimalMode [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The DecimalMode tag controls how many decimal places should be displayed when the Float tag has been specified, indicating the value should be treated as a floating point number.

If the decimal mode is All, all decimal places will be displayed.
If the decimal mode is Auto, two decimal places will be displayed.
If the value does not contain a decimal point, no decimal places will be displayed.

If you wish to specify a custom number of decimal places, do not specify a decimal mode.
The custom decimal mode can be selected from within the PRTG UI.

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value 1.2
        Float 1
        DecimalMode Auto
    }
}
```

Show a floating point number with two decimal places.

### EXAMPLE 2

```
Prtg {
    Result {
        Channel "My channel"
        Value 1.23456789
        Float 1
        DecimalMode All
    }
}
```

Show a floating point number with all decimal places.

## PARAMETERS

### -Value
The decimal mode to use. Either Auto or All.

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

[Float](Float.md)