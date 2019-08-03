[CmdletBinding()]
param(
    [switch]$Batch
)

function Update-PrtgHelp
{
    Write-Warning "You must have hacked GetMarkdownFilesFromPath in platyPS to use this file"

    $outDir = "$PSScriptRoot\..\src"

    New-ExternalHelp $PSScriptRoot\..\docs -OutputPath $outDir -Force

    UpdateAboutHelp $outDir
    UpdateXmlHelp $outDir
}

function UpdateAboutHelp($outDir)
{
    $aboutFile = Join-Path $outDir "about_PrtgXml.help.txt"

    $aboutFileContents = gc $aboutFile

    $aboutFileContents = $aboutFileContents | foreach {

        if($_ -like "*about_prtgxml*")
        {
            return $_ -replace "about_prtgxml","about_PrtgXml"
        }
        elseif($_ -match "    \*.+")
        {
            return "",$_
        }
        else
        {
            return $_
        }
    }

    while($aboutFileContents[$aboutFileContents.Length - 1] -eq "")
    {
        $aboutFileContents = $aboutFileContents | select -SkipLast 1
    }

    ($aboutFileContents -join [Environment]::NewLine)|Set-Content $aboutFile -Encoding UTF8 -NoNewline
}

function UpdateXmlHelp($outDir)
{
    $xmlFile = Join-Path $outDir "PrtgXml-Help.xml"

    $xml = New-Object System.Xml.XmlDocument
    $xml.PreserveWhitespace = $true
    $xml.Load($xmlFile)

    # Update the table for Unit to display as a multi-line table

    $unitCommand = $xml.helpItems.command | where { $_.details.name -eq "Unit" }

    if(!($unitCommand))
    {
        throw "Failed to find Unit command"
    }

    $table = $unitCommand.description.ChildNodes | where { $_."#text" -like "| Name  *" }

    if(!($table))
    {
        throw "Failed to find Unit table"
    }

    $rows = [regex]::Matches($table."#text", "\|.+?\|.+?\|")

    $newText = ($rows|select -expand Value|foreach { $_.TrimStart(" ") }) -join [Environment]::NewLine

    $table."#text" = $newText

    foreach($command in $xml.helpItems.command)
    {
        for($i = 0; $i -lt @($command.examples.example).Count - 1; $i++)
        {
            $example = $command.examples.example[$i]

            $existingWhitespace = $example.remarks.ChildNodes[0]
            $existingPara = $example.remarks.ChildNodes[1]

            $newPara = $xml.CreateElement("maml", "para", "http://schemas.microsoft.com/maml/2004/10")
            $newWhitespace = $example.remarks.InsertAfter($existingWhitespace.Clone(), $existingPara)

            $insertedNode = $example.remarks.InsertAfter($newPara, $newWhitespace) | Out-Null
        }
    }

    # Update all examples to have a newline after each remark, except for the last example of the command

    $xml.Save($xmlFile)
}

if($Batch)
{
    try
    {
        Update-PrtgHelp
        Sleep -m 1500
    }
    catch
    {
        Write-Host $_.Exception.Message -ForegroundColor Red

        Write-Host "Press any key to continue..."

        $Host.UI.RawUI.ReadKey()
    }
}
else
{
    Update-PrtgHelp
}