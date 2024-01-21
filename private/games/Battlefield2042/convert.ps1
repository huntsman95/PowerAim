[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, ParameterSetName = 'Sensitivity')]
    [float]
    $Sensitivity
    ,
    [Parameter(Mandatory = $true, ParameterSetName = 'Cm360deg')]
    [float]
    $Cm360deg
)

switch ($PSCmdlet.ParameterSetName) {
    'Sensitivity' {
        # Returns CM/360deg
        return (76.7274 / ((0.23074 * $Sensitivity) + 0.7707))
    }
    'Cm360deg' {
        # Returns In-Game Sensitivity Value
        return [math]::Round( (76.7274 - (0.7707 * $Cm360deg)) / (0.23074 * $Cm360deg) , 2)
    }
}

