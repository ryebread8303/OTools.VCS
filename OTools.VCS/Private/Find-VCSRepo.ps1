function Find-VCSRepo {
    [CmdletBinding()]
    param(
        [Parameter(ParameterSetName='Tree')]
        [switch]$Tree
    )
    switch ($PSCmdlet.ParameterSetName){
        'Tree' {$TargetDir = '.tree'}
        default {
            #if we try a query that isn't coded yet, throw an error
            throw [System.NotImplementedException]'Function not implemented yet. Contact script creator.'
        }
    }
    throw [NotImplementedException]'Find-VCSRepo is not implemented.'
    try {
        # check for the hidden .tree folder
    } catch [System.Management.Automation.ErrorRecord] {
        # check the parent folder
    } catch {
        # return any errors that aren't the directory not existing
        throw $_
    }
}
