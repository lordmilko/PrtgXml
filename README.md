# PrtgAPI.CustomSensors

[![Build status](https://img.shields.io/appveyor/ci/lordmilko/prtgapi-customsensors.svg)](https://ci.appveyor.com/project/lordmilko/prtgapi-customsensors)

*PrtgAPI.CustomSensors* is a PowerShell module for generating the XML output required by *EXE/Script Advanced* custom sensors.

Typically, to generate a response with one channel the following XML is required

```xml
<Prtg>
    <Result>
        <Channel>First Channel</Channel>
        <Value>10</Value>
    </Result>
</Prtg>
```
The equivalent XML can be generated as follows via *PrtgAPI.CustomSensors*
```powershell
Prtg {
    Result {
        Channel "First Channel"
        Value 10
    }
}
```

All tags supported by *EXE/Script Advanced* sensors are supported by *PrtgAPI.CustomSensors*. For a list of tags that can be used in EXE/Script Advanced sensors, please see the [documentation on writing Custom Sensors](https://prtg.paessler.com/api.htm?tabid=7)

To import *PrtgAPI.CustomSensors*, run `Import-Module C:\path\to\PrtgAPI.CustomSensors`. If *PrtgAPI.CustomSensors* is on your PSModulePath, you can simply run `Import-Module PrtgAPI.CustomSensors`

For help using *PrtgAPI.CustomSensors* within PowerShell, run `Get-Help Prtg`

*PrtgAPI.CustomSensors* has no dependency on [PrtgAPI](https://github.com/lordmilko/PrtgAPI), and can be installed and run completely separately without issue.

## Installation

### NuGet (PowerShell Gallery)

You can install *PrtgAPI.CustomSensors* on any computer running PowerShell 5 by executing

`Install-Package PrtgAPI.CustomSensors`

When using *PrtgAPI.CustomSensors*, it's advised to perform a check to see whether or not *PrtgAPI.CustomSensors* needs to be installed. For more information, see *Tips* below.

### Manual

1. Download the [latest build](https://ci.appveyor.com/api/projects/lordmilko/prtgapi-customsensors/artifacts/PrtgAPI.CustomSensors.zip)
2. Right click **PrtgAPI.CustomSensors.zip** -> **Properties**
3. On the *General* tab, under *Security* select **Unblock**
4. Unzip the file
5. Run `Import-Module C:\path\to\PrtgAPI.CustomSensors`

If PrtgAPI.CustomSensors is installed toyour PSModulePath, you can load the module within PowerShell by simply running `Import-Module PrtgAPI.CustomSensors`

## Tips

The first time you install a package from NuGet, PowerShell will prompt you to install the NuGet Package Provider. In addition, unless you have manually marked the PowerShell Gallery as a trusted package provider, you will be asked to confirm whether you're sure you want to install the package.

To bypass these prompts and make your scripts portable and versatile, you can incorporate the following snippet into your code

```powershell
if(!(Get-Module -ListAvailable PrtgAPI.CustomSensors))
{
    Install-Package PrtgAPI.CustomSensors -ForceBootstrap -Force | Out-Null
}
```

`PrtgAPI.CustomSensors` functions can then be invoked in your scripts without issue (without even having to `Import-Module`

When performing PowerShell Remoting, *PrtgAPI.CustomSensors* will need to be installed on the target server if you wish to output your response from inside your remote session. To install *PrtgAPI.CustomSensors* on the remote server, simply include the snippet above in the script block of your `Invoke-Command`
