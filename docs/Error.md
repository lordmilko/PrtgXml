---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/Error.md
schema: 2.0.0
---

# Error

## SYNOPSIS

Generates an \<Error\>\</Error\> XML tag for specifying that a fatal error has occurred in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
Error [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The Error tag specifies that the sensor result returns an error and to ignore any channel results (if they are included).

When returning an error, a Text tag should be included to indicate the reason the sensor failed.

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Error 1
    Text "A critical error occurred: The system could not find the file something.txt"
}
```

Generate an error response.

## PARAMETERS

### -Value
The value to use. Either 1 (error) or 0 (no error).

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

[Warning](Warning.md)