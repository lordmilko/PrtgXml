---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/Text.md
schema: 2.0.0
---

# Text

## SYNOPSIS

Generates a \<Text\>\</Text\> XML tag for specifying a custom message in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
Text [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The Text tag specifies a message that should be displayed on the sensor. This replaces the "OK" text that is normally displayed on the sensor when the sensor is up.
When a sensor is returning a successful result, this value optional. If the sensor has failed, this value should be provided.

Prior to PRTG 16 this tag cannot be used with LimitError* or LimitWarning* tags; if a channel surpasses a warning or error limit threshold, the message will be
overwritten with the LimitWarningMsg or LimitErrorMsg (which may be null). From PRTG 16+ PRTG will display both the Text and Limit Message together.

If this value exceeds 2000 characters, additional characters will be truncated.

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Text "Everything's OK!"
    Result {
        Channel "My channel"
        Value 1
    }
}
```

Generate a sensor with one channel and a custom message.

### EXAMPLE 2

```powershell
Prtg {
    Error 1
    Text "A critical error occurred: The system could not find the file something.txt"
}
```

Generate an error response.

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

[Error](Error.md)