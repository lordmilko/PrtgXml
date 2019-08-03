---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/Float.md
schema: 2.0.0
---

# Float

## SYNOPSIS

Generates a \<Float\>\</Float\> XML tag for specifying whether a channel value should be represented as a floating point number in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
Float [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The Float tag iIndicates whether a value should be represented as a floating point number. Default value is 0 (false).

If value is set to 1 (true) the number of decimal places to use can be controlled via the DecimalMode tag.
Regardless of the DecimalMode used, if a number does not contain a decimal point it will be displayed as a whole number.

If you wish to display a custom number of decimal places, the DecimalMode tag can be ommitted.
To specify a custom number of decimal places, you must use the PRTG UI.

If Float is not enabled and a floating point number is specified in Value with any digit other than 0 after the decimal point, the number will be displayed as 0 in PRTG.

As such, if you wish to display a float as an integer in PRTG you must cast it to an integer before passing it to the Value function.

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

```powershell
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

### EXAMPLE 3

```
Prtg {
    Result {
        Channel "My channel"
        Value 1.23456789
        Float 1
    }
}
```

Show a floating point number with a custom number of decimal places. The custom amount must be specified in the PRTG UI.

### EXAMPLE 4

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value ([int]1.23456789)
    }
}
```

Show a floating point number as an integer in the PRTG UI.

## PARAMETERS

### -Value
The value to use. Either 1 (represent values as floating point numbers) or 0 (represent values as integers).

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

[DecimalMode](DecimalMode.md)

