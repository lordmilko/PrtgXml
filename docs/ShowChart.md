---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/ShowChart.md
schema: 2.0.0
---

# ShowChart

## SYNOPSIS

Generates a \<ShowChart\>\</ShowChart\> XML tag for specifying whether a channel should be displayed in charts by default in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
ShowChart [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The ShowChart tag configures whether the channel is shown in charts on the Live Data page. The default value is 1 (true).

This tag will only be considered when the channel is initially created. Once created, the channel chart visibility can be adjusted under the channel's settings.

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value 1
        ShowChart 0
    }
}
```

Configure a channel's Graph Rendering property to be "Hide from Graphs" by default.

## PARAMETERS

### -Value
The value to use. Either 1 (show in charts) or 0 (hide from charts).

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

[ShowTable](ShowTable.md)