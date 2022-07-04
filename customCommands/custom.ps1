# \Windows\System32\WindowsPowerShell\v1.0\Modules. Now, create a folder within which your module will reside. The folder name must match the module name. For example, I am calling my module Demo, so my folder will also be named Demo.

Function testing
{
Write-Host 'this is a test'
}

Export-ModuleMember -Function ‘testing’
