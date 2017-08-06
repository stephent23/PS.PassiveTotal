Function Get-PTAPIKey {
    $config = Get-PTConfig
    return $config.APIKey   
}