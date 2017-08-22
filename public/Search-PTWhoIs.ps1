Function Search-PTWhoIs {
    <#
        .SYNOPSIS
            Searches a given WHOIS field with the specified term and returns the relevant results.
            
        .DESCRIPTION
            Performs a web request to the PassiveTotal API in order to retrieve the WHOIS information for the given search query.
            Returns a custom PSObject for each of the results.
            The PSObjects are able to be manipulated using PowerShell in the normal way. 
            
        .PARAMETER SearchField
            The field of the WHOIS database that should be searched.
            The following fields are able to be searched:
             - Email
             - Domain
             - Name
             - Organization
             - Address
             - Phone
             - Name Server

        .PARAMETER Query
            The query that should be searched in the selected search field.
            
        .EXAMPLE
            Search-PTWhoIs -SearchField email -Query "test_email@domain.com"
            Search-PTWhoIs -SearchField organization -Query "MyCompany"
    #>
    Param (
        [Parameter(Mandatory=$True, Position=1)]
        [ValidateSet('email','domain','name','organization','address','phone','nameserver')]
        [string]$SearchField,

        [Parameter(Mandatory=$true, Position=0)]
        [string]$Query
    )

    $auth = Get-PTAuthentication
    $uri = "https://api.passivetotal.org/v2/whois/search"
    $params = @{
        query = $Query
        field = $SearchField
    } | ConvertTo-Json
    
    return (Invoke-RestMethod -Method Get -Headers $auth -Uri $URI -Body $params -ContentType 'application/json').results
}