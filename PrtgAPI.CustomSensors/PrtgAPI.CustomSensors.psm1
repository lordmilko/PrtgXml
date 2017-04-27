function __rootElement($scriptBlock)
{
    $name = (Get-PSCallStack)[1].Command

    $value = __executeScriptBlock $scriptBlock

    $xml = "<$name>$value</$name>"

    __formatXml $xml

    #we need to fix all capitaized value variables below in the functions
}

function __rootProperty($value)
{
	$name = (Get-PSCallStack)[1].Command
	$xml = "<$name>$value</$name>"

	if(!$value -and $value -ne 0)
	{
		$xml = "<$name/>"
	}

	__formatXml $xml
}

function __resultProperty($value)
{
	$name = (Get-PSCallStack)[1].Command
	$xml = "<$name>$value</$name>"

	if(!$value -and $value -ne 0)
	{
		$xml = "<$name/>"
	}

	__formatXml $xml
}

function __executeScriptBlock($scriptBlock)
{
	$caller = (Get-PSCallStack)[2].Command

	if(!$scriptBlock -or $scriptBlock.Ast.Extent.ToString() -replace "`n","" -replace "`r","" -replace "`t","" -replace "{","" -replace "}","" -replace " ","" -eq "")
	{
		throw "$caller block requires an inner element."
	}

	& $scriptBlock
}

function __formatXml([xml]$xml)
{
    $stringWriter = New-Object System.IO.StringWriter
    $xmlWriter = New-Object System.Xml.XmlTextWriter $stringWriter

    $xmlWriter.Formatting = "Indented"
    $xmlWriter.Indentation = 4

    $xml.WriteContentTo($xmlWriter)

    $xmlWriter.Flush()
    $stringWriter.Flush()

    $stringWriter.ToString()
}

#################################################################################################

<#
.SYNOPSIS
	Generates a <Prtg></Prtg> XML tag for use with a PRTG Network Monitor Custom Sensor

.DESCRIPTION
	Prtg serves as the root node for all responses given under all EXE/Script Advanced sensors in PRTG, generating the <Prtg></Prtg> XML.

	All XML nodes supported by EXE/Script Advanced sensor responses have corresponding functions under the PrtgAPI.CustomSensors module.

	For a list of all supported functions, see Get-Command -Module PrtgAPI.CustomSensors

.EXAMPLE

# Generate a sensor with one channel

Prtg {
	Result {
		Channel "First channel"
		Value 3
	}
}
.EXAMPLE

# Display an error message

Prtg {
    Error 1
    Text "Woops!"
}

.EXAMPLE

# Silently install PrtgAPI.CustomSensors if it is not installed. 

if(!(Get-Module -ListAvailable PrtgAPI.CustomSensors))
{
    Install-Package PrtgAPI.CustomSensors -ForceBootstrap -Force | Out-Null
}

By incorporating this check scripts may be executed on other machines without worrying about missing modules.

.LINK
    Result
    Channel
    Value
    Error
    Message
    about_CustomSensors

#>
function Prtg([ScriptBlock]$ScriptBlock)       { __rootElement $ScriptBlock }

<#
.SYNOPSIS
	Generates a <Result></Result> XML tag for use with a PRTG Network Monitor Custom Sensor.

.DESCRIPTION
    The result tag specifies channels that should be included in the sensor response. Each channel
    must have a value and unique name, along with any optional formatting tags that may be used
    to customize the channel's configuration.

    The result tag must be specified in a sensor response unless the sensor is returning an error. For more
    information, see Get-Help Error

.EXAMPLE

    # Generate a sensor with one channel

	Prtg {
        Result {
            Channel "My channel"
            Value 1
        }
    }

.LINK
    Prtg
    Channel
    Value
    Error
    about_CustomSensors
#>
function Result([ScriptBlock]$ScriptBlock)     { __rootElement $ScriptBlock }

#################################################################################################

<#
.SYNOPSIS
	Generates a <Text></Text> XML tag for use with a PRTG Network Monitor Custom Sensor.

.DESCRIPTION
    The Text tag specifies a message that should be displayed on the sensor with every scanning interval. This replaces the "OK"
    text that is normally displayed on the sensor when the sensor is up. When a sensor is returning a successful result, this
    value optional. If the sensor has failed, this value should be provided.

    Max length: 2000 characters.

.EXAMPLE
    # Generate a sensor with one channel and a custom message

    Prtg {
        Text "Everything's OK!"
        Result {
            Channel "My channel"
            Value 1
        }
    }

.EXAMPLE
    # Generate an error response

    Prtg {
        Error 1
        Text "A critical error occurred: The system could not find the file something.txt"
    }

