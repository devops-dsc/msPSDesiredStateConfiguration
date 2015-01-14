Configuration Sample_msWindowsProcess_EnsureAbsentWithCredential
{
    param
    (
        [pscredential]$cred = (Get-Credential)
    )
    Import-DSCResource -ModuleName msPSDesiredStateConfiguration
    Node localhost
    {
        msWindowsProcess Notepad
        {
            Path = "C:\Windows\System32\Notepad.exe"
            Arguments = ""
            Credential = $cred
            Ensure = "Absent"
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

Sample_msWindowsProcess_EnsureAbsentWithCredential -ConfigurationData $Config 
