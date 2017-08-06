Function Get-PTConfig {
    $config = @{}
    Get-Content "$($PSScriptRoot)/../config/config.ini" | ForEach-Object { 
        $line = [regex]::split($_,'='); 
        if(($line[0].CompareTo("") -ne 0) -and ($line[0].StartsWith("[") -ne $True)) { 
            $config.Add($line[0], $line[1])
        } 
    }
    return $config
}