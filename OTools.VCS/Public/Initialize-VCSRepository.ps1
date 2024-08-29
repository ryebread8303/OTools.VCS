function Initialize-VCSRepository {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter()]
        [switch]$Bare,
        [Parameter()]
        [switch]$Passthru,
        [Parameter()]
        [switch]$Force
    )
    if (Test-Path $Path){
        if (-not $Force){throw [System.IO.IOException]"Folder already exists: $(Convert-Path $Path)"}
    }
    $RepoPath = Join-Path $Path '.tree'
    $Folders = @()
    $NIArgs = @{ItemType='Directory';Force=$true}
    $Folders += New-Item -Path $RepoPath @NIArgs
    $Folders += New-Item -Path (Join-Path $RepoPath 'staged') @NIArgs
    $Folders += New-Item -Path (Join-Path $RepoPath 'committed') @NIArgs
    if ($Passthru){$Folders}
}
