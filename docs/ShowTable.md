---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/ShowTable.md
schema: 2.0.0
---

# ShowTable

## SYNOPSIS

Generates a \<ShowTable\>\</ShowTable\> XML tag for specifying whether a channel should be shown in tables by default in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
ShowTable [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The ShowTable tag configures whether the channel has a gauge on the channel's Overview page, is shown in Live Data tables and is included
in channel retrieval API requests. The default value is 1 (true).

This tag will only be considered when the channel is initially created. Once created, the channel table visibility can be adjusted under
the channel's settings.

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value 1
        ShowTable 0
    }
}
```

Configure a channel's Table Rendering property to be "Hide from Tables" by default.

## PARAMETERS

### -Value
The value to use. Either 1 (show in tables) or 0 (hide from tables).

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

[ShowChart](ShowChart.md)