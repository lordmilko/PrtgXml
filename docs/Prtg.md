---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/Prtg.md
schema: 2.0.0
---

# Prtg

## SYNOPSIS

Generates a \<Prtg\>\</Prtg\> XML tag for defining a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
Prtg [[-ScriptBlock] <ScriptBlock>] [<CommonParameters>]
```

## DESCRIPTION

The Prtg tag serves as the root node for all responses given under all EXE/Script Advanced sensors in PRTG, generating the \<Prtg\>\</Prtg\> XML.

If the sensor scan completed successfully, the result should contain one or more Result tags with an optional Text message.

If the sensor should throw an error without returning any channel values, the Error tag should be set to 1 and a Text message should be displayed.

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Result {
        Channel "First channel"
        Value 3
    }
}
```

Generate a sensor with a single channel.

### EXAMPLE 2

```powershell
Prtg {
    Error 1
    Text "Woops!"
}
```

Display an error message.

### EXAMPLE 3

```powershell
Prtg {
    Text "Hello world!"
    Result {
        Channel "First channel"
        Value 3
    }
}
```

Generate a sensor with a single channel and a custom message.

## PARAMETERS

### -ScriptBlock
A ScriptBlock containing Text, Error or Result nodes.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## RELATED LINKS

[Result](Result.md)

[Channel](Channel.md)

[Value](Value.md)

[Error](Error.md)

[Text](Text.md)

[about_PrtgXml](about_PrtgXml.md)