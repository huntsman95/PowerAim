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

function Convert-GameSensitivity {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ArgumentCompleter({
                [OutputType([System.Management.Automation.CompletionResult])]
                param(
                    [string] $CommandName,
                    [string] $ParameterName,
                    [string] $WordToComplete,
                    [System.Management.Automation.Language.CommandAst] $CommandAst,
                    [System.Collections.IDictionary] $FakeBoundParameters
                )
            
                $CompletionResults = [System.Collections.Generic.List[System.Management.Automation.CompletionResult]]::new()
            
                $games = Get-ChildItem -Path "$PSScriptRoot\private\games" -Directory | Select-Object -ExpandProperty Name

                $games | ForEach-Object {
                    $CompletionResults.Add($_)
                }
            
                return $CompletionResults
            })]
        [string]
        $SourceGame
        ,
        [Parameter()]
        [ArgumentCompleter({
                [OutputType([System.Management.Automation.CompletionResult])]
                param(
                    [string] $CommandName,
                    [string] $ParameterName,
                    [string] $WordToComplete,
                    [System.Management.Automation.Language.CommandAst] $CommandAst,
                    [System.Collections.IDictionary] $FakeBoundParameters
                )
            
                $CompletionResults = [System.Collections.Generic.List[System.Management.Automation.CompletionResult]]::new()
            
                $games = Get-ChildItem -Path "$PSScriptRoot\private\games" -Directory | Select-Object -ExpandProperty Name

                $games | ForEach-Object {
                    $CompletionResults.Add($_)
                }
            
                return $CompletionResults
            })]
        [string]
        $DestinationGame
        ,
        [Parameter()]
        [int]
        $Sensitivity
        ,
        # Flag to attempt auto configuration of the destination game
        [Parameter()]
        [switch]
        $ConfigureDestinationGame
    )

    $SourceGameCM = & "$PSScriptRoot\private\games\$SourceGame\convert.ps1" -Sensitivity $Sensitivity
    $DestinationGameSensitivity = & "$PSScriptRoot\private\games\$DestinationGame\convert.ps1" -Cm360deg $SourceGameCM

    return [PSCustomObject]@{
        Game        = $DestinationGame
        Sensitivity = $DestinationGameSensitivity
    }
}