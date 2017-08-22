Function Get-PTWhoIs {
    <#
        .SYNOPSIS
            Retrieves the WHOIS data for the specified query.
            
        .DESCRIPTION
            Performs a web request to the PassiveTotal API in order to retrieve the WHOIS information for a given domain.
            Returns a custom PSObject that is able to be manipulated in PowerShell in the normal way. 
            
        .PARAMETER Domain
            The domain that the WHOIS data should be retrieved for.

        .PARAMETER Compact_Record
            Whether the WHOIS record returned should be compressed.
            
        .EXAMPLE
            Get-PTWhoIs -Domain "mydomain.co.uk"
            Get-PTWhoIs -Domain "mydomain.co.uk" -Compact_Record
    #>
    Param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$Domain,

        [Parameter(Mandatory=$false, Position=1)]
        [switch]$Compact_Record
    )

    if($Compact_Record) {
        $compress = "True"
    } else {
        $compress = "False"
    }

    $auth = Get-PTAuthentication
    $uri = "https://api.passivetotal.org/v2/whois"
    $params = @{
        query = $Domain
        compact_record = $compress
    } | ConvertTo-Json
    
    return Invoke-RestMethod -Method Get -Headers $auth -Uri $URI -Body $params -ContentType 'application/json'
}