BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1').Replace('tests','OTools.VCS/Private')
    $ParentFolder = Split-Path -Path $PSScriptRoot -Parent
    . "$ParentFolder\OTools.VCS\Public\Initialize-VCSRepository.ps1"
}

Describe "new-blob" {
    BeforeAll {
        $repoDir = "testdrive:\blobs"
        Initialize-VCSRepository -Path $repoDir
        $TextFile = ( Join-Path $repoDir testfile)
        "This is a string" | Set-Content -Path $TextFile
        $TestInputFile = Get-ChildItem $TextFile
    }
    It "Creates a file" {
        new-blob -Path $TestInputFile.FullName -Passthru | Should -Exist
    }
}
