BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1').Replace('tests','OTools.VCS/Public')
}

Describe "Initialize-VCSRepository" {
    It "Generates the correct directory structure" {
        $rootDir = "testdrive:\checkDir"
        Initialize-VCSRepository -Path $rootDir
        "$rootDir" | Should -Exist
        "$rootDir\.tree" | Should -Exist
        "$rootDir\.tree\staged" | Should -Exist
        "$rootDir\.tree\committed" | Should -Exist
    }
    It "Should mark the .tree folder as hidden" {
        $rootDir = "testdrive:\checkHidden"
        Initialize-VCSRepository -Path $rootDir
        Get-Item "$rootDir\.tree" -Force | Select-Object Attributes | Should -Match "Hidden"
    }
    It "Outputs the created directories if asked to" {
        $rootDir = "testdrive:\checkPassthru"
        (Initialize-VCSRepository -Path $rootDir -Passthru).count | Should -Be 3
    }
    It "doesn't create a repo if the folder already exists" {
        $rootDir = "testdrive:\checkFolderExists"
        new-item -Path $rootDir -ItemType Directory
        {Initialize-VCSRepository -Path $rootDir} | Should -Throw
    }
    It "does create a repo in an existing folder if you pass the Force argument" {
        $rootDir = "testdrive:\checkForceWorks"
        new-item -Path $rootDir -ItemType Directory
        {Initialize-VCSRepository -Path $rootDir -Force} | Should -Not -Throw
    }
}