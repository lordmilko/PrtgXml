function Get-PrtgContainerXml($scriptBlock)
{
    $name = (Get-PSCallStack)[1].Command

    $value = Invoke-PrtgScriptBlock $scriptBlock

    $xml = "<$name>$value</$name>"

    Format-PrtgXml $xml
}

function Get-PrtgValueXml($value)
{
    $value = [System.Security.SecurityElement]::Escape($value)

    $name = (Get-PSCallStack)[1].Command
    $xml = "<$name>$value</$name>"

    if(!$value -and $value -ne 0)
    {
        $xml = "<$name/>"
    }

    Format-PrtgXml $xml
}

function Invoke-PrtgScriptBlock($scriptBlock)
{
    $caller = (Get-PSCallStack)[2].Command

    if(!$scriptBlock -or $scriptBlock.Ast.Extent.ToString() -replace "`n","" -replace "`r","" -replace "`t","" -replace "{","" -replace "}","" -replace " ","" -eq "")
    {
        throw "$caller block requires an inner element."
    }

    & $scriptBlock
}

function Format-PrtgXml([xml]$xml)
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

function Prtg([ScriptBlock]$ScriptBlock)   { Get-PrtgContainerXml $ScriptBlock }
function Result([ScriptBlock]$ScriptBlock) { Get-PrtgContainerXml $ScriptBlock }

#################################################################################################

function Text            ([string]$Value)  { Get-PrtgValueXml $Value }
function Error           ([string]$Value)     { Get-PrtgValueXml $Value }

#################################################################################################

function Channel         ([string]$Value)  { Get-PrtgValueXml $Value }
function Value           ([string]$Value)  { Get-PrtgValueXml $Value }
function CustomUnit      ([string]$Value)  { Get-PrtgValueXml $Value }
function LimitMaxError   ([string]$Value)  { Get-PrtgValueXml $Value }
function LimitMaxWarning ([string]$Value)  { Get-PrtgValueXml $Value }
function LimitMinWarning ([string]$Value)  { Get-PrtgValueXml $Value }
function LimitMinError   ([string]$Value)  { Get-PrtgValueXml $Value }
function LimitErrorMsg   ([string]$Value)  { Get-PrtgValueXml $Value }
function LimitWarningMsg ([string]$Value)  { Get-PrtgValueXml $Value }
function ValueLookup     ([string]$Value)  { Get-PrtgValueXml $Value }
function NotifyChanged                     { Get-PrtgValueXml $null }

function Unit
{
    param(
        [ArgumentCompleter({
            "BytesBandwidth","BytesMemory","BytesDisk","Temperature",
            "Percent","TimeResponse","TimeSeconds","Custom","Count",
            "CPU","BytesFile","SpeedDisk","SpeedNet","TimeHours"
        })]
        [string]$Value
    )

    Get-PrtgValueXml $Value
}

function SpeedSize
{
    param(
        [ArgumentCompleter({
            "One","Kilo","Mega","Giga","Tera","Byte",
            "KiloByte","MegaByte","GigaByte","TeraByte",
            "Bit","KiloBit","MegaBit","GigaBit","TeraBit"
        })]
        [string]$Value
    )

    Get-PrtgValueXml $Value
}

function VolumeSize
{
    param(
        [ArgumentCompleter({
            "One","Kilo","Mega","Giga","Tera","Byte",
            "KiloByte","MegaByte","GigaByte","TeraByte",
            "Bit","KiloBit","MegaBit","GigaBit","TeraBit"
        })]
        [string]$Value
    )

    Get-PrtgValueXml $Value
}

function SpeedTime
{
    param(
        [ArgumentCompleter({"Second","Minute","Hour","Day"})]
        [string]$Value
    )

    Get-PrtgValueXml $Value
}

function Mode
{
    param(
        [ArgumentCompleter({"Absolute", "Difference"})]
        [string]$Value
    )

    Get-PrtgValueXml $Value
}

function Float
{
    param(
        [ArgumentCompleter({0,1})]
        [string]$Value
    )

    Get-PrtgValueXml $Value
}

function DecimalMode
{
    param(
        [ArgumentCompleter({"Auto","All"})]
        [string]$Value
    )

    Get-PrtgValueXml $Value
}

function Warning
{
    param(
        [ArgumentCompleter({0,1})]
        [string]$Value
    )

    Get-PrtgValueXml $Value
}

function ShowChart
{
    param(
        [ArgumentCompleter({0,1})]
        [string]$Value
    )

    Get-PrtgValueXml $Value
}

function ShowTable
{
    param(
        [ArgumentCompleter({0,1})]
        [string]$Value
    )

    Get-PrtgValueXml $Value
}

function LimitMode
{
    param(
        [ArgumentCompleter({0,1})]
        [string]$Value
    )

    Get-PrtgValueXml $Value
}