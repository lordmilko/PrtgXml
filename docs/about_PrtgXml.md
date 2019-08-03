# PrtgXml
## about_PrtgXml

# SHORT DESCRIPTION

PrtgXml is a wrapper library for creating PRTG EXE/Script Advanced Sensor XML output.

# LONG DESCRIPTION

PrtgXml provides a series of functions that correspond to the XML tags found in EXE/Script Advanded Sensors. Each function takes one of two arguments:

* A ScriptBlock containing one or more inner tags, or

* A literal numeric/string value.

# INSTALLATION

To ensure your scripts incorporating PrtgXml are portable, include the following at the top of your script to ensure PrtgXml is automatically installed if it is not available

```powershell
if(!(Get-Module -ListAvailable PrtgXml))
{
    Install-Package PrtgXml -ForceBootstrap -Force | Out-Null
}
```

If you are emitting PRTG XML while remotely connected to another computer, you should also include this snippet inside of your script block passed to Invoke-Command.

# EXAMPLES

```powershell
Prtg {
    Result {
        Channel "First channel"
        Value 10
    }
}
```

Generate a response containing a single channel with a specified value.

# KEYWORDS

PRTG EXE Script Advanced Sensor XML

# SEE ALSO

[Prtg](Prtg.md)

[Result](Result.md)

[Channel](Channel.md)

[Value](Value.md)

gcm -Module PrtgXml