# PrtgAPI.CustomSensors

[![Build status](https://img.shields.io/appveyor/ci/lordmilko/prtgapi-customsensors.svg)](https://ci.appveyor.com/project/lordmilko/prtgapi-customsensors)

PrtgAPI.CustomSensors PowerShell module for generating the XML output required by *EXE/Script Advanced* custom sensors. `PrtgAPI.CustomSensors` can be found in the build directory of your project, alongside `PrtgAPI`

Typically, to generate a response with one channel the following XML is required

```xml
<Prtg>
    <Result>
        <Channel>First Channel</Channel>
        <Value>10</Value>
    </Result>
</Prtg>
```
The equivalent XML can be generated as follows via PrtgAPI.CustomSensors
```powershell
Prtg {
    Result {
        Channel "First Channel"
        Value 10
    }
}
```

All tags supported by *EXE/Script Advanced* sensors are supported by *PrtgAPI.CustomSensors*. For a list of tags that can be used in EXE/Script Advanced sensors, please see the [documentation on writing Custom Sensors](https://prtg.paessler.com/api.htm?tabid=7)

To import PrtgAPI.CustomSensors, run `Import-Module C:\path\to\PrtgAPI.CustomSensors`. If PrtgAPI.CustomSensors is on your PSModulePath, you can simply run `Import-Module PrtgAPI.CustomSensors`

## Installation

1. Download the [latest build](https://ci.appveyor.com/api/projects/lordmilko/prtgapi-customsensors/artifacts/PrtgAPI.CustomSensors.zip)
2. Right click **PrtgAPI.zip** -> **Properties**
3. On the *General* tab, under *Security* select **Unblock**
4. Unzip the file
5. Run `Import-Module C:\path\to\PrtgAPI.CustomSensors`

If PrtgAPI.CustomSensors is installed toyour PSModulePath, you can load the module within PowerShell by simply running `Import-Module PrtgAPI.CustomSensors`

For help using PrtgAPI.CustomSensors within PowerShell, run `Get-Help Prtg`

PrtgAPI.CustomSensors has no dependency on [PrtgAPI](https://github.com/lordmilko/PrtgAPI), and can be installed and run completely separately without issue.

