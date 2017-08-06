Function Get-PTWhoIs {
    Param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$Domain
    )

    $uri = "https://api.passivetotal.org/v2/whois"
    $auth = Get-PTAuthentication
    

    Invoke-RestMethod -Method Get -Headers @{ Authorization=$auth } -Uri $URI -Body { "query:$($Domain)" } -ContentType 'application/jso'
}