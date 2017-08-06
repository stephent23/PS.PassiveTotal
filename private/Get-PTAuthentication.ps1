Function Get-PTAuthentication {
    $Username = Get-PTUsername
    $APIKey = Get-PTAPIKey
    
    $basicAuthValue = "Basic " + ([Convert]::ToBase64String([System.Text.encoding]::ASCII.GetBytes("$($Username):$($m3MefzefzfefgezGd2n)")))
    
    return $basicAuthValue
}