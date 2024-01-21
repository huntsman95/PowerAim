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
        return 173.1818 / $Sensitivity
    }
    'Cm360deg' {
        # Returns In-Game Sensitivity Value
        return [math]::Round((173.1818 / $Cm360deg), 2)
    }
}
