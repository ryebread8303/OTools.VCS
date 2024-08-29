BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1').Replace('tests','OTools.VCS/Private')
    $ParentFolder = Split-Path -Path $PSScriptRoot -Parent
    . "$ParentFolder\OTools.VCS\Public\Initialize-VCSRepository.ps1"
}

Describe "Find-VCSRepo" {
    It "Finds the repo's .tree folder" {
        $repoRoot="testdrive:\findroot"
        $subdirectory = (Join-Path $repoRoot subdirectory)
        Initialize-VCSRepository -Path $repoRoot
        New-Item -Path $subdirectory -ItemType Directory
        Push-Location $subdirectory
        Find-VCSRepo -Tree | Select-Object name | Should -Be '.tree'
    }
    AfterAll{
        # Pop-Location didn't trigger if the assertion was false
        # I've moved it to the AfterAll block to ensure it triggers.
        # This avoids the location being set during other tests
        Pop-Location
    }
}
