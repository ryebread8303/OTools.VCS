function New-Blob {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter()]
        [ValidateSet('MD5','SHA1','SHA256')]
        [string]$Algorithm = 'SHA1',
        [Parameter()]
        [switch]$Passthru
    )
    throw [NotImplementedException]'New-Blob is not implemented.'
    $StagingDir = Get-Item 
}
