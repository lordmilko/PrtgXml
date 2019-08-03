---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/Value.md
schema: 2.0.0
---

# Value

## SYNOPSIS

Generates a \<Value\>\</Value\> XML tag for specifying the value of a single channel in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
Value [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The Value tag specifies the value to use for a channel. Must be an integer or a floating point number.

If the value is a float, the Float tag must be specified. If you specify a floating point number that contains any value other than 0 after the
decimal point without setting the Float tag to 1, the number will be displayed as 0 in PRTG.

If a result is being returned, this value is mandatory.

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

Generate a channel with a integer value.

### EXAMPLE 2

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value 3.5
        Float 1
    }
}
```

Generate a channel with a floating point number.

### EXAMPLE 3

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

[Channel](Channel.md)

[Float](Float.md)

[Unit](Unit.md)