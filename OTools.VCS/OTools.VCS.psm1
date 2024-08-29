# Dot source public/private functions
$privateFunctionsPath = Join-Path -Path $PSScriptRoot -ChildPath 'Private/*.ps1'
$private = @(Get-ChildItem -Path $privateFunctionsPath -Recurse)
$publicFunctionsPath = Join-Path -Path $PSScriptRoot -ChildPath 'Public/*.ps1'
$public = @(Get-ChildItem -Path $publicFunctionsPath -Recurse)
foreach ($file in $private) {
    try {
        . $file.FullName
    } catch {
        throw "Unable to dot source [$($file.FullName)]"
    }
}
foreach ($file in $public) {
    try {
        . $file.FullName
    } catch {
        throw "Unable to dot source [$($file.FullName)]"
    }
}

Export-ModuleMember -Function $public.BaseName