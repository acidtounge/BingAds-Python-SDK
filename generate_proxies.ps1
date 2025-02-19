Param (
    [string]$svcWsdl,
    [string]$path
)

function Format-XML([xml]$xml, $indent=3)
{
    $StringWriter = New-Object System.IO.StringWriter
    $XmlWriter = New-Object System.XMl.XmlTextWriter $StringWriter
    $xmlWriter.Formatting = "indented"
    $xmlWriter.Indentation = $Indent
    $xml.WriteContentTo($XmlWriter)
    $XmlWriter.Flush()
    $StringWriter.Flush()
    Write-Output $StringWriter.ToString()
}

wget $svcWsdl -OutFile $path
Format-XML ([xml](cat $path)) | Set-Content -Path $path