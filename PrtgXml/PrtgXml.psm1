function __rootElement($scriptBlock)
{
    $name = (Get-PSCallStack)[1].Command

    $value = __executeScriptBlock $scriptBlock

    $xml = "<$name>$value</$name>"

    __formatXml $xml
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

function Prtg([ScriptBlock]$ScriptBlock)       { __rootElement $ScriptBlock }
function Result([ScriptBlock]$ScriptBlock)     { __rootElement $ScriptBlock }

#################################################################################################

function Text($Value)             { __rootProperty $Value }
function Error($Value)            { __rootProperty $Value }

#################################################################################################

function Channel($Value)          { __resultProperty $Value }
function Value($Value)            { __resultProperty $Value }
function Unit($Value)             { __resultProperty $Value }
function CustomUnit($Value)       { __resultProperty $Value }
function SpeedSize($Value)        { __resultProperty $Value }
function VolumeSize($Value)       { __resultProperty $Value }
function SpeedTime ($Value)       { __resultProperty $Value }
function Mode ($Value)            { __resultProperty $Value }
function Float ($Value)           { __resultProperty $Value }
function DecimalMode ($Value)     { __resultProperty $Value }
function Warning ($Value)         { __resultProperty $Value }
function ShowChart ($Value)       { __resultProperty $Value }
function ShowTable ($value)       { __resultProperty $Value }
function LimitMaxError ($Value)   { __resultProperty $Value }
function LimitMaxWarning ($Value) { __resultProperty $Value }
function LimitMinWarning ($Value) { __resultProperty $Value }
function LimitMinError ($Value)   { __resultProperty $Value }
function LimitErrorMsg ($Value)   { __resultProperty $Value }
function LimitWarningMsg ($Value) { __resultProperty $Value }
function LimitMode ($Value)       { __resultProperty $Value }
function ValueLookup ($Value)     { __resultProperty $Value }
function NotifyChanged ($Value)   { __resultProperty $Value }