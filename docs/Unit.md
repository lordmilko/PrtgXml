---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/Unit.md
schema: 2.0.0
---

# Unit

## SYNOPSIS

Generates a \<Unit\>\</Unit\> XML tag for specifying the unit of a single channel in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
Unit [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The Unit tag specifies the unit of the channel Value. The unit of the channel allows PRTG to automatically convert values such as volumes and times based on their size. The default value is Custom.

The following values are supported

| Name           | Default Unit         |
| -------------- | -------------------- |
| BytesBandwidth | KByte                |
| BytesDisk      | MByte                |
| BytesFile      | Byte                 |
| BytesMemory    | MByte                |
| Count          | #                    |
| CPU            | %                    |
| Custom         | Custom               |
| Percent        | %                    |
| SpeedDisk      | /s                   |
| SpeedNet       | /s                   |
| Temperature    | °C                   |
| TimeHours      | h                    |
| TimeResponse   | msec                 |
| TimeSeconds    | Dynamic (s, m, h, d) |

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value 30
        Unit Percent
    }
}
```

Create a sensor with a channel that uses a percentage unit.

## PARAMETERS

### -Value
The unit to use.

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

[CustomUnit](CustomUnit.md)