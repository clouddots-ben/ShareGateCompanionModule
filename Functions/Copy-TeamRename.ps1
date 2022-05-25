$teamNames = import-csv -Path C:\Users\svc_cim_lifep\Downloads\sourceTargetDisplayNames.csv
foreach ($copyTeam in $sourceTeams) {
    $newName = $teamNames.where({
            $copyTeam.displayname -eq $_.targetName
        })
    copy-team -team $copyTeam -TeamTitle $newName -DestinationTenant $targetTenant -MappingSettings $mappingSettings -TaskName $newName
}