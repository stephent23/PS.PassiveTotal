Function Get-PTAuthentication {
    $Username = Get-PTUsername
    $APIKey = Get-PTAPIKey
    
    $basicAuthValue = "Basic " + ([Convert]::ToBase64String([System.Text.encoding]::UTF8.GetBytes("$($Username):$($APIKey)")))
    return @{Authorization=$basicAuthValue}
}