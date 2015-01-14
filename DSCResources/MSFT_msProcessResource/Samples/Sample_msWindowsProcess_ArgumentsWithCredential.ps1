Configuration Sample_msWindowsProcess_ArgumentsWithCredential
{
    param
    (
        [pscredential]$cred = (Get-Credential)
    )
    Import-DSCResource -ModuleName msPSDesiredStateConfiguration
    Node localhost
    {
        msWindowsProcess powershell
        {
            Path = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
            Arguments = "-NoExit -file `"c:\testScript.ps1`""
            Credential = $cred
            Ensure = "Present"
        }
    }
}
            

$Config = @{
    Allnodes = @(
                    @{
                        Nodename = "localhost"
                        PSDSCAllowPlainTextPassword = $true
                    }
                )
}

Sample_msWindowsProcess_ArgumentsWithCredential -ConfigurationData $Config 