.LINK
    Prtg
    Result
    Error
    about_CustomSensors
#>
function Text($Value)             { __rootProperty $Value }

<#
.SYNOPSIS
	Generates an <Error></Error> XML tag for use with a PRTG Network Monitor Custom Sensor.

.DESCRIPTION
    Specifies that the sensor result returns an error and to ignore any channel results (if they are included).

    When returning an error, a Text tag should be included to indicate the reason the sensor failed.

.EXAMPLE
    # Generate an error response

    Prtg {
        Error 1
        Text "A critical error occurred: The system could not find the file something.txt"
    }

.LINK
    Prtg
    Text
    about_CustomSensors
#>
function Error($Value)            { __rootProperty $Value }

#################################################################################################

<#
.SYNOPSIS
	Generates a <Channel></Channel> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

.DESCRIPTION
    The Channel tag specifies the name of the channel that will be displayed within PRTG. This value must be unique
    within the sensor it applies to. If a result is being returned, this value is mandatory.

.EXAMPLE
    # Generate a sensor with one channel

    Prtg {
        Result {
            Channel "My channel"
            Value 1
        }
    }

.LINK
    Prtg
    Result
    Value
    about_CustomSensors
#>
function Channel($Value)          { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <Value></Value> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

.DESCRIPTION
    The value of the channel. Must be an integer or a floating point number. If the value is a float, the Float
    tag must be specified. If a result is being returned, this value is mandatory.

.EXAMPLE
    # Generate a channel with a integer value

    Prtg {
        Result {
            Channel "My channel"
            Value 1
        }
    }

.EXAMPLE
    # Generate a channel with a floating point number

    Prtg {
        Result {
            Channel "My channel"
            Value 3.5
            Float 1
        }
    }

.LINK
    Prtg
    Result
    Channel
    Float
    about_CustomSensors
#>
function Value($Value)            { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <Unit></Unit> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

.DESCRIPTION
    The unit of the value. The unit of the channel allows PRTG to automatically convert values such as volumes and times based on their size. The default value is Custom.

    The following values are supported

        BytesBandwidth
        BytesMemory
        BytesDisk
        Temperature
        Percent
        TimeResponse
        TimeSeconds
        Custom
        Count
        CPU
        BytesFile
        SpeedDisk
        SpeedNet
        TimeHours

.EXAMPLE
    # Create a sensor with a channel that uses a percentage unit

    Prtg {
        Result {
            Channel "My channel"
            Value 30
            Unit Percent
        }
    }

.LINK
    Prtg
    Result
    Channel
    Value
    about_CustomSensors
#>
function Unit($Value)             { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <CustomUnit></CustomUnit> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

.DESCRIPTION
    Custom unit to display when the Unit of the channel is set to Custom. Custom unit may be any valid string, it is advisable to keep it short.

.EXAMPLE
    # Create a sensor with a channel using a custom unit

    Prtg {
        Result {
            Channel "Frogs per capita"
            Value 3
            Unit Custom
            CustomUnit Frogs
        }
    }

.LINK
    Unit
    Prtg
    Result
    Channel
    Value
    about_CustomSensors
#>
function CustomUnit($Value)       { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <SpeedSize></SpeedSize> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function SpeedSize($Value)        { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <VolumeSize></VolumeSize> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function VolumeSize($Value)       { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <SpeedTime></SpeedTime> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function SpeedTime ($Value)       { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <Mode></Mode> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function Mode ($Value)            { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <Float></Float> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function Float ($Value)           { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <DecimalMode></DecimalMode> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function DecimalMode ($Value)     { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <Warning></Warning> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function Warning ($Value)         { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <ShowChart></ShowChart> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function ShowChart ($Value)       { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <ShowTable></ShowTable> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function ShowTable ($value)       { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <LimitMaxError></LimitMaxError> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function LimitMaxError ($Value)   { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <LimitMaxWarning></LimitMaxWarning> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function LimitMaxWarning ($Value) { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <LimitMinWarning></LimitMinWarning> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function LimitMinWarning ($Value) { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <LimitMinError></LimitMinError> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function LimitMinError ($Value)   { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <LimitErrorMsg></LimitErrorMsg> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function LimitErrorMsg ($Value)   { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <LimitWarningMsg></LimitWarningMsg> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function LimitWarningMsg ($Value) { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <LimitMode></LimitMode> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function LimitMode ($Value)       { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <ValueLookup></ValueLookup> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function ValueLookup ($Value)     { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <NotifyChanged></NotifyChanged> XML tag for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function NotifyChanged ($Value)   { __resultProperty $Value }