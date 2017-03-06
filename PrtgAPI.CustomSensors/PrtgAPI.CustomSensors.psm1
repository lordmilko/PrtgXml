function __rootProperty($value)
{
	$name = (Get-PSCallStack)[1].Command
	$xml = "<$name>$Value</$name>"

	if(!$value)
	{
		$xml = "<$name/>"
	}

	"`t$xml`n"
}

function __resultProperty($value)
{
	$name = (Get-PSCallStack)[1].Command
	$xml = "<$name>$value</$name>"

	if(!$value)
	{
		$xml = "<$name/>"
	}

	"`t`t$xml`n"
}

function __getInner($scriptBlock)
{
	$caller = (Get-PSCallStack)[1].Command

	if(!$scriptBlock -or $scriptBlock.Ast.Extent.ToString() -replace "`n","" -replace "`r","" -replace "`t","" -replace "{","" -replace "}","" -replace " ","" -eq "")
	{
		throw "$caller block requires an inner element."
	}

	& $scriptBlock
}

#################################################################################################

<#
.SYNOPSIS
	Generates a <Prtg></Prtg> XML block for use with a PRTG Network Monitor Custom Sensor

.DESCRIPTION
	Prtg serves as the root node for all responses given under all EXE/Script Advanced sensors in PRTG, generating the <Prtg></Prtg> XML.
    All XML nodes supported by EXE/Script Advanced sensor responses have corresponding functions under the PrtgAPI.CustomSensors module.

	For a list of all supported functions, see Get-Module PrtgAPI.CustomSensors | Select -Expand ExportedFunctions

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
#>
function Prtg($ScriptBlock)       { "<Prtg>`n$(__getInner $ScriptBlock)</Prtg>" }

<#
.SYNOPSIS
	Generates a <Result></Result> XML block for use with a PRTG Network Monitor Custom Sensor.
	
	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function Result($ScriptBlock)     { "`t<Result>`n$(__getInner $ScriptBlock)`t</Result>`n" }

#################################################################################################

<#
.SYNOPSIS
	Generates a <Text></Text> XML block for use with a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function Text($Value)             { __rootProperty $Value }

<#
.SYNOPSIS
	Generates an <Error></Error> XML block for use with a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg.
#>
function Error($Value)            { __rootProperty $Value }

#################################################################################################

<#
.SYNOPSIS
	Generates a <Channel></Channel> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function Channel($Value)          { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <Value></Value> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function Value($Value)            { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <Unit></Unit> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function Unit($Value)             { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <CustomUnit></CustomUnit> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function CustomUnit($Value)       { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <SpeedSize></SpeedSize> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function SpeedSize($Value)        { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <VolumeSize></VolumeSize> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function VolumeSize($Value)       { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <SpeedTime></SpeedTime> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function SpeedTime ($Value)       { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <Mode></Mode> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function Mode ($Value)            { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <Float></Float> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function Float ($Value)           { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <DecimalMode></DecimalMode> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function DecimalMode ($Value)     { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <Warning></Warning> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function Warning ($Value)         { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <ShowChart></ShowChart> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function ShowChart ($Value)       { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <ShowTable></ShowTable> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function ShowTable ($value)       { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <LimitMaxError></LimitMaxError> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function LimitMaxError ($Value)   { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <LimitMaxWarning></LimitMaxWarning> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function LimitMaxWarning ($Value) { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <LimitMinWarning></LimitMinWarning> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function LimitMinWarning ($Value) { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <LimitMinError></LimitMinError> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function LimitMinError ($Value)   { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <LimitErrorMsg></LimitErrorMsg> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function LimitErrorMsg ($Value)   { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <LimitWarningMsg></LimitWarningMsg> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function LimitWarningMsg ($Value) { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <LimitMode></LimitMode> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function LimitMode ($Value)       { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <ValueLookup></ValueLookup> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function ValueLookup ($Value)     { __resultProperty $Value }

<#
.SYNOPSIS
	Generates a <NotifyChanged></NotifyChanged> XML block for use in the Result of a PRTG Network Monitor Custom Sensor.

	For more information, see Get-Help Prtg or Setup -> PRTG API -> Custom Sensors within PRTG.
#>
function NotifyChanged ($Value)   { __resultProperty $Value }