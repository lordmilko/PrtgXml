---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/Warning.md
schema: 2.0.0
---

# Warning

## SYNOPSIS

Generates a \<Warning\>\</Warning\> XML tag for specifying that a channel should enter a warning state in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
Warning [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The Warning tag causes a sensor to enter a Warning state when specified on at least one channel. Default value is 0 (false).

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value 1
        Warning 1
    }
}
```

Trigger a warning state on a sensor.

### EXAMPLE 2

```powershell
Prtg {
    Text "Bad things happened"
    Result {
        Channel "My channel"
        Value 1
        Warning 1
    }
}
```

Trigger a warning with a custom message.

## PARAMETERS

### -Value
The value to use. Either 1 (warning) or 0 (no warning).

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

[Text](Text.md)

[Result](Result.md)

[Channel](Channel.md)

[Value](Value.md)

[Error](Error.md)