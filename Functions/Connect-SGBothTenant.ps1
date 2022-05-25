function Connect-SGBothTenant {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $True)][string]
        $SourceDomain,
        [Parameter(Mandatory = $True)][string]
        $TargetDomain
    )
    Write-Information "connecting source tenant" -InformationAction Continue
    $script:sourceTenant = connect-tenant -domain $SourceDomain -browser
    $sourceTenant
    Read-Host -Prompt "Press any key to continue"
    Write-Information "connecting target tenant" -InformationAction Continue
    $script:TargetTenant = connect-tenant -domain $TargetDomain -browser
    $TargetTenant
}