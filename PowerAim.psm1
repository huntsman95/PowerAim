<#
.SYNOPSIS
    Powershell calculator for aim-sensitivity in FPS games
.DESCRIPTION
    A longer description of the function, its purpose, common use cases, etc.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Test-MyTestFunction -Verbose
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>

$ModuleFunctions = @(
    'Convert-GameSensitivity'
)

$ModuleFunctions | ForEach-Object {
    . .\public\$_.ps1
}

Export-ModuleMember $ModuleFunctions