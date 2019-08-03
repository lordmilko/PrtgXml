---
external help file: PrtgXml-help.xml
Module Name: PrtgXml
online version: https://github.com/lordmilko/PrtgXml/blob/master/docs/ValueLookup.md
schema: 2.0.0
---

# ValueLookup

## SYNOPSIS

Generates a \<ValueLookup\>\</ValueLookup\> XML tag for specifying the default value lookup of a channel in a custom PRTG Network Monitor EXE/XML Sensor.

## SYNTAX

```
ValueLookup [[-Value] <String>] [<CommonParameters>]
```

## DESCRIPTION

The ValueLookup tag specifies the default Value Lookup to use with the channel's value.

Value Lookups allows PRTG to replace a channel's numeric value with a textual representation. Sophisticated dials can be created using Value Lookups
allowing PRTG to show a system as being in a particular state.

Value Lookups are stored on the PRTG Core Server under C:\Program Files (x86)\PRTG Network Monitor\lookups. Custom lookups can be stored under the lookups\custom subfolder,
and then loaded via the Load Lookups option under Setup -\> Administrative Tools.

This tag will only be considered when the channel is initially created.

## EXAMPLES

### EXAMPLE 1

```powershell
Prtg {
    Result {
        Channel "My channel"
        Value 1
        ValueLookup prtg.standardlookups.yesno.stateyesok
    }
}
```

Create a sensor with a channel that shows "Yes" or "No" depending on its value (1 or 2).

## PARAMETERS

### -Value
The name of a standard or custom lookup that has been installed on the PRTG Core.

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

[PRTG Manual:](https://www.paessler.com/manuals/prtg/define_lookups)