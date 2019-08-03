---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/CustomUnit.md
schema: 2.0.0
---

# CustomUnit

## SYNOPSIS

Generates a \<CustomUnit\>\</CustomUnit\> XML tag for specifying the custom unit of a channel in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
CustomUnit [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The CustomUnit tag specifies the custom unit to display when the Unit of the channel is set to Custom. The custom unit may be any valid string, however it is advisable to keep it short.

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Result {
        Channel "Frogs per capita"
        Value 3
        Unit Custom
        CustomUnit Frogs
    }
}
```

Create a sensor with a channel using a custom unit.

## PARAMETERS

### -Value
The custom string to use for the unit.

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

[Unit](Unit.md)

[Prtg](Prtg.md)

[Result](Result.md)

[Channel](Channel.md)

[Value](Value.md)