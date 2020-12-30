# PrtgXml

[![Build status](https://img.shields.io/appveyor/ci/lordmilko/prtgxml.svg)](https://ci.appveyor.com/project/lordmilko/prtgxml)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/PrtgXml?label=psgallery)](https://www.powershellgallery.com/packages/PrtgXml)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/PrtgXml)](https://www.powershellgallery.com/packages/PrtgXml)

*PrtgXml* is a PowerShell library that provides a declarative syntax for creating EXE/Script Advanced sensors in PRTG Network Monitor.

Typically, to generate a response with one channel the following XML is required

```xml
<Prtg>
    <Result>
        <Channel>First Channel</Channel>
        <Value>10</Value>
    </Result>
</Prtg>
```
The equivalent XML can be generated as follows via *PrtgXml*
```powershell
Prtg {
    Result {
        Channel "First Channel"
        Value 10
    }
}
```

All tags supported by *EXE/Script Advanced* sensors are supported by *PrtgXml*. For a list of tags that can be used in EXE/Script Advanced sensors, please see the [documentation on writing Custom Sensors](https://www.paessler.com/manuals/prtg/custom_sensors#advanced_sensors) or read the [docs](https://github.com/lordmilko/PrtgXml/tree/master/docs). Every command supported by *PrtgXml* has full PowerShell documentation (accessible via `Get-Help <command>`) explaining what the command does and how to use it.

For tags with known values (`Unit`, `SpeedSize`, `DecimalMode`, etc) *PrtgXml* will provide a list of suggestions you can choose from. Cycle through options simply by hitting the tab key!

```powershell
C:\> Unit <tab>
C:\> Unit BytesBandwidth
```

Standard language features including variables, control structures and exception handlers are fully compatible with *PrtgXml*, allowing for inline programming.

```powershell
Prtg {
    foreach($elm in $elms)
    {
        Result {
            Channel $elm.Name
            Value $elm.Value
        }
    }
}
```

While the "magic" of *PrtgXml* may seem weird if you've never seen this type of programming before, it's ultimately all just normal PowerShell; the `Prtg` function takes a single `ScriptBlock` as a parameter, which when executed retrieves all of the text to include inside of the `<Prtg></Prtg>` tags. The resulting XML is then formatted nicely and emitted from the function as a `string`. As such, within each `ScriptBlock` there aren't really any *rules* you have to follow. Whatever values are returned, *PrtgXml* will incorporate into the result.

```powershell
# In PowerShell, any statement that emits a value will implicitly be "returned" from a function
# or ScriptBlock. As such, you can just do whatever and PrtgXml will capture the results.
Prtg {
    Result {
        Channel "Channel1"
        Value 10
    }
    
    Result {
        Channel "Channel2"
        Value 20
    }
    
    "<Result><Channel>Channel3</Channel><Value>30</Value></Result>"
    
    GetChannel4
}
```

For help using *PrtgXml* within PowerShell, run `Get-Help PrtgXml`

## Installation

### NuGet (PowerShell Gallery)

You can install *PrtgXml* on any computer running PowerShell 5 by executing

```powershell
Install-Package PrtgXml
```

If you are using Windows PowerShell, due to the PowerShell Gallery now requiring TLS 1.2 you may need to manually specify to use TLS 1.2 in order to install or update PrtgXml

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
```

When using *PrtgXml*, it's advised to perform a check to see whether or not *PrtgXml* needs to be installed. For more information, see *Tips* below.

Note: if you were previously using this package under its previous name (*PrtgAPI.CustomSensors*) you will need to uninstall the existing package first before you can install the new one

```powershell
Uninstall-Package PrtgAPI.CustomSensors -AllVersions
```

### Manual

1. Download the [latest build](https://ci.appveyor.com/api/projects/lordmilko/prtgxml/artifacts/PrtgXml.zip)
2. Right click **PrtgXml.zip** -> **Properties**
3. On the *General* tab, under *Security* select **Unblock**
4. Unzip the file
5. Run `Import-Module C:\path\to\PrtgXml`

If PrtgXml is installed to your `PSModulePath`, the module will be automatically imported whenever you invoke one of its functions. You can also manually import the module into your script by running `Import-Module PrtgXml`.

## Tips

The first time you install a package from NuGet, PowerShell will prompt you to install the NuGet Package Provider. In addition, unless you have manually marked the PowerShell Gallery as a trusted package provider, you will be asked to confirm whether you're sure you want to install the package.

To bypass these prompts and make your scripts portable and versatile, you can incorporate the following snippet into your code

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

if(!(Get-Module -ListAvailable PrtgXml))
{
    Install-Package PrtgXml -ForceBootstrap -Force | Out-Null
}
```

`PrtgXml` functions can then be invoked in your scripts without issue (without even having to `Import-Module`). This technique can also be found in the PowerShell *about topic* via `Get-Help PrtgXml`.

When performing PowerShell Remoting, *PrtgXml* will need to be installed on the target server if you wish to output your response from inside your remote session. To install *PrtgXml* on the remote server, simply include the snippet above in the script block of your `Invoke-Command`
