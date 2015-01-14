configuration Sample_msPSEndpoint_NewWithDefaults
{
    param
    (
        [Parameter(Mandatory)]
        [String]$Name
    )

    Import-DscResource -module msPSDesiredStateConfiguration

    msPSEndpoint PSSessionConfiguration
    {
        Name = $Name
        Ensure = 'Present'
    }
}

configuration Sample_msPSEndpoint_LocalOnlyWorkflowEP
{
    Import-DscResource -module msPSDesiredStateConfiguration

    msPSEndpoint PSSessionConfiguration
    {
        Name       = 'Microsoft.PowerShell.Workflow'
        Ensure     = 'Present'
        AccessMode = 'Disabled'
    }
}

configuration Sample_msPSEndpoint_RemoveEP
{
    param
    (
        [Parameter(Mandatory)]
        [String]$Name
    )
    Import-DscResource -module msPSDesiredStateConfiguration

    msPSEndpoint PSSessionConfiguration
    {
        Name       = $Name
        Ensure     = 'Absent'
    }
}


configuration Sample_msPSEndpoint_NewWithRunAsandStartupAndCustomSDDLAndLocalAccess
{
    param
    (
        [Parameter(Mandatory)]
        [String]$Name,

        [Parameter(Mandatory)]
        [PSCredential]$RunAs,

        [String]$SDDL = 'Default',

        [Parameter(Mandatory)]
        [String]$StartupScript
    )
    Import-DscResource -module msPSDesiredStateConfiguration

    Node 'localhost'
    {
        msPSEndpoint PSSessionConfiguration
        {
            Name                   = $Name
            Ensure                 = 'Present'
            AccessMode             = 'Local'
            RunAsCredential        = $RunAs
            SecurityDescriptorSDDL = $SDDL
            StartupScriptPath      = $StartupScript 
        }
    }
}

# To use the sample(s) with credentials, see blog at http://blogs.msdn.com/b/powershell/archive/2014/01/31/want-to-secure-credentials-in-windows-powershell-desired-state-configuration.aspx
