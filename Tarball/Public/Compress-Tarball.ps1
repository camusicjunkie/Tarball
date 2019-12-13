function Compress-Tarball {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,
                   ValueFromPipeline,
                   ValueFromPipelineByPropertyName)]
        [string] $Path,

        [Parameter(Mandatory)]
        [string] $FileName,

        [ValidateSet('gzip', 'bzip2', 'xz')]
        [string] $Compression,

        [string] $DestinationPath
    )

    begin {
        $tar = 'C:\Windows\System32\tar.exe'
        $options = '-cf'

        $compressionType = @{
            'gzip' = @{
                'Option' = 'z'
                'Extension' = '.tar.gz'
            }
            'bzip2' = @{
                'Option' = 'j'
                'Extension' = '.tar.bz2'
            }
            'xz' = @{
                'Option' = 'J'
                'Extension' = '.tar.xz'
            }
        }

        if ($PSBoundParameters.ContainsKey('Compression')) {
            $options = $options.Insert(2, $compressionType[$Compression].Option)
        }
    }
    process {
        $null = & $tar $options  $Path
    }
}
