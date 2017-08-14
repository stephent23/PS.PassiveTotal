Function Get-PTWhoIs {
    Param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$Domain
    )

    $uri = "https://api.passivetotal.org/v2/whois?query={0}" -f $Domain
    $auth = Get-PTAuthentication
    

    Invoke-RestMethod -Method Get -Headers $auth -Uri $URI -ContentType 'application/json'
}