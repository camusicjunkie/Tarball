function Get-CompressionExtension {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string] $Compression
    )

    $compressionType = @{
        'gzip' = '.gz'
        'bzip2' = '.bz2'
        'xz' = '.xz'
    }

    Write-Output $compressionType[$Compression]
}
