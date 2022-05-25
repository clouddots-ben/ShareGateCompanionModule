function Invoke-SGMapping {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $True)][string]
        $ImportPath,
        [Parameter(Mandatory = $True)][string]
        $ExportPath
    )
    $table = Import-CSV $ImportPath -Delimiter ","
    $mappingSettings = New-MappingSettings
    foreach ($row in $table) {
        $results = Set-UserAndGroupMapping -MappingSettings $mappingSettings -Source $row.SourceValue -Destination $row.DestinationValue
        $row.sourcevalue
    }
    Export-UserAndGroupMapping -MappingSettings $mappingSettings -Path $ExportPath
    $script:mappingSettings = Import-UserAndGroupMapping -Path $ExportPath
}