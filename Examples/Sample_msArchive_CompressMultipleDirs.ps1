
Configuration Sample_msArchive_CompressMultipleDirs
{
    param 
    ( 
        [parameter(mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Path,

        [parameter (mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $Destination,

        [parameter (mandatory=$false)]
        [ValidateSet("Optimal","NoCompression","Fastest")]
        [string]
        $CompressionLevel = "Optimal",

        [parameter (mandatory=$false)]
        [boolean]
        $MatchSource = $false
    ) 

    Import-DscResource -ModuleName msPSDesiredStateConfiguration

    Node localhost
    {
        msArchive SampleCompressMultipleDirsArchive
        {
            Path = $Path
            Destination = $Destination
            CompressionLevel = $CompressionLevel
            DestinationType="File"
            MatchSource=$MatchSource
        }
    }
}

Sample_msArchive_CompressMultipleDirs
